################################################################
##                     qiime_trim.cwl                        ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/plugins/available/cutadapt/trim-paired/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["qiime", "cutadapt", "trim-paired"]

inputs:
  input_qza:
    label: "Path to qza file"
    type: File
    inputBinding:
      prefix: --i-demultiplexed-sequences
  adapter_f:
    label: "These are found in R1 on the 3' end and everything after it should be discarded"
    type: string
    inputBinding:
      prefix: --p-adapter-f
  adapter_r:
    label: "These are found in R2 on the 3' end and everything after it should be discarded"
    type: string
    inputBinding:
      prefix: --p-adapter-r
  output_file:
    label: "Output path of QIIME file containing trimmed sequences"
    type: string
    inputBinding:
      prefix: --o-trimmed-sequences
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
      glob: $(inputs.output_file)
