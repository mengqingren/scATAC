FILEs=All_*.bam

for BAM in $FILEs
do
  echo $BAM
#  ~/RNASeqPipeline/3_Picard_Dedup.sh $BAM

#  samtools view -h -F 1024 DupMarked_$BAM | sed '/MT/d;/ERCC/d' | samtools view -S -b > filtered_$BAM
  samtools view -h -F 1024 DupMarked_$BAM | sed '/MT/d;/ERCC/d;/\tX\t/d;/\tY\t/d' | samtools view -S -b > filtered_$BAM
done
