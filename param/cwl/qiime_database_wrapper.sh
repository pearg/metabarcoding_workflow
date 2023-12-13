# 1: input tsv
# 2: input fasta
# 3: output path
# 4: output prefix

qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path ${1} \
  --output-path ${3}/${4}_feature_taxonomy.qza
  
qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path ${2} \
  --output-path ${3}/${4}_feature_sequences.qza
