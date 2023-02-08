# 1: input qza
# 2: output qzv
# 3: output path for extracted tsv files in qzv
# 4: sample name

tmpDir=$(mktemp -d)

qiime demux summarize \
    --i-data ${1} \
    --o-visualization ${2}
qiime tools extract \
    --input-path ${2}  \
    --output-path ${tmpDir}
cp ${tmpDir}/*/data/per-sample-fastq-counts.tsv \
    ${3}/${4}_per-sample-fastq-counts.tsv
cp ${tmpDir}/*/data/forward-seven-number-summaries.tsv \
    ${3}/${4}_forward-seven-number-summaries.tsv
cp ${tmpDir}/*/data/reverse-seven-number-summaries.tsv \
    ${3}/${4}_reverse-seven-number-summaries.tsv