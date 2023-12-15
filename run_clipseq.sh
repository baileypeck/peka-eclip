#!/bin/bash
# Script name = nextflowclipseq
echo "nextflowclipseq"
echo "##################"
echo "Created by = bdpeck"
echo "##"
echo "Date Created = 12DEC23 "
echo "##"
echo "Date Updated = 12DEC23"
echo "##"
echo "Date Job Run = 13DEC23"
echo "#################"
#$ -N nextflowclipseq
#$ -q CCOM
#$ -M bdpeck@uiowa.edu
#$ -m beas
#$ -j Y
#$ -o /Users/bdpeck/qsubout.txt
#$ -pe smp 16
#$ -l h_vmem=1000G
#$ -l h_rt=1000:0:0
#################
export NXF_SINGULARITY_CACHEDIR=/Users/bdpeck/singularity
REFDIR=/Users/bdpeck/ref
cd /Users/bdpeck
module load  stack/2022.2
module load stack/2022.2-base_arch
module load nextflow/22.10.1_gcc-9.5.0
nextflow pull baileypeck/peka-eclip
nextflow run baileypeck/peka-eclip
-profile 'singularity' \
--input 'sample.csv' \
--outdir 'results' \
--umi_separator '_' \
--smrna_org 'human' \
--fasta $REFDIR/gencode.v44.transcripts.fa \
--gtf $REFDIR/gencode.v44.basic.annotation.gtf \
