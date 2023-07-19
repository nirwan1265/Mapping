#the basic code
./minimap2 -ax sr -t $THREAD_NUM --secondary=yes -N$MAX_SECONDARY -$F_PARAM --eqx $REF_GEN $FR $RR > $SAM_FILE

#THREAD_NUM = Number of threads (in sara, for multiple jobs, you can use 6; this way you can have 4 jobs that runs in individual server)
#N = maximum number of secondary alignments to output
#MAX_SECONDARY = 20
#F_PARAM = mapping preset. set to "f1000,5000"
#REF_GEN = reference genome
#FR, RR = forward read, reverse read
#SAM_FILE = a sam file with .sam extension

