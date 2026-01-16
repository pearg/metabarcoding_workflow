# Compilation of publicly accessible files from original source files on unimelb server.

## 1. BOLD v5 search results

### Results of search of the all_records asv sequences against BOLD version 5 
### using the 'rapid species search' against the 'public+private' library manually
dir_0 <- "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/"
dir_asv_lib <- paste0(dir_0,"asv_library/tfill_boldv5_search_results/")
bold_results_tfill <- rbind(
  read.csv(paste0(dir_asv_lib, "tfill_1_600BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_600_1201BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_1201-1800BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_1801_2200BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_2201_3000BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_2701_endBOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_3001_3600BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_3601_4000BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_4001_4800BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_4801_5400BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_5401_6000BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_6001_6800BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_6801_7600BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_7601_8200BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_8801_9400BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_9400_10200BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_10201_11000BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_11001_11600BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_11600_12200BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_12201_12700BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_12701_13100BOLD_results.csv")),
  read.csv(paste0(dir_asv_lib, "tfill_13100_endBOLD_results.csv")))

# Chris found many extras here
x <- rbind(
  read.csv(paste0(dir_asv_lib, "BOLD_maxp_tfill_extras_1_1000_results.csv")),
  read.csv(paste0(dir_asv_lib, "BOLD_maxp_tfill_extras_1001_2000_results.csv")),
  read.csv(paste0(dir_asv_lib, "BOLD_maxp_tfill_extras_2001_3000_results.csv")),
  read.csv(paste0(dir_asv_lib, "BOLD_maxp_tfill_extras_3000_end_results.csv")))
bold_results_tfill <- rbind(bold_results_tfill, 
                        x[!x$Query.ID %in% unique(bold_results_tfill$Query.ID),])
  
dir_46 <- "~/uomShare/wergStaff/MelCarew/git-data/Spring_2018_DNA_metabarcoding_data/"
wd2 <- paste0(dir_46,"/synonym_updates/BOLDv5_search_results/")
bold_results_mw46 <- rbind(
  read.csv(paste0(wd2, "MW46_unmatched_1_999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_1000_1999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_2000_2999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_3000_3999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_4000_4999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_5000_5999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_6000_6999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_7000_7999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_8000_8999_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_9000_end_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_1_700_extras_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_701_1400_extras_BOLDsearch_results.csv")),
  read.csv(paste0(wd2, "MW46_unmatched_1401_end_extras_BOLDsearch_results.csv")))

wd3 <- paste0(dir_0, "asv_library/unmatched_boldv5_search_results")
bold_results_1 <- rbind(
  read.csv(paste0(wd3, "/all_arc_unmatched_1_1000_BOLD_results.csv")),
  read.csv(paste0(wd3, "/all_arc_unmatched_1001_2000_BOLD_results.csv")),
  read.csv(paste0(wd3, "/all_arc_unmatched_2001_3000_BOLD_results.csv")),
  read.csv(paste0(wd3, "/all_arc_unmatched_3001_4000_BOLD_results.csv")),
  read.csv(paste0(wd3, "/all_arc_unmatched_4001_4821_BOLD_results.csv")),
  read.csv(paste0(wd3, "/all_arc_unmatched_4821_end_BOLD_results.csv")),
  # and some results missing from the first searches
  read.csv(paste0(wd3, "/arc_missing_1_1000.csv")),
  read.csv(paste0(wd3, "/arc_missing_1001_1600.csv")),
  read.csv(paste0(wd3, "/arc_missing_1601_end.csv")),
  read.csv(paste0(wd3, "/BOLDrechecks_700_1283.csv")),
  read.csv(paste0(wd3, "/BOLDrechecks_1_700.csv")),
  read.csv(paste0(wd3, "/BOLD_rechecks_1_12.csv")))
#Chris found some missing records here
x <- read.csv(paste0(wd3, "/BOLD_exhaustive_search_1.csv"))
bold_results_1 <- rbind(bold_results_1, 
                        x[!x$Query.ID %in% unique(bold_results_1$Query.ID),])

wd4 <- paste0(dir_0, "asv_library/maxp_boldv5_search_results")
# read in .csv files with bold barcodeID engine results.
bold_results_maxp <- rbind(
  read.csv(paste0(wd4, "/maxp_1_1000BOLD_results.csv")),
  read.csv(paste0(wd4, "/maxp_1000_endBOLD_results.csv")))

# # Finally 9 records with matches <94 retrieved by a genus and species search
# bold_results_lt94 <- read.csv(paste0(dir_0, "asv_library/bold_search_to 90.csv"))
# # And another 'final' 175 records (see code at bottom of this file after finding missing non-matches in final stretch)
# bold_results_last_175 <- read.csv(paste0(dir_0, "asv_library/bold_search_last_175.csv"))
# # And another 'final' 3!
# bold_results_last_3 <- read.csv(paste0(dir_0, "asv_library/bold_3_asvs.csv"))
# # Annoyingly discovered at the last hurdle that all of the missing bold matches 
# # were in the files I found and called x above. So none of the extras were necessary.

# rename bold output fields
bold_results <- unique(rbind(bold_results_tfill, bold_results_mw46,
                      bold_results_1, bold_results_maxp))

names(bold_results)[names(bold_results) == "Query.ID"] <- "asv_code" 
names(bold_results)[names(bold_results) == "PID..BIN."] <- "pid_bin" 
names(bold_results)[names(bold_results) == "ID."] <- "similarity"
names(bold_results) <- tolower(names(bold_results))
pid_bin_split <- strsplit(bold_results$pid_bin, "\\[BOLD:")
bold_results$id <- sapply(pid_bin_split,"[[",1)
bold_results$bin_uri <- NA
bold_results$bin_uri[lengths(pid_bin_split) > 1] <- 
  gsub("]", "", sapply(pid_bin_split[lengths(pid_bin_split) > 1],"[[",2))
bold_results$bin_uri[lengths(pid_bin_split) == 1] <- 
  gsub("]", "", sapply(pid_bin_split[lengths(pid_bin_split) == 1],"[[",1))
asv_bold <- unique(bold_results$asv_code)
write.csv(bold_results, "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/match_bold_v5.csv", row.names = FALSE)

## 1a. keep a list of subfamilies (that don't consistently get used in mwbugs database)
subfams <- unique(bold_results[c("family","subfamily")])
subfams <- subfams[subfams$subfamily != "" & !grepl("unclassified", subfams$subfamily) &
                     !grepl("unassigned", subfams$subfamily),]
write.csv(subfams, "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/taxon_subfams_partial.csv",
          row.names = TRUE)

## 1b. Compile match_list_bin_uri from bold_results

# Get sub-set of asv_codes that are aquatic macroinvertebrates
# First load the interim version of tfill collated in final iteration of Appendix_2.qmd
tfill <- as.data.frame(readxl::read_excel("~/uomShare/wergStaff/ChrisW/temp/asv_library_corrected.xlsx"),
                       sheet = "tfill")

# Convert bold_results to a list: one element per asv_code
asv_codes_with_bins <- unique(bold_results$asv_code)
asv_codes_with_bins <- asv_codes_with_bins[asv_codes_with_bins %in% tfill$asv_code]
match_list_bin_uri <- list()
for(i in 1:length(asv_codes_with_bins)){
        matchi <- bold_results[bold_results$asv_code == asv_codes_with_bins[i],
                               !names(bold_results) %in% c("asv_code","pid_bin")]
        matchi <- matchi[!is.na(matchi$bin_uri),]
        # if there is at least one registered bin_uri remove temp id records
        if(nrow(matchi) == 0) stop("1")
        if(nrow(matchi) > 0){
          if(sum(nchar(matchi$bin_uri) == 7) > 0){
            matchi <- matchi[nchar(matchi$bin_uri) == 7,]
          }
        }
  match_list_bin_uri <- c(match_list_bin_uri, list(matchi))
  names(match_list_bin_uri)[length(match_list_bin_uri)] <- asv_codes_with_bins[i]
}
save(match_list_bin_uri, file = "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/match_list_bin_uri_v5.rda")

## 2. All miseq records (extracted before finalization of the asv_library, except 
##    for the earlier MW46 site data imported separately at ##2b)

dir_0 <- "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/"
miseq13 <- read.csv(paste0(dir_0, 
                           "miseq13/metabarcoding_workflow/ten_site_data_summaries/",
                           "data_for_analysis/ten_sites_long_format_25_02_2025.csv"))
dir_miseqXX <- paste0(dir_0,
                      "miseqXX/metabarcoding_workflow/final_modeling_data/")
miseq15 <- read.csv(paste0(gsub("XX","15",dir_miseqXX), 
                           "miseq15_final_data_long_format_17_02_2025.csv"))
miseq16 <- read.csv(paste0(gsub("XX","16",dir_miseqXX), 
                           "miseq16_final_data_long_format_17_02_2025.csv"))
miseq17 <- read.csv(paste0(gsub("XX","17",dir_miseqXX), 
                           "miseq17_final_data_long_format_17_02_2025.csv"))
miseq18 <- read.csv(paste0(gsub("XX","18",dir_miseqXX), 
                           "miseq18_final_data_long_format_26_02_2025.csv"))
miseq19 <- read.csv(paste0(gsub("XX","19",dir_miseqXX), 
                           "miseq19_final_data_long_format_18_02_2025.csv"))
miseq20 <- read.csv(paste0(gsub("XX","20",dir_miseqXX), 
                           "/miseq20_final_data_long_format_18_02_2025.csv"))
all_records <- rbind(miseq13[,match(names(miseq15),names(miseq13))], 
                     miseq15, miseq16, miseq17, miseq18, miseq19, miseq20)

# Remove records with phylum = "Unassigned" and with no matching record in BOLD
# But first correct 4 records that were later found on BOLD
all_records$kingdom[all_records$asv_code %in% 
                      c("0d73b0f475b83e1069d9f2e38f4b5758","67fe56f64eaef51ff784857f62546726",
                        "8fd7ae02def911f10009484a02ac1a04","f6a0d1f9bec02a7dc7e59e894a3e874d")] <- "Eukaryota"
all_records$species[match(c("0d73b0f475b83e1069d9f2e38f4b5758","67fe56f64eaef51ff784857f62546726",
                            "8fd7ae02def911f10009484a02ac1a04","f6a0d1f9bec02a7dc7e59e894a3e874d"), all_records$asv_code)] <- 
  c("Apsectrotanypus sp. (Unident.)","Spongillidae sp. B-AGB4278","Lichenaula sp. B-AAX4878","Aphilorheithrus sp. B-ABV8709")
all_records <- all_records[!(all_records$kingdom == "Unassigned" & !all_records$asv_code %in% unique(bold_results$asv_code)),]
# Update taxonomy for the 53 unassigned records that do have a bold match
unassigned_asvs <- unique(all_records$asv_code[all_records$kingdom == "Unassigned"])  #12 asv_codes
unassigned_asvs_bold_ambig <- vector()
for(i in 1:length(unassigned_asvs)){
  boldi <- bold_results[bold_results$asv_code == unassigned_asvs[i],]
  if(max(boldi$similarity, na.rm = TRUE) >= 97){
    new_taxoni <- unique(boldi[boldi$similarity >= 97,
                               c("phylum","class","order","family","genus","species")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig <-  c(unassigned_asvs_bold_ambig,unassigned_asvs[i])
    }else{
      all_records[all_records$asv_code == unassigned_asvs[i],
                  c("phylum","class","order","family","genus","species")] <- new_taxoni
    }
  }
  if(max(boldi$similarity, na.rm = TRUE) >= 95){
    new_taxoni <- unique(boldi[boldi$similarity >= 95,
                               c("phylum","class","order","family","genus")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig <-  c(unassigned_asvs_bold_ambig,unassigned_asvs[i])
    }else{
      all_records[all_records$asv_code == unassigned_asvs[i],
                  c("phylum","class","order","family","genus")] <- new_taxoni
    }
  }
  if(max(boldi$similarity, na.rm = TRUE) < 95){
    new_taxoni <- unique(boldi[c("phylum","class","order","family")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig <-  c(unassigned_asvs_bold_ambig,unassigned_asvs[i])
    }else{
      all_records[all_records$asv_code == unassigned_asvs[i],
                  c("phylum","class","order","family")] <- new_taxoni
    }
  }
}

# Remove Unassigned records without a clear identification in BOLD
all_records <- all_records[!all_records$asv_code %in% unassigned_asvs_bold_ambig,]
# Set aside all environmental sample records
env_records <- all_records[grep("environmental",all_records$species),]
all_records <- all_records[-grep("environmental",all_records$species),]
# Change all empty strings "" to NAs
all_records[!is.na(all_records) & all_records == ""] <- NA  # nrow(all_records) - 135440

##  Records from 46-site spring 2018 metabarcoding study, initially compiled 
##    with a different workflow to being used here

dir_46 <- "~/uomShare/wergStaff/MelCarew/git-data/Spring_2018_DNA_metabarcoding_data/"
mw46 <- as.data.frame(
  readxl::read_excel(paste0(dir_46, "/spring2018_metabarcoding_Nov2023.xlsx"), 
                     sheet = 2))
# change column names otu_id to asv_code and asv_seq to asv_seq to align with ARC data
names(mw46)[names(mw46) == "otu_id"] <- "asv_code"
names(mw46)[names(mw46) == "otu_sequence"] <- "asv_seq"
names(mw46)[names(mw46) == "match"] <- "max_p_identity"

### reduce to unique asv_codes 
# Two records with Unassigned kingdom later checked and given an id by Mel Carew
mw46$kingdom[mw46$asv_code %in% c("165a64b99d99ac6025c60bd32748febb",
                                  "4a221f7f32a6c77153a67068011a848f")] <- "Eukaryota"
mw46$class[mw46$asv_code == "4a221f7f32a6c77153a67068011a848f"] <- "Demospongiae"
mw46$order[mw46$asv_code == "4a221f7f32a6c77153a67068011a848f"] <- "Verongiida"
mw46$class[mw46$asv_code == "165a64b99d99ac6025c60bd32748febb"] <- "Insecta"
mw46$order[mw46$asv_code == "165a64b99d99ac6025c60bd32748febb"] <- "Diptera"
mw46$family[mw46$asv_code == "165a64b99d99ac6025c60bd32748febb"] <- "Limoniidae"
mw46$family[mw46$asv_code == "165a64b99d99ac6025c60bd32748febb"] <- "Limnophilinae sp. B-AGD4720"
# Ad hoc corrections for consistency
mw46$family[mw46$genus == "Molophilus"] <- "Limoniidae"
### A. Inconsistencies between asv_codes and asv_sequences (earlier excel errors)
asv_test <- unique(mw46[c("asv_code","asv_seq")])
# sum(duplicated(asv_test$asv_seq))
# asv_test[duplicated(asv_test$asv_seq) | duplicated(asv_test$asv_seq, fromLast = TRUE),]
# asv_test[duplicated(asv_test$asv_code) | duplicated(asv_test$asv_code, fromLast = TRUE),]
### This sequence is the most troubling: it is associated with 4 asv_codes
dup_seq <- "TTTATCTTCAAATATTGCTCATGGAGGTGCTTCTGTAGACCTGGCAATTTTCAGATTGCACTTAGTTGGTATTTCATCTATTTTAGGTGCTGTAAATTTTATTACTACCGTGATTAATATACGATCAAACAAAATAACCTATGACCGACTTCCACTATTTGTTTGATCAGTAGCAATTACTGCTCTTCTACTTCTTCTATCTTTACCTGTTTTAGCTGGTGCTATCACCATACTTTTAACAGACCGAAATTTAAATACTACATTTTTTGATCCTGTAGGAGGAGGAGATCCAATTTTATATCAACATCTATTT"
dup_asv_seq_codes <- unique(mw46$asv_code[mw46$asv_seq == dup_seq])
### [1] "9fbe986c778c5556f99611d0075a122a" "7ca9195991a6cad87374d1e98c6ab624" "14295e7a8819dbdc4c2c972433d09d84" "ed3ae084977ef615af77a2eee71a2c5b"
### and one of those asv_codes matches a different sequence!
other_seq <- "TTTATCTTCAAATATTGCTCATGGAGGTGCTTCTGTAGACCTGGCAATTTTCAGATTGCACTTAGCTGGTATTTCATCTATTTTAGGTGCTGTAAATTTTATTACTACCGTGATTAATATACGATCAAACAAAATAACCTATGACCGACTTCCACTATTTGTTTGATCAGTAGCAATTACTGCTCTTCTACTTCTTCTATCTTTACCTGTTTTAGCTGGTGCTATCACCATACTTTTAACAGACCGAAATTTAAATACTACATTTTTTGATCCTGTAGGAGGAGGAGATCCAATTTTATATCAACATCTATTT"
# unique(mw46$asv_code[mw46$asv_seq == other_seq])
### [1] "7ca9195991a6cad87374d1e98c6ab624"

### Two of these asv_codes are in all_records already
# Hydrochus sp. MC-1 only has 92% match to Genbank
all_records$max_p_identity[all_records$asv_code == "ed3ae084977ef615af77a2eee71a2c5b"] <- 92 

# dup_asv_seq_codes[dup_asv_seq_codes %in% all_records$asv_code]
# Those two are consistently called Hydrochus sp. MC-1 in both datasets
mw46$species[!is.na(mw46$species) & mw46$asv_code == "14295e7a8819dbdc4c2c972433d09d84"]
# [1] "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1"
# mw46$species[!is.na(mw46$species) & mw46$asv_code == "ed3ae084977ef615af77a2eee71a2c5b"]
# # [1] "Hydrochus sp. MC-1" "Hydrochus sp. MC-1"
# all_records$species[!is.na(all_records$species) & all_records$asv_code == "ed3ae084977ef615af77a2eee71a2c5b"]
# # [1] "Hydrochus sp. MC-1" "Hydrochus sp. MC-1"
all_records_ed3_seq <- unique(all_records$asv_seq[!is.na(all_records$species) & all_records$asv_code == "ed3ae084977ef615af77a2eee71a2c5b"])
# all_records$species[!is.na(all_records$species) & all_records$asv_code == "14295e7a8819dbdc4c2c972433d09d84"]
# all_records_ed3_seq == dup_seq | all_records_ed3_seq == other_seq  # FALSE
# [1] "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1" "Hydrochus sp. MC-1"
all_records_142_seq <- unique(all_records$asv_seq[!is.na(all_records$species) & all_records$asv_code == "14295e7a8819dbdc4c2c972433d09d84"])
# all_records_142_seq == dup_seq | all_records_142_seq == other_seq  # FALSE
### So neither of these sequences match the duplicated sequence in MW46, so they can be used to correct the asv_seq for those two asv_codes
mw46$asv_seq[mw46$asv_code == "ed3ae084977ef615af77a2eee71a2c5b"] <- all_records_ed3_seq
mw46$asv_seq[mw46$asv_code == "14295e7a8819dbdc4c2c972433d09d84"] <- all_records_142_seq
# # But the other two are called 
# mw46$species[!is.na(mw46$species) & mw46$asv_code == "9fbe986c778c5556f99611d0075a122a"]
# # [1] "Hydrochus sp. B-AEH7112"
# mw46$species[!is.na(mw46$species) & mw46$asv_code == "7ca9195991a6cad87374d1e98c6ab624"]
# # [1] "Hydrochus sp. B-AEH7112" "Hydrochus sp. B-AEH7112" "Hydrochus sp. B-AEH7112" "Hydrochus sp. B-AEH7112"
### The names don't matter too much at this stage - they will be revised below
### The above corrections just leave two inconsistencies. 
### It seems most sensible to leave the remaining asv_code that is only associated with dup_seq as is,
### And associate all records of the asv_code associated with both dup_seq and other_seq with other_seq
mw46$asv_seq[mw46$asv_code == "7ca9195991a6cad87374d1e98c6ab624"] <- other_seq
asv_test <- unique(mw46[c("asv_code","asv_seq")])
sum(duplicated(asv_test$asv_seq))  # 0 - all good.

### Problem 2. asv_code b9ffeddb98f138f3aa3550b73a610dbb  has one record  incorrectly identified as Plecoptera sp. MC-O1 and one as kingdom Unassigned
mw46 <- mw46[!(mw46$kingdom == "Unassigned" & mw46$asv_code == "b9ffeddb98f138f3aa3550b73a610dbb"),]

# Remove records with phylum = "Unassigned" and with no matching record in BOLD

mw46 <- mw46[!(mw46$kingdom == "Unassigned" & !mw46$asv_code %in% unique(bold_results$asv_code)),]
# Update taxonomy for the 53 unassigned records that do have a bold match
unassigned_asvs <- unique(mw46$asv_code[mw46$kingdom == "Unassigned"])  #27 asv_codes
unassigned_asvs_bold_ambig_mw46 <- vector()
for(i in 1:length(unassigned_asvs)){
  boldi <- bold_results[bold_results$asv_code == unassigned_asvs[i],]
  if(max(boldi$similarity, na.rm = TRUE) >= 97){ 
    new_taxoni <- unique(boldi[boldi$similarity >= 97,
                               c("phylum","class","order","family","genus","species")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig_mw46 <-  c(unassigned_asvs_bold_ambig_mw46,unassigned_asvs[i])
    }else{
      mw46[mw46$asv_code == unassigned_asvs[i],
           c("phylum","class","order","family","genus","species")] <- new_taxoni
    }
  }
  if(max(boldi$similarity, na.rm = TRUE) >= 95){ 
    new_taxoni <- unique(boldi[boldi$similarity >= 95,
                               c("phylum","class","order","family","genus")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig_mw46 <-  c(unassigned_asvs_bold_ambig_mw46,unassigned_asvs[i])
    }else{
      mw46[mw46$asv_code == unassigned_asvs[i],
           c("phylum","class","order","family","genus")] <- new_taxoni
    }
  }
  if(max(boldi$similarity, na.rm = TRUE) < 95){
    new_taxoni <- unique(boldi[c("phylum","class","order","family")])
    if(nrow(new_taxoni) > 1){ 
      unassigned_asvs_bold_ambig_mw46 <-  c(unassigned_asvs_bold_ambig_mw46,unassigned_asvs[i])
    }else{
      mw46[mw46$asv_code == unassigned_asvs[i],
           c("phylum","class","order","family")] <- new_taxoni
    }
  }
}

# Remove remaining unassigned records
mw46 <- mw46[!mw46$kingdom %in% c("Unassigned"),]
mw46_sampledata <- mw46 # keep all sample data for checking purposes
mw46 <- unique(mw46[!mw46$asv_code %in% unique(all_records$asv_code),
                    c("asv_code","kingdom","phylum","class","order",
                      "family","genus","species","max_p_identity",
                      "asv_seq","amplicon")])

sum(duplicated(mw46$asv_code))  # 36. 
### Investigate remaining duplicates 
mw46_dups <- mw46[duplicated(mw46$asv_code) | duplicated(mw46$asv_code, fromLast = TRUE),]
### Differences in species names don't matter, as these will be checked below. Just choose
### the first one.  Entry with more taxonomic information is preferable
### Or cases of differing max_p_identity: set max_p_identity to maximum value and re-check
dup_asvs <- unique(mw46_dups$asv_code)
for(i in 1:length(dup_asvs)){
  dupi <- mw46_dups[mw46_dups$asv_code == dup_asvs[i],]
  ## get rid of any unassigned records and any duplicated non-macro/non-aquatics
  if(sum(!is.na(dupi$kingdom)) > 0 & sum(dupi$kingdom == "Unassigned") > 0){
    mw46 <- mw46[!(mw46$asv_code == dup_asvs[i] & mw46$kingdom == "Unassigned"),]
    next()
  }
  if(sum(!is.na(dupi$phylum)) > 0 & sum(dupi$phylum == "Magnoliophyta") > 0){
    mw46 <- mw46[!(mw46$asv_code == dup_asvs[i] & mw46$phylum == "Magnoliophyta"),]
    next()
  }
  # If is.na() taxonomic levels are different
  if(length(unique(apply(is.na(dupi[2:7]),1,sum))) > 1){
    mw46[mw46$asv_code == dup_asvs[i],2:7] <- dupi[which.min(apply(is.na(dupi[2:7]),1,sum)),2:7]
  }
  if(sum(is.na(dupi$max_p_identity)) > 0) stop("1")
  if(length(unique(dupi$max_p_identity)) > 1){
    mw46$max_p_identity[mw46$asv_code == dup_asvs[i]] <- max(dupi$max_p_identity)
  }
  if(sum(is.na(dupi$species)) > 0) stop("2")
  if(sum(grepl("Unident.", dupi$species)) == 1 & sum(dupi$species == "") == 1){
    mw46$species[mw46$asv_code == dup_asvs[i]] <- ""
  }
  if(length(unique(dupi$species)) > 1){
    mw46$species[mw46$asv_code == dup_asvs[i]] <- dupi$species[1]
  }
}
mw46 <- unique(mw46)
sum(duplicated(mw46$asv_code))  # 0.

### For assembly of library, just asv_code-specific information is required
all_records_sample_data <- all_records # keep all sample data for checking purposes
all_records <- unique(all_records[c("asv_code","kingdom","phylum","class","order",
                                    "family","genus","species","max_p_identity",
                                    "asv_seq","amplicon")])
### And add non-matching asv_codes from mw46 data 
all_records <- rbind(all_records, mw46)
all_records <- unique(all_records)  # 22,383

sum(duplicated(all_records$asv_code)) # 45
### Investigate remaining duplicates 
all_records_dups <- all_records[duplicated(all_records$asv_code) | duplicated(all_records$asv_code, fromLast = TRUE),]

### All either cases of differing max_p_identity or one identified to higher level
### set max_p_identity to maximum value and re-check and pick the higher level record
dup_asvs <- unique(all_records_dups$asv_code)
for(i in 1:length(dup_asvs)){
  dupi <- all_records_dups[all_records_dups$asv_code == dup_asvs[i],]
  if(sum(is.na(dupi$max_p_identity) > 0)) stop("1")
  if(length(unique(dupi$max_p_identity)) > 1){
    all_records$max_p_identity[all_records$asv_code == dup_asvs[i]] <- max(dupi$max_p_identity)
  }
  missing_taxa <- is.na(dupi[c("order","family","genus","species")])
  id_level <- apply(missing_taxa,1,sum)
  higher_id <- which(id_level == min(id_level))
  all_records[all_records$asv_code %in% dupi$asv_code,c("order","family","genus","species")] <- 
    dupi[higher_id,c("order","family","genus","species")]
}
### Remove duplicates and check again
all_records <- unique(all_records)
sum(duplicated(all_records$asv_code))  # 0.  Good

asv_bold <- unique(bold_results$asv_code)
sum(asv_bold %in% all_records$asv_code)  #16153 asv_codes with a match to BOLD (some with similarity <94 after addition of genus matches) 

write.csv(all_records, "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/all_miseq_records_draft.csv", row.names = FALSE)

## 3. Mel Carew's checked table used for checking and validating the outputs of 
##    Appendix 2 for aquatic fauna (outside the Appendix 2 script), and for compiling 
##    and partially correcting the non-aquatic records in the asv_library (chunk
##    starting L1458 in Appendix 2)

tfill_ck <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/arc_tfill_checked_all.csv")
maxp_ck <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/arc_maxp_checked_all.csv")
mw46unmat_ck <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/Spring_2018_DNA_metabarcoding_data/synonym_updates/MW46_metabar_unmatched_checked_all.csv")
arc_unmat_ck  <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/arc_unmatched_checked.csv")

all_MC_checks <- rbind(tfill_ck, maxp_ck, mw46unmat_ck, arc_unmat_ck) 
# Remove duplicates and unnecessary fields
all_MC_checks <- unique(all_MC_checks[c("asv_code","checked_species_name", "bold_match","bold_bin_uri","action","comments")])
dups <- all_MC_checks[duplicated(all_MC_checks$asv_code) | duplicated(all_MC_checks$asv_code, fromLast = TRUE),]  
#  174 duplicated asv_codes with different actions/comments: get rid of some as follows
# Need to work around this somehow....for now just delete all duplicates (at the risk of losing some important actions/comments)
# important actions seem to come second, so
all_MC_checks <- all_MC_checks[!duplicated(all_MC_checks$asv_code, fromLast = TRUE),]

write.csv(all_MC_checks, "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/all_mc_checks.csv", 
          row.names = FALSE)

## 4. Mel Carew's private library

tfill <- as.data.frame(readxl::read_excel("~/uomShare/wergStaff/ChrisW/temp/asv_library_corrected.xlsx"),
                       sheet = "tfill")
load("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/match_list_bin_uri_v5.rda")
all_MC_checks <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/all_mc_checks.csv")

#read in private library and searches from Geneious 
priv_bar_lib <- read.csv("~/uomShare/wergStaff/MelCarew/DNAbarcode_reference_databases/priv_lib_Nov23.csv")
# Unbelievably persistent spelling error (lost count of how many times I've corrected this)
priv_bar_lib$species <- gsub("Cricptopus","Cricotopus",priv_bar_lib$species)
# Results of search on geneious for matches with asv_records without matches in the BOLD database
genei_results  <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/geneious_search_not_bold_priv_lib.csv")
names(genei_results)[match(c("Query","X..Pairwise.Identity","Query.coverage"),names(genei_results))] <- 
  c("asv_code","geneious_similarity","Query_coverage")
genei_results$geneious_similarity <- as.numeric(gsub("%","",genei_results$geneious_similarity))
genei_results$id <- stringr::str_extract(genei_results$Name, "[^_]+$")

# Now there were a persistent 126 records that repeatedly didn't get a match >=97 from geneious or genBank
# Mel Carew found 59 did get a good match on one last go...
priv_126 <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/geneious_search_results_last126.csv")
priv_126$geneious_similarity <- as.numeric(gsub("%","",priv_126$geneious_match))
# But subsequently discovered that the names in this file were wrong, and their names should be the checked_species_name 
# 49 records with good matches
priv_126 <- priv_126[priv_126$geneious_similarity >= 97,]
for(i in 1:nrow(priv_126)){
  if(sum(genei_results$asv_code == priv_126$asv_code[i]) != 1) stop("1")
  if(genei_results$geneious_similarity[genei_results$asv_code == priv_126$asv_code[i]] > 
     priv_126$geneious_similarity[i]) stop("2")
  genei_results$geneious_similarity[genei_results$asv_code == priv_126$asv_code[i]] <- 
    priv_126$geneious_similarity[i]
  # species names in the genei_results table are whack.
  if(!priv_126$asv_code[i] %in% all_MC_checks$asv_code) stop("1")
  genei_results$species[genei_results$asv_code == priv_126$asv_code[i]] <- 
    all_MC_checks$checked_species_name[all_MC_checks$asv_code == priv_126$asv_code[i]]
}
gb_126 <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/genbank_search_results_last126.csv")
gb_126 <- aggregate(gb_126$genbank_match, by = list(asv_code = gb_126$asv_code), FUN = max)
# and 36 records in genbank with good matches
for(i in 1:nrow(gb_126)){
  if(sum(genei_results$asv_code == gb_126$asv_code[i]) != 1) stop("1")
  if(genei_results$geneious_similarity[genei_results$asv_code == gb_126$asv_code[i]] <
     gb_126$x[i]) 
  genei_results$geneious_similarity[genei_results$asv_code == gb_126$asv_code[i]] <- 
    gb_126$x[i]
}

# Separate records with <97 match for further consideration
genei_results_lt97 <- genei_results[genei_results$geneious_similarity < 97,] # 1119 down from 1193 before the 126 check
genei_results <-  genei_results[genei_results$geneious_similarity >= 97,] # 1591 up from 1517 
# reduce set to those in the private library
genei_results <- genei_results[!is.na(match(genei_results$id, priv_bar_lib$id)),]
genei_results$species_check <- priv_bar_lib$species[match(genei_results$id, priv_bar_lib$id)] # 1495 records
genei_results$species_check <- NA
for(i in 1:nrow(genei_results)){
  genei_results$species_check[i] <- gsub("_", " ", 
                                         gsub(paste0("_",genei_results$id[i]), "", genei_results$Name[i]))
}
# another (#!$ spelling correction to make the next check 0)
genei_results$species_check <- gsub("Cricptopus","Cricotopus",genei_results$species_check)
sum(genei_results$species != genei_results$species_check) # Species names derived both ways match. All good.
genei_results <- genei_results[names(genei_results) != "species_check"]
# A correction following final checks of species groupings by Mel Carew
genei_results$species[genei_results$Name == "Austrochiltonia_sp._MC-1_WER38Cein1"] <- "Austrochiltonia australis"

asv_no_bold <- tfill$asv_code[!tfill$asv_code %in% unique(names(match_list_bin_uri))]  
check_no_bold <- tfill[!tfill$asv_code %in% unique(names(match_list_bin_uri)),] # 1540
#  all_MC_checks[all_MC_checks$asv_code %in% asv_no_bold,]
# length(asv_no_bold)  1540 (aquatic macroinvertebrate) asv_codes with no match in bin
# And another set of geneious searches (with taxonomic information )
priv_lib_matches <- read.csv("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_library/geneious_search_filtered_check_not_bold.csv") #1690
priv_lib_matches$species <- gsub("\\_", " ", priv_lib_matches$species)
names(priv_lib_matches)[names(priv_lib_matches) == "geneious_match"] <- "geneious_similarity"
priv_lib_matches$geneious_similarity <- as.numeric(gsub("%","",priv_lib_matches$geneious_similarity))

genei_results_lt97$x <- NA
for(i in 1:nrow(genei_results_lt97)){
  if(sum(priv_lib_matches$asv_code == genei_results_lt97$asv_code[i]) == 0){
    namei <- gsub(paste0("_",genei_results_lt97$id[i]), "", genei_results_lt97$Name[i])
    taxonomyi <- unique(priv_lib_matches$Name[grep(namei, genei_results_lt97$Name)])
    if(length(taxonomyi) == 1)
      genei_results_lt97$x[i] <- taxonomyi
  }else{
    genei_results_lt97$x[i] <- priv_lib_matches$Name[priv_lib_matches$asv_code == genei_results_lt97$asv_code[i]]
  }
}
# sum(genei_results_lt97$asv_code[is.na(genei_results_lt97$x)] %in% asv_no_bold) # 0
# 1 record without resulting taxonomic information not in check_no_bold...manually fix it
#   2 other records with the same taxonomy
genei_results_lt97$x[genei_results_lt97$Name == "Scatella_sp._B-AEU5143_BLC97Scoi1"]  <- 
  genei_results_lt97$x[genei_results_lt97$Name == "Scatella_sp._B-AEU5143_BLC97Scoi1"][1]
genei_results_lt97 <- genei_results_lt97[genei_results_lt97$asv_code %in% check_no_bold$asv_code,]
genei_results_lt97 <- mutate(genei_results_lt97, 
                             class = sapply(strsplit(x,";"),"[[",3),
                             order = sapply(strsplit(x,";"),"[[",4),
                             family = sapply(strsplit(x,";"),"[[",5),
                             genus = sapply(strsplit(x,";"),"[[",6), 
                             species = gsub("_"," ", sapply(strsplit(x,";"),"[[",7)),
                             .after = "asv_code")
# Adjust taxonomic ID based on geneious_similarity
# Mel Carew's decisions for species requiring more works 
# 1. keep records that are matched of >96 as Pseudomoera fontana  but for records 
#    with matches <96 lets leave them at family level
# 2. A single record with 96.9 similarity to Apsectrotanypus sp. MC-1 can be kept at species level
# (all other species should follow the standard similarity rules)
genei_results_lt97$species[!((genei_results_lt97$geneious_similarity >= 96 & 
                                genei_results_lt97$species == "Pseudomoera fontana") |
                               (genei_results_lt97$geneious_similarity >= 96.9 & 
                                  genei_results_lt97$species == "Apsectrotanypus sp. MC-1"))] <- NA
genei_results_lt97$genus[genei_results_lt97$geneious_similarity < 95] <- NA
genei_results_lt97$family[genei_results_lt97$geneious_similarity < 92] <- NA
genei_results_lt97$order[genei_results_lt97$geneious_similarity < 85] <- NA

# Move lt97 records kept at species level back to the >97 table
genei_results <- rbind(genei_results, 
                       genei_results_lt97[!is.na(genei_results_lt97$species),
                                          match(names(genei_results),names(genei_results_lt97))]) #1569 records
genei_results_lt97 <- genei_results_lt97[is.na(genei_results_lt97$species),]  #111 records

# Give genei_results species names from all_MC_checks
for(i in 1:nrow(genei_results)){
  if(genei_results$asv_code[i] %in% all_MC_checks$asv_code){
     if(all_MC_checks$checked_species_name[all_MC_checks$asv_code == genei_results$asv_code[i]] != "") {
  genei_results$species[i] <- all_MC_checks$checked_species_name[all_MC_checks$asv_code == genei_results$asv_code[i]]
     }
    genei_results$species[i] <- trimws(gsub("_"," ", gsub(genei_results$id[i],"", genei_results$Name[i])))
  }else{
    genei_results$species[i] <- trimws(gsub("_"," ", gsub(genei_results$id[i],"", genei_results$Name[i])))
    
  }
}

# Check for inconsistencies with checked_species_name
genei_results$csn <- all_MC_checks$checked_species_name[match(genei_results$asv_code, all_MC_checks$asv_code)]
unique(genei_results[genei_results$csn != genei_results$species & genei_results$csn != "",c("csn","species")])
# Mel assures me that all the checked species names are correct.
for(i in which(!is.na(genei_results$csn) & # there really is a checked species name
          genei_results$csn != genei_results$species &   #checked species name differs from private library name
          genei_results$csn != "" &  # there really is a checked species name (again)
          grepl(" ", genei_results$csn #checked species name isn't just a genus/family name
                ))){
  genei_results$species[i] <- genei_results$csn[i]
}

# Correct spelling errors 
genei_results$species <- gsub("sp.B","sp. B", genei_results$species)

# MEL:I struck problems with class-level inconsistencies between tfill and genei_results_lt97 
# when records had geneious similarity <= 86.2. I had, at first, assumed here  
# that these should be removed from the private library, but see below
genei_low <- genei_results_lt97[genei_results_lt97$geneious_similarity <= 86.2,]  #27
genei_low_tfill <- data.frame(tfill[match(genei_low$asv_code, tfill$asv_code),
                 c("asv_code","class","max_p_identity")], 
           class_genei = genei_low$class,
           geneious_similarity = genei_low$geneious_similarity)
problems <- genei_low_tfill[genei_low_tfill$class != genei_low_tfill$class_genei,]
problems  # 9 (of 27 with disagreement at class level)
# Happy for you to make a call on what to do with these:
# Personally I would counsel removing all low-geneious_similarity records from the asv_library
# For now I've left them in tfill, and have removed them from genei_results_lt97.
### MEL: In the last version I had asked if you were comfortable deleting these problems
#        I've managed to come to the conclusion that removing them did cause the problem.
#        Instead, I have created a field in tfill called dubious_id (max_p_identity <= 86.2)
###      Given the high level of disagreement at the class level, I would counsel strongly  
###      that these records should be removed from the asv_library. 
WriteXLS::WriteXLS(list(species = genei_results, higher_taxa = genei_results_lt97),
                   "~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/asv_source_files/private_library_mc_validated.xlsx")

# Records from a visual check of priv_lib_spp entries with odd naming inconsistencies
inc <- c("2aa8dad922b7db2e1326760f3fa9075b","e0718a08e9e543f502f7e2ccc2f41593","05a219c2d4357c5580dd0294b9fd0f41",
"a1dc1b5ad6c4bfeec1155fa6fbec404e","1a382b58c4a5d3c1ec558265cf5219e8","846cd569430799e8555c942e43295cd8",
"c99cbe15c38a2ed5ccc3b01edec08d14","e9e9dca47fcf68baca937e6b68ede656","eb28d2a272446fad1272d79d03a2e19c",
"7bf89f25a170d491b66d2e5fc6ebe937")
inc <- c(inc, check_no_bold$asv[check_no_bold$species != ""])

x <- priv_lib_spp[priv_lib_spp$asv_code %in% inc,]
names(x)[names(x) == "species"] <- "priv_lib_species"
x$checked_species_name <- all_MC_checks$checked_species_name[match(x$asv_code, all_MC_checks$asv_code)]
x$tfill_species_name <- tfill$species[match(x$asv_code, tfill$asv_code)]
