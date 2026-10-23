# Pacote
library(jogospc)

# Argumentos para funcao prevCBA()

# Argumentos da funcao
meanCBPfm = 1.38
meanCBPsm = 1.04
meanCBPfv = 1.04
meanCBPsv = 1.38
nsim = 100
CopaBR = "COR"
Lib = "CAP"
rodada = 10
data = bd

# Argumentos para a funcao sim()
class <- jogospc:::classific(data, rodada = rodada)

# Objeto que armazenarar os contadores de resultado
res <- cbind(class[2],  Camp = 0, Liber = 0, Sul = 0, Reb = 0)

# Objeto auxiliar que armazenarar as probabilidades por rodada
prevprobaux <- cbind(data[,1:3], PVM = 0, EMP = 0, PVV = 0)

# numero de partidas por rodada
n_partidas <- length(data$Rodada[data$Rodada == 1])
n_rodadas <- max(data$Rodada)



# Executando a funcao sim()
jogospc:::sim(data, rodada, n_partidas, n_rodadas, res,
                meanCBPfm = 1.38, meanCBPsm = 1.04,
                meanCBPfv = 1.04, meanCBPsv = 1.38, nsim, CopaBR, Lib)

# Executando a funcao prevCBA()
res <- prevCBA(data, rodada, meanCBPfm, meanCBPsm,
        meanCBPfv, meanCBPsv, nsim, CopaBR,
        Lib)

# CBF - Serie A 2026
# Argumentos da funcao
meanCBPfm = 1.38
meanCBPsm = 1.04
meanCBPfv = 1.04
meanCBPsv = 1.38
nsim = 10
CopaBR = "VAS"
Lib = "PAL"
rodada = 32
data = cbfsa2026

res <- prevCBA(data, rodada, meanCBPfm, meanCBPsm,
        meanCBPfv, meanCBPsv, nsim, CopaBR,
        Lib)
View(res$`Tabela de media de gols nas partidas`)

res$`Tabela de media de gols nas partidas` |>
  dplyr::filter(Rodada == 31)

res$`Tabela de probabilidades da rodada`

