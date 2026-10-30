#' @export
prevCBA <- function(data, rodada, meanCBPfm, meanCBPsm,
                    meanCBPfv, meanCBPsv, nsim, CopaBR = NULL,
                    Lib = NULL, progresso = TRUE) {

  # 1. Calcula a classificacao inicial (antes das simulacoes)
  class <- classific(data, rodada = rodada)

  # 2. Prepara os objetos que serao alimentados pelas simulacoes
  res <- cbind(class[2], Camp = 0, Liber = 0, Sul = 0, Reb = 0)

  # Numero de partidas por rodada e numero de rodadas
  n_partidas <- length(data$Rodada[data$Rodada == 1])
  n_rodadas  <- max(data$Rodada)

  # Objeto auxiliar para as probabilidades da rodada
  prevprobaux <- cbind(data[, 1:3], PVM = 0, EMP = 0, PVV = 0)
  prevprob    <- subset(prevprobaux, Rodada == rodada)

  # 3. Chama o loop de simulacoes em C++
  # O C++ fara o loop e chamara a sua funcao sim() a cada iteracao.
  if (progresso) {
    cat("\nSimulando os dados...\n\n")
    cat(paste0("\nTotal de simulacoes: ", nsim, "\n\n", sep = ""))
  }

  sims <- loop_simulacao_cpp(
    nsim = nsim,
    data = data,
    rodada = rodada,
    n_partidas = n_partidas,
    n_rodadas = n_rodadas,
    res = res,
    meanCBPfm = meanCBPfm,
    meanCBPsm = meanCBPsm,
    meanCBPfv = meanCBPfv,
    meanCBPsv = meanCBPsv,
    Lib = Lib,
    CopaBR = CopaBR,
    sim = sim,        # Passa a funcao sim() do R para o C++
    progresso = progresso
  )

  if (progresso) cat("\nSimulacao concluida!\n\n")

  # 4. Processamento pos-simulacao (igual ao seu codigo original)

  # Soma todos os resultados independentes
  cat("\nProcessando os dados...\n\n")
  #rodada em paralelo, roda independente
  if (progresso) {
    pb <- utils::txtProgressBar(min = 0, max = nsim, style = 3)
    on.exit(close(pb), add = TRUE)
  }

  for (n in 1:nsim) {
    x <- sims[[n]]
    res[, 2:5] <- res[, 2:5] + x$res[, 2:5]
    prevprob[, 4:6] <- prevprob[, 4:6] + x$prevprob[, 4:6]

    if (progresso) {
      utils::setTxtProgressBar(pb, n)
    }
  }

  # Mensagem de finalizacao de simulacao
  if (progresso) {
    cat("\n\nProcessamento concluido!\n")
  }

  # Media de gols
  jogos_list <- lapply(sims, `[[`, "jogos")

  media_gols <- jogos_list[[1]]   # copia estrutura + colunas nao numericas
  media_gols[c("res1", "res2")] <- Reduce(
    `+`,
    lapply(jogos_list, `[`, c("res1", "res2"))
  ) / length(jogos_list)

  # Apresentando resultados a partir da Rodada >= rodada
  media_gols <- media_gols |>
    dplyr::filter(Rodada >= rodada) |>
    dplyr::mutate(across(where(is.numeric), ~ round(., digits = 2)))
  names(media_gols)[c(3, 5)] <- c(" ", " ")

  rownames(res) <- 1:20
  tabelas <- list(Tab1 = res, Tab2 = prevprob, Tab3 = media_gols)
  names(tabelas)[1] <- "Tabela de probabilidades para Campeao/Libertadores/Sulamericana/Rebaixamento"
  names(tabelas)[2] <- "Tabela de probabilidades da rodada"
  names(tabelas)[3] <- "Tabela de media de gols nas partidas"

  return(tabelas)
}
