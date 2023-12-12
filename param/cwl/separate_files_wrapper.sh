# 1: input tsv from vsearch in blast6out format
# 2: input representative sequences from dada2
# 3: input counts table from dada2
# 4: output directory
# 5: amplicon group to use for basename of outputs


# Use awk to filter unique IDs, retaining the first hit which has the highest % identity
awk -F"\t" '!_[$1]++' ${1} > ${4}/${5}_vsearch_top_hit.tsv

# You can change the ranges of these % identity thresholds in the awk commands if you wish
awk -F"\t" 'BEGIN {print "feature-id"}; $3 >= 97' ${4}/${5}_vsearch_top_hit.tsv | cut -f 1 > ${4}/${5}_ids_l7.txt
awk -F"\t" 'BEGIN {print "feature-id"}; $3 < 97 && $3 >= 95' ${4}/${5}_vsearch_top_hit.tsv | cut -f 1 > ${4}/${5}_ids_l6.txt
awk -F"\t" 'BEGIN {print "feature-id"}; $3 < 95 && $3 >= 92' ${4}/${5}_vsearch_top_hit.tsv | cut -f 1 > ${4}/${5}_ids_l5.txt
awk -F"\t" 'BEGIN {print "feature-id"}; $3 < 92 && $3 >= 80' ${4}/${5}_vsearch_top_hit.tsv | cut -f 1 > ${4}/${5}_ids_l4.txt


# Extract matching IDs from feature counts for each level
for LEVEL in `seq 4 7`; do
    qiime feature-table filter-features \
        --i-table ${3} \
        --m-metadata-file ${4}/${5}_ids_l${LEVEL}.txt \
        --o-filtered-table ${4}/${5}_table_l${LEVEL}.qza
done

# Extract matching IDs from representative sequences for each level
for LEVEL in `seq 4 7`; do
    qiime feature-table filter-seqs \
        --i-data ${2} \
        --i-table ${4}/${5}_table_l${LEVEL}.qza \
        --o-filtered-data ${4}/${5}_representative_sequences_l${LEVEL}.qza
done