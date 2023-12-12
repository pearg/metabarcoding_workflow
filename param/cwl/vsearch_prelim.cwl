################################################################
##                    qiime_collapse.cwl                      ##
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
  vsearch_prelim_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_table:
    label: "Path to qiime feature table file"
    type: File
    inputBinding:
      position: 2
  p_identity:
    label: "Reject if lower than identity"
    type: float
    inputBinding:
      position: 3
  input_taxonomy:
    label: "Path to fasta database"
    type: File
    inputBinding:
      position: 4
  n_threads:
    label: "Number of threads"
    type: string
    inputBinding:
      position: 5
  blast6out_path:
    label: "Output path for vsearch blast6out file"
    type: string
    inputBinding:
      position: 6
  vsearch_params:
    label: "Extra parameters for vsearch"
    type: string
    inputBinding:
      position: 7

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.blast6out_path)
