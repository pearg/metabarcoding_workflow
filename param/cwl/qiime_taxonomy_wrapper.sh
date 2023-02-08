# 1: input tsv
# 2: input fasta
# 3: input representative sequences
# 4: output path
# 5: amplicon group
# 6: p-perc-identity for feature-classifier
# 7: p-min-consensus for feature-classifier

qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path ${1} \
  --output-path ${4}/${5}_feature_taxonomy.qza
  
qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path ${2} \
  --output-path ${4}/${5}_feature_sequences.qza

# TODO: --p-threads 8
qiime feature-classifier classify-consensus-vsearch \
    --i-query ${3} \
    --i-reference-reads ${4}/${5}_feature_sequences.qza \
    --i-reference-taxonomy ${4}/${5}_feature_taxonomy.qza \
    --p-perc-identity ${6} \
    --p-min-consensus ${7} \
    --o-classification ${4}/${5}_classification.qza \
    --verbose

qiime metadata tabulate \
  --m-input-file ${4}/${5}_classification.qza \
  --o-visualization ${4}/${5}_classification.qzv