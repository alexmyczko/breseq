/*****************************************************************************

AUTHORS

  Jeffrey E. Barrick <jeffrey.e.barrick@gmail.com>
  David B. Knoester

LICENSE AND COPYRIGHT

  Copyright (c) 2008-2010 Michigan State University
  Copyright (c) 2011 The University of Texas at Austin

  breseq is free software; you can redistribute it and/or modify it under the  
  terms the GNU General Public License as published by the Free Software 
  Foundation; either version 1, or (at your option) any later version.

*****************************************************************************/

#ifndef _BRESEQ_CONTINGENCY_LOCI_H_
#define _BRESEQ_CONTINGENCY_LOCI_H_

#include "breseq/common.h"
#include "breseq/pileup_base.h"
#include "breseq/annotated_sequence.h"

using namespace std;

namespace breseq {
	      
    //Unnecessary stuff that I need to graph stuff
    
    vector<int> readIndices();
    

	void analyze_contingency_loci(const string& bam,
                        const string& fasta,
                        const string& output
                        );
	

	
  // Structure to hold information about repeats
	struct homopolymer_repeat {
        /*
		homopolymer_repeat() {
			bzero(this,sizeof(homopolymer_repeat));
		}*/
		
        string    seq_id;
        uint32_t  start;
        uint32_t  length;
        char      base;
        vector<double> freqs;
	};
    
    struct repeat_stats {
        string region;
        vector<double> freqs;
        
        repeat_stats( string r ){
            region = r;
        }
    };
	
  typedef vector<homopolymer_repeat> homopolymer_repeat_list;

  // Function to identify repeats
  void identify_homopolymer_repeats(homopolymer_repeat_list& hr, const cReferenceSequences& ref_seqs);
  
	/*! Error-counting class.
	 
	 This class is used by the above identify_mutations() function in order to count errors.
	 */
	class contingency_loci_pileup : public pileup_base {
	public:

		
		//! Constructor.
		contingency_loci_pileup(
                              const string& bam,
															const string& fasta
                            );
				
		//! Destructor.
		virtual ~contingency_loci_pileup() {};		
		
    //! Main function that analyzes a single repeat locus...
    //  ... should either return or output results!
    void analyze_contingency_locus(const string& region_of_interest);

		//! Called for each alignment.
		virtual void fetch_callback(const alignment_wrapper& a);
    
        
        void printStats(const string& output){
            cout << "PRINTING...\n";
            getchar();
            ofstream out(output.c_str());
            assert(!out.fail()); 
            
            int mindiff = 0;
            int maxdiff = 0;
            
            //Finds the max and min diff with respect to the length of the original repeat
            for( size_t i=0; i<repeats.size(); i++ ){
                vector<string> bounds = split( split( repeats[i].region, ":" )[1], "-" );
                int length = atoi( bounds[1].c_str() ) - atoi( bounds[0].c_str() );
                //out << repeats[i].region << ":" << length << " ";
                //cout << length << "\n";
        
                int diff = (repeats[i].freqs.size()+1)-length;
                if( diff > maxdiff ){
                    maxdiff = diff;
                }
                
                //Finds the greatest del
                for( size_t j=0; j<repeats[i].freqs.size(); j++ ){
                    if( repeats[i].freqs[j] != 0 ){
                        if( static_cast<int32_t>(j)-length < mindiff ){
                            mindiff = j-length;
                        }
                        break;
                    }
                }

            }
            
            //cout << mindiff << ":" << maxdiff << "\n";
            //getchar();
            
            for( size_t i=0; i<repeats.size(); i++ ){
                vector<string> bounds = split( split( repeats[i].region, ":" )[1], "-" );
                int length = atoi( bounds[1].c_str() ) - atoi( bounds[0].c_str() );
                for( size_t j=mindiff+length; j<repeats[i].freqs.size(); j++ ){
                    out << repeats[i].freqs[j] << " ";
                }
                for( size_t j=0; j<length+maxdiff-repeats[i].freqs.size(); j++ ){
                    out << 0 << " ";
                }
                out << bounds[0];
                out << "\n";
                
            }
            /*   
            for( int i=0; i<repeats.size(); i++ ){
                for( int j=0; j<repeats[i].freqs.size(); j++ ){
                    out << repeats[i].freqs[j] << " ";
                }
                out << "\n";
            }*/
            out << mindiff << " " << maxdiff;
            out.close();
        }

        
 
        
        
	protected:
        // These are used to store information for each run of analyze_contingency_locus
        vector<repeat_stats> repeats;
        homopolymer_repeat current_region;
        string fastaf;
        tam_file tf;
        //const string& bamf;
        //const string& fastaf;
        
        
        //Unnecessary stuff:
        vector<int> indices;
        

    // Add variables that keep track of distribution while fetch_callback is called....
        
        

	};  
    

    
    
    //
    
    void writeTAM( const string& tam_file_name, const string& fasta, contingency_loci_pileup clp, alignment_list al );

  
} // breseq namespace


#endif