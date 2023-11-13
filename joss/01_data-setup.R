# This script pulls out PDF documents from the broader EIS document set for ground-truthing and trialing the govscienceuseR package. To pull out these documents we execute the following stpes

## I HAVE IDENTIFIED THE PAIR OF THE 10 EXTRACTED BUT NOT DOWNLOADED THEM YET...

# 0. Set different paths
proj_dir <- '~/Documents/Davis/R-Projects/govscienceuseR.github.io/'
doc_dir <- '~/Box/eis_documents/enepa_repository/documents/'

# 1. Identify the DEIS-FEIS pairs that we use in the science policy paper
pairs <- readRDS('~/Documents/Davis/R-Projects/truckee/eis_science_politics/input/filtered_draft_final_pairs.RDS')

# 2. Identify where documents are stored
docs <- list.files(doc_dir, recursive = T)
ids <- str_remove(unique(str_extract(docs, "/\\d{8}")), '/')
## Note that documents are in this folder but one EIS may be broken up by many documents, so we want to identify just the documents that are a single unit

# 3. Limit document sample to EISs in a single document and those that match the 'pairs' documents
doc_count <- data.frame("id" = ids, 
                        "count" = sapply(ids, function(x) 
                          sum(str_count(str_remove(str_extract(docs, "/\\d{8}"), '/'), x))))
singles <- doc_count$id[doc_count$count == 1]
singles <- singles[singles %in% pairs$DEIS_Number | singles %in% pairs$FEIS_Number]
## We have 92 EISs that are compiled into a single document and in our pairs 

# 4. Randomly extract 20 of the singles
set.seed(22)
sample20 <- sample(singles, 20)
sample_data20 <- pairs[pairs$FEIS_Number %in% sample20 | pairs$DEIS_Number %in% sample20, ]

# 5. But really, I want 20 total (10 pairs), so let's choose only 10 and diversify the authoring agencies
sample_data10 <- sample_data20[!(duplicated(sample_data20$FEIS_Agency)),]
# I want there to only being 10 so losing one randomly
sample_data10 <- sample_data10[sample_data10$FEIS_Number != "20190008", ]
sample10 <- ifelse(sample_data10$FEIS_Number %in% sample20, 
                   sample_data10$FEIS_Number, sample_data10$DEIS_Number)
sample_data10$Final <- ifelse(sample10 %in% sample_data10$FEIS_Number, T, F)
sample_data10$EIS_Number <- ifelse(sample10 %in% sample_data10$FEIS_Number,
                                   sample_data10$FEIS_Number, sample_data10$DEIS_Number)
sample_data10 <- sample_data10[,c('FEIS_Agency', 'FEIS_Title', 'EIS_Number', "Final", 
                                  "DEIS_Number", "FEIS_Number")]

# 6. Let's find their match and hope to goodness that their match is also one document?
paired_report <- ifelse(sample_data10$Final == T, 
                        sample_data10$DEIS_Number, sample_data10$FEIS_Number)
paired_report %in% singles
# Okay, will need to merge
library(qpdf)
year <- str_extract(paired_report, "^\\d{4}")
fl_pattern <- paste(year, paired_report, sep = "/")
fl_pattern <- paste(fl_pattern, collapse = "|")
docs_pair <- docs[str_detect(docs, fl_pattern)]
# Double IDs are either duplicates or EPA letter?
double_ids <- paste(paste(paired_report, paired_report, sep = "_"), collapse = "|")
docs_pair <- docs_pair[!str_detect(docs_pair, double_ids)]
# Also there is some explicit EPA letter:
docs_pair <- docs_pair[!str_detect(docs_pair, "Comment_Letter|EPA_Comments")]
# Also looking at the rest, this is also a letter
docs_pair <- docs_pair[!str_detect(docs_pair, "BIA_DEIS_Colville_Reservation_IRMP|Letter_CY_07162020")]
docs_pair_id <- str_extract(docs_pair, "\\d{8}")
# SO wait, in the end, these are all also only single pages, but they looked like double because they all had their comment letters with them
sample_data10_pair <- pairs[pairs$FEIS_Number %in% docs_pair_id | pairs$DEIS_Number %in% docs_pair_id, ]


# 7. Copy over sample of PDFs into this directory so that we can use them
sample_fls <- fls[str_detect(fls, paste(paste0(str_extract(sample10, '\\d{4}'), 
                                               '/', sample10),
                                        collapse = "|"))]
dir.create(paste0(proj_dir, 'data/'))
dir.create(paste0(proj_dir, 'data/documents/'))
sapply(sample_fls, function(x) file.copy(from = paste0(doc_dir, x), 
                                         to = paste0(proj_dir,'data/documents/')))

# COPY OVER THE DRAFTS LATER!

# 8. Get PDF summaries: page number and add to sample data
sample10_pdf_info <- lapply(list.files(paste0(proj_dir, 'data/documents/'),
                                       full.names = T), pdftools::pdf_info)
for(i in 1:length(sample10_pdf_info)){
  sample_data10$pages[i] <- sample10_pdf_info[[i]]$pages
}


write.csv(sample_data10, 'joss/data/sample_data_10.csv', row.names = F)
