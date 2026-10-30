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
rodada = 32
data = cbfsa2026

res <- prevCBA(data, rodada, meanCBPfm, meanCBPsm,
                           meanCBPfv, meanCBPsv, nsim, CopaBR,
                           Lib, progresso = TRUE)


library(crayon)
library(dplyr)


# Pega a tabela
classificacao(cbfsa2026, 32)








saida <- print_color(
  df,
  n = c(1:4, 5, 6:11, 17:20),
  color = c(rep("cyan", 4), "yellow", rep("green", 6), rep("red", 4)),
  legend = c(
    cyan = "Fase de grupos da CONMEBOL Libertadores",
    yellow = "Qualificatórias da CONMEBOL Libertadores",
    green = "Fase de grupos da CONMEBOL Sudamericana",
    red = "Rebaixamento"
  )
)

colorir_tabela <- function(df) {

  # 1. Cria uma copia do data.frame para nao alterar o original
  df_colorido <- df

  # 2. Define a cor de cada linha baseada na posicao (1 a 20)
  n_linhas <- nrow(df)

  for (i in 1:n_linhas) {

    # Define a funcao de cor com base na posicao
    # (ajuste os intervalos conforme a sua regra de negocio)
    if (i <= 4) {
      f_cor <- crayon::green
    } else if (i <= 6) {
      f_cor <- crayon::blue
    } else if (i <= 12) {
      f_cor <- crayon::yellow
    } else if (i >= 17) {
      f_cor <- crayon::red
    } else {
      f_cor <- crayon::white
    }

    # Aplica a cor a todas as colunas da linha i
    for (j in 1:ncol(df)) {
      df_colorido[i, j] <- as.character(f_cor(as.character(df[i, j])))
    }
  }

  return(df_colorido)
}





