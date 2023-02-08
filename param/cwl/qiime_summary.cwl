################################################################
##                     qiime_summary.cwl                      ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: ""
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["bash"]

inputs:
  summary_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_qza:
    label: "Path to qza file"
    type: File
    inputBinding:
      position: 2
  output_file:
    label: "Output path to qza visualisation file"
    type: string
    inputBinding:
      position: 3
  output_dir:
    label: "Output path for extracted tsv files in qzv"
    type: string
    inputBinding:
      position: 4
  sample_name:
    label: "Sample name"
    type: string
    inputBinding:
      position: 5

outputs:
  output_qzv:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
