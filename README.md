# Metabarcoding Workflow


To use on the mozzie server, first clone the repository:

```
git clone https://github.com/pearg/metabarcoding_workflow.git
```

Copy the example data into the newly created directory:

```
cd metabarcoding_workflow
cp -r /mnt/galaxy/shared/metabarcoding_workflow/data .
```

Open an RStudio Server session and navigate to the `metabarcoding_workflow/src` directory. 
Open the first RMarkdown document, `01_preprocessing.Rmd` to start processing your data.

