#!/bin/bash

#SBATCH -A eande106
#SBATCH -t 4:00:00
#SBATCH -N 1
#SBATCH -p parallel
#SBATCH -J index_c_elegans_N2_plg1

module load bwa
bwa index -p /vast/eande106/projects/Jess/index_c_elegans_N2_plg1 /vast/eande106/projects/Jess/N2_cer1_plg-1.fasta

