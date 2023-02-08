################################################################
##                     qiime_import.cwl                       ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/tutorials/importing/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime


baseCommand: ["qiime", "tools", "import"]

#requirements:
#  InitialWorkDirRequirement:
#    listing: [ $(inputs.input_path) ]

inputs:
  input_path:
    label: "Path to the directory forward.fq.gz and reverse.fq.gz"
    type: Directory
    inputBinding:
      prefix: --input-path
  library_type:
    label: "Qiime import library type"
    type: string
    default: "MultiplexedPairedEndBarcodeInSequence"
    inputBinding:
      prefix: --type
  output_path:
    label: "Output path of QIIME artifact file"
    type: string
    inputBinding:
      prefix: --output-path

outputs:
  output_qza:
    type: File
    outputBinding:
      glob: $(inputs.output_path)
