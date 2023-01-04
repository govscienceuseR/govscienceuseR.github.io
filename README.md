## govscienceuseR
Tools for automated extraction and disambiguation of scientific resources cited in government documents.  
![govscienceuseR workflow](img/workflow.png "govscienceuseR workflow")

1. referenceExtract: Process PDFs and tag citations/references observed in PDFs  
2. referenceClassify(https://github.com/govscienceuseR/referenceClassify): Clean and classify citations by category (e.g., academic journal, agency document)  
3. indexBuild(https://github.com/govscienceuseR/indexBuild): Create a database of academic work to search against for disambiguating extracted citations  
4. referenceSearch: Search extracted citations against indexed database of canonical citations to match and disambiguate extracted citations  
