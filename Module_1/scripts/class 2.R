#Define input and output folders
input_dir <- "raw_data" 
output_dir <- "results"

#List which files to process
files_processed <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# Prepare empty list to store results in R 
result_list <- list()

#Create function classify gene
classify_gene <- function(padj, logFC) {
  ifelse(padj < 0.05 & logFC > 1, "Upregulated",
         ifelse(padj < 0.05 & logFC < -1, "Downregulated", "Not_Significant")
  )
}

#Now create a for loop to automatically peroform the assigned processing needed
for (file_names in files_processed) {
  cat("\nProcessing:", file_names, "\n")
  #Track your progress in the loop
  input_file_path <- file.path(input_dir, file_names)
  
  #import datasets
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values...\n")
  
  #Handle missing values
  
  if("padj" %in% names(data)){
    missing_count <- sum(is.na(data$padj))
    
    cat("Missing values in 'padj':", missing_count, "\n")
    data$padj[is.na(data$padj)] <- 1
  }
    #Add a new column 'status' 
    data$status <- classify_gene(data$padj, data$logFC)
    cat("Genes have been classified successfully.\n")
    
    #Save results in R
    result_list[[file_names]] <- data 
    
    #Save results in Results folder
    output_file_path <- file.path(output_dir, paste0("DEG_results", file_names))
    write.csv(data, output_file_path, row.names = FALSE)
    cat("Results saved to:", output_file_path, "\n")
    
    #print summary
    summarized_table <- table(data$status)
    cat("Summarized table of status:", summarized_table, "\n")
    
    }

#Show table more clearly
table(data$status)

#Extract results
results_1 <- result_list[[1]] 
results_2 <- result_list[[2]]


save.image(file = "ShahdZiadMohamedRashad_Class_2_Assignment.RData")


