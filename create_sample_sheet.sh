#!/bin/bash

# usage: create_sample_sheet.sh <strain_list.txt> <sample_sheet.tsv>

strain_list=$1
sample_sheet=$2

STRAINS=($(cat ${strain_list}))
echo -e "strain\tlb\tid\tfq1\tfq2\tseq_folder" > ${sample_sheet}
for I in $(seq 0 1 $(expr ${#STRAINS[*]} - 1)); do
    for J in ${STRAINS[${I}]}_*_1R.fq.gz; do
        echo $J | awk '
        {
            split($1,A,"_");
            STRAIN=A[1];
            LB=A[2];
            REP=A[3];
            ID=STRAIN "_" LB "_" REP;
            printf "%s\t%s\t%s\t%s_1R.fq.gz\t%s_2R.fq.gz\t\n", STRAIN, LB, ID, ID, ID;
        }' >> ${sample_sheet}
    done
done
