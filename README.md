# cora-citation-network-analysis

## Panoramica del progetto
Questo repository contiene un’analisi completa della Cora Citation Network, una rete di citazioni tra paper di machine learning.​  
Il progetto è organizzato in script “backend” in R e in notebook R Markdown che guidano l’utente passo per passo dall’installazione dei dati fino alle analisi di centralità, similarità e struttura globale della rete.

---

## Struttura del progetto, file e cartelle

- `data/raw/` – contiene i file originali del dataset Cora (`cora.content`, `cora.cites`).​
- `data/processed/` – contiene oggetti `.rds` e altri file derivati usati nei notebook successivi.​  
- `scripts/` – contiene gli script R “automatici”:  
  - `01_download_data.R` – scarica e prepara il dataset Cora nella cartella `data/raw` (chiamato in 01_Network_Construction)
- `create_project_structure.R` – crea tutta la struttura di cartelle e i file `.gitkeep`.​  
- `notebooks/` – contiene i notebook R Markdown numerati (01_… 05_…) con tutte le analisi.​  

### Cartelle disponibili per analisi future

- `output/figures/` – grafici e immagini generate dai notebook.​  
- `output/tables/` – tabelle e CSV generati dalle analisi.

---

## Requisiti

- R versione ≥ 4.3​  
- RStudio  
- I principali pacchetti R per l’analisi di rete e la visualizzazione:
  - `dplyr`, `igraph`, `tidygraph`, `ggraph`, `ggplot2`

---

## Come iniziare (setup rapido)

1. Clona o scarica il repository su una cartella locale.  
2. Apri il file `.Rproj` del progetto (`cora-citation-network-analysis.Rproj`) con RStudio per lavorare con la working directory corretta.​  
3. (Opzionale) Esegui lo script `create_project_structure.R` se stai partendo da zero e vuoi ricreare le cartelle.  
4. Apri il file `01_Network_Construction.Rmd`.

---

## Costruzione della rete (Notebook 01_Network_Construction.Rmd)

Apri `notebooks/01_Network_Construction.Rmd` in RStudio.​  
Poi esegui il codice dei vari chunk presenti in tale file R Markdown in RStudio.

Alternativamente, fai knit ed esegui così tutto il codice, ottenengo un html.  
Rpeti questi passi per tutti e 5 i notbooks, dei quali qui sotto riporto gli indici.

---

## Indice : 01_Network_Construction

1. Caricare le librerie  
2. Lettura e filtraggio di Nodi ed Edges  
3. Oggetto igraph  
4. Matrice di Adiacenza e statistiche  
5. Visualizzazione Cora Citation Network  

Bonus : Panoramica della rete in base alla Degree Centrality  
6. Studio in-degree per ogni paper  
7. Studio out-degree per ogni paper  
8. Tabella numero di paper totale per ogni categoria  
9. Tabella di quanti paper citano tot paper  
10. Tabella citazioni totali intra-disciplinari per categoria  
11. Salvataggio oggetti per analisi successive

---

## Indice : 02_Centrality_Analysis

1. Caricare le librerie e dati da usare  
2. Calcolo delle metriche di centralità  
   - 2.1 : Degree centrality  
     - In-degree  
     - Out-degree  
   - 2.2 : Closness Centrality  
   - 2.3 : Betweenness Centrality  
   - 2.4 : Eigenvector Centrality  
   - 2.5 : Page Rank Centrality  
   - 2.6 : HITS  
   - 2.7 : Katz Centrality  
3. Paragoni tra le centralità  
4. Power  
5. Paragone tra Power and Katz Centrality  
6. Uso delle 2 matrici proiezioni A %*% t(A) e t(A) %*% A (prodotto matriciale)  
   - Trova le 30 coppie (i, j) con più paper citati in comune (common successors)  
   - Trova le 30 coppie con più paper citanti in comune (common predecessors)  
7. Salvataggio Metriche computate

---

## Indice : 03_Similarity_Heterogeneity

1. Caricare le librerie e dati da usare  
2. Analisi di Similarità  
   - 2.1 : Cosine Similarity  
     - Opzione 1 : Basata su successori comuni (paper citati in comune)  
       - Tabella : top coppie di paper per similarità  
       - Grafico : della Distribuzione Out Cosine Similarity  
     - Opzione 2 : Basata su predecessori comuni (paper che citano entrambi)  
       - Tabella : top coppie di paper per similarità  
       - Grafico : Distribuzione In Cosine Similarity  
       - Grafo : Network delle top 500 coppie per cosine similarity (predecessori comuni)  
   - 2.2 : Pearson Similarity  
     - Opzione 1 : successori comuni (paper citati in comune)  
     - Opzione 2 : predecessori comuni (paper che citano entrambi)  
     - Distribuzione della Pearson similarity, Opz. 1 e Opz. 2  
   - 2.3: Global Similarity  
     - Normalizzazione matrice adiacenza per grado uscente, raggio spettrale ed alpha  
     - Tabella : Top 50 coppie per global similarity  
     - Grafo : network delle 200 coppie di nodi con più alto valore di Global similarity.  
   - 2.4: Metriche a confronto  
     - Katz centrality e similarità  
       - Dimostrazione la relazione tra Katz e la somma delle similarità globali  
       - Grafico : Katz Centrality = Somma delle Similarità Globali  
3. Analisi di Eterogeneità  
   - 3.1: Shannon Entropy  
     - Tabella : Top 10 nodi più eterogenei  
   - 3.2: Simpson Diversity  
     - Tabella : Top 10 nodi più eterogenei (Simpson)  
   - 3.3: Rao Quadratic Entropy  
     - Tabella : Top paper interdisciplinari  
     - Tabella : Top paper specializzati (Rao basso, ma con citazioni)  
     - Tabella : TOP paper poco Interdisciplinari (Rao > 0, ma basso)  
     - Tabella : Distribuzione per livello di interdisciplinarità  
4. Analisi a livello di categoria  
   - 4.1 Quali sono le discipline più autocitanti ?  
   - 4.2 Grafico : heatmap della matrice X-test tra categorie  
   - 4.3 Tabella : le top 5 categorie per interdisciplinarietà (Rao)  
5. Confronto tra Similarità e Centralità  
   - Domande di ricerca :  
     - A. I paper con alta centralità (es. PageRank, betweenness) tendono ad essere interdisciplinari ?  
     - B. I paper interdisciplinari sono più influenti nella rete ?  
     - C. Quali categorie producono i paper più interdisciplinari ? E quali beneficiano di più dai ponti interdisciplinari?

---

## Indice : 04_Group_Analysis

1. Carico librerie e grafo  
2. Filtro sui nodi  
3. Community detection e Clustring  
4. Modularità  
5. Ottimizzazzione della modularity (Algoritmi di Community Detection) :  
   - 5.1 Louvain     
     - Grafo : Network con raggruppamento ottenuto  
     - Grafo : Network con raggruppamento Ground Truth (Categorie CoraNetwork)  
   - 5.2 Label Propagation  
   - 5.3 Infomap community finding  
   - 5.4 Clustering Gerarchico                           
     - Grafo : Struttura principale Dendrogramma  
6. Domande di ricerca:  
   - A. Le communities coincidono con le categorie scientifiche?  
   - B. Quali categorie sono più pure ? (una sola community o meno possibili)  
7. Salvatoaggio Risultati ottenuti

---

## Indice : 05_Global_Analysis

1. Connected components and Strongly Connected components  
2. Small-world effect  
3. Power Laws  
4. Assortativity  
   - Domanda A : identifica se l’elite delle pubblicazioni crea un “club” chiuso  
5. Transitivity e Transitivity coefficient  
6. Reciprocity
