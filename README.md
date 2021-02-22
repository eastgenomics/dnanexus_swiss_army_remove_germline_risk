# dnanexus_swiss_army_remove_germline_risk
This repository contains the commands executed by the swiss army knife app (v4.0.1) to remove the germline_risk annotation on sentieon output VCF files 

## Input
The input files for this app includes a bash script(remove_germline_risk_v*.sh) and vcf.gz files produced by sentieon-tnseq.

The app's "command line" input is used to execute the above bash script. This command is recorded in command_line_input.sh

## How the app works
- removes the germline_risk anotation from all variants in the vcf (bcftools annotate -x FILTER/germline_risk). This is caused because sentieon-tnseq is run on Tumor-only mode with a panel of normals._
- creates a gz and index for filtered VCF (bgzip and tabix)

## Output
Output includes a VCF (suffix of ngr.vcf.gz) and  its associated tabix index vcf.gz.