# Cora Citation Network Analysis

## Panoramica del progetto
Questo repository contiene una Network Analysis completa della Cora Citation Network. 


Il dataset Cora consiste in paper accademici in ambito Machine Learning. 
Questi articoli sono classificati in una delle seguenti sette diverse categorie :

    Case_Based
	Genetic_Algorithms
	Neural_Networks
	Probabilistic_Methods
	Reinforcement_Learning
	Rule_Learning
	Theory

Il file .content contiene le descrizioni degli articoli nel seguente formato:

  	<paper_id> <word_attributes>+ <class_label>

La prima voce di ogni riga contiene l'ID dell'paper.
La seconda voce di ogni riga non verrà usata in questo progetto.
L'ultima voce della riga contiene l'etichetta della categoria dell'articolo.

Il file .cites contiene il grafo delle citazioni. Ogni riga descrive un collegamento nel seguente formato

 	 <ID of cited paper> <ID of citing paper> 

Ogni riga contiene due ID di paper.  
La prima voce è l'ID del paper citato, il secondo ID rappresenta il paper citante. 

Il progetto è organizzato in script in "R" e in notebook "R Markdown" che guidano l’utente passo per passo nelle alle analisi di centralità, similarità e struttura globale della rete.

---

 ## Struttura del progetto, file e cartelle

- `data/raw/` – contiene i file originali del dataset Cora (`cora.content`, `cora.cites`).​
- `data/processed/` – contiene oggetti `.rds` e altri file derivati.​  
- `scripts/` – contiene gli script R “automatici”:  
  - `01_download_data.R` – scarica e prepara il dataset Cora nella cartella `data/raw`
- `notebooks/` – contiene i notebook R Markdown numerati (01_… 05_…) e quello con tutte le analisi : 06_Final_Analysis.​  

## Requisiti

- R versione ≥ 4.3​  
- RStudio  
- I principali pacchetti R per l’analisi di rete e la visualizzazione:
  - `dplyr`, `igraph`, `tidygraph`, `ggraph`, `ggplot2`, `ggrepel`, `Matrix`, `corrplot`, `tidyr`, `knitr`
---

## Come iniziare

1. Clona o scarica il repository su una cartella locale.
2. Apri RStudio, a sinistra nella barra in alto seleziona File -> Open Project
3. Apri il progetto `cora-citation-network-analysis.Rproj` per lavorare con la working directory corretta.​
4. Esegui questo `source("scripts/01_download_data.R")` sulla console di RStudio per scaricare la Cora citation Network nella cartella `data/raw/` (è automatico)
5. Apri il file `notebooks/06_Network_Analysis.Rmd`.
6. Visionare il contenuto del file 

---

## Domande di ricerca : 

  ### Network quick view
  
  1 : Qual è il numero di paper in ogni categoria ?

  2 : Qual è la distribuzione del numero di citazioni fatte dai paper ?

  3 : Per ogni catgoria, quante sono le citazioni verso la stessa categoria ?

  4.1 : Quali sono le top coppie di paper con più paper citati in comune ? (common successors)
  4.2 : Quali sono le top coppie di paper con più paper citanti in comune ? (common predecessors)

  ### Centrality

  5 : Analizza i top paper per PageRank e scopri se tale valore è principalmente influenzato da : 
      
    * numero di link che riceve 
    * centralità dei nodi da cui riceve i link
    * quanto i nodi da cui si ricevono i link sono propensi a linkar altri nodi

  6 : Analizza Authority ed Hub score per capire quali paper risultano maggiormente influenti. 


  7 : Identifica categorie potenti che non sono centrali e categorie centrali che non sono potenti.


  8 : Visualizzare la rete tra categorie con la dimensione dei nodi proporzionale alla power e alla centralità, colore archi proporzionale al flusso di citazioni.

  
  ### Similarity ed eterogenity


  9 : I paper con alta centralità tendono ad essere interdisciplinari ?

  10 : I paper interdisciplinari (alto Rao da out-degree) sono più influenti (alto in-degree/PageRank) ?

  11 : Quali categorie producono i paper più interdisciplinari ? E quali beneficiano di più dai ponti interdisciplinari?


  ### Group Analysis

  12 : Identifica le comunità di paper e verifica se esse coincidono con le categorie scientifiche (ground truth). 
      Se no, quale divisione in gruppi risulta esser più adatta alla rete ?  Quella iniziale (categorie) o quella trovata (communities) ? 

  13 : Quali categorie sono più pure ? (una sola community o meno possibili)


  ### Global Analysis

  14 : Studia i K-connected components e verifica se i gruppi con connettività più alta sono composti da soli paper di una stessa catgoria.

  15 : Analizza gli SCC per verificare l'aciclicità della rete. 
  
  16 : Verifica lo Small-World Effect sul grafo non diretto.
  
  17 : Verifica che la Assortativity by category sia molto alta (dato che ho tante citazioni intra-categoria)
  
  18 : Verifica se l’elite delle pubblicazioni crea un “club” chiuso


