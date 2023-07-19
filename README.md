# Mapping
This git page explains the details about mapping sequences to a reference genome. 

## Demultiplexing using Sabre
Sabre is used to demultiplex sequences, i.e, separate the sequences from the . Detailed installation process is [here](https://github.com/najoshi/sabre). The yaml file used to install the sable in the server is src/[sabre.yml](https://github.com/nirwan1265/Mapping/blob/main/src/sabre.yml). The tcsh script used to run a single forward and reverse read is found in src/[sabre_mapping.csh](https://github.com/nirwan1265/Mapping/blob/main/src/sabre_mapping.csh). 

## Alignment to the reference genome
The alignment is done with [minimap2](https://academic.oup.com/bioinformatics/article/34/18/3094/4994778). The installation process is found [here](https://github.com/lh3/minimap2#install). 

## Viewing the alignment
Basic viewing of the alignment can be done with [samtools](http://www.htslib.org/doc/). The detailed installation process for a linux distribution can be found [here](http://www.htslib.org/download/).  
