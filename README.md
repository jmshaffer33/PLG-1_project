# How to complete plg-1 sequence alignments:
1. Align against N2 plg-1 region, prefix for indexed files: index_c_elegans_N2_plg1
2. Generate a strain_list.txt file with all the wild strains you want to align
3. Use create_sample_sheet.sh to generate the sample sheet for wild strains of interest, sample_sheet.tsv
4. Use alignment-nf to complete sequence alignments, resulting BAM files will be deposited in bam/ directory
5. View BAM files on IGV to assess read pileup, adjusting the range of the coverage files as needed to visualize patterns 
6. Extract individual read info from BAM files using bam_info.py
7. Use array_bam_info.sh to complete array SLURM job, so bam_info.py is applied on all BAM files and <strain>.txt files are generated
	<strain>.txt files contain read direction (forward = 1, reverse = 0), position (forward gives start, reverse gives stop) and length
8. Open a Rockfish R server and run plg-1_plots.R to generate plots for every strain on bam_list.txt
	** Jess only did following portion fo N2, you will need to scale up to complete all other strains **
9. To identify orphaned reads per strain, run identify_orphaned.py
10. Create an array job to run identify_orphaned.py across all strains
11. Use extract_fastq.py to extract reads from strain fastq files
12. Align resultant fastq files against whole strain genome
13. Convert resultant BAM into SAM 
14. Visualize genomic locations on CaeNDR Genome Browser
15. Have fun <3

Jess' BAM files, TXT files, and final plots are available in alignment_1/bam1/
alignment_2/ contains redundant alignments that were moved in to alignment_1/ and subsequently analyzed in alignment_1/
See README.md in alignment_2/ for greater explanation
