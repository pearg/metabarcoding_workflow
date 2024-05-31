# 1: input table
# 2: input rep sequences
# 3: p-abundance for filter-features-conditionally
# 4: p-prevalence for filter-features-conditionally
# 5: output filtered table
# 6: output filtered rep sequences


qiime feature-table filter-features-conditionally \
    --i-table ${1} \
    --p-abundance ${3} \
    --p-prevalence ${4} \
    --o-filtered-table ${5} \
    --verbose

qiime feature-table filter-seqs \
    --i-data ${2} \
    --i-table ${5} \
    --o-filtered-data ${6}