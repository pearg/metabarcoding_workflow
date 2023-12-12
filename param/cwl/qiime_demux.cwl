################################################################
##                     qiime_demux.cwl                        ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/plugins/available/cutadapt/demux-paired/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["qiime", "cutadapt", "demux-paired"]

inputs:
  input_qza:
    label: "Path to qza file"
    type: File
    inputBinding:
      prefix: --i-seqs
  forward_primers_file:
    label: "Path to file containing forward primers"
    type: File
    inputBinding:
      prefix: --m-forward-barcodes-file
  forward_primers_column:
    label: "Column name of forward sequences in primers file"
    type: string
    default: "forward-sequence"
    inputBinding:
      prefix: --m-forward-barcodes-column
  reverse_primers_file:
    label: "Path to file containing reverse primers"
    type: File
    inputBinding:
      prefix: --m-reverse-barcodes-file
  reverse_primers_column:
    label: "Column name of reverse sequences in primers file"
    type: string
    default: "reverse-sequence"
    inputBinding:
      prefix: --m-reverse-barcodes-column
  output_sample_sequences:
    label: "Output path of QIIME file containing sample sequences"
    type: string
    inputBinding:
      prefix: --o-per-sample-sequences
  output_untrimmed_sequences:
    label: "Output path of QIIME file containing discarded sequences"
    type: string
    inputBinding:
      prefix: --o-untrimmed-sequences
  verbose:
    type: boolean
    default: true
    inputBinding:
      prefix: --verbose
      
  # This is hacky, but type:stdout/stderr isn't working for outputs
  log_file:
    label: "Output path of log file"
    type: string
    shellQuote: False
    inputBinding:
      prefix: ">"


outputs:
  output_log:
    type: File
    outputBinding:
      glob: $(inputs.log_file)
  output_qza:
    type: File
    outputBinding:
      glob: $(inputs.output_sample_sequences)
