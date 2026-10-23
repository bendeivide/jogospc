
#install.packages("devtools")
#library(devtools)
#devtools::install_github("nome-do-repo/nome-do-pacote")


#install.packages("future")
#install.packages("dplyr")
#install.packages("furrr")
#install.packages("parallel")



library(prevCBA)
library(future)
library(dplyr)
library(furrr)
library(parallel)
library(readr)

data(bd)

bd <- read.csv2("bd.csv")
# se for linux
#plan(multicore)

#se for windows
plan(multisession)

  #rodada
  rodada = 38

  system.time({
    tab <- prevCBA(bd, rodada, meanCBPfm = 1.36, meanCBPsm = 0.82,
                   meanCBPfv = 0.9, meanCBPsv = 1.8, nsim = 20, CopaBR = "COR", Lib = "CAP")
  })
  tab


# medias
library(dplyr)

cba05.09.2025 |>
 filter(Time1 == "SAO" & !is.na(GFM)) |>
  summarise(mean(GFM))

prevCBA:::prevCBA_original(dados =cba05.09.2025, rodada = 10, meanCBPfm = 1.36, meanCBPsm = 0.82,
                           meanCBPfv = 0.9, meanCBPsv = 1.8, nsim = 20)
prevCBA(cba05.09.2025, rodada = 10, meanCBPfm = 1.36, meanCBPsm = 0.82,
        meanCBPfv = 0.9, meanCBPsv = 1.8, nsim = 20, CopaBR = "COR", Lib = "CAP")

