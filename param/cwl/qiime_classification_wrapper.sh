# 1: input rep sequences qza file to query
# 2: input sequences db
# 3: input taxonomy ID db
# 4: p-perc-identity for feature-classifier
# 5: p-min-consensus for feature-classifier
# 6: n threads
# 7: output path for classification qza
# 8: output path for search results qza
# # 9: path to tmp dir

# tmpDir=$(mktemp -d -p ${9})
# 
# export TMPDIR=${tmpDir}

qiime feature-classifier classify-consensus-vsearch \
    --i-query ${1} \
    --i-reference-reads ${2} \
    --i-reference-taxonomy ${3} \
    --p-perc-identity ${4} \
    --p-min-consensus ${5} \
    --p-threads ${6} \
    --o-classification ${7} \
    --o-search-results ${8} \
    --no-recycle \
    --verbose


# qiime metadata tabulate \
#   --m-input-file ${7}/${8}_classification_l${9}.qza \
#   --o-visualization ${7}/${8}_classification_l${9}.qzv