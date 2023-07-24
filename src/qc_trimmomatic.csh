#!/bin/tcsh
#BSUB -n 8
#BSUB -W 14400
#BSUB -q sara
#BSUB -R "span[hosts=1]"
#BSUB -J filter_5
#BSUB -o stdout.%J
#BSUB -e stderr.%J

set S=5

# Create the destination directory if it doesn't exist
mkdir -p /rsstu/users/r/rrellan/sara/BZea/filtered_S/filtered_S${S}

# Change to directory S1   
cd /rsstu/users/r/rrellan/sara/BZea/combined_S/S${S}       

# Iterate over all the files
foreach	file (*_R1.fq)
    # Extract the base name without extension
    set base = `basename $file _R1.fq`
    echo "Processing file: $base"
    # Run Trimmomatic
    java -jar /gpfs_common/share/maize/ntanduk/trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 \
          $base'_R1.fq' $base'_R2.fq' \
          /rsstu/users/r/rrellan/sara/BZea/filtered_S/filtered_S${S}/$base'_paired_R1.fq.gz' /dev/null /rsstu/users/r/rrellan/sara/BZea/filtered_S/filtered_S${S}/$base'_paired_R2.fq.gz' /dev/null \
          ILLUMINACLIP:/gpfs_common/share/maize/ntanduk/trimmomatic/Trimmomatic-0.39/adapters.fa:2:30:10 \
          LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 -threads 8
end
