#!/usr/bin/bash
#file1=../Undetermined_AH7YMYBGXC_S0_L001_R1_001.fastq.gz
#file2=../Undetermined_AH7YMYBGXC_S0_L001_R2_001.fastq.gz
#prefix=Lane1
file1=$1
file2=$2
prefix=$3

gunzip $file1
file1_un=${file1%.gz}
gunzip $file2
file2_un=${file2%.gz}

perl ../1_Flexible_FullTranscript_Demultiplexing.pl $file1_un $file2_un header 8 ../possible_barcodes3.txt 2 $prefix > $prefix\_summary_stats.txt

gzip $file1_un
gzip $file2_un
