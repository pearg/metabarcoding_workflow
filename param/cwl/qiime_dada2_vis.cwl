################################################################
##                     qiime_dada2_vis.cwl                    ##
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "https://docs.qiime2.org/2022.11/plugins/available/dada2/denoise-paired/"
hints:
  SoftwareRequirement:
    packages:
    - package: qiime


baseCommand: ["qiime", "metadata", "tabulate"]

inputs:
  input_qza:
    label: "Path to the input QIIME artifact file"
    type: File
    inputBinding:
      prefix: --m-input-file
  output_qzv:
    label: "Output path of QIIME qzv visulisation file"
    type: string
    inputBinding:
      prefix: --o-visualization
  
outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_qzv)
