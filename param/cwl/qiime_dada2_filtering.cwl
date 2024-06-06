################################################################
##                 qiime_dada2_filtering.cwl                  ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2024.2/plugins/available/feature-table/filter-features-conditionally/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime

baseCommand: ["bash"]

inputs:
  dada2_filtering_wrapper:
    label: "Path to bash script"
    type: File
    inputBinding:
      position: 1
  input_table:
    label: "Path to table counts"
    type: File
    inputBinding:
      position: 2
  input_representative_sequences:
    label: "Path to representative sequences"
    type: File
    inputBinding:
      position: 3
  p_abundance:
    label: "Minimum abundance to keep ASV"
    type: float
    default: 0.001
    inputBinding:
      position: 4
  p_prevalence:
    label: "Minimum proportion of samples with at least p_abundance to keep ASV"
    type: float
    default: 0.1
    inputBinding:
      position: 5
  table_output_file:
    label: "Output path for taxonomy and classification files"
    type: string
    inputBinding:
      position: 6
  seq_output_file:
    label: "Amplicon group name"
    type: string
    inputBinding:
      position: 7
  

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.seq_output_file)
