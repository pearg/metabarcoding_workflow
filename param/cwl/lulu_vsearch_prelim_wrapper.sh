# 1: input qza
# 2: output match_list.txt file


tmpDir=$(mktemp -d)

qiime tools extract \
    --input-path ${1}  \
    --output-path ${tmpDir}

vsearch \
    --usearch_global ${tmpDir}/*/data/dna-sequences.fasta \
    --db ${tmpDir}/*/data/dna-sequences.fasta \
    --self \
    --id .84 \
    --iddef 1 \
    --userout ${2} \
    --userfields query+target+id \
    --maxaccepts 0 \
    --query_cov .9 \
    --maxhits 10
