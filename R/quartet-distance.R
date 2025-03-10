library('Quartet')
library("profmem")
library(ape)  # For reading tree files
library(pryr)  # For memory measurement

# Define a custom TQfile function
custom_TQfile <- function(trees) {
  # Create a temporary file
  temp_file <- tempfile(pattern = "trees_", fileext = ".nwk")
  
  if (class(trees) == "phylo") {
    # Single tree
    write.tree(trees, file = temp_file)
  } else if (class(trees) == "multiPhylo") {
    # Multiple trees
    write.tree(trees, file = temp_file)
  } else {
    stop("Input must be of class 'phylo' or 'multiPhylo'")
  }
  
  return(temp_file)
}

# Process a single pair of tree files
process_tree_pair <- function(file1, file2, output_file) {
  # Read trees from files
  trees1 <- read.tree(file = file1)
  if (class(trees1) != "multiPhylo") {
    trees1 <- c(trees1)
    class(trees1) <- "multiPhylo"
  }
  
  trees2 <- read.tree(file = file2)
  if (class(trees2) != "multiPhylo") {
    trees2 <- c(trees2)
    class(trees2) <- "multiPhylo"
  }
  
  # Merge tree lists
  all_trees <- c(trees1, trees2)
  class(all_trees) <- "multiPhylo"
  
  temp_file <- custom_TQfile(all_trees)
  on.exit(file.remove(temp_file))
  
  # Measure time only (memory tracking updated)
  start_time <- Sys.time()
  
  # Calculate quartet distance
  qd_matrix <- AllPairsQuartetDistance(temp_file)
  
  end_time <- Sys.time()
  time_taken <- as.numeric(difftime(end_time, start_time, units = "secs"))
  
  # We'll use a simpler memory estimate (current memory usage)
  gc()  # Force garbage collection
  mem_used_mb <- sum(gc()[,2]) / 1024 
  
  # Save the result to file
  write.table(qd_matrix, file=output_file, sep = ",",row.names=FALSE)
  
  return(list(
    processing_time = time_taken,
    memory_used_mb = mem_used_mb
  ))
}

# Process all tree pairs
process_all_tree_pairs <- function(base_path1, base_path2, base_path3, n = 4, n_pairs = 100) {
  total_time <- 0
  total_memory <- 0
  
  cat("Starting to process", n_pairs, "tree pairs...\n")
  
  for (i in 1:n_pairs) {
    # Construct file paths
    file1 <- paste0(base_path1, i, ".trees")
    file2 <- paste0(base_path2, i, ".trees")
    output_file <- paste0(base_path3, i, ".csv")
    
    cat("Processing pair", i, "of", n_pairs, "...\n")
    
    # Process the pair
    tryCatch({
      result <- process_tree_pair(file1, file2, output_file)
      
      # Add to total metrics
      total_time <- total_time + as.numeric(result$processing_time, units = "secs")
      total_memory <- total_memory + result$memory_used_mb
      
      cat("  Completed. Time:", result$processing_time, "seconds, Memory:", 
          result$memory_used_mb, "MB\n")
      cat("  Results saved to:", output_file, "\n")
    }, error = function(e) {
      cat("  Error processing pair", i, ":", e$message, "\n")
    })
  }
  
  # Calculate summary statistics - Removed trailing comma!
  summary <- list(
    total_processing_time = total_time,
    total_memory_used_mb = total_memory
  )
  
  return(summary)
}

# Main execution
base_path1 <- "../../data/rawTree/4_diff_topo_1_100_"
base_path2 <- "../../data/rawTree/4_diff_topo_5_100_"
base_path3 <- "../../data/QD/4_qd_100_"

# Process all 100 pairs
summary <- process_all_tree_pairs(base_path1, base_path2, base_path3, n=4, n_pairs = 100)

# Print summary
cat("\n===== SUMMARY =====\n")
cat("Total processing time:", summary$total_processing_time, "seconds\n")
cat("Total memory used:", summary$total_memory_used_mb, "MB\n")
# 1763.453 seconds, 10.7532 MB



base_path1 <- "../../data/rawTree/4_diff_topo_1_1000_"
base_path2 <- "../../data/rawTree/4_diff_topo_5_1000_"
base_path3 <- "../../data/QD/4_qd_1000_"

# Process all 100 pairs
summary <- process_all_tree_pairs(base_path1, base_path2, base_path3, n=4, n_pairs = 100)

# Print summary
cat("\n===== SUMMARY =====\n")
cat("Total processing time:", summary$total_processing_time, "seconds\n")
cat("Total memory used:", summary$total_memory_used_mb, "MB\n")
# 1907.334 seconds


base_path1 <- "../../data/rawTree/8_diff_topo_1_100_"
base_path2 <- "../../data/rawTree/8_diff_topo_7_100_"
base_path3 <- "../../data/QD/8_qd_100_"

# Process all 100 pairs
summary <- process_all_tree_pairs(base_path1, base_path2, base_path3, n=8, n_pairs = 100)

# Print summary
cat("\n===== SUMMARY =====\n") 
cat("Total processing time:", summary$total_processing_time, "seconds\n")
cat("Total memory used:", summary$total_memory_used_mb, "MB\n")
# 1905.733 seconds



base_path1 <- "../../data/rawTree/8_diff_topo_1_1000_"
base_path2 <- "../../data/rawTree/8_diff_topo_7_1000_"
base_path3 <- "../../data/QD/8_qd_1000_"

# Process all 100 pairs
summary <- process_all_tree_pairs(base_path1, base_path2, base_path3, n=8, n_pairs = 100)

# Print summary
cat("\n===== SUMMARY =====\n")
cat("Total processing time:", summary$total_processing_time, "seconds\n")
cat("Total memory used:", summary$total_memory_used_mb, "MB\n")