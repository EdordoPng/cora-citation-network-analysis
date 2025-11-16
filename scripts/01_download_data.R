# ==============================================================================
# Script: 01_download_data.R
# Description: Scarica e decomprime il dataset CORA nella cartella data/raw/
# ==============================================================================

cat("=== Downloading Cora Dataset ===\n\n")

# URL ufficiale
cora_url <- "https://linqs-data.soe.ucsc.edu/public/lbc/cora.tgz"

# Percorsi di destinazione
dest_dir <- "data/raw"
archive_path <- file.path(dest_dir, "cora.tgz")
cora_content_path <- file.path(dest_dir, "cora.content")
cora_cites_path <- file.path(dest_dir, "cora.cites")

# Crea cartella di destinazione se non esiste
if(!dir.exists(dest_dir)) dir.create(dest_dir, recursive = TRUE)

# Scarica solo se non esistono già i file estratti
if (file.exists(cora_content_path) && file.exists(cora_cites_path)) {
  cat("✓ cora.content e cora.cites già presenti in", dest_dir, "\n")
} else {
  # Download .tgz se non presente
  if (!file.exists(archive_path)) {
    download.file(cora_url, destfile = archive_path, mode = "wb", quiet = FALSE)
    cat("✓ Archivio scaricato:", archive_path, "\n")
  } else {
    cat("✓ Archivio già presente:", archive_path, "\n")
  }
  
  # Estrazione
  untar(archive_path, exdir = dest_dir)
  cat("✓ File estratti in:", dest_dir, "\n")
  
  # Rinomina file (alcuni archivi pongono in una sottocartella './cora/')
  content_found <- list.files(dest_dir, pattern = "cora.content", recursive = TRUE, full.names = TRUE)
  cites_found   <- list.files(dest_dir, pattern = "cora.cites", recursive = TRUE, full.names = TRUE)
  
  file.rename(content_found[1], cora_content_path)
  file.rename(cites_found[1], cora_cites_path)
  
  cat("✓ File cora.content e cora.cites pronti in", dest_dir, "\n")
}

cat("\nFile presenti:\n")
print(list.files(dest_dir))
cat("\n=== Cora dataset is ready ===\n")
