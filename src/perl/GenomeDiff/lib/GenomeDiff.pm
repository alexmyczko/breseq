###
# Pod Documentation
###

=head1 NAME

GenomeDiff.pm

=head1 SYNOPSIS

Module for reading and writing Genome Diff (.gd) files that describe 
evidence for mutations and predicted mutations.

=head1 DESCRIPTION

=head1 FORMAT

Genome Diff files are tab delimitted. The first column defines the type of entry on a given line.
The second and third columns are type-nonspecific (id, parents), followed by type-specific
columns, then an arbitrary number of columns of more detailed data in a key=value format.

=head1 ENTRY TYPES

=head2 MUTATIONAL EVENTS

=head3 SNP :: single base substitution

Single nucleotide polymorphism (SNP) type mutation. String operation is to substitute a single base.

=head3 DEL :: deletion

Deletion of any number of reference bases. String operation is to remove these bases.

=head3 INS :: insertion

Insertion of any number of new bases. String operation is to add these bases.

=head3 SUB :: block substitution

Insertion of any number of new bases. String operation is to add these bases.

=head3 MOB :: insertion of mobile element

Insertion of a new copy of an existing modile genetic element (such as an insertion sequence or transposon). String operation
is to insert the sequence of the mobile genetic element, paying attention to its orientation, the possible duplication of reference 
bases at the new insertion site, and insertions and deletions of several nucleotides associated with the new insertion.

=head3 AMP :: gene amplification

Duplication or higher order amplification of a genomic segment. String operation is to create new copies after the first copy.

=head3 CON :: gene conversion

Replacement of a stretch of bases with sequence from elsewhere in the reference genome, typically by a mechanism of homologous
recombination between newarly identical repeat sequences, such as ribomal RNA copies. String operation is to substitute a length
of bases with the other reference sequence.

=head3 INV :: chromosomal inversion

Inversion of the DNA between two points in the chromosome. String operation is to reverse complement the sequence between these boundaries.

=head2 EVIDENCE

=head3 RA :: within read alignment evidence

Evidence from reads uniquely aligned to this reference position.

Fixed columns: entry_type, entry_id, seq_id, start, end, ref_seq, new_seq, 

=head3 MC :: missing coverage evidence

Fixed columns: entry_type, entry_id, seq_id, start, end 

Evidence that coverage is missing from this region in the reference genome.

=head3 NJ :: new junction evidence

Fixed columns: entry_type, entry_id, seq_id_1, position_1, direction_1, seq_id_2, position_2, direction_2, overlap

Evidence of a new junction between regions that were not adjacent in the reference genome from reads that span the new boundary.

=head3 UN :: within read alignment evidence

Fixed columns: entry_type, entry_id, seq_id, start, end, ref_seq, new_seq, 

Regions where there is missing evidence, due to not enough coverage from uniquely aligned reads to call a base.

=head2 Specifying coordinates relative to the reference genome after complicated mutations

Specify mutations in degenerate regions by giving them a subscript coord, i.e. 342.2 is the second copy of position 342 in the
new genome. Alternately, we could specify mutation sets and have mutations within a set apply to local coordinates of the other mutation.
This may be better for cases such as a new insertion sequence appearing (where the index is not obvious to assign or if there is insertion
of a large stretch of new sequence.

=head1 AUTHOR

Jeffrey E. Barrick <jeffrey.e.barrick@gmail.com>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2010 Michigan State University

breseq is free software; you can redistribute it and/or modify it under the terms the 
GNU General Public License as published by the Free Software Foundation; either 
version 1, or (at your option) any later version.

=cut

###
# End Pod Documentation
###

package GenomeDiff;
use vars qw(@ISA);
use strict;

use Data::Dumper;

our $VERSION = '1.00';

#
# Format specification
# 
our $line_specification = {
	## mutations
	'SNP' => ['seq_id', 'position', 'new_seq'],
	'SUB' => ['seq_id', 'position', 'size', 'new_seq'],
	'DEL' => ['seq_id', 'position', 'size'],
	'INS' => ['seq_id', 'position', 'new_seq'],
	'MOB' => ['seq_id', 'position', 'repeat_name', 'strand', 'duplication_size'],	
#	'DUP' => ['seq_id', 'position', 'size'], # Legacy ... right now translated internally into 'AMP' during reading
	'AMP' => ['seq_id', 'position', 'size', 'new_copy_number'],
	'CON' => ['seq_id', 'position', 'size', 'region'],
	'INV' => ['seq_id', 'position', 'size'],
	
	## evidence
	'RA' => ['seq_id', 'position', 'insert_position', 'ref_base', 'new_base'],
	'MC' => ['seq_id', 'start', 'end', 'start_range', 'end_range'], #The deletion goes maximally from [start,start+start_range] to [end-end_range, end]
	'JC' => ['side_1_seq_id', 'side_1_position', 'side_1_strand', 'side_2_seq_id', 'side_2_position', 'side_2_strand', 'overlap'],
	'UN' => ['seq_id', 'start', 'end'],
	
	## validation
	'CURA' => ['expert'], 
	'FPOS' => ['expert'],
	'PHYL' => ['gd'], 
	'TSEQ' => ['seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'PFLP' => ['seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'RFLP' => ['seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'PFGE' => ['seq_id', 'enzyme'],
};

our $tag_sort_fields = {
	'SNP' => [1, 'seq_id', 'position'],
	'SUB' => [1, 'seq_id', 'position'],
	'DEL' => [1, 'seq_id', 'position'],
	'INS' => [1, 'seq_id', 'position'],
	'MOB' => [1, 'seq_id', 'position'],
	'AMP' => [1, 'seq_id', 'position'],
	'INV' => [1, 'seq_id', 'position'],
	'CON' => [1, 'seq_id', 'position'],
	
	'CURA' => [1.5, 'expert', 'expert'], ##expects three levels of sort...
	'FPOS' => [1.5, 'expert', 'expert'], ##expects three levels of sort...
	'PHYL' => [1.5, 'gd', 'gd'],         ##expects three levels of sort...
	'TSEQ' => [1.5, 'seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'PFLP' => [1.5, 'seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'RFLP' => [1.5, 'seq_id', 'primer_1_start', 'primer_1_end', 'primer_2_start', 'primer_2_end'], 
	'PFGE' => [1.5, 'seq_id', 'enzyme'],
	
	'RA' => [2, 'seq_id', 'position'],
	'MC' => [2, 'seq_id', 'start'],
	'JC' => [2, 'side_1_seq_id', 'side_1_position'],
	'UN' => [3, 'seq_id', 'start'],
};

our $type_sort_order = {
	'SNP' => 2,
	'SUB' => 4,
	'DEL' => 1,
	'INS' => 3,
	'MOB' => 5,	
	'AMP' => 6,
	'INV' => 7,
	'CON' => 7,	
	'RA' => 8,
	'MC' => 9,
	'JC' => 10,
	'UN' => 11,
};

sub revcom
{
	my ($seq) = @_;
	$seq =~ tr/ATCG/TAGC/;
	return reverse $seq;
}

=head2 new

 Title   : new
 Usage   : $gd = GenomeDiff->new();
           $gd = GenomeDiff->new( -file => 'evolved.gd' );
 Function: Creates a GenomeDiff object, loading it from a file if one is provided
 Returns : new GenomeDiff object

=cut

sub new
{
	my($caller,$args) = @_;
	my $class = ref($caller) || $caller;
	$args = {} if (!defined $args);
	my $self = $args;	
	bless ($self, $class);

	# initialize
	@{$self->{list}} = ();
	$self->{unique_id_counter} = 0;
	$self->{unique_id_used} = {};

	bless ($self, $class);
	
	# load from file if one of these options found...
	$self->{file_name} = $self->{FILE_NAME} if (!defined $self->{file_name});
	$self->{file_name} = $self->{file} if (!defined $self->{file_name});
	$self->{file_name} = $self->{FILE} if (!defined $self->{file_name});
	$self->{file_name} = $self->{in} if (!defined $self->{file_name});
	$self->{file_name} = $self->{IN} if (!defined $self->{file_name});
	
	$self->read($self->{file_name}) if ($self->{file_name});
	
	return $self;
}


=head2 add

 Title   : add
 Usage   : $gd->add( {seq_id=>'', start=>456, end=>546 } );
 Function: Adds a new item to a GenomeDiff from a hash. Auto-populates empty required fields.
 Returns : 

=cut
sub add
{
	my ($self, $item) = @_;
	my @missing_required_columns = ();

	## no ID, give it a new one (need to re-assign id's later...)
	if ( !defined $item->{id} )
	{
		$item->{id} = $self->new_unique_id;
	}
	elsif ( $self->used_unique_id( $item->{id}) && !(($item->{id} eq '.') || ($item->{id} eq '+') || ($item->{id} eq '?')))
	{
		print "Ignoring attempt to add item with an existing id: $item->{id}\n";
		return;
	}

	sub check_required_field
	{
		my ($item, $field, $missing_ref) = @_;
		push @$missing_ref, $field if (!defined $item->{$field});
	}
	
	## check to be sure the item has required fields, or auto-populate them
	$item->{type} = '' if (!defined $item->{type});
	
	my $spec = $line_specification->{$item->{type}};
	if (!defined $spec)
	{
		print "Type \'$item->{type}\' is not recognized. Ignoring item.\n";
		return;
	}
	
	## check for required fields
	foreach my $key (@$spec)
	{
		check_required_field($item, $key, \@missing_required_columns);
	}

	if (scalar @missing_required_columns > 0)
	{
		print "GenomeDiff::Ignoring item of type \'$item->{type}\' that is missing required field(s):" . join (',', @missing_required_columns) . "\n";
		return;
	}

	## these are all required columns
	$item->{SORT_1} = $tag_sort_fields->{$item->{type}}->[0];
	$item->{SORT_2} = $item->{$tag_sort_fields->{$item->{type}}->[1]};
	$item->{SORT_3} = $item->{$tag_sort_fields->{$item->{type}}->[2]};
	
	push @{$self->{list}}, $item;
	$self->mark_unique_id($item->{id});
}


## 
sub used_unique_id
{
	my ($self, $id) = @_;
	return $self->{unique_id_used}->{$id};
}

##
sub new_unique_id
{
	my ($self) = @_;
	my $assigned_id = ++$self->{unique_id_counter};
	while ( $self->{unique_id_used}->{$assigned_id} )
	{
		$assigned_id = ++$self->{unique_id_counter};
	}
	return $assigned_id;
}

##
sub mark_unique_id
{
	my ($self, $id) = @_;
	$self->{unique_id_used}->{$id} = 1;
}


sub list
{
	my ($self, @types) = @_;
		
	## return ALL
	if (scalar @types == 0)
	{
		return @{$self->{list}};
	}
	## return only requested types
	else
	{
		my %requested;
		foreach my $type (@types)
		{
			$requested{$type} = 1;
		}
		my @return_list = grep { $requested{$_->{type}} } @{$self->{list}};
		return @return_list;
	}
	
	return undef;
}

sub by_sort_fields
{ 			
	return cmp_mutations($a, $b);
}


sub cmp_mutations
{ 		
	my ($a, $b) = @_;
		
	print "Sort fields not defined for item:\n" . Dumper($a) if (!defined $a->{SORT_1} || !defined $a->{SORT_2} || !defined $a->{SORT_3} || !defined $a->{type}); 
	print "Sort fields not defined for item:\n" . Dumper($b) if (!defined $b->{SORT_1} || !defined $b->{SORT_2} || !defined $b->{SORT_3} || !defined $b->{type}); 

	## plus and minus should come before '?' so join them together correctly
	my $additional_sort = 0;
	if ( ($a->{type} eq 'MOB') && ($b->{type} eq 'MOB') )
	{
		$additional_sort = -1 if (($a->{strand} == 0) && ($b->{strand} != 0));
	}
	
	return ($a->{SORT_1} <=> $b->{SORT_1}) 
		|| ($a->{SORT_2} cmp $b->{SORT_2}) 
		|| ($a->{SORT_3} <=> $b->{SORT_3})
		|| ($type_sort_order->{$a->{type}} <=> $type_sort_order->{$b->{type}})
	;
}

sub mutation_list
{
	my ($self, $sort) = @_;
	my @mut_list = grep { length($_->{type}) == 3 } $self->list;
	
	@mut_list = sort by_sort_fields @mut_list if ($sort);
	
	return 	@mut_list;
}

sub evidence_list
{
	my ($self, $sort) = @_;
	my @mut_list = grep { length($_->{type}) != 3 } $self->list;
	
	@mut_list = sort by_sort_fields @mut_list if ($sort);
	
	return 	@mut_list;
}

## Internal function for creating a hash from a line
sub _line_to_item
{
	my ($self, $line) = @_;
	
	my @line_list = split /\t/, $line;
	
	##remove items at the end that are empty
	while ( scalar(@line_list) && ($line_list[-1] =~ m/^\s+$/) )
	{
		pop @line_list;
	}
	
	my $item = {};
	$item->{type} = shift @line_list;
	$item->{id} = shift @line_list;
	my $evidence_string = shift @line_list;
	@{$item->{evidence}} = split /,/, $evidence_string;
		
	my $spec = $line_specification->{$item->{type}};
	if (!defined $spec)
	{
		print "Type \'$item->{type}\' is not recognized for line:\n$line\n";
		return undef;
	}
	
	######## Temporary transition code for 'DUP' => AMP
	if ($item->{type} eq 'DUP')
	{
		$item->{type} = 'AMP';
		$item->{new_copy_number} = 2;
	}
	
	######## Temporary transition code for 'MOB'
	if ($item->{type} eq 'MOB')
	{
		my @spec_items = grep {!($_ =~ m/=/)} @line_list;
		
		if (scalar(@spec_items) == scalar(@$spec) + 2)
		{
			my $gap_left = $line_list[5];
			if ($gap_left =~ m/^-/)
			{
				$item->{del_start} = abs($gap_left);
			}
			else
			{
				$item->{ins_start} = $gap_left;
			}

			my $gap_right = $line_list[6];
			if ($gap_right =~ m/^-/)
			{
				$item->{del_end} = abs($gap_left);
			}
			else
			{
				$item->{ins_end} = $gap_left;
			}
			
			##remove these items
			splice @line_list, 5, 2;
		}
	}
	
	
	foreach my $key (@$spec)
	{
		my $next = shift @line_list;
		if (!defined $next)
		{
			print "Number of required items is less than expected for type \'$item->{type}\' line:\n$line\n";
			return undef;
		}
		if ($next =~ m/=/) 
		{
			print "Unexpected key=value pair \'$next\' encountered for required item \'$key\' in type \'$item->{type}\' line:\n$line\n";
#			return undef;
		}
		
		$item->{$key} = $next;
	}

	## Remainder of the line is comprised of non-required key value pairs
	foreach my $key_value_pair (@line_list)
	{
		next if (!$key_value_pair);
		next if ($key_value_pair =~ m/^\s*$/);
		my $matched = ($key_value_pair =~ m/^(.+)=(.+)$/);
		if (!$matched)
		{
			print "Not a key value pair \'$key_value_pair\' line:\n$line\n";
			next;
		}		
		
		my ($item_key, $item_value) = ($1, $2);	
		$item->{$item_key} = $item_value;
	}
	
	### We do some extra convenience processing for junctions...
	if ($item->{type} eq 'JC')
	{
		foreach my $side_key ('side_1', 'side_2')
		{
			foreach my $key ('seq_id', 'position', 'strand')
			{
				$item->{"_$side_key"}->{$key} = $item->{"$side_key\_$key"};
			}
			$item->{"_$side_key"}->{type} = 'NA';
		}
	}

	return $item;
}

## Internal function for creating a line from a hash
sub _item_to_line
{
	my ($self, $item) = @_;
	my $line = '';
		
	my $spec = $line_specification->{$item->{type}};
	if (!defined $spec)
	{
		print "Type \'$item->{type}\' not found for item. Ignoring.\n";
		print Dumper($item);
		return '';
	}
	
	my %ignore;
	foreach my $key ('type', 'id')
	{
		$line .= "$item->{$key}\t";
		$ignore{$key} = 1;
	}
	
	my $parent_string = '';
	$parent_string = join(',', @{$item->{evidence}}) if (ref($item->{evidence}) eq 'ARRAY');
	$ignore{evidence} = 1;
	$line .= $parent_string . "\t";
		
	foreach my $key (@$spec)
	{
		$line .= "$item->{$key}\t";
		$ignore{$key} = 1;
	}
	
	my @keys = sort keys %$item;
	
	#various things we don't want to print
	@keys = grep { !(ref($_) eq 'HASH') } @keys;
	@keys = grep { !($_=~ m/^_/) } @keys;
	@keys = grep { !$ignore{$_} } @keys;
	@keys = grep { !($_=~ m/^SORT_/) } @keys;
	@keys = grep { $item->{$_} ne '' } @keys; #ignore empty values

	my @key_value_pairs = map { $_ . "=" . $item->{$_} } @keys;
	$line .= join "\t", @key_value_pairs;
	
	return $line;
}


sub mutation_key
{
	my ($mut) = @_;
	
	my $spec = $line_specification->{$mut->{type}};
	if (!defined $spec)
	{
		die("Type \'$mut->{type}\' not found for item. Ignoring.");
		return '';
	}
	
	return join(",", map {$mut->{$_}} 'type', @$spec);
}

sub read
{
	my ($self, $file_name) = @_;
	
	open IN, "<$file_name" or die "Could not open file for reading: $file_name";

	#read lines, skip comment lines, and blank lines
	my @lines = <IN>;
	chomp @lines;
		
	@lines = grep {!/^\s*#[^=]/} @lines;
	@lines = grep {!/^\s*$/} @lines;
		
	## read version from first line
	my $l = shift @lines;
	($l =~ m/#=GENOME_DIFF\s+(\d+)/) or ($l =~ m/#=GENOMEDIFF\s+(\d+)/)  or die "Could not match version line in file $self->{file_name}.";
	$self->{version} = $1;

	## read header information
	
	## read data
	while ($l = shift @lines)
	{
		if ($l =~ m/^\s*#=(\S+)\s+(.+)/) {
			#metadata line key value pair
			push @{$self->{metadata}->{$1}}, $2;
			push @{$self->{metadata_lines}}, $l;
			
		} elsif ($l =~ m/^\s+#=(.+)/) {
		} elsif ($l =~ m/^#=AUTHOR\s*$/) {
		} 
		else {
			$self->add($self->_line_to_item($l));
		}
	}
	close IN;
}

=head2 write

 Title   : write
 Usage   : $gd->write("output.gd");
 Function: writes a genome diff file
 Returns :

=cut

sub write
{
	my ($self, $file_name, $no_sort) = @_;

	## read version from first line
	open OUT, ">$file_name" or die "Could not write file: $file_name";
	print OUT "#=GENOME_DIFF 1.0\n";
#	print OUT "#=SAMPLE " . $self->hash_to_line($self->{'SAMPLE'}) . "\n" if (defined $self->{'SAMPLE'});
	
	foreach my $metadata (@{$self->{metadata_lines}}) {
		print OUT $metadata . "\n";
	}
	
	#fill in the sort fields
	foreach my $item (	@{$self->{list}} )
	{
		$item->{SORT_1} = $tag_sort_fields->{$item->{type}}->[0];
		$item->{SORT_2} = $item->{$tag_sort_fields->{$item->{type}}->[1]};
		$item->{SORT_3} = $item->{$tag_sort_fields->{$item->{type}}->[2]};
	}
	

	@{$self->{list}} = sort by_sort_fields @{$self->{list}} if (!$no_sort);

	foreach my $item (@{$self->{list}})
	{		
		my $line = $self->_item_to_line($item);
		print OUT "$line\n" if ($line);
	}
	
	close OUT;
}

sub write_yaml
{
	my ($self, $file_name, $no_sort) = @_;
	eval ('require YAML::XS');
	
	#eval ('require YAML::XS qw(Dump)');
	#eval ('require YAML::XS qw(Dump)') or die "Module YAML::XS not found.";

	open OUT, ">$file_name" or die "Could not write file: $file_name";


	#fill in the sort fields
	foreach my $item (	@{$self->{list}} )
	{
		$item->{SORT_1} = $tag_sort_fields->{$item->{type}}->[0];
		$item->{SORT_2} = $item->{$tag_sort_fields->{$item->{type}}->[1]};
		$item->{SORT_3} = $item->{$tag_sort_fields->{$item->{type}}->[2]};
	}

	my $data_to_write;
	@{$data_to_write->{metadata}} = $self->{metadata_lines};
	@{$data_to_write->{mutations}} = $self->mutation_list;
	@{$data_to_write->{evidence}} = $self->evidence_list;

	@{$data_to_write->{mutations}} = sort by_sort_fields @{$data_to_write->{mutations}} if (!$no_sort);
	@{$data_to_write->{evidence}} = sort by_sort_fields @{$data_to_write->{evidence}} if (!$no_sort);
	
	print OUT YAML::XS::Dump($data_to_write);
	close OUT;
	
}

=head2 has_mutation

 Title   : has_mutation
 Usage   : $gd->has_mutation;
 Function: test whether a genome diff has the specified mutation
 Returns : hether a genome diff has the specified mutation

=cut

sub has_mutation
{
	my ($self, $test_item) = @_;

	foreach my $item ($self->mutation_list)
	{		
		if ( equivalent_mutations($item, $test_item) )
		{
			return 1;
		}
	}
	return 0;
}

sub equivalent_mutations
{
	my ($m1, $m2) = @_;

	return 0 if ($m1->{type} ne $m2->{type});
	my $spec = $line_specification->{$m1->{type}};
	foreach my $key (@$spec)
	{
	#	print "$key ($m1->{$key} ne $m2->{$key})\n";
		
		if (($m1->{type} eq 'MOB') && ($key eq 'strand'))
		{
			#pass if  either is equal to '?' == 0
			next if ($m1->{strand} == 0);
			next if ($m2->{strand} == 0);
		}

		return 0 if ($m1->{$key} ne $m2->{$key});
	}
		
	return 1;
}

##splice items used as evidence by any mutations out of input list
sub filter_used_as_evidence
{
	my ($self, @list) = @_;
	
	IN: for (my $i=0; $i<scalar @list; $i++)
	{
		my $in_item = $list[$i];
		foreach my $test_item ($self->list)
		{
			foreach my $test_evidence_id (@{$test_item->{evidence}})
			{
				if ($test_evidence_id ==  $in_item->{id})
				{
					splice @list, $i, 1;
					$i--;
					next IN;
				}
			}
		}
	}
	return @list;
}

sub filter
{
	my ($self, $filter_function) = @_;
		
	my @new_list = ();
	my $removed_gd = GenomeDiff->new();
	
	foreach my $item ($self->list)
	{
		if ($filter_function->($item))
		{
			push @new_list, $item;
		}
		else
		{
			$removed_gd->add($item);
		}
	}
	@{$self->{list}} = @new_list;
	
	return $removed_gd;
}

sub parent
{
	my ($self, $item) = @_;

	TEST: foreach my $test_item ($self->list)
	{
		foreach my $test_evidence_id (@{$test_item->{evidence}})
		{
			if ($test_evidence_id == $item->{id})
			{					
				return $test_item;
			}
		}
	}
	
	return undef;
}

=head2 find_common_mutations

 Title   : get_next
 Usage   : $read = $delta_file->get_next;
 Function: new genome diff object with only common mutations
 Returns :

=cut

sub last_common_ancestor
{
#	my ($list_1, $list_2) = @_;	

#	my $list_1_intersection = GenomeDiff::intersection($list_1);
#	my $list_1_intersection = GenomeDiff::intersection($list_1);


#	my $gd1 = shift @$list_1;
#	if (scalar $list_1 == 1)
#	{
#		last_common_ancestor;
#	}
#	elseif (scalar $list_1 == 1)
#	{
#		last_common_ancestor;
#	}
#	{
#	}


	
#	my @list = split /[,|]\s+/, $l;
#	my $return_hash;
#	foreach my $item (@list)
#	{
#		next if (!$item);
#		my ($item_key, $item_value) = split /=/, $item;
#		die "$item_key, $item_value" if (!$item_value);
#		$return_hash->{$item_key} = $item_value;
#		$self->{$key}->{$item_key} = $item_value if (defined $key);
#	}
	
#	return $return_hash;
}


=head2 merge

 Title   : merge
 Usage   : $gd = Bio::GenomeDiff::merge($gd1, $gd2, $gd3, ...);
 Function: merge evidence and predictions from multiple GenomeDiffs into one
 Returns : new GenomeDiff object with items from all input GenomeDiffs

=cut

sub merge
{
	use Storable qw(dclone);
	my (@list) = @_;

	my $new_gd = GenomeDiff->new();			
	while (my $gd = shift @list)
	{
		## deep copy the list, so we aren't changing the original items
		my @list = $gd->list;
		@list = sort {$a->{id} <=> $b->{id}} @list;
		my @item_list = @{dclone(\@list)};
				
		foreach my $item (@item_list)
		{
			## first we need to check to be sure
			## each id we are using isn't present in what we have added so far
			if ($new_gd->used_unique_id($item->{id}))
			{
				$item->{id} = $new_gd->new_unique_id();
			}
			
			$new_gd->add($item);
		}
		
	}
	return $new_gd;
}


sub intersection
{
	my ($list) = @_;
	
	my $union_gd = GenomeDiff::merge(@$list);
	
	my $new_gd = GenomeDiff->new();
	$new_gd->{'SAMPLE'}->{intersection } = join ",", map {$_->{SAMPLE}->{strain}} @$list;
	
	SNP: foreach my $test_item (@{$union_gd->{list}})
	{
		foreach my $gd (@$list)
		{
			next SNP if (!$gd->has_mutation($test_item));
		}
		push @{$new_gd->{list}}, $test_item;
	}
	
	return $new_gd;
}

sub subtract
{
	my ($list_1, $list_2) = @_;
	
	my $union1_gd = GenomeDiff::merge(@$list_1);
	my $union2_gd = GenomeDiff::merge(@$list_2);

	my $new_gd = GenomeDiff->new();
	$new_gd->{'SAMPLE'}->{subtract} = join( ",", map {$_->{SAMPLE}->{strain}} @$list_1) . "-" . join( ",", map {$_->{SAMPLE}->{strain}} @$list_2);
		
	SNP: foreach my $test_item (@{$union1_gd->{list}})
	{
		next SNP if ($union2_gd->has_mutation($test_item));
		push @{$new_gd->{list}}, $test_item;
	}
	
	return $new_gd;
}

## currently this destroys the genome diff's original format (maybe not the best thing to do)
sub apply_to_sequences
{
	my ($self, $ref_seq_info) = @_;
	my $verbose = 1;
	
	my $ref_strings = $ref_seq_info->{ref_strings};
	my $new_ref_strings;
	foreach my $seq_id (keys %$ref_strings)
	{
		$new_ref_strings->{$seq_id} = $ref_strings->{$seq_id};
	}
	
	foreach my $mut ($self->mutation_list)
	{		
		die "Mutation on unknown reference sequence: $mut->{seq_id}\n" if (!defined $new_ref_strings->{$mut->{seq_id}});
		
		print Dumper($mut) if ($verbose);
		if ($mut->{type} eq 'SNP')
		{
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, 1, $mut->{new_seq};
			print "SNP: " . (1) . " => " . length($mut->{new_seq}) . "\n" if ($verbose);
			print +($mut->{position}-1) . " " . "+" . $mut->{new_seq} . "\n" if ($verbose);
		}
		elsif ($mut->{type} eq 'SUB')
		{
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, $mut->{size}, $mut->{new_seq};
			print "SUB: " . ($mut->{size}) . " => " . length($mut->{new_seq}) . "\n" if ($verbose);
			print +($mut->{position}-1) . " " . "+" . $mut->{new_seq} . "\n" if ($verbose);
		}
		elsif ($mut->{type} eq 'INS')
		{
			##notice that this is AFTER the position
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}, 0, $mut->{new_seq};
			print "INS: " . (0) . " => " . length($mut->{new_seq}) . "\n" if ($verbose);
			print +($mut->{position}-1) . " " . "+" . $mut->{new_seq} . "\n" if ($verbose);
		}
		elsif ($mut->{type} eq 'DEL')
		{	
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, $mut->{size}, '';
			print "DEL: " . ($mut->{size}) . " => " . (0) . "\n" if ($verbose);
			print +($mut->{position}-1) . " " . "\n" if ($verbose);
		}		
		elsif ($mut->{type} eq 'AMP')
		{
			my $dup = substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, $mut->{size};
			$dup = $dup x ($mut->{new_copy_number} - 1);
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1 + $mut->{size}, 0, $dup;
			print "AMP: " . (0) . " => " . (length($dup)) . "\n" if ($verbose);
			print +($mut->{position}-1) . " " . "+" . $dup . "\n" if ($verbose);
		}
		elsif ($mut->{type} eq 'INV')
		{
			die "INV: mutation type not handled yet\n";
		}
		elsif ($mut->{type} eq 'MOB')
		{
			die "MOB: does not handle ins_start, ins_end, del_start, del_end yet." if (($mut->{ins_start} != 0) || ($mut->{ins_end} != 0) || ($mut->{del_start} != 0) || ($mut->{del_end} != 0) );
			
			die "Unknown repeat strand" if ($mut->{strand} eq '?');
			my $seq_string = GenomeDiff::ReferenceSequence::repeat_example($ref_seq_info, $mut->{repeat_name}, $mut->{strand});
			
			## note that we are setting the size used by shift_positions
			$mut->{repeat_size} = length($seq_string); ##used by shift_positions
			my $duplicate_sequence = substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, $mut->{duplication_size};
			substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, 0, $duplicate_sequence . $seq_string;
			print "MOB: " . (0) . " => " . (length($duplicate_sequence . $seq_string)) . "\n" if ($verbose);
			print +($mut->{position}) . " " . "+" . $duplicate_sequence . $seq_string . "\n" if ($verbose);
		} 
		elsif ($mut->{type} eq 'CON')
		{
			$mut->{region} =~ m/^(.+):(.+)-(.+)$/ or die "Could not understand CON replacement region: $mut->{region}";
			my $start = $2;
			my $end = $3;
			my $seq_id = $1;
			my $strand = ($start < $end) ? +1 : -1;
			($start, $end) = ($end, $start) if ($strand == -1);
			my $replace_string = substr $ref_strings->{$seq_id}, $start-1, $end-$start+1; #taken from original!!
			$replace_string = GenomeDiff::ReferenceSequence::revcom($replace_string) if ($strand == -1);
			my $replaced = substr $new_ref_strings->{$mut->{seq_id}}, $mut->{position}-1, $mut->{size}, $replace_string;
			
			print ">> CON: Gene Conversion Mutation <<\n";
			print "$mut->{region}\n";
			print "$seq_id : $start - $end" . "\n";
			print "Original Length: " . length($new_ref_strings->{$mut->{seq_id}}) . "\n";
			print "Replace $replaced\n";
			print "With $replace_string\n";
			print "New Length: " . length($new_ref_strings->{$mut->{seq_id}}) . "\n";
		}
		else 
		{
			die "Can't handle mutation type: $mut->{type}\n";
		}
		
		## we have to update all of the other positions
		$self->shift_positions($mut);	
	}
	
	return $new_ref_strings;
}

sub shift_positions
{
	my ($self, $mut) = @_;
	my $verbose = 0;
	
	my $delta = mutation_size_change($mut);
	die "Size change not defined for mutation." if (!defined $delta);
	
	my $offset = $mut->{position};
	
	print "$offset $delta\n"  if ($verbose);
	my $inversion = 0;
	
	foreach my $mut ($self->mutation_list)
	{		
		if ($inversion)
		{
			die "shift_positions cannot handle inversions yet!";
			if (($mut->{position} > $offset) && ($mut->{position} < $offset + $delta))
			{
			}
		}
		else
		{
			if ($mut->{position} > $offset)
			{
				$mut->{position} += $delta;
			}
		}
	}
}

sub mutation_size_change
{
	my ($item) = @_;

	if ($item->{type} eq 'SNP')
	{
		return 0;
	}	
	if ($item->{type} eq 'SUB')
	{
		return length($item->{new_seq}) - $item->{size};
	}
	elsif ($item->{type} eq 'INS')
	{
		return length($item->{new_seq});
	}
	elsif ($item->{type} eq 'DEL')
	{
		return -$item->{size};
	}
	elsif ($item->{type} eq 'AMP')
	{
		return +$item->{size} * ($item->{new_copy_number} - 1);
	}
	elsif ($item->{type} eq 'MOB')
	{
		my $size = +$item->{repeat_size} + $item->{duplication_size};
		$size -= $item->{del_start} if ($item->{del_start});
		$size -= $item->{del_end} if ($item->{del_end});	
		$size += length($item->{ins_start}) if ($item->{ins_start});	
		$size += length($item->{ins_end}) if ($item->{ins_end});	
		return $size;
	}			
	elsif ($item->{type} eq 'CON')
	{	
		my $size = $item->{size};
		$item->{region} =~ m/^(.+):(.+)-(.+)$/ or die "Could not understand CON replacement region: $item->{region}";
		my $new_size = $3 - $2 + 1;
		return $item->{size} - $new_size;
	}
	return undef;
}


sub interval_un
{
	my ($gd, $start, $end) = @_;

	my @un_list = $gd->list('UN');	
	UNKNOWN: foreach my $un (@un_list) 
	{					
		return 1 if ( ($start >= $un->{start}) && ($end <= $un->{end}) );
	}
	return 0;
}

sub interval_del
{
	my ($gd, $start, $end) = @_;

	my @del_list = $gd->list('DEL');	
	DEL: foreach my $del (@del_list) 
	{					
		return 1 if ( ($start >= $del->{position}) && ($end <= $del->{position} + $del->{size} - 1) );
	}
	return 0;
}

sub mutation_evidence_list
{
	my ($self, $item) = @_;	
	die if (ref($item) ne 'HASH');
	return () if (!defined $item->{evidence});
	
	my %evidence;
	foreach my $evidence_id (@{$item->{evidence}})
	{
		$evidence{$evidence_id} = 1;
	}
	my @return_list = grep { $evidence{$_->{id}} } $self->list;
	return @return_list;
}

sub mutation_unknown
{
	my ($self, $mut) = @_;

	if ($mut->{type} eq 'SNP')
	{
		return $self->interval_un($mut->{position}, $mut->{position});
	}
	
	## should be updated to new unknown that includes linkage
	if ($mut->{type} eq 'INS')
	{
		return $self->interval_un($mut->{position}, $mut->{position}+1);
	}

	if ($mut->{type} eq 'DEL')
	{

#doesn't work b/c evidence list may not be correct here
		## only call unknowns if all support is RA
#		my $only_ra_evidence = 1;
#		foreach my $ev ($self->mutation_evidence_list($mut))
#		{
#			print Dumper($ev);
#			$only_ra_evidence &&= $ev->{type} eq 'RA';
#		}
#		print Dumper($mut);
#		print "Only RA evidence? $only_ra_evidence\n";		
#		return 0 if (!$only_ra_evidence);
		return $self->interval_un($mut->{position}, $mut->{position}+$mut->{size}-1);
	}
	
	if ($mut->{type} eq 'SUB')
	{
		return $self->interval_un($mut->{position}, $mut->{position}+$mut->{size}-1);
	}
	
	return 0;
}

sub mutation_deleted
{
	my ($self, $mut) = @_;

	if ($mut->{type} eq 'SNP')
	{
		return $self->interval_del($mut->{position}, $mut->{position});
	}
	
	## should be updated to new unknown that includes linkage
	if ($mut->{type} eq 'INS')
	{
		return $self->interval_del($mut->{position}, $mut->{position}+1);
	}

	if ($mut->{type} eq 'DEL')
	{

#doesn't work b/c evidence list may not be correct here
		## only call unknowns if all support is RA
#		my $only_ra_evidence = 1;
#		foreach my $ev ($self->mutation_evidence_list($mut))
#		{
#			print Dumper($ev);
#			$only_ra_evidence &&= $ev->{type} eq 'RA';
#		}
#		print Dumper($mut);
#		print "Only RA evidence? $only_ra_evidence\n";		
#		return 0 if (!$only_ra_evidence);
		return $self->interval_del($mut->{position}, $mut->{position}+$mut->{size}-1);
	}
	
	if ($mut->{type} eq 'SUB')
	{
		return $self->interval_del($mut->{position}, $mut->{position}+$mut->{size}-1);
	}
	
	return 0;
}

sub add_reject_reason
{
	my ($item, $reject) = @_;
	$item->{reject} .= "," if (defined ($item->{reject}));
	$item->{reject} .= $reject; 
}

sub get_reject_reasons
{
	my ($item) = @_;
	return () if (!defined $item->{reject});
	return split /,/, $item->{reject};
}

sub number_reject_reasons
{
	my ($item) = @_;
	return 0 if (!defined $item->{reject});
	return scalar get_reject_reasons($item);
}

## removes all evidence that is not referenced and renumbers
sub strip_evidence
{
	my ($self) = @_;
	
	## keep all mutations
	my @new_list = $self->mutation_list;
	
	print STDERR "Items before stripping evidence: " . (scalar $self->list) . "\n";
	
	## keep evidence only if a mutation refers to it... not very efficient way of doing this...
	EVIDENCE: foreach my $item ($self->evidence_list)
	{				
		MUTATION: foreach my $mutation ($self->mutation_list)
		{
			foreach my $test_evidence_id (@{$mutation->{evidence}}) 
			{				
				if ($item->{id} == $test_evidence_id)
				{
					push @new_list, $item;
					next EVIDENCE;
				}
			}
		}
	}
	
	@{$self->{list}} = @new_list;
	print STDERR "Items after stripping evidence: " . (scalar $self->list) . "\n";

	$self->renumber;
}

## removes certain tags for validation
sub strip_tags
{
	my ($self) = @_;
		
	## keep evidence only if a mutation refers to it... not very efficient way of doing this...
	LIST: foreach my $item ($self->list)
	{				
		delete  $item->{edit} if (defined $item->{edit});
	}
}

sub renumber
{
	my ($self) = @_;
	
	#determine what numbers are used
	my $used_index_hash;
	foreach my $item ($self->list)
	{
		 $used_index_hash->{$item->{id}} = $item;
	}
	
	#re-assign contiguous numbers in same order that we display
	my $on_id = 0;
	my $renumber_hash;
	foreach my $item ($self->list)
	{
		$renumber_hash->{$item->{id}} = ++$on_id;
	}
	
#	foreach my $id (sort {$a <=> $b } keys %$used_index_hash)
#	{		
#		#how do we want to renumber this (and all references)?
#		$renumber_hash->{$id} = ++$on_id;
#	}
		
	EVIDENCE: foreach my $item ($self->list)
	{		
		#handle '+' entries by giving them numbers and marking as edited...
		if ($item->{id} eq '+') {
			$item->{id} = ++$on_id;
			$item->{edit} = 1;
		}
		else {
			$item->{id} = $renumber_hash->{$item->{id}};
		}
		
		my @new_evidence;
		foreach my $evidence_id (@{$item->{evidence}}) 
		{
			push @new_evidence, $renumber_hash->{$evidence_id};
		}
		@{$item->{evidence}} = @new_evidence;
	}	
}


return 1;
