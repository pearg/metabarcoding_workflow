# 1: input qza
# 2: output directory for merged amplicon group fastqs
# 3: amplicon group
# 4: sample name

tmpDir=$(mktemp -d)

qiime tools extract \
    --input-path ${1}  \
    --output-path ${tmpDir}

cat ${tmpDir}/*/data/*_R1_001.fastq.gz \
    > ${2}/${3}/${4}_X_L001_R1_001.fastq.gz
cat ${tmpDir}/*/data/*_R2_001.fastq.gz \
    > ${2}/${3}/${4}_X_L001_R2_001.fastq.gz