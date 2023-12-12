################################################################
##                    separate_files.cwl                      ##
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
  separate_files_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_vsearch_tsv:
    label: "Path to vsearch output tsv file"
    type: File
    inputBinding:
      position: 2
  input_representative_sequences:
    label: "Path to representative sequences file"
    type: File
    inputBinding:
      position: 3
  input_table:
    label: "Path to feature table file"
    type: File
    inputBinding:
      position: 4
  output_dir:
    label: "Output path for preliminary classification files"
    type: string
    inputBinding:
      position: 5
  amplicon_group:
    label: "Amplicon group name"
    type: string
    inputBinding:
      position: 6
  
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
