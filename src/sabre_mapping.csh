#!/bin/tcsh

set S="10"
set L="3"

#BSUB -n 1
#BSUB -W 14400
#BSUB -q sara
#BSUB -R "span[hosts=1]"
##BSUB -R "rusage[mem=32GB]"
#BSUB -J "103"
#BSUB -o "stdout_S${S}_L${L}.%J"
#BSUB -e "stderr_S${S}_L${L}.%J"
module load conda
conda activate /usr/local/usrapps/maize/ntanduk/sabre

# Create the output directory if it does not exist
set output_dir="/rsstu/users/r/rrellan/sara/docker/BZea/S${S}_L${L}"
if (! -d $output_dir) then
    mkdir -p $output_dir
endif

cd $output_dir

sabre pe -f "/gpfs_common/share/maize/ntanduk/phg_trial/BZea/NVS188B_Rellan_Alvarez_BzeaP1_R
1/BZea${S}_S${S}_L00${L}_R1_001.fastq.gz" \
        -r "/gpfs_common/share/maize/ntanduk/phg_trial/BZea/NVS188B_Rellan_Alvarez_BzeaP1_R2
/BZea${S}_S${S}_L00${L}_R2_001.fastq.gz" \
        -b "/gpfs_common/share/maize/ntanduk/sabre/demultiplex_ex/mapping_index_BZea.txt" \
        -u "${output_dir}/no_bc_match_S${S}_L${L}_R1_001" \
        -w "${output_dir}/no_bc_match_S${S}_L${L}_R2_001"

conda deactivate
