#!/bin/bash

#SBATCH -A eande106
#SBATCH -t 0:10:00
#SBATCH -N 1
#SBATCH -p parallel
#SBATCH -J get_bam_info
#SBATCH --array 1-112

cd /vast/eande106/projects/Jess/alignment_1/bam1/
module load anaconda
conda activate /data/eande106/software/conda_envs/pysam

BAM_FILE=$(head -n ${SLURM_ARRAY_TASK_ID} bam_list.txt | tail -n 1)
OUT_FILE=${BAM_FILE/bam/txt}
python bam_info.py ${BAM_FILE} ${OUT_FILE}
