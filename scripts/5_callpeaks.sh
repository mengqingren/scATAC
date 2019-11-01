
source ~/.bashrc
conda activate macs

BAM=$1
PREFIX=`basename $BAM`
PREFIX=${PREFIX%.bam}


macs2 callpeak -t $BAM -f BAM -n $PREFIX -s 75 --call-summits --nomodel --llocal 1000000 
