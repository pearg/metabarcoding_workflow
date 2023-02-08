################################################################
##                    qiime_collapse.cwl                      ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.11/plugins/available/taxa/collapse/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["bash"]

inputs:
  collapse_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_table:
    label: "Path to qiime feature table file"
    type: File
    inputBinding:
      position: 2
  input_taxonomy:
    label: "Path to qiime taxonomy classification file"
    type: File
    inputBinding:
      position: 3
  output_dir:
    label: "Output path for collapsed taxonomy files"
    type: string
    inputBinding:
      position: 4
  amplicon_group:
    label: "Amplicon group name"
    type: string
    inputBinding:
      position: 5

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
