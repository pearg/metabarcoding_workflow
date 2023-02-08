################################################################
##               qiime_combine_import.cwl                    ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.8/tutorials/importing/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime


baseCommand: ["qiime", "tools", "import"]
  
inputs:
  input_path:
    label: "Path to the directory containing fastq files, one pair per sample"
    type: Directory
    inputBinding:
      prefix: --input-path
  library_type:
    label: "Qiime import library type"
    type: string
    default: "SampleData[PairedEndSequencesWithQuality]"
    inputBinding:
      prefix: --type
  input_format:
    label: "Qiime input format"
    type: string
    default: "CasavaOneEightSingleLanePerSampleDirFmt"
    inputBinding:
      prefix: --input-format
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
