#This script pre-processes the water buffalo gene transfer format file (GTF) (converted from NCBI provided GFF file) to extract all exonic cordinates and make a bed file of it using the Rscript 'make_corrected_bed.R'. #GTF_extract is a part of the GFFUtils package (https://gffutils.readthedocs.io/en/latest/GTF_extract.html)
#module load roslin/python/2.7.13 igmm/apps/R/3.3.0

GTF_extract -f exon --fields chrom,start,end,gene_name,feature,strand,gene_id /exports/cmvm/eddie/eb/groups/prendergast_dutta_phd/refseq_buffalo_genome/GCF_003121395.1_UOA_WB_1_genomic_updated_chrom.gtf >GCF_003121395.1_UOA_WB_1_genomic_updated_chrom.bed

Rscript make_corrected_bed.R