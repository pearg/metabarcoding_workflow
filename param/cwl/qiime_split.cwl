################################################################
##                     qiime_split.cwl                        ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/plugins/available/demux/filter-samples/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["qiime", "demux", "filter-samples"]

inputs:
  input_qza:
    label: "Path to qza file"
    type: File
    inputBinding:
      prefix: --i-demux
  metadata_file:
    label: "Path to metadata file"
    type: File
    inputBinding:
      prefix: --m-metadata-file
  condition:
    label: "SQLite WHERE cause for filtering samples"
    type: string
  output_file:
    label: "Output path of QIIME file containing samples with condition met"
    type: string
    inputBinding:
      prefix: --o-filtered-demux

# SQL query needs to be encapsulated by quotes
arguments:
  - prefix: --p-where "
    valueFrom: $(input.condition)
  - prefix: "\""

outputs:
  output_qza:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
