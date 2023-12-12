# 1: input qza
# 2: min identity match
# 3: fasta database
# 4: blast6out output
# 5: n threads
# 6+: vsearch parameters

tmpDir=$(mktemp -d)

qiime tools extract \
    --input-path ${1}  \
    --output-path ${tmpDir}

vsearch \
    --usearch_global ${tmpDir}/*/data/dna-sequences.fasta \
    --id ${2} \
    ${@:6} \
    --db ${3} \
    --threads ${4} \
    --blast6out ${5}
