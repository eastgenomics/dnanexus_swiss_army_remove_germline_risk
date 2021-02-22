#!/bin/bash

# Remove germline_risk from variants
# Started: CC19Feb2021

# Description: Removes germline_risk from variant INFO field of sentieon-tnseq output vcfs using bcftools (v1.11) within the Swiss Army Knife app (v4.0.1) on DNAnexus
# Inputs: .vcf.gz file 
# Outputs: filtered.vcf.gz 

# Reference(s): 
# https://platform.dnanexus.com/app/swiss-army-knife
# https://github.com/samtools/bcftools 

# Start message
echo "Remove germline_risk from sentieon vcfs"
date
echo ""

# Process vcf files 
for vcf in *vcf.gz; do
	vcf_basename="$(echo $vcf | cut -d '.' -f1)"
	echo $vcf_basename
	echo "Removing germline_risk from vcf"
	bcftools annotate -x FILTER/germline_risk $vcf > $vcf_basename.ngr.vcf
	bgzip $vcf_basename.ngr.vcf
done

# Remove input vcfs to avoid including in output
echo "Removing input vcf files"
rm *tnhaplotyper2.vcf.gz
