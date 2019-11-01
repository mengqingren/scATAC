#!/usr/bin/bash
PICARD=/software/team218/TA/OtherTools/picard.jar
JAVA=/software/jre1.8.0_131/bin/java
BAM=$1
OUT=DupMarked_$BAM

if [ -z $BAM ] 
then
   echo "Requires BAM file as argument."
   exit 1
fi


export _JAVA_OPTIONS="-Xmx2000M -XX:MaxHeapSize=2000m"

$JAVA -jar -Xmx2000M -XX:MaxHeapSize=2000m $PICARD MarkDuplicates ASSUME_SORT_ORDER=coordinate I=$BAM O=$OUT M=${BAM}.picard.metrics
