# cora-citation-network-analysis

## Panoramica del progetto
Questo repository contiene un’analisi completa della Cora Citation Network, una rete di citazioni tra paper accademici in ambito Machine Learning.​  
Il progetto è organizzato in script in "R" e in notebook "R Markdown" che guidano l’utente passo per passo dall’installazione dei dati fino alle analisi di centralità, similarità e struttura globale della rete.

---

--------------  ## Struttura del progetto, file e cartelle

- `data/raw/` – contiene i file originali del dataset Cora (`cora.content`, `cora.cites`).​
- `data/processed/` – contiene oggetti `.rds` e altri file derivati usati nei notebook successivi.​  
- `scripts/` – contiene gli script R “automatici”:  
  - `01_download_data.R` – scarica e prepara il dataset Cora nella cartella `data/raw` (chiamato in 01_Network_Construction)
- `create_project_structure.R` – crea tutta la struttura di cartelle e i file `.gitkeep`.​  
- `notebooks/` – contiene i notebook R Markdown numerati (01_… 05_…) con tutte le analisi.​  

## Requisiti

- R versione ≥ 4.3​  
- RStudio  
- I principali pacchetti R per l’analisi di rete e la visualizzazione:
  - `dplyr`, `igraph`, `tidygraph`, `ggraph`, `ggplot2`

---

## Come iniziare

1. Clona o scarica il repository su una cartella locale.  
2. Apri il file `cora-citation-network-analysis.Rproj` con RStudio per lavorare con la working directory corretta.​  
3. Apri il file `06_Network_Analysis.Rmd`.

---

-------------- Scaricare la cora network

-------------- ### Domande di ricerca : 



