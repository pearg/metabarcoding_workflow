################################################################
##               qiime_combine_extract.cwl                    ##
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
  extract_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_qza:
    label: "Path to qza file"
    type: File
    inputBinding:
      position: 2
  output_dir:
    label: "Parent output path for merged amplicon group fastq files"
    type: string
    inputBinding:
      position: 3
  amplicon_group:
    label: "Amplicon group name"
    type: string
    inputBinding:
      position: 4
  sample_name:
    label: "Sample name"
    type: string
    inputBinding:
      position: 5

outputs:
  output_r1:
    type: File
    outputBinding:
      glob: $(inputs.output_r1_file)
  output_r2:
    type: File
    outputBinding:
      glob: $(inputs.output_r2_file)
