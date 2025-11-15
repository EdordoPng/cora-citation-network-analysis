# ==============================================================================
# Script: create_project_structure.R
# Description: Creates the folder structure for Cora Citation Network Analysis
# Author: Edoardo Diana
# Date: 2025-11-16
# ==============================================================================

cat("=== Creating Project Structure ===\n\n")

# Define folder structure
folders <- c(
  "data",
  "data/raw",
  "data/processed",
  "scripts",
  "notebooks",
  "output",
  "output/figures",
  "output/tables"
)

# Create folders if they don't exist
for (folder in folders) {
  if (!dir.exists(folder)) {
    dir.create(folder, recursive = TRUE)
    cat("✓ Created:", folder, "\n")
  } else {
    cat("⚠ Already exists:", folder, "\n")
  }
}

cat("\n=== Project Structure Created Successfully ===\n")
cat("\nFolder tree:\n")
cat("cora-citation-network-analysis/\n")
cat("├── data/\n")
cat("│   ├── raw/           # Raw Cora data (cora.content, cora.cites)\n")
cat("│   └── processed/     # Processed .rds files\n")
cat("├── scripts/           # R backend scripts\n")
cat("├── notebooks/         # R Markdown analysis notebooks\n")
cat("└── output/            # Generated outputs\n")
cat("    ├── figures/       # PNG/PDF plots\n")
cat("    └── tables/        # CSV tables\n\n")

cat("Next steps:\n")
cat("1. Run scripts/00_setup.R to install packages\n")
cat("2. Run scripts/01_download_data.R to download Cora dataset\n")
cat("3. Open notebooks/01_Network_Construction.Rmd to start analysis\n\n")


# Create .gitkeep files in empty folders
gitkeep_folders <- c(
  "data/raw",
  "data/processed",
  "output/figures",
  "output/tables"
)

cat("\n=== Creating .gitkeep files ===\n")

for (folder in gitkeep_folders) {
  gitkeep_path <- file.path(folder, ".gitkeep")
  if (!file.exists(gitkeep_path)) {
    file.create(gitkeep_path)
    cat("✓ Created:", gitkeep_path, "\n")
  }
}

cat("\n✓ .gitkeep files created (preserves empty folders on Git)\n")
