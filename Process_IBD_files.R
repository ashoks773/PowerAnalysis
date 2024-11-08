# This script is to compute microbiome diversity on IBDMDB dataset published in Nature 2019
# https://ibdmdb.org
# By Ashok K. Sharma
# Date: 10-28-2024

library(labdsv)
library(vegan)

# Download merged taxomony profile https://ibdmdb.org/downloads/html/products_MGX_2017-08-12.html
# Download HMP2 Metadata file
mgx_taxa <- read.csv("IBDMDB_dataset/hmp2_mgx_taxonomy.tsv", header = T, row.names = 1, sep= "\t")
colnames(mgx_taxa) <- gsub("_profile$", "", colnames(mgx_taxa))

# Metadata for Metagenomics Dataset
metadata <- read.csv("IBDMDB_dataset/Metadata_mgx.txt", header = T, sep= ",") #Get only metagenomic sample file
rownames(metadata) <- metadata$External.ID; metadata$External.ID <- NULL

# Check if All Samples names are same in both files
all(rownames(metadata) %in% colnames(mgx_taxa))

# To Get Diversity
mgx_taxa_T <- data.frame(t(mgx_taxa))
Obs <- rowSums(mgx_taxa_T > 0)
#Obs.rare <- rarefy(mgx_taxa_T, min(rowSums(mgx_taxa_T)))
Shannon <- diversity(mgx_taxa_T)
InvSimpson <- diversity(mgx_taxa_T, "invsimpson")
Diversity <- data.frame(Obs, Shannon, InvSimpson)

# Merge Metadata with Divesity
Diversity_meta <- merge(Diversity, metadata, by=0, all=F)
rownames(Diversity_meta) <- Diversity_meta$Row.names; Diversity_meta$Row.names <- NULL
Diversity_meta_sel <- Diversity_meta[,c(1:4,5,8,11,30,31, 73, 233, 433, 480)]

colnames(Diversity_meta_sel)[colnames(Diversity_meta_sel) == "Participant.ID"] <- "Patient"
colnames(Diversity_meta_sel)[colnames(Diversity_meta_sel) == "Age.at.diagnosis"] <- "Age"

## Convert Diagnosis to Group
Diversity_meta_sel$Group <- ifelse(Diversity_meta_sel$diagnosis %in% c("CD", "UC"), "CDUC", "nonIBD")
write.csv(Diversity_meta_sel, file = "data/Diversity.csv")

# Site specific Sample Details
CS_diversity <- subset(Diversity_meta_sel, site_name == "Cedars-Sinai") #only for Cedars Sinai Samples
write.csv(CS_diversity, file = "data/CS_diversity.csv")

# Site specific Sample Details
Cincinnati_diversity <- subset(Diversity_meta_sel, site_name == "Cincinnati")
write.csv(Cincinnati_diversity, file = "Cincinnati_diversity.csv")
