################################################################
##                      qiime_dada2.cwl                       ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.11/plugins/available/dada2/denoise-paired/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime


baseCommand: ["qiime", "dada2", "denoise-paired"]

# TODO: --p-n-threads

inputs:
  input_qza:
    label: "Path to the input QIIME artifact file"
    type: File
    inputBinding:
      prefix: --i-demultiplexed-seqs
  forward_trunc_length:
    label: "Position at which forward read sequences should be truncated due to decrease in quality"
    type: int
    inputBinding:
      prefix: --p-trunc-len-f
  reverse_trunc_length:
    label: "Position at which reverse read sequences should be truncated due to decrease in quality"
    type: int
    inputBinding:
      prefix: --p-trunc-len-r
  stats_output:
    label: "Output path of QIIME denosing stats file"
    type: string
    inputBinding:
      prefix: --o-denoising-stats
  seq_output:
    label: "Output path of QIIME representative sequences file"
    type: string
    inputBinding:
      prefix: --o-representative-sequences
  table_output:
    label: "Output path of QIIME table file"
    type: string
    inputBinding:
      prefix: --o-table

outputs:
  output_qza:
    type: File
    outputBinding:
      glob: $(inputs.table_output)
