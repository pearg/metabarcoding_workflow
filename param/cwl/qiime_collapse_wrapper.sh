# 1: input table
# 2: input taxonomy
# 3: output path
# 4: amplicon group
# 5: p_identity
# 6: level

qiime taxa collapse \
    --i-table ${1} \
    --i-taxonomy ${2} \
    --p-level ${6} \
    --o-collapsed-table ${3}/${4}_collapsed_table_l${6}.qza
qiime feature-table summarize \
    --i-table ${3}/${4}_collapsed_table_l${6}.qza \
    --o-visualization ${3}/${4}_collapsed_table_l${6}.qzv
