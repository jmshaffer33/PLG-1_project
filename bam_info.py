#!/usr/bin/env python3

# paste script in directory with bam files
# pass input bam file name  in terminal as argument[1]
# give name to output file as .tsv in terminal as argument[2]
# must activate pysam conda environment

import pysam
import sys

output_file = open(sys.argv[2], "w")
output_file.write(f"direction\tposition\tlength\n")

bam_file = open(sys.argv[1])

samfile = pysam.AlignmentFile(bam_file)

for read in samfile:
	read_length = read.template_length
	if read.is_mapped == True:
		if read.is_forward == True:
			# forward = 1
			start_position = read.reference_start
			output_file.write(f"1\t{start_position}\t{read_length}\n")
		if read.is_reverse == True:
			# reverse = 0
			stop_position = read.reference_end
			output_file.write(f"0\t{stop_position}\t{read_length}\n")
	else:
		continue
