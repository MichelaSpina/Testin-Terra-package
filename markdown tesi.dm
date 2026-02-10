# Results and Discussion

## 1. Descriptive Statistics and Gradient Characterization

### 1.1 Orchids: Stomatal Density Variation

Orchids exhibit a mean stomatal density of **68.52 ± 22.04 stomata/mm²** with a range between 45.20 and 106.40 stomata/mm². This high coefficient of variation (CV = 32%) indicates strong functional trait differentiation among sampling sites, suggesting a pronounced response to environmental gradients.

Site-specific analysis reveals:

- **P1** (2640 m altitude, Soil T = 33.96°C): **97.2 ± 7.65 stomata/mm²** – highest density
- **P2** (2680 m altitude, Soil T = 36.52°C): **48.7 ± 2.56 stomata/mm²** – intermediate density, lowest variation among individuals
- **T1** (2667 m altitude, Soil T = 41.78°C): **59.6 ± 7.38 stomata/mm²** – intermediate density with high inter-individual variation

#### Interpretation

Site P1 (coolest environment) exhibits orchids with significantly higher stomatal density. This pattern contradicts classical expectations (hotter environments = more stomata for thermoregulation), suggesting instead an **adaptation to cool/humid conditions** rather than heat tolerance. Alternatively, site P1 may experience lower fumarolic influence, with a more humid microclimate that reduces water stress and favors higher stomatal density.

### 1.2 Bromeliads: Stomatal and Trichome Density Variation

Bromeliads show a mean stomatal density of **19.71 ± 6.83 stomata/mm²** (range: 12.50–32.55 stomata/mm²) with CV = 34.7%, and mean trichome density of **11.01 ± 3.06 trichomes/mm²** (range: 6.80–16.80 trichomes/mm²).

Site-specific data:

- **T2** (2560 m, Soil T = 15.28°C, Air T = 15.24°C): stomata = 14.5 ± 1.41 n/mm², trichomes = 9.8 ± 2.48 n/mm²
- **P1** (2650 m, Soil T = 33.96°C, Air T = 23.4°C): stomata = 25.0 ± 5.93 n/mm², trichomes = 12.2 ± 2.09 n/mm²

#### Interpretation

Site P1 (warmest environment) supports bromeliads with significantly higher stomatal AND trichome densities. This suggests **active adaptation to geothermal stress** through:

1. **Stomatal increase**: enhanced evaporative transpiration for plant body cooling
2. **Trichome increase**: enhanced protection from direct radiation and desiccation

This pattern is **diametrically opposite** to orchids, highlighting fundamentally different ecological strategies between the two families in response to geothermal gradients.

---

## 2. Correlation Analysis

### 2.1 Orchids: Correlation Matrix

|  | mean.stoma | mean.T.soil | T.environment | altitude |
|---|---|---|---|---|
| **mean.stoma** | 1.000 | -0.570 | -0.835 | -0.956 |
| **mean.T.soil** | -0.570 | 1.000 | 0.914 | 0.502 |
| **T.environment** | -0.835 | 0.914 | 1.000 | 0.810 |
| **altitude** | -0.956 | 0.502 | 0.810 | 1.000 |

#### Key Findings

- **Strong negative correlation between stomata and altitude (r = -0.956)**: stomatal density **DECREASES with increasing altitude**
- **Strong negative correlation between stomata and air temperature (r = -0.835)**: stomatal density **DECREASES with increasing air temperature**
- **Moderate negative correlation between stomata and soil temperature (r = -0.570)**: stomatal density **DECREASES with soil temperature**
- **Strong positive correlation between air and soil temperature (r = 0.914)**: the two thermal parameters show high multicollinearity, indicating the gradient is **primarily thermal in nature**

#### Ecological Interpretation

Orchids at lower altitudes (P1: 2640 m, cooler environment) exhibit higher stomatal density, while at higher altitudes (T1: 2667 m) density decreases. This is **counterintuitive** to simple fumarole-distance effects, suggesting instead that:

1. **Distance from fumaroles is NOT the primary driver**; the primary driver is **local microclimate/topography**
2. Orchids may be **stenobiontic for temperature**: preferring cool, humid environments
3. In warmer environments (T1, P2—influenced by fumaroles), orchids exhibit reduced stomatal density, possibly as a **water conservation strategy** (stomatal closure to reduce transpiration under stress)

### 2.2 Bromeliads: Correlation Matrix

|  | mean.stoma | media.tricom | ratio | mean.T.soil | T.environment | altitude |
|---|---|---|---|---|---|---|
| **mean.stoma** | 1.000 | 0.147 | 0.734 | 0.791 | 0.791 | 0.791 |
| **media.tricom** | 0.147 | 1.000 | -0.534 | 0.407 | 0.407 | 0.407 |
| **ratio.stoma.tricoma** | 0.734 | -0.534 | 1.000 | 0.441 | 0.441 | 0.441 |
| **mean.T.soil** | 0.791 | 0.407 | 0.441 | 1.000 | 1.000 | 1.000 |

#### Key Findings

- **Strong positive correlation between stomata and temperature (r = 0.791 with soil T)**: stomatal density **INCREASES with temperature**
- **Weak correlation between stomata and trichomes (r = 0.147)**: the two traits are **nearly independent** (minimal covariance)
- **Moderate negative correlation between ratio and trichomes (r = -0.534)**: plants with abundant trichomes show lower stomatal/trichome ratio, suggesting trichomes increase more rapidly than stomata in response to environmental stress
- **Perfect collinearity between soil temperature, air temperature, and altitude** (r = 1.000): confirming the gradient is one-dimensional and thermically driven

#### Ecological Interpretation

Bromeliads respond **positively to heat** (stomata increase with temperature) in contrast to orchids. Crucially, **stomata and trichomes are independent traits**, suggesting they respond to **distinct environmental signals**:

- **Stomata**: short-term responses to immediate thermal/hydrological stress (photosynthesis/transpiration regulation)
- **Trichomes**: long-term evolutionary responses to chronic UV stress and desiccation risk (protective adaptation)

This independence implies evolved **ecological trade-offs**: a bromeliad may have few trichomes but many stomata (acquisitive strategy—high photosynthetic investment) or many trichomes and few stomata (conservative strategy—protection-focused). This suggests **species-level adaptation** to different thermal regimes.

---

## 3. Simple Linear Regressions

### 3.1 Orchids

#### Model 1: Stomata ~ Soil Temperature
