################################################################
##           qiime_classification_by_threshold.cwl            ##
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
  input_representative_sequences:
    label: "Path to representative sequences file for querying"
    type: File
    inputBinding:
      position: 2
  input_seq_db:
    label: "Path to database file containing sequences"
    type: File
    inputBinding:
      position: 3
  input_taxonomy_db:
    label: "Path to database file containing taxonomy IDs"
    type: File
    inputBinding:
      position: 4
  min_consensus:
    label: "Minimum fraction of assignments must match top hit to be accepted as consensus assignment"
    type: float
    default: 0.51
    inputBinding:
      position: 5
  n_threads:
    label: "Number of threads to use"
    type: string
    inputBinding:
      position: 6
  output_file:
    label: "Output path for merged taxonomy file"
    type: string
    inputBinding:
      position: 7
  file_list:
    label: "Input path for file list of feature IDs by threshold percent identity"
    type: string
    inputBinding:
      position: 8
  tmp_dir:
    label: "Path to tmp directory"
    type: string
    inputBinding:
      position: 9

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_file)
