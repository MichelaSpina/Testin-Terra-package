---
title: "Analisi raster — testing terra package"
author: "Michela Spina"
date: "2026-01-27"
output:
  html_document:
    toc: true
    toc_depth: 3
    number_sections: true
---

```{r setup, include=TRUE}
# Eseguire le installazioni una tantum, se necessario:
# install.packages(c("terra","viridis","readr","dplyr","ggplot2","knitr"))

library(terra)
library(viridis)
library(readr)
library(dplyr)
library(ggplot2)
library(knitr)

# Impostazioni utente
setwd(wd)

# File names 
sentinel_file <- "Sentinel-2_20250122.tif"
```

# Obiettivo

Questo documento esegue una pipeline con il pacchetto `terra`: lettura e ritaglio di Sentinel-2, scala automatica delle bande, calcolo di indici vegetazionali (NDVI, EVI, SAVI, MSAVI, GCI, LAI), controllo qualità di EVI e analisi di classi operative (soglie). I risultati sono pensati per analisi esplorative e per essere estesi a modelli ecologici.
# Caricamento raster e controllo

```{r load-raster}
MachinSentinel <- rast(sentinel_file)
print(MachinSentinel)
nlyr(MachinSentinel)
names(MachinSentinel)
```

# Definizione extent e crop

```{r crop}
# extent di interesse 
extent_cropped <- ext(c(xmin = 455000, xmax = 460000, ymin = 493000, ymax = 499000))
Machin_crop <- crop(MachinSentinel, extent_cropped)
print(Machin_crop)
```

# Estrazione e scaling automatico delle bande

```{r bands-scaling}
# Mappa delle bande 
band_map_sentinel <- list(blue = 2, green = 3, red = 4, nir = 8)

# Estrazione singole bande
red_crop   <- Machin_crop[[band_map_sentinel$red]]
green_crop <- Machin_crop[[band_map_sentinel$green]]
blue_crop  <- Machin_crop[[band_map_sentinel$blue]]
nir_crop   <- Machin_crop[[band_map_sentinel$nir]]

# Funzione per scalare se i valori > 1.5 
scale_band_if_needed <- function(r) {
  m <- global(r, "max", na.rm = TRUE)[1]
  if (!is.na(m) && m > 1.5) {
    message("Normalizzo banda (divido per 10000). Max = ", round(m,1))
    return(r / 10000)
  } else {
    message("Banda già in scala 0..1. Max = ", round(m,3))
    return(r)
  }
}

red_crop   <- scale_band_if_needed(red_crop)
green_crop <- scale_band_if_needed(green_crop)
blue_crop  <- scale_band_if_needed(blue_crop)
nir_crop   <- scale_band_if_needed(nir_crop)

# True color per controllo
rgb_stack_crop <- c(red_crop, green_crop, blue_crop)
plotRGB(rgb_stack_crop, r = 1, g = 2, b = 3, main = "RGB Sentinel-2 Cropped", stretch = "lin")
```

# Calcolo indici vegetazionali

```{r indices}
ndvi  <- (nir_crop - red_crop) / (nir_crop + red_crop); names(ndvi) <- "NDVI"
L     <- 0.5
savi  <- ((nir_crop - red_crop) / (nir_crop + red_crop + L)) * (1 + L); names(savi) <- "SAVI"
msavi <- (2 * nir_crop + 1 - sqrt((2 * nir_crop + 1)^2 - 8 * (nir_crop - red_crop))) / 2; names(msavi) <- "MSAVI"
gci   <- (nir_crop / green_crop) - 1; names(gci) <- "GCI"

# EVI: controllo il denominatore e sostituisco valori troppo piccoli con NA
denom <- nir_crop + 6 * red_crop - 7.5 * blue_crop + 1
bad_denom_count <- sum(abs(values(denom)) < 1e-6, na.rm = TRUE)
message("Pixel con denominatore EVI vicino a 0: ", bad_denom_count)
denom_masked <- denom
values(denom_masked)[abs(values(denom_masked)) < 1e-6] <- NA
evi <- 2.5 * ((nir_crop - red_crop) / denom_masked); names(evi) <- "EVI"

# LAI empirico
lai <- 3.618 * ndvi - 0.118; names(lai) <- "LAI"

indices_stack <- c(ndvi, savi, msavi, gci, evi, lai)
plot(indices_stack)
```

# Controlli statistici e pulizia EVI

```{r evi-stats}
# versione pulita per le statistiche (escludo outlier logici fuori [-1,1])
evi_clean <- evi
values(evi_clean)[!is.na(values(evi_clean)) & (values(evi_clean) < -1 | values(evi_clean) > 1)] <- NA

evi_vals <- values(evi_clean)
evi_vals <- evi_vals[!is.na(evi_vals)]

evi_mean <- mean(evi_vals)
evi_sd   <- sd(evi_vals)
evi_cv   <- ifelse(evi_mean == 0, NA, evi_sd / evi_mean)

h <- hist(evi_vals, breaks = 50, plot = FALSE)
p <- h$counts / sum(h$counts)
shannon_evi <- -sum(p[p > 0] * log(p[p > 0]))

cat("Shannon EVI:", round(shannon_evi,6), "\nEVI mean:", round(evi_mean,4),
    "EVI sd:", round(evi_sd,4), "EVI CV:", round(evi_cv,4), "\n")
```

- "L'EVI corretto mostra media ≈ `r round(evi_mean,3)` con CV ≈ `r round(evi_cv,3)`. Valori coerenti con copertura vegetale moderata‑alta nell'area studiata. Eventuali valori >1 sono stati esclusi dalle statistiche come outlier."

# Classificazione per soglie operative e analisi di area

```{r classes-and-area}
# soglie operative: low < 0.5 ; high > 0.7
low_highlight  <- ifel(evi > -Inf & evi < 0.5, 1, NA)
high_highlight <- ifel(evi > 0.7, 1, NA)

# plot su RGB (sovrapposizione)
plotRGB(rgb_stack_crop, r = 1, g = 2, b = 3, stretch = "lin", main = "Estremi EVI su RGB")
plot(low_highlight,  col = adjustcolor("red",  alpha.f = 0.5), add = TRUE, legend = FALSE)
plot(high_highlight, col = adjustcolor("blue", alpha.f = 0.5), add = TRUE, legend = FALSE)

# conversione a punti
pts_low  <- as.points(low_highlight,  na.rm = TRUE)
pts_high <- as.points(high_highlight, na.rm = TRUE)
n_low  <- if (!is.null(pts_low))  nrow(as.data.frame(pts_low))  else 0
n_high <- if (!is.null(pts_high)) nrow(as.data.frame(pts_high)) else 0

# area per pixel
res_vals <- res(evi)
pixel_area_m2 <- prod(res_vals)
area_low_km2  <- n_low  * pixel_area_m2 / 1e6
area_high_km2 <- n_high * pixel_area_m2 / 1e6

# percentuali 
total_pixels <- sum(!is.na(values(evi)))
pct_low  <- 100 * n_low  / total_pixels
pct_high <- 100 * n_high / total_pixels

cat(sprintf("Pixel low: %d  -- area (km^2): %.4f\n", n_low, area_low_km2))
cat(sprintf("Pixel high: %d -- area (km^2): %.4f\n", n_high, area_high_km2))
cat(sprintf("Percentuale area EVI < 0.5: %.2f %%\n", pct_low))
cat(sprintf("Percentuale area EVI > 0.7: %.2f %%\n", pct_high))
```

- *Le soglie 0.5 e 0.7 sono operative e vanno giustificate o verificate tramite analisi di sensibilità.*
- *Le percentuali sono calcolate sui pixel validi dopo la pulizia degli outlier EVI.*


# sessionInfo

```{r sessioninfo}
print(sessionInfo())
```
