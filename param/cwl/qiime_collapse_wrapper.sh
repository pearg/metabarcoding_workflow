# 1: input table
# 2: input taxonomy
# 3: output path
# 4: amplicon group

for LEVEL in `seq 5 7`; do
    qiime taxa collapse \
        --i-table ${1} \
        --i-taxonomy ${2} \
        --p-level ${LEVEL} \
        --o-collapsed-table ${3}/${4}_table_l${LEVEL}.qza
    qiime feature-table summarize \
        --i-table ${3}/${4}_table_l${LEVEL}.qza \
        --o-visualization ${3}/${4}_table_l${LEVEL}.qzv
done
