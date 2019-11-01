#!/bin/bash
# Initial QC
FASTQFILE=$1
OUTDIR=$2
FASTQC=/nfs/users/nfs_t/ta6/RNASeqPipeline/software/FastQC/fastqc
LIMITFILE=/nfs/users/nfs_t/ta6/RNASeqPipeline/0_FASTQC_limits.txt
# There is also the -o for an appropriate output directory

mkdir -p $OUTDIR

if [ ! -f "$FASTQFILE" ] ; then
  echo "Sorry $FASTQFILE does not exist "
  exit 1
fi

if [ ! -f "$FASTQC" ] ; then
  echo "Sorry FASTQC not available "
  exit 1
fi

export _JAVA_OPTIONS="-Xmx100M -XX:MaxHeapSize=100m"
$FASTQC -l $LIMITFILE --quiet $FASTQFILE -o $OUTDIR

