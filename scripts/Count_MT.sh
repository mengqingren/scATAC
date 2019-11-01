FILEs=All_*.bam

for BAM in $FILEs
do
   echo $BAM
   nomt=$(samtools view $BAM | sed '/\tMT\t/d' | wc -l)
   withmt=$(samtools view $BAM | wc -l)
   expr $withmt - $nomt
done





