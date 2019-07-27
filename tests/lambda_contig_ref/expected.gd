#=GENOME_DIFF	1.0
#=COMMAND	./src/c/breseq/breseq -j 4 -o tests/lambda_contig_ref -c tests/lambda_contig_ref/../data/lambda/lambda-contig.gbk tests/lambda_contig_ref/../data/lambda/lambda_mixed_population.fastq
#=REFSEQ	tests/lambda_contig_ref/../data/lambda/lambda-contig.gbk
#=READSEQ	tests/lambda_contig_ref/../data/lambda/lambda_mixed_population.fastq
#=CONVERTED-BASES	6998495
#=CONVERTED-READS	199957
#=INPUT-BASES	7000144
#=INPUT-READS	200010
#=MAPPED-BASES	5119770
#=MAPPED-READS	147273
DEL	1	28	NC_001416-0	139	1	gene_name=–/nu1	gene_position=intergenic (–/-52)	gene_product=–/DNA packaging protein	gene_strand=–/>	locus_tag=–/lambdap01	mutation_category=small_indel	position_end=139	position_start=139	ref_seq=G
INS	2	29	NC_001416-1	4566	G	gene_name=L/K	gene_position=intergenic (+139/-10)	gene_product=tail component/tail component	gene_strand=>/>	genes_promoter=K	locus_tag=lambdap18/lambdap19	locus_tags_promoter=lambdap19	mutation_category=small_indel	position_end=4566	position_start=4566	ref_seq=C
SNP	3	30	NC_001416-2	1261	G	aa_new_seq=E|S	aa_position=338|36	aa_ref_seq=K|F	codon_new_seq=GAA|TCT	codon_number=338|36	codon_position=1|2	codon_ref_seq=AAA|TTT	gene_name=orf-401|orf206b	gene_position=1012|107	gene_product=Tail fiber protein|hypothetical protein	gene_strand=>|<	genes_overlapping=orf-401,orf206b	locus_tag=lambdap27|lambdap90	locus_tags_overlapping=lambdap27,lambdap90	mutation_category=snp_nonsynonymous|nonsynonymous	position_end=1261	position_start=1261	ref_seq=A	snp_type=nonsynonymous|nonsynonymous	transl_table=11|11
INS	4	31	NC_001416-2	1435	C	gene_name=orf-401	gene_position=coding (1186/1206 nt)	gene_product=Tail fiber protein	gene_strand=>	genes_overlapping=orf-401	locus_tag=lambdap27	locus_tags_overlapping=lambdap27	mutation_category=small_indel	position_end=1435	position_start=1435	ref_seq=C
SNP	5	32	NC_001416-2	2314	A	aa_new_seq=N	aa_position=229	aa_ref_seq=S	codon_new_seq=AAC	codon_number=229	codon_position=2	codon_ref_seq=AGC	gene_name=orf-314	gene_position=686	gene_product=Tail fiber	gene_strand=>	genes_overlapping=orf-314	locus_tag=lambdap28	locus_tags_overlapping=lambdap28	mutation_category=snp_nonsynonymous	position_end=2314	position_start=2314	ref_seq=G	snp_type=nonsynonymous	transl_table=11
DEL	6	61,65	NC_001416-2	2338	5996	gene_name=[orf-314]–ea59	gene_product=[orf-314],orf-194,ea47,ea31,ea59	genes_inactivated=orf-314,orf-194,ea47,ea31,ea59	locus_tag=[lambdap28]–[lambdap82]	locus_tags_inactivated=lambdap28,lambdap29,lambdap80,lambdap81,lambdap82	mutation_category=large_deletion	position_end=8333	position_start=2338	ref_seq=5996-bp
SNP	7	33	NC_001416-3	1915	C	aa_new_seq=E|D	aa_position=3|61	aa_ref_seq=E|N	codon_new_seq=GAG|GAC	codon_number=3|61	codon_position=3|1	codon_ref_seq=GAA|AAC	gene_name=orf61|orf63	gene_position=9|181	gene_product=hypothetical protein|hypothetical protein	gene_strand=<|<	genes_overlapping=orf61,orf63	locus_tag=lambdap37|lambdap38	locus_tags_overlapping=lambdap37,lambdap38	mutation_category=snp_synonymous|nonsynonymous	position_end=1915	position_start=1915	ref_seq=T	snp_type=synonymous|nonsynonymous	transl_table=11|11
SNP	8	34	NC_001416-3	5833	G	aa_new_seq=G	aa_position=151	aa_ref_seq=G	codon_new_seq=GGG	codon_number=151	codon_position=3	codon_ref_seq=GGA	gene_name=lambdap48	gene_position=453	gene_product=Superinfection exclusion protein B	gene_strand=>	genes_overlapping=lambdap48	locus_tag=lambdap48	locus_tags_overlapping=lambdap48	mutation_category=snp_synonymous	position_end=5833	position_start=5833	ref_seq=A	snp_type=synonymous	transl_table=11
DEL	9	35	NC_001416-3	8717	1	gene_name=cI	gene_position=coding (123/714 nt)	gene_product=repressor	gene_strand=<	genes_inactivated=cI	locus_tag=lambdap88	locus_tags_inactivated=lambdap88	mutation_category=small_indel	position_end=8717	position_start=8717	ref_seq=C
SNP	10	36	NC_001416-4	6817	C	aa_new_seq=F	aa_position=42	aa_ref_seq=F	codon_new_seq=TTC	codon_number=42	codon_position=3	codon_ref_seq=TTT	gene_name=R	gene_position=126	gene_product=endolysin	gene_strand=>	genes_overlapping=R	locus_tag=lambdap75	locus_tags_overlapping=lambdap75	mutation_category=snp_synonymous	position_end=6817	position_start=6817	ref_seq=T	snp_type=synonymous	transl_table=11
SNP	11	42	NC_001416-4	8184	T	gene_name=bor/lambdap78	gene_position=intergenic (-233/+57)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	locus_tag=lambdap77/lambdap78	mutation_category=snp_intergenic	position_end=8184	position_start=8184	ref_seq=C	snp_type=intergenic
SNP	12	43	NC_001416-4	8191	T	gene_name=bor/lambdap78	gene_position=intergenic (-240/+50)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	locus_tag=lambdap77/lambdap78	mutation_category=snp_intergenic	position_end=8191	position_start=8191	ref_seq=C	snp_type=intergenic
SNP	13	44	NC_001416-4	8203	A	gene_name=bor/lambdap78	gene_position=intergenic (-252/+38)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	locus_tag=lambdap77/lambdap78	mutation_category=snp_intergenic	position_end=8203	position_start=8203	ref_seq=G	snp_type=intergenic
SNP	14	45	NC_001416-4	8328	G	aa_new_seq=H	aa_position=149	aa_ref_seq=H	codon_new_seq=CAC	codon_number=149	codon_position=3	codon_ref_seq=CAT	gene_name=lambdap78	gene_position=447	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_synonymous	position_end=8328	position_start=8328	ref_seq=A	snp_type=synonymous	transl_table=11
SNP	15	46	NC_001416-4	8342	T	aa_new_seq=I	aa_position=145	aa_ref_seq=V	codon_new_seq=ATT	codon_number=145	codon_position=1	codon_ref_seq=GTT	gene_name=lambdap78	gene_position=433	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_nonsynonymous	position_end=8342	position_start=8342	ref_seq=C	snp_type=nonsynonymous	transl_table=11
SNP	16	47	NC_001416-4	8442	A	aa_new_seq=N	aa_position=111	aa_ref_seq=N	codon_new_seq=AAT	codon_number=111	codon_position=3	codon_ref_seq=AAC	gene_name=lambdap78	gene_position=333	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_synonymous	position_end=8442	position_start=8442	ref_seq=G	snp_type=synonymous	transl_table=11
SNP	17	48	NC_001416-4	8514	A	aa_new_seq=I	aa_position=87	aa_ref_seq=I	codon_new_seq=ATT	codon_number=87	codon_position=3	codon_ref_seq=ATC	gene_name=lambdap78	gene_position=261	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_synonymous	position_end=8514	position_start=8514	ref_seq=G	snp_type=synonymous	transl_table=11
SNP	18	49	NC_001416-4	8559	A	aa_new_seq=N	aa_position=72	aa_ref_seq=N	codon_new_seq=AAT	codon_number=72	codon_position=3	codon_ref_seq=AAC	gene_name=lambdap78	gene_position=216	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_synonymous	position_end=8559	position_start=8559	ref_seq=G	snp_type=synonymous	transl_table=11
SNP	19	50	NC_001416-4	8597	T	aa_new_seq=N	aa_position=60	aa_ref_seq=D	codon_new_seq=AAC	codon_number=60	codon_position=1	codon_ref_seq=GAC	gene_name=lambdap78	gene_position=178	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_nonsynonymous	position_end=8597	position_start=8597	ref_seq=C	snp_type=nonsynonymous	transl_table=11
SNP	20	51	NC_001416-4	8708	C	aa_new_seq=A	aa_position=23	aa_ref_seq=T	codon_new_seq=GCG	codon_number=23	codon_position=1	codon_ref_seq=ACG	gene_name=lambdap78	gene_position=67	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_nonsynonymous	position_end=8708	position_start=8708	ref_seq=T	snp_type=nonsynonymous	transl_table=11
SNP	21	52	NC_001416-4	8728	T	aa_new_seq=K	aa_position=16	aa_ref_seq=R	codon_new_seq=AAG	codon_number=16	codon_position=2	codon_ref_seq=AGG	gene_name=lambdap78	gene_position=47	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_nonsynonymous	position_end=8728	position_start=8728	ref_seq=C	snp_type=nonsynonymous	transl_table=11
SNP	22	53	NC_001416-4	8774	A	aa_new_seq=M	aa_position=1	aa_ref_seq=M	codon_new_seq=TTG	codon_number=1	codon_position=1	codon_ref_seq=GTG	gene_name=lambdap78	gene_position=1	gene_product=putative envelope protein	gene_strand=<	genes_overlapping=lambdap78	locus_tag=lambdap78	locus_tags_overlapping=lambdap78	mutation_category=snp_synonymous	position_end=8774	position_start=8774	ref_seq=C	snp_type=synonymous	transl_table=11
SNP	23	54	NC_001416-4	8868	C	gene_name=lambdap78/lambdap79	gene_position=intergenic (-94/-69)	gene_product=putative envelope protein/hypothetical protein	gene_strand=</>	genes_promoter=lambdap78	locus_tag=lambdap78/lambdap79	locus_tags_promoter=lambdap78	mutation_category=snp_intergenic	position_end=8868	position_start=8868	ref_seq=T	snp_type=intergenic
SNP	24	55	NC_001416-4	9077	G	aa_new_seq=R	aa_position=47	aa_ref_seq=R	codon_new_seq=AGG	codon_number=47	codon_position=3	codon_ref_seq=AGA	gene_name=lambdap79	gene_position=141	gene_product=hypothetical protein	gene_strand=>	genes_overlapping=lambdap79	locus_tag=lambdap79	locus_tags_overlapping=lambdap79	mutation_category=snp_synonymous	position_end=9077	position_start=9077	ref_seq=A	snp_type=synonymous	transl_table=11
SNP	25	56	NC_001416-4	9172	C	gene_name=lambdap79/–	gene_position=intergenic (+29/–)	gene_product=hypothetical protein/–	gene_strand=>/–	locus_tag=lambdap79/–	mutation_category=snp_intergenic	position_end=9172	position_start=9172	ref_seq=T	snp_type=intergenic
SUB	26	57,58	NC_001416-4	9176	2	AC	gene_name=lambdap79/–	gene_position=intergenic (+33/–)	gene_product=hypothetical protein/–	gene_strand=>/–	locus_tag=lambdap79/–	mutation_category=small_indel	position_end=9177	position_start=9176	ref_seq=GT
SNP	27	59	NC_001416-4	9359	C	gene_name=lambdap79/–	gene_position=intergenic (+216/–)	gene_product=hypothetical protein/–	gene_strand=>/–	locus_tag=lambdap79/–	mutation_category=snp_intergenic	position_end=9359	position_start=9359	ref_seq=T	snp_type=intergenic
RA	28	.	NC_001416-0	138	0	G	.	consensus_score=296.0	frequency=1	gene_name=–/nu1	gene_position=intergenic (–/-53)	gene_product=–/DNA packaging protein	gene_strand=–/>	locus_tag=–/lambdap01	major_base=.	major_cov=33/43	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=33/43	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=33/43
RA	29	.	NC_001416-1	4566	1	.	G	consensus_score=199.3	frequency=1	gene_name=L/K	gene_position=intergenic (+139/-10)	gene_product=tail component/tail component	gene_strand=>/>	locus_tag=lambdap18/lambdap19	major_base=G	major_cov=43/30	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=43/30	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=43/30
RA	30	.	NC_001416-2	1261	0	A	G	aa_new_seq=E|S	aa_position=338|36	aa_ref_seq=K|F	bias_e_value=43080.7	bias_p_value=0.888226	codon_new_seq=GAA|TCT	codon_number=338|36	codon_position=1|2	codon_ref_seq=AAA|TTT	consensus_score=218.7	fisher_strand_p_value=1	frequency=1	gene_name=orf-401|orf206b	gene_position=1012|107	gene_product=Tail fiber protein|hypothetical protein	gene_strand=>|<	ks_quality_p_value=0.566142	locus_tag=lambdap27|lambdap90	major_base=G	major_cov=24/58	major_frequency=9.880e-01	minor_base=A	minor_cov=0/1	new_cov=24/58	new_seq=G	polymorphism_frequency=9.880e-01	polymorphism_score=-3.3	prediction=consensus	ref_cov=0/1	ref_seq=A	snp_type=nonsynonymous|nonsynonymous	total_cov=24/60	transl_table=11|11
RA	31	.	NC_001416-2	1432	1	.	C	aa_new_seq=P	aa_position=395	aa_ref_seq=A	codon_new_seq=CCC	codon_number=395	codon_position=1	codon_ref_seq=GCC	consensus_score=266.6	frequency=1	gene_name=orf-401	gene_position=1183	gene_product=Tail fiber protein	gene_strand=>	locus_tag=lambdap27	major_base=C	major_cov=32/62	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=32/62	new_seq=C	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=G	snp_type=nonsynonymous	total_cov=32/62	transl_table=11
RA	32	.	NC_001416-2	2314	0	G	A	aa_new_seq=N	aa_position=229	aa_ref_seq=S	bias_e_value=48502	bias_p_value=1	codon_new_seq=AAC	codon_number=229	codon_position=2	codon_ref_seq=AGC	consensus_score=313.4	fisher_strand_p_value=1	frequency=1	gene_name=orf-314	gene_position=686	gene_product=Tail fiber	gene_strand=>	ks_quality_p_value=0.99982	locus_tag=lambdap28	major_base=A	major_cov=37/68	major_frequency=9.906e-01	minor_base=G	minor_cov=0/1	new_cov=37/68	new_seq=A	polymorphism_frequency=9.906e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/1	ref_seq=G	snp_type=nonsynonymous	total_cov=38/69	transl_table=11
RA	33	.	NC_001416-3	1915	0	T	C	aa_new_seq=E|D	aa_position=3|61	aa_ref_seq=E|N	bias_e_value=48502	bias_p_value=1	codon_new_seq=GAG|GAC	codon_number=3|61	codon_position=3|1	codon_ref_seq=GAA|AAC	consensus_score=296.4	fisher_strand_p_value=1	frequency=1	gene_name=orf61|orf63	gene_position=9|181	gene_product=hypothetical protein|hypothetical protein	gene_strand=<|<	ks_quality_p_value=1	locus_tag=lambdap37|lambdap38	major_base=C	major_cov=59/49	major_frequency=9.908e-01	minor_base=A	minor_cov=1/0	new_cov=59/49	new_seq=C	polymorphism_frequency=9.908e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=T	snp_type=synonymous|nonsynonymous	total_cov=60/49	transl_table=11|11
RA	34	.	NC_001416-3	5833	0	A	G	aa_new_seq=G	aa_position=151	aa_ref_seq=G	bias_e_value=48502	bias_p_value=1	codon_new_seq=GGG	codon_number=151	codon_position=3	codon_ref_seq=GGA	consensus_score=181.0	fisher_strand_p_value=1	frequency=1	gene_name=lambdap48	gene_position=453	gene_product=Superinfection exclusion protein B	gene_strand=>	ks_quality_p_value=1	locus_tag=lambdap48	major_base=G	major_cov=22/45	major_frequency=9.853e-01	minor_base=T	minor_cov=0/1	new_cov=22/45	new_seq=G	polymorphism_frequency=9.853e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=A	snp_type=synonymous	total_cov=22/46	transl_table=11
RA	35	.	NC_001416-3	8714	0	C	.	bias_e_value=39008.7	bias_p_value=0.80427	consensus_score=169.7	fisher_strand_p_value=1	frequency=1	gene_name=cI	gene_position=coding (126/714 nt)	gene_product=repressor	gene_strand=<	ks_quality_p_value=0.443721	locus_tag=lambdap88	major_base=.	major_cov=28/17	major_frequency=9.783e-01	minor_base=C	minor_cov=1/0	new_cov=28/17	polymorphism_frequency=9.783e-01	polymorphism_score=-0.8	prediction=consensus	ref_cov=1/0	total_cov=29/17
RA	36	.	NC_001416-4	6817	0	T	C	aa_new_seq=F	aa_position=42	aa_ref_seq=F	bias_e_value=25092	bias_p_value=0.51734	codon_new_seq=TTC	codon_number=42	codon_position=3	codon_ref_seq=TTT	consensus_score=407.2	fisher_strand_p_value=0.197187	frequency=1	gene_name=R	gene_position=126	gene_product=endolysin	gene_strand=>	ks_quality_p_value=1	locus_tag=lambdap75	major_base=C	major_cov=64/82	major_frequency=9.865e-01	minor_base=A	minor_cov=2/0	new_cov=64/82	new_seq=C	polymorphism_frequency=9.865e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/1	ref_seq=T	snp_type=synonymous	total_cov=66/83	transl_table=11
RA	37	.	NC_001416-4	7629	0	T	C	bias_e_value=911.861	bias_p_value=0.0188005	consensus_reject=FREQUENCY_CUTOFF	consensus_score=141.0	fisher_strand_p_value=0.00501725	frequency=2.414e-01	gene_name=Rz/bor	gene_position=intergenic (+3/+29)	gene_product=cell lysis protein/Bor protein precursor	gene_strand=>/<	ks_quality_p_value=0.542572	locus_tag=lambdap76/lambdap77	major_base=T	major_cov=29/37	major_frequency=7.586e-01	minor_base=C	minor_cov=17/4	new_cov=17/4	polymorphism_frequency=2.414e-01	polymorphism_score=32.0	prediction=polymorphism	ref_cov=29/37	snp_type=intergenic	total_cov=46/41
RA	38	.	NC_001416-4	7796	0	G	A	aa_new_seq=V	aa_position=52	aa_ref_seq=V	bias_e_value=3262.13	bias_p_value=0.0672576	codon_new_seq=GTT	codon_number=52	codon_position=3	codon_ref_seq=GTC	consensus_reject=FREQUENCY_CUTOFF	consensus_score=115.3	fisher_strand_p_value=0.140556	frequency=2.614e-01	gene_name=bor	gene_position=156	gene_product=Bor protein precursor	gene_strand=<	ks_quality_p_value=0.0889035	locus_tag=lambdap77	major_base=G	major_cov=41/24	major_frequency=7.386e-01	minor_base=A	minor_cov=10/13	new_cov=10/13	new_seq=A	polymorphism_frequency=2.614e-01	polymorphism_score=44.5	prediction=polymorphism	ref_cov=41/24	ref_seq=G	snp_type=synonymous	total_cov=51/38	transl_table=11
RA	39	.	NC_001416-4	7807	0	T	C	aa_new_seq=E	aa_position=49	aa_ref_seq=K	bias_e_value=17253.5	bias_p_value=0.355728	codon_new_seq=GAG	codon_number=49	codon_position=1	codon_ref_seq=AAG	consensus_reject=FREQUENCY_CUTOFF	consensus_score=127.4	fisher_strand_p_value=0.150732	frequency=2.162e-01	gene_name=bor	gene_position=145	gene_product=Bor protein precursor	gene_strand=<	ks_quality_p_value=0.738595	locus_tag=lambdap77	major_base=T	major_cov=38/20	major_frequency=7.838e-01	minor_base=C	minor_cov=7/9	new_cov=7/9	new_seq=C	polymorphism_frequency=2.162e-01	polymorphism_score=25.0	prediction=polymorphism	ref_cov=38/20	ref_seq=T	snp_type=nonsynonymous	total_cov=45/29	transl_table=11
RA	40	.	NC_001416-4	7811	0	C	T	aa_new_seq=G	aa_position=47	aa_ref_seq=G	bias_e_value=31755	bias_p_value=0.654715	codon_new_seq=GGA	codon_number=47	codon_position=3	codon_ref_seq=GGG	consensus_reject=FREQUENCY_CUTOFF	consensus_score=128.4	fisher_strand_p_value=0.436944	frequency=2.093e-01	gene_name=bor	gene_position=141	gene_product=Bor protein precursor	gene_strand=<	ks_quality_p_value=0.674367	locus_tag=lambdap77	major_base=C	major_cov=41/27	major_frequency=7.907e-01	minor_base=T	minor_cov=9/9	new_cov=9/9	new_seq=T	polymorphism_frequency=2.093e-01	polymorphism_score=32.2	prediction=polymorphism	ref_cov=41/27	ref_seq=C	snp_type=synonymous	total_cov=50/36	transl_table=11
RA	41	.	NC_001416-4	8152	1	.	A	bias_e_value=46532.5	bias_p_value=0.959393	consensus_reject=FREQUENCY_CUTOFF	consensus_score=130.5	fisher_strand_p_value=0.755609	frequency=7.931e-01	gene_name=bor/lambdap78	gene_position=intergenic (-201/+89)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	ks_quality_p_value=0.964658	locus_tag=lambdap77/lambdap78	major_base=A	major_cov=22/24	major_frequency=7.931e-01	minor_base=.	minor_cov=5/7	new_cov=22/24	polymorphism_frequency=7.931e-01	polymorphism_score=39.4	prediction=polymorphism	ref_cov=5/7	snp_type=intergenic	total_cov=27/31
RA	42	.	NC_001416-4	8184	0	C	T	consensus_score=271.6	frequency=1	gene_name=bor/lambdap78	gene_position=intergenic (-233/+57)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	locus_tag=lambdap77/lambdap78	major_base=T	major_cov=52/38	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=52/38	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=52/38
RA	43	.	NC_001416-4	8191	0	C	T	bias_e_value=28826.1	bias_p_value=0.594329	consensus_score=188.8	fisher_strand_p_value=0.499561	frequency=1	gene_name=bor/lambdap78	gene_position=intergenic (-240/+50)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	ks_quality_p_value=0.497205	locus_tag=lambdap77/lambdap78	major_base=T	major_cov=36/30	major_frequency=9.706e-01	minor_base=C	minor_cov=2/0	new_cov=36/30	polymorphism_frequency=9.706e-01	polymorphism_score=-3.0	prediction=consensus	ref_cov=2/0	snp_type=intergenic	total_cov=38/30
RA	44	.	NC_001416-4	8203	0	G	A	consensus_score=191.8	frequency=1	gene_name=bor/lambdap78	gene_position=intergenic (-252/+38)	gene_product=Bor protein precursor/putative envelope protein	gene_strand=</<	locus_tag=lambdap77/lambdap78	major_base=A	major_cov=27/42	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=27/42	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=27/42
RA	45	.	NC_001416-4	8328	0	A	G	aa_new_seq=H	aa_position=149	aa_ref_seq=H	codon_new_seq=CAC	codon_number=149	codon_position=3	codon_ref_seq=CAT	consensus_score=218.7	frequency=1	gene_name=lambdap78	gene_position=447	gene_product=putative envelope protein	gene_strand=<	locus_tag=lambdap78	major_base=G	major_cov=42/35	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=42/35	new_seq=G	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=A	snp_type=synonymous	total_cov=42/35	transl_table=11
RA	46	.	NC_001416-4	8342	0	C	T	aa_new_seq=I	aa_position=145	aa_ref_seq=V	bias_e_value=48499.6	bias_p_value=0.99995	codon_new_seq=ATT	codon_number=145	codon_position=1	codon_ref_seq=GTT	consensus_score=208.1	fisher_strand_p_value=1	frequency=1	gene_name=lambdap78	gene_position=433	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=0.98999	locus_tag=lambdap78	major_base=T	major_cov=38/32	major_frequency=9.859e-01	minor_base=C	minor_cov=1/0	new_cov=38/32	new_seq=T	polymorphism_frequency=9.859e-01	polymorphism_score=-4.1	prediction=consensus	ref_cov=1/0	ref_seq=C	snp_type=nonsynonymous	total_cov=39/33	transl_table=11
RA	47	.	NC_001416-4	8442	0	G	A	aa_new_seq=N	aa_position=111	aa_ref_seq=N	bias_e_value=48502	bias_p_value=1	codon_new_seq=AAT	codon_number=111	codon_position=3	codon_ref_seq=AAC	consensus_score=211.1	fisher_strand_p_value=1	frequency=1	gene_name=lambdap78	gene_position=333	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=0.999609	locus_tag=lambdap78	major_base=A	major_cov=26/45	major_frequency=9.861e-01	minor_base=G	minor_cov=0/1	new_cov=26/45	new_seq=A	polymorphism_frequency=9.861e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/1	ref_seq=G	snp_type=synonymous	total_cov=26/46	transl_table=11
RA	48	.	NC_001416-4	8514	0	G	A	aa_new_seq=I	aa_position=87	aa_ref_seq=I	bias_e_value=26752.3	bias_p_value=0.551571	codon_new_seq=ATT	codon_number=87	codon_position=3	codon_ref_seq=ATC	consensus_score=301.4	fisher_strand_p_value=0.218987	frequency=1	gene_name=lambdap78	gene_position=261	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=1	locus_tag=lambdap78	major_base=A	major_cov=46/54	major_frequency=9.804e-01	minor_base=C	minor_cov=2/0	new_cov=46/54	new_seq=A	polymorphism_frequency=9.804e-01	polymorphism_score=-4.1	prediction=consensus	ref_cov=1/0	ref_seq=G	snp_type=synonymous	total_cov=49/54	transl_table=11
RA	49	.	NC_001416-4	8559	0	G	A	aa_new_seq=N	aa_position=72	aa_ref_seq=N	codon_new_seq=AAT	codon_number=72	codon_position=3	codon_ref_seq=AAC	consensus_score=213.5	frequency=1	gene_name=lambdap78	gene_position=216	gene_product=putative envelope protein	gene_strand=<	locus_tag=lambdap78	major_base=A	major_cov=25/46	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=25/46	new_seq=A	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=G	snp_type=synonymous	total_cov=25/46	transl_table=11
RA	50	.	NC_001416-4	8597	0	C	T	aa_new_seq=N	aa_position=60	aa_ref_seq=D	bias_e_value=35347.1	bias_p_value=0.728776	codon_new_seq=AAC	codon_number=60	codon_position=1	codon_ref_seq=GAC	consensus_score=242.9	fisher_strand_p_value=0.433735	frequency=1	gene_name=lambdap78	gene_position=178	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=0.832217	locus_tag=lambdap78	major_base=T	major_cov=35/47	major_frequency=9.880e-01	minor_base=C	minor_cov=1/0	new_cov=35/47	new_seq=T	polymorphism_frequency=9.880e-01	polymorphism_score=-3.7	prediction=consensus	ref_cov=1/0	ref_seq=C	snp_type=nonsynonymous	total_cov=36/47	transl_table=11
RA	51	.	NC_001416-4	8708	0	T	C	aa_new_seq=A	aa_position=23	aa_ref_seq=T	codon_new_seq=GCG	codon_number=23	codon_position=1	codon_ref_seq=ACG	consensus_score=161.5	frequency=1	gene_name=lambdap78	gene_position=67	gene_product=putative envelope protein	gene_strand=<	locus_tag=lambdap78	major_base=C	major_cov=34/25	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=34/25	new_seq=C	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=T	snp_type=nonsynonymous	total_cov=34/25	transl_table=11
RA	52	.	NC_001416-4	8728	0	C	T	aa_new_seq=K	aa_position=16	aa_ref_seq=R	bias_e_value=48502	bias_p_value=1	codon_new_seq=AAG	codon_number=16	codon_position=2	codon_ref_seq=AGG	consensus_score=254.8	fisher_strand_p_value=1	frequency=1	gene_name=lambdap78	gene_position=47	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=1	locus_tag=lambdap78	major_base=T	major_cov=42/42	major_frequency=9.882e-01	minor_base=G	minor_cov=0/1	new_cov=42/42	new_seq=T	polymorphism_frequency=9.882e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=C	snp_type=nonsynonymous	total_cov=42/43	transl_table=11
RA	53	.	NC_001416-4	8774	0	C	A	aa_new_seq=M	aa_position=1	aa_ref_seq=M	bias_e_value=38321.9	bias_p_value=0.79011	codon_new_seq=TTG	codon_number=1	codon_position=1	codon_ref_seq=GTG	consensus_score=244.1	fisher_strand_p_value=0.426829	frequency=1	gene_name=lambdap78	gene_position=1	gene_product=putative envelope protein	gene_strand=<	ks_quality_p_value=0.999699	locus_tag=lambdap78	major_base=A	major_cov=34/47	major_frequency=9.878e-01	minor_base=C	minor_cov=1/0	new_cov=34/47	new_seq=A	polymorphism_frequency=9.878e-01	polymorphism_score=NA	prediction=consensus	ref_cov=1/0	ref_seq=C	snp_type=synonymous	total_cov=35/47	transl_table=11
RA	54	.	NC_001416-4	8868	0	T	C	consensus_score=265.7	frequency=1	gene_name=lambdap78/lambdap79	gene_position=intergenic (-94/-69)	gene_product=putative envelope protein/hypothetical protein	gene_strand=</>	locus_tag=lambdap78/lambdap79	major_base=C	major_cov=48/47	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=48/47	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=48/47
RA	55	.	NC_001416-4	9077	0	A	G	aa_new_seq=R	aa_position=47	aa_ref_seq=R	codon_new_seq=AGG	codon_number=47	codon_position=3	codon_ref_seq=AGA	consensus_score=237.8	frequency=1	gene_name=lambdap79	gene_position=141	gene_product=hypothetical protein	gene_strand=>	locus_tag=lambdap79	major_base=G	major_cov=35/53	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=35/53	new_seq=G	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	ref_seq=A	snp_type=synonymous	total_cov=35/53	transl_table=11
RA	56	.	NC_001416-4	9172	0	T	C	consensus_score=276.5	frequency=1	gene_name=lambdap79/–	gene_position=intergenic (+29/–)	gene_product=hypothetical protein/–	gene_strand=>/–	locus_tag=lambdap79/–	major_base=C	major_cov=48/50	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=48/50	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=48/50
RA	57	.	NC_001416-4	9176	0	G	A	consensus_score=243.9	frequency=1	gene_name=lambdap79/–	gene_position=intergenic (+33/–)	gene_product=hypothetical protein/–	gene_strand=>/–	locus_tag=lambdap79/–	major_base=A	major_cov=43/41	major_frequency=1.000e+00	minor_base=N	minor_cov=0/0	new_cov=43/41	polymorphism_frequency=1.000e+00	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=43/41
RA	58	.	NC_001416-4	9177	0	T	C	bias_e_value=40648.5	bias_p_value=0.838079	consensus_score=230.8	fisher_strand_p_value=0.488095	frequency=1	gene_name=lambdap79/–	gene_position=intergenic (+34/–)	gene_product=hypothetical protein/–	gene_strand=>/–	ks_quality_p_value=0.999713	locus_tag=lambdap79/–	major_base=C	major_cov=43/40	major_frequency=9.881e-01	minor_base=G	minor_cov=0/1	new_cov=43/40	polymorphism_frequency=9.881e-01	polymorphism_score=NA	prediction=consensus	ref_cov=0/0	snp_type=intergenic	total_cov=43/41
RA	59	.	NC_001416-4	9359	0	T	C	bias_e_value=42269.6	bias_p_value=0.871502	consensus_score=150.7	fisher_strand_p_value=0.582108	frequency=1	gene_name=lambdap79/–	gene_position=intergenic (+216/–)	gene_product=hypothetical protein/–	gene_strand=>/–	ks_quality_p_value=0.92422	locus_tag=lambdap79/–	major_base=C	major_cov=35/38	major_frequency=8.202e-01	minor_base=T	minor_cov=6/10	new_cov=35/38	polymorphism_frequency=8.202e-01	polymorphism_score=28.1	prediction=consensus	ref_cov=6/10	snp_type=intergenic	total_cov=41/48
MC	60	.	NC_001416-0	1	2	0	0	gene_name=–/nu1	gene_position=intergenic (–/-189)	gene_product=–/DNA packaging protein	gene_strand=–/>	left_inside_cov=0	left_outside_cov=NA	locus_tag=–/lambdap01	right_inside_cov=0	right_outside_cov=157
MC	61	.	NC_001416-2	2338	8333	0	0	gene_name=[orf-314]–ea59	gene_product=[orf-314],orf-194,ea47,ea31,ea59	left_inside_cov=0	left_outside_cov=102	locus_tag=[lambdap28]–[lambdap82]	right_inside_cov=1	right_outside_cov=103
MC	62	.	NC_001416-4	9667	9701	0	0	gene_name=lambdap79/–	gene_position=intergenic (+524/–)	gene_product=hypothetical protein/–	gene_strand=>/–	left_inside_cov=22	left_outside_cov=28	locus_tag=lambdap79/–	right_inside_cov=0	right_outside_cov=NA
JC	63	.	NC_001416-0	9700	-1	NC_001416-1	1	1	0	alignment_overlap=0	coverage_minus=76	coverage_plus=40	flanking_left=35	flanking_right=35	frequency=1	junction_possible_overlap_registers=34	key=NC_001416-0__9700__-1__NC_001416-1__1__1__0____35__35__0__0	max_left=34	max_left_minus=34	max_left_plus=34	max_min_left=17	max_min_left_minus=17	max_min_left_plus=16	max_min_right=17	max_min_right_minus=17	max_min_right_plus=12	max_pos_hash_score=68	max_right=34	max_right_minus=34	max_right_plus=33	neg_log10_pos_hash_p_value=0.1	new_junction_coverage=1.24	new_junction_read_count=145	polymorphism_frequency=1.000e+00	pos_hash_score=48	prediction=consensus	side_1_annotate_key=gene	side_1_continuation=0	side_1_coverage=0.00	side_1_overlap=0	side_1_possible_overlap_registers=34	side_1_read_count=0	side_1_redundant=0	side_2_annotate_key=gene	side_2_continuation=0	side_2_coverage=0.00	side_2_overlap=0	side_2_possible_overlap_registers=34	side_2_read_count=0	side_2_redundant=0	total_non_overlap_reads=116
JC	64	.	NC_001416-1	9700	-1	NC_001416-2	1	1	0	alignment_overlap=0	coverage_minus=35	coverage_plus=52	flanking_left=35	flanking_right=35	frequency=1	junction_possible_overlap_registers=34	key=NC_001416-1__9700__-1__NC_001416-2__1__1__0____35__35__0__0	max_left=34	max_left_minus=33	max_left_plus=34	max_min_left=17	max_min_left_minus=17	max_min_left_plus=16	max_min_right=17	max_min_right_minus=17	max_min_right_plus=17	max_pos_hash_score=68	max_right=34	max_right_minus=34	max_right_plus=34	neg_log10_pos_hash_p_value=0.0	new_junction_coverage=0.81	new_junction_read_count=95	polymorphism_frequency=1.000e+00	pos_hash_score=46	prediction=consensus	side_1_annotate_key=gene	side_1_continuation=0	side_1_coverage=0.00	side_1_overlap=0	side_1_possible_overlap_registers=34	side_1_read_count=0	side_1_redundant=0	side_2_annotate_key=gene	side_2_continuation=0	side_2_coverage=0.00	side_2_overlap=0	side_2_possible_overlap_registers=34	side_2_read_count=0	side_2_redundant=0	total_non_overlap_reads=87
JC	65	.	NC_001416-2	2337	-1	NC_001416-2	8334	1	0	alignment_overlap=5	coverage_minus=33	coverage_plus=34	flanking_left=35	flanking_right=35	frequency=1	junction_possible_overlap_registers=29	key=NC_001416-2__2337__-1__NC_001416-2__8329__1__5____35__35__0__0	max_left=29	max_left_minus=27	max_left_plus=29	max_min_left=13	max_min_left_minus=13	max_min_left_plus=11	max_min_right=15	max_min_right_minus=15	max_min_right_plus=15	max_pos_hash_score=58	max_right=29	max_right_minus=29	max_right_plus=28	neg_log10_pos_hash_p_value=0.0	new_junction_coverage=0.79	new_junction_read_count=79	polymorphism_frequency=9.937e-01	pos_hash_score=36	prediction=consensus	side_1_annotate_key=gene	side_1_continuation=0	side_1_coverage=0.00	side_1_overlap=5	side_1_possible_overlap_registers=34	side_1_read_count=0	side_1_redundant=0	side_2_annotate_key=gene	side_2_continuation=0	side_2_coverage=0.01	side_2_overlap=0	side_2_possible_overlap_registers=29	side_2_read_count=1	side_2_redundant=0	total_non_overlap_reads=67
JC	66	.	NC_001416-2	9701	-1	NC_001416-3	1	1	0	alignment_overlap=0	coverage_minus=36	coverage_plus=18	flanking_left=35	flanking_right=35	frequency=1	junction_possible_overlap_registers=34	key=NC_001416-2__9701__-1__NC_001416-3__1__1__0____35__35__0__0	max_left=34	max_left_minus=33	max_left_plus=34	max_min_left=15	max_min_left_minus=15	max_min_left_plus=15	max_min_right=17	max_min_right_minus=17	max_min_right_plus=12	max_pos_hash_score=68	max_right=34	max_right_minus=34	max_right_plus=24	neg_log10_pos_hash_p_value=0.0	new_junction_coverage=0.56	new_junction_read_count=65	polymorphism_frequency=1.000e+00	pos_hash_score=32	prediction=consensus	side_1_annotate_key=gene	side_1_continuation=0	side_1_coverage=0.00	side_1_overlap=0	side_1_possible_overlap_registers=34	side_1_read_count=0	side_1_redundant=0	side_2_annotate_key=gene	side_2_continuation=0	side_2_coverage=0.00	side_2_overlap=0	side_2_possible_overlap_registers=34	side_2_read_count=0	side_2_redundant=0	total_non_overlap_reads=54
JC	67	.	NC_001416-3	9700	-1	NC_001416-4	1	1	0	alignment_overlap=0	coverage_minus=63	coverage_plus=67	flanking_left=35	flanking_right=35	frequency=1	junction_possible_overlap_registers=34	key=NC_001416-3__9700__-1__NC_001416-4__1__1__0____35__35__0__0	max_left=34	max_left_minus=34	max_left_plus=34	max_min_left=16	max_min_left_minus=16	max_min_left_plus=16	max_min_right=17	max_min_right_minus=17	max_min_right_plus=17	max_pos_hash_score=68	max_right=34	max_right_minus=34	max_right_plus=33	neg_log10_pos_hash_p_value=0.2	new_junction_coverage=1.34	new_junction_read_count=157	polymorphism_frequency=1.000e+00	pos_hash_score=53	prediction=consensus	side_1_annotate_key=gene	side_1_continuation=0	side_1_coverage=0.00	side_1_overlap=0	side_1_possible_overlap_registers=34	side_1_read_count=0	side_1_redundant=0	side_2_annotate_key=gene	side_2_continuation=0	side_2_coverage=0.00	side_2_overlap=0	side_2_possible_overlap_registers=34	side_2_read_count=0	side_2_redundant=0	total_non_overlap_reads=130
UN	68	.	NC_001416-0	1	8
UN	69	.	NC_001416-2	2338	8333
UN	70	.	NC_001416-4	9685	9685
UN	71	.	NC_001416-4	9689	9689
UN	72	.	NC_001416-4	9691	9691
UN	73	.	NC_001416-4	9693	9701
