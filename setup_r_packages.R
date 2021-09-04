# structure inspired from 
# https://lcolladotor.github.io/bioc_team_ds/config-files.html#.YTPTny1Q1OQ

# remotes 
install.packages("remotes")

# BiocManager
remotes::install_cran("BiocManager")

# devtools/usethis
remotes::install_cran(c(
  "devtools",
  "usethis"
))

# bioconductor packages
BiocManager::install(c(
  "BiocCheck",
  "biocthis",
  "GenomicFeatures",
  "GenomicState",
  "megadepth",
  "recount",
  "recount3",
), dependencies = TRUE, update = FALSE)

# cran packages
remotes::install_cran(c(
  "ggbeeswarm",
  "ggpubr",
  "bookdown",
  "reprex",
  "tidyverse",
  "xaringan",
  "xaringanthemer"
), dependencies = TRUE)

## GitHub packages
remotes::install_github(c(
  "dzhang32/dasper",
  "dzhang32/Rmdplate",
  "dzhang32/rutils"
), dependencies = TRUE)
