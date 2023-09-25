# This rscript is to manipulate the json output from sierralocal to produce drug_score_level csv to be manipulate in bash
args1 <- commandArgs(trailingOnly = TRUE) # make the script accept arguments
#path="results/sierralocal_output/" # path for json files
path <- paste(args1[1], args1[2], "results/sierralocal_output/", sep = "/")
#jsons <- list.files("results/sierralocal_output/", pattern = ".*json") # create a vector for the json files
jsons <- list.files(path, pattern = ".*json")

ids <- sapply(strsplit(jsons, "_"), "[[", 1) # access the sample ids

for (i in ids){ # go through each sample id
  # cat(paste(path, i, "_sierralocal_report.json", sep = ""), "\n")
  hivdr <- jsonlite::fromJSON(paste(path, i, "_sierralocal_report.json", sep = ""), flatten = TRUE) # read in the json file
  tmp<-data.frame()
  for (j in 1:dim(hivdr)[1]) {
    seq_df <- hivdr[j,]
    seq<-seq_df$inputSequence.header
    drug_res<-seq_df$drugResistance[[1]]
    genes<-drug_res$gene.name
    for (gene in unique(genes)) {
      gene_df<-drug_res[drug_res$gene.name==gene,]
      
      # extracted the version and date
      version <- gene_df$version.text
      verDate <- gene_df$version.publishDate
      gene_drug_scores<-gene_df$drugScores[[1]]
      gene_drug_scores<-gene_drug_scores[c("drugClass.name","drug.name", "score", "text")]
      tmp<-rbind(tmp, gene_drug_scores)
    }
    names(tmp)<-c("drugClass.name", "Drug name", "HIVDB Score", "Drug susceptibility")
    mutations<-seq_df$alignedGeneSequences[[1]]$mutations
    subtype<-hivdr$subtypeText
  }
  myfile <- paste0(i, "_drug_score_resistance.csv") # create the unique file name
  write.csv(tmp, file = myfile) # create the file
  
}

