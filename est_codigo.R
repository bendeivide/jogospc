# Pacote
library(jogospc)

# CBF - Serie A 2026
# Argumentos da funcao
meanCBPfm = 1.38
meanCBPsm = 1.04
meanCBPfv = 1.04
meanCBPsv = 1.38
nsim = 10000
CopaBR = "VAS"
Lib = "PAL"
rodada = 34
data = cbfsa2026$resultados

res <- prevCBA(data, rodada, meanCBPfm, meanCBPsm,
                           meanCBPfv, meanCBPsv, nsim, CopaBR,
                           Lib, progresso = TRUE)















