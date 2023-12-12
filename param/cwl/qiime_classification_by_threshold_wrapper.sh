# 1: input rep sequences qza file to query
# 2: input sequences db
# 3: input taxonomy ID db
# 4: p-min-consensus for feature-classifier
# 5: n threads
# 6: output path for merged classification qza
# 7: input path for file list of feature IDs by threshold percent identity
# 8: path to tmp dir

tmpDir=$(mktemp -d -p ${8})

export TMPDIR=${tmpDir}

fileList=${7}
filteredFiles=""
while read -r line; do
    # echo $line;
    a=($(echo $line))
    idFilename=${a[0]}
    percIdentity=${a[1]}
    
    filteredFilename=$(echo ${idFilename} | sed 's/.txt$/.qza/')
    filteredClassificationResults=$(echo ${idFilename} | sed 's/.txt$/_classification.qza/')
    filteredSearchResults=$(echo ${idFilename} | sed 's/.txt$/_search_results.qza/')
    filteredFiles=$(echo ${filteredFiles} ${filteredClassificationResults})

    qiime feature-table filter-seqs \
        --i-data ${1} \
        --m-metadata-file ${idFilename} \
        --o-filtered-data ${filteredFilename}
    
    qiime feature-classifier classify-consensus-vsearch \
        --i-query ${filteredFilename} \
        --i-reference-reads ${2} \
        --i-reference-taxonomy ${3} \
        --p-perc-identity ${percIdentity} \
        --p-min-consensus ${4} \
        --p-threads ${5} \
        --o-classification ${filteredClassificationResults} \
        --o-search-results ${filteredSearchResults} \
        --verbose

done < ${fileList}

qiime feature-table merge-taxa \
    --i-data ${filteredFiles} \
    --o-merged-data ${6}

# qiime metadata tabulate \
#   --m-input-file ${7}/${8}_classification_l${9}.qza \
#   --o-visualization ${7}/${8}_classification_l${9}.qzv