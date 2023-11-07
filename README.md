# Introgression Mapping for B73 x Teosinte/Landraces
This git page explains the details about introgression mapping of B73 x Teosinte/Landraces populations. We start of with demultiplexing multiple reads into individuals reads, followed by mapping to a reference genome (b73 version 5), and finally visualization of the introgressed region per chromosome. The detailed process are explained below.

## Demultiplexing using Sabre
Sabre is used to demultiplex sequences, i.e, separate the sequences from the . Detailed installation process is [here](https://github.com/najoshi/sabre). The yaml file used to install the sable in the server is src/[sabre.yml](https://github.com/nirwan1265/Mapping/blob/main/src/sabre.yml). The tcsh script used to run a single forward and reverse read is found in src/[sabre_mapping.csh](https://github.com/nirwan1265/Mapping/blob/main/src/sabre_mapping.csh). Separate indexing files are required for separate samples which are found in src/[mapping_index_BZea/](https://github.com/nirwan1265/Mapping/tree/main/src/mapping_index_BZea).

## Quality Control using Trimmomatic
QC is an important step before running any analysis. I use Trimmomatic for this. The code is found here.

## Alignment to the reference genome
The alignment is done with [minimap2](https://academic.oup.com/bioinformatics/article/34/18/3094/4994778). The installation process is found [here](https://github.com/lh3/minimap2#install). The code for running the alignment is found in src/[mapping_minimap.csh](https://github.com/nirwan1265/Mapping/blob/main/src/mapping_minimap). 

## Viewing the alignment
Basic viewing of the alignment can be done with [samtools](http://www.htslib.org/doc/). The detailed installation process for a linux distribution can be found [here](http://www.htslib.org/download/).  

## Quality Control
Post-alignment QC is equally important to remove potential sources of error. Using samtools, reads with a mapping quality (Q) score of less than 15 are filtered out to ensure only high-confidence alignments are considered for analysis. Duplicated reads are identified and removed using Picard tools to avoid inflating read counts filtering was also done for base quality score recalibration (BQSR) Furthermore, regions that did not map to the reference genome are also excised from the dataset. The exact commands and scripts for this QC step will be added to the repository for reference.

## Genotype Likelihood Estimation
For populations like B73 x Teosinte/Landraces, estimating genotype likelihoods is a necessary step before calling SNPs. This is particularly useful in accounting for the uncertainty in the data due to sequencing errors or allelic dropout. Genotype likelihood estimation can be performed using tools like angsd. Here, we would provide a script and a detailed description of the process to compute the likelihood of genotypes for each individual at each SNP position, taking into account the depth of coverage and the quality of reads.





