################################################################
##                    qiime_taxonomy.cwl                      ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/plugins/available/feature-classifier/classify-consensus-vsearch/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["bash"]

inputs:
  taxonomy_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_tsv:
    label: "Path to tsv file"
    type: File
    inputBinding:
      position: 2
  input_fasta:
    label: "Path to fasta file"
    type: File
    inputBinding:
      position: 3
  input_representative_sequences:
    label: "Path to representative sequences file"
    type: File
    inputBinding:
      position: 4
  output_dir:
    label: "Output path for taxonomy and classification files"
    type: string
    inputBinding:
      position: 5
  amplicon_group:
    label: "Amplicon group name"
    type: string
    inputBinding:
      position: 6
  perc_identity:
    label: "Reject match if percent identity to query is lower"
    type: float
    default: 0.90
    inputBinding:
      position: 7
  min_consensus:
    label: "Minimum fraction of assignments must match top hit to be accepted as consensus assignment"
    type: float
    default: 0.90
    inputBinding:
      position: 7

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
