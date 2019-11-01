#!/bin/bash
# This is just a copy of commands in 00_LIST_OF_BSUB_COMMANDS.sh so that I can run it separately from the rest of the pipeline.

OUTPUTDIR=/lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping
mkdir -p $OUTPUTDIR
INPUTDIR=/lustre/scratch117/cellgen/team218/TA/BenedettaData/Demuliplexed/Cell_Specific_FastQs
INPUTFILES=($INPUTDIR/*.gz)
NUMFILES=${#INPUTFILES[@]}
MAXJOBS=$(($NUMFILES/2))

PARAMFILE=/lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_STAR_Parameters.txt
#bsub -J"arrayjob[1-$MAXJOBS]%100" -R"select[mem>30000] rusage[mem=30000]" -M30000 -q long -o STAR_output.%J.%I /lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_MapReadsFile.sh 1 $INPUTDIR $OUTPUTDIR $PARAMFILE Benedetta
#bsub -R"select[mem>30000] rusage[mem=30000]" -M30000 -q long -o STAR_output.4.fix -e STAR_err.4.fix /lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_MapReadsFile.sh 1 $INPUTDIR $OUTPUTDIR $PARAMFILE Benedetta 4
#bsub -R"select[mem>30000] rusage[mem=30000]" -M30000 -q long -o STAR_output.5.fix -e STAR_err.5.fix /lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_MapReadsFile.sh 1 $INPUTDIR $OUTPUTDIR $PARAMFILE Benedetta 5
#bsub -R"select[mem>30000] rusage[mem=30000]" -M30000 -q long -o STAR_output.18.fix -e STAR_err.18.fix /lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_MapReadsFile.sh 1 $INPUTDIR $OUTPUTDIR $PARAMFILE Benedetta 18
bsub -R"select[mem>35000] rusage[mem=35000]" -M35000 -q long -o STAR_output.356.fix -e STAR_err.356.fix /lustre/scratch117/cellgen/team218/TA/BenedettaData/Mapping/2_MapReadsFile.sh 1 $INPUTDIR $OUTPUTDIR $PARAMFILE Benedetta 356

