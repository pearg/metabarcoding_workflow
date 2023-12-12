################################################################
##                    qiime_database.cwl                      ##
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
  database_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_taxonomy:
    label: "Path to taxonomy ID file"
    type: File
    inputBinding:
      position: 2
  input_fasta:
    label: "Path to fasta file"
    type: File
    inputBinding:
      position: 3
  output_dir:
    label: "Output path for taxonomy and classification files"
    type: string
    inputBinding:
      position: 4
  output_prefix:
    label: "Output prefix name (database name and amplicon group)"
    type: string
    inputBinding:
      position: 5

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
