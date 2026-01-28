# Testin-Terra-package

## Descrizione
Repository per l'analisi di immagini Sentinel‑2 e dati fisiologici (Bromelie / Orchidee) usando il pacchetto `terra` in R. Contiene una pipeline R Markdown che esegue: lettura e ritaglio del raster, scaling automatico delle bande, calcolo di indici vegetazionali (NDVI, EVI, SAVI, MSAVI, GCI, LAI), controlli di qualità (in particolare EVI), classificazione operativa per soglie EVI e produzione di mappe e statistiche.


Requisiti
- R / RStudio.
- Pacchetti R: terra, viridis, readr, dplyr, ggplot2, knitr, rmarkdown
