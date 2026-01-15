#!/usr/bin/env python3

# paste script in directory with bam files
# pass input bam file name  in terminal as argument[1]
# give name to output file as .tsv or .txt in terminal as argument[2]
# must activate pysam conda environment

import pysam
import sys


output_file = open(sys.argv[2], "w")

bam_file = open(sys.argv[1])

samfile = pysam.AlignmentFile(bam_file)

for read in samfile:
	if read.is_mapped == True:
		if read.is_forward == True:
			if 13299 < read.reference_start < 14299:
				if read.mate_is_mapped == False:
					orphaned_read_start = read.query_name
					output_file.write(f"{orphaned_read_start}\n")
		if read.is_reverse == True:
			if 5236 < read.reference_end < 6236:
				if read.mate_is_mapped == False:
					orphaned_read_stop = read.query_name
					output_file.write(f"{orphaned_read_stop}\n")
	else:
		continue
