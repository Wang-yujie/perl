#!/bin/bash
$GATK --java-options $GATK_options HaplotypeCaller \
        -R /opt/seqtools/gatk/ucsc.hg19.fasta \
        -I /mnt/workshop/SC/project/WES/180401_wyj_N06497_LWT_80-148306909_SEQ/results/recal_bam/QW-1432_combined.recal.dedup.sorted.bam \
        -L /opt/seqtools/bed/Exome_v1_Targets_Standard.bed \
        -ip 100 \
        -ERC GVCF \
        -O /mnt/workshop/SC/project/WES/180401_wyj_N06497_LWT_80-148306909_SEQ/results/recal_bam/QW-1432_combined.g.vcf


java -XX:ParallelGCThreads=1 -jar /opt/seqtools/gatk/GenomeAnalysisTK.jar \
        -T GenotypeGVCFs \
        -R /opt/seqtools/gatk/ucsc.hg19.fasta \
        -V /mnt/workshop/SC/project/WES/180401_wyj_N06497_LWT_80-148306909_SEQ/results/recal_bam/QW-1432_combined.g.vcf \
        -O /mnt/workshop/SC/project/WES/180401_wyj_N06497_LWT_80-148306909_SEQ/results/recal_bam/QW-1432_combined.raw.vcf
