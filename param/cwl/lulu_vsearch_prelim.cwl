################################################################
##                  lulu_vsearch_prelim.cwl                   ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: ""
hints:
  SoftwareRequirement:
    packages:
    - package: vsearch

baseCommand: ["bash"]

inputs:
  lulu_vsearch_prelim_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_table:
    label: "Path to qiime feature table file"
    type: File
    inputBinding:
      position: 2
  match_list_path:
    label: "Output path for match_list.txt file"
    type: string
    inputBinding:
      position: 3

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.match_list_path)
