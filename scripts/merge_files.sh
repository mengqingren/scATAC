#!/usr/bin/bash
input="/lustre/scratch117/cellgen/team218/TA/BenedettaData/possible_barcodes3.txt"
while IFS= read -r line
do
  cat Lane1_${line}_read1.fq Lane2_${line}_read1.fq Lane3_${line}_read1.fq Lane4_${line}_read1.fq > Cell_Specific_FastQs/All_${line}_read1.fq
  cat Lane1_${line}_read2.fq Lane2_${line}_read2.fq Lane3_${line}_read2.fq Lane4_${line}_read2.fq > Cell_Specific_FastQs/All_${line}_read2.fq
done < "$input"
