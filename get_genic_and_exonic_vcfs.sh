#!/bin/bash
# Grid Engine options
#$ -N get_genic_exonic_vcfs
#$ -cwd
#$ -M prasundutta87@gmail.com
#$ -m bea
#$ -pe sharedmem 1
#$ -l h_vmem=8G
#$ -t 1:4
#$ -l h_rt=42:00:0
#$ -R y
# Initialise the modules framework
. /etc/profile.d/modules.sh

module load igmm/apps/bcftools/1.6 igmm/apps/tabix/0.2.6 roslin/bedtools/2.26.0

sample=`head -$SGE_TASK_ID samples.txt | tail -1`

bcftools view -g het -i 'GQ >= 40' "$sample".vcf.gz > "$sample"_het_GQ40.vcf

#bedtools intersect -a "$sample"_het_GQ40.vcf -b genes_coordinates_no_MT.bed -header >"$sample"_het_GQ40_genic.vcf

bedtools intersect -a "$sample"_het_GQ40.vcf -b exons_water_buffalo_coordinate_corrected_no_MT.bed -u -header >"$sample"_het_GQ40_exonic.vcf

#bgzip "$sample"_het_GQ40_genic.vcf

bgzip "$sample"_het_GQ40_exonic.vcf

#tabix -p vcf "$sample"_het_GQ40_genic.vcf.gz

bcftools index --tbi "$sample"_het_GQ40_exonic.vcf.gz

bgzip "$sample"_het_GQ40.vcf


 



