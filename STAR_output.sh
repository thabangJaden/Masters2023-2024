#!/bash


# [1] Isolate column2 of STAR output into temp file
tail -n +5 sample_output.ReadsPerGene.ou.tab | cut -f2 > sample_output_tmp.txt 

tail -n +5 sample_output.ReadsPerGene.ou.tab | cut -f1 > Gene_ID_tmp.txt

# [2] Insert headers to the tmp files
echo -n -e "sample_header\n$(cat sample_output_tmp.txt )" > sample_output_tmp.txt 

# [3] combines the sample files into a table
paste *_tmp.txt > total_counts.tsv

rm *_tmp.txt
