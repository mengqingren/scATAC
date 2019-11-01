for file in *.bam
do
  echo $file
  samtools view $file | wc -l 
done
