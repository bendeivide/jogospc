#' #####################################
#' # Trabalho de Luiz Fernando - PROFMAT
#' #####################################
#' # DESCRICAO:
#' # Previsao dos jogos do campeonato brasileiro de futebol- Serie A
#'

# roda uma simulacao
# sim <- function(data, rodada, n_partidas, n_rodadas, res,
#                 meanCBPfm = 1.38, meanCBPsm = 1.04,
#                 meanCBPfv = 1.04, meanCBPsv = 1.38, nsim,
#                 CopaBR = NULL, Lib = NULL) {
#
#   # Argumentos:
#   ## - data: data.frame (ou tibble) com a seguinte estrutura
#   ##
#   #     Rodada Time1 Time2   GFM   GSM   GSV   GFV
#   #      <int> <chr> <chr> <int> <int> <int> <int>
#   #       1    BOT   PAL       1     1     1     1
#   #       1    SAO   PAR       1     0     1     0
#   #     ...    ...   ...     ...   ...   ...   ...
#   ##
#   ## - rodada: numero da rodada desejada para a previsao
#   ## - n_partidas: numero de partidas computadas em uma rodada
#   ## - n_rodadas: numero de rodadas no campeonato
#   ## - res: data.frame (ou tibble) que armazena a classificacao
#   ##        dos times quanto ao brasileiro, libertadores,
#   ##        sulamericana e rebaixamento. (Acho que esse argumento
#   ##        deve ser melhorado, porque o jogo de pontos corridos
#   ##        pode nao ser necessariamente Bras-A. Se for Bras-B,
#   ##        por exemplo, como ficaria este df ou tbl). A estrutura
#   ##        de dado segue:
#   ##
#   ##        Time Camp Liber  Sul Reb
#   ##         INT    0     0    0   0
#   ##         SAO    0     0    0   0
#   ##         ...  ...   ...  ... ...
#   ##
#   ## - meanCBPfm: media de gols feitos como mandante no campeonato
#   ##              anterior
#   ## - meanCBPsm: media de gols sofridos como mandante no campeonato
#   ##              anterior
#   ## - meanCBPfv: media de gols feitos como visitante no campeonato
#   ##              anterior
#   ## - meanCBPsv: media de gols sofridos como visitante no campeonato
#   ##              anterior
#   ## - nsim: Numero de simulacoes desejadas (Quanto mais, melhor; porem
#   ##         mais demorada fica a simulacao) - Entretanto, este argumento
#   ##         nao se comporta como o processo que desencadeia as nsim
#   ##         simulacoes. Preciso entender melhor a sua finalidade.
#   ## - CopaBR: Sigla do clube que deseja saber se sera campeao, ira para liberta-
#   ##           dores, sulamericana, ou sera rebaixado; pode
#   ##           receber o objeto NULL
#   ## - Lib: Sigla do clube (Nao entendi a finalidade desse argumento); pode
#   ##           receber o objeto NULL
#
#   # Objeto que armazena inicialmente os resultados
#   # das partidas ate a "rodada - 1"; prevdados sera
#   # alimentado no for() que segue...
#   # utils.R/criar_prevdados()
#   prevdados <- criar_prevdados(data, rodada, n_partidas)
#
#   # Objeto que armazena a previsao da media dos gols
#   # possiveis em todas as partidas do campeonato
#   prevjogos <- data.frame(prevdados[,1:2], res1 = rep(0, length(prevdados$Rodada)), x = "x",
#                           res2 = rep(0, length(prevdados$Rodada)), Time2 = prevdados[,3])
#
#
#
#   # Atualizando o class com o banco de dados informado
#   # O objeto "class" so eh definido na funcao prevCBA()
#   prevclass <- class
#
#   #for que varre as rodada
#   for (i in rodada:n_rodadas) {
#
#     ##########################################
#     # Atualizacao dos lambdas da media de gols
#     ##########################################
#
#     ## media de gols feitos do time mandante
#     lauxfm <- meanCBPfm_atual(prevdados, i, meanCBPfm)
#     ## media de gols sofridos do time visitante
#     lauxsv <- meanCBPsv_atual(prevdados, i, meanCBPsv)
#     ## media de gols feitos do time visitante
#     lauxfv <- meanCBPfv_atual(prevdados, i, meanCBPfv)
#     ## media de gols sofridos do tipo mandante
#     lauxsm <- meanCBPsm_atual(prevdados, i, meanCBPsm)
#
#     # Contador de partidas por rodada
#     j <- n_partidas*(i - 1) + 1
#
#     for(r in j:(j + n_partidas - 1)) {
#
#       # Buscando time1 e time2 de acordo com coluna da rodada
#       time1 <- as.character(prevdados$Time1[r])
#       time2 <- as.character(prevdados$Time2[r])
#
#       if (i == 1) {
#         # lambdam <- meanCBPfm + meanCBPsv # parametro da wpoisson do time mandante
#         # lambdav <- meanCBPsm + meanCBPfv # parametro da wpoisson do time visitante
#         lfm <- meanCBPfm
#         lsv <- meanCBPsv
#         lfv <- meanCBPfv
#         lsm <- meanCBPsm
#       } else {
#         lfm <- lauxfm[rownames(lauxfm) == time1]
#         lsv <- lauxsv[rownames(lauxsv) == time2]
#         lfv <- lauxfv[rownames(lauxfv) == time2]
#         lsm <- lauxsm[rownames(lauxsm) == time1]
#
#         # lambdam <- lfm + lsv # parametro da wpoisson do time mandante
#         # lambdav <- lsm + lfv # parametro da wpoisson do time visitante
#       }
#
#       # Escala para mandante
#       escm <- pwpois(c(0, 1, 2, 3, 4, 5), lambda1 = lfm, lambda2 = lsv)
#
#       # Escala para visitante
#       escv <- pwpois(c(0, 1, 2, 3, 4, 5), lambda1 = lsm, lambda2 = lfv)
#
#       # Uma simulacao para o mandante
#       simm <- cbind(runif(1, 0, 1))
#
#       # Armazenando os resultados dos gols como mandante
#       resm <- apply(simm, 1, simaux, escala = escm)
#
#       # Simulacao para o visitante
#       simv <- cbind(runif(1, 0, 1))
#
#       # Armazenando os resultados dos gols como visitante
#       resv <- apply(simv, 1, simaux, escala = escv)
#
#       # Contabilizando os gols na tabela de prevdados
#
#       prevdados$GFM[r] <- round(mean(resm), 0)
#       prevdados$GSM[r] <- round(mean(resv), 0)
#       prevdados$GFV[r] <- round(mean(resv), 0)
#       prevdados$GSV[r] <- round(mean(resm), 0)
#
#       # Computando o possivel resultado das partidas
#       prevjogos[r, 3] <- resm
#       prevjogos[r, 5] <- resv
#     }
#
#   }
#
#   list(
#     prevprob = atualizar_prevprob(prevdados, rodada, nsim),
#     res = atualizar_res(prevdados, res, nsim, CopaBR, Lib),
#     jogos = prevjogos[-c(1:(rodada * 10 - 10)),]
#   )
# }

#' prevCBA
#'
#' Faz toda a previsao
#'
#' @param data banco de dados
#' @param rodada rodada
#' @param meanCBPfm meanCBPfm
#' @param meanCBPsm meanCBPsm
#' @param meanCBPfv meanCBPfv
#' @param meanCBPsv meanCBPsv
#' @param nsim numero de simulacoes
#'
#' @export
# prevCBA <- function(data, rodada, meanCBPfm, meanCBPsm,
#                     meanCBPfv, meanCBPsv, nsim, CopaBR = NULL, Lib = NULL, progresso = TRUE) {
#
#   # mandante do jogo - time1
#   # visitante do jogo - time2
#   # data - conjunto de dados
#   # rodada - representa o numero de rodadas realizadas
#   # prevrodada - previsao da rodada desejada
#   # lambdam - parametro da poisson do time mandante
#   # lambdav - parametro da poisson do time visitante
#   # meanCBPfm - Media de gols do CB passado feitos como mandante
#   # meanCBPsm - Media de gols do CB passado sofridos como mandante
#   # meanCBPfv - Media de gols do CB passado feitos como visitante
#   # meanCBPsv - Media de gols do CB passado sofridos como visitante
#   # nsim - numero de simulacoes
#   # CopaBR - Escolha do time que deseja saber se ganhara o campeonato brasileiro
#   # Lib - Escolha do time que deseja saber se ira para Libertadores
#
#   class <- classific(data, rodada = rodada)
#
#   # Objeto que armazenarar a classificacao dos times quanto ao
#   # ao campeonaro, libertadores, Sulamericana e Rebaixamento
#   res <- cbind(class[2],  Camp = 0, Liber = 0, Sul = 0, Reb = 0)
#
#   # Objeto auxiliar que armazenarar as probabilidades de
#   # vitoria do mandante, empate e vitoria do visitante,
#   # na rodada indicada pelo argumento "rodada".
#   prevprobaux <- cbind(data[,1:3], PVM = 0, EMP = 0, PVV = 0)
#
#   # numero de partidas por rodada
#   n_partidas <- length(data$Rodada[data$Rodada == 1])
#   n_rodadas <- max(data$Rodada)
#
#   # Objeto final que armazenara as probabilidades por rodada
#   prevprob <- subset(prevprobaux, Rodada == rodada)
#
#   # Lista para armazenar os resultados
#   sims <- vector("list", nsim)
#
#   #rodada em paralelo, roda independente
#   if (progresso) {
#     pb <- utils::txtProgressBar(min = 0, max = nsim, style = 3)
#     on.exit(close(pb), add = TRUE)
#   }
#
#   for (i in seq_len(nsim)) {
#     sims[[i]] <- sim(
#       data, rodada, n_partidas, n_rodadas, res, meanCBPfm, meanCBPsm,
#       meanCBPfv, meanCBPsv, nsim, Lib, CopaBR
#     )
#
#     if (progresso) {
#       utils::setTxtProgressBar(pb, i)
#     }
#   }
#   # Mensagem de finalizacao de simulacao
#   if (progresso) {
#     cat("\n\nSimulacao concluida!\n")
#   }
#
#
#   #esse for soma todos os resultados independentes
#   for (n in 1:nsim) {
#     x <- sims[[n]]
#     res[, 2:5] <- res[,2:5] + x$res[,2:5]
#     prevprob[, 4:6] <- prevprob[, 4:6] + x$prevprob[,4:6]
#   }
#
#   # Media de gols
#   jogos_list <- lapply(sims, `[[`, "jogos")
#
#   media_gols <- jogos_list[[1]]   # copia estrutura + colunas não numéricas
#   # Computando a media de gols que os clubes fizeram
#   # como mandante e visitante
#   media_gols[c("res1", "res2")] <- Reduce(
#     `+`,
#     lapply(jogos_list, `[`, c("res1", "res2"))
#   ) / length(jogos_list)
#
#   # Computando a mediana de gols
#   # mediana_gols[c("res1", "res2")] <- {
#   #   # Empilha as colunas res1/res2 de todas as simulações
#   #   vals <- do.call(rbind, lapply(jogos_list, `[`, c("res1", "res2")))
#   #   # Mediana por coluna (res1 e res2), ignorando NA
#   #   apply(vals, 2, median, na.rm = TRUE)
#   # }
#   ## Apresentando resultados a partir da Rodada > rodada
#   media_gols <- media_gols |>
#     dplyr::filter(Rodada >= rodada) |>
#     dplyr::mutate(across(where(is.numeric), ~ round(., digits = 2)))
#   names(media_gols)[c(3, 5)] <- c(" ", " ")
#   # mediana_gols <- mediana_gols |>
#   #   dplyr::filter(Rodada >= rodada) |>
#   #   dplyr::mutate(across(where(is.numeric), ~ round(., digits = 2)))
#   # names(mediana_gols)[c(3, 5)] <- c(" ", " ")
#
#
#   rownames(res) <- 1:20
#   tabelas <- list(Tab1 = res, Tab2 = prevprob, Tab3 = media_gols)
#   #tabelas <- list(Tab1 = res, Tab2 = prevprob, Tab3 = mediana_gols)
#   names(tabelas)[1] <- "Tabela de probabilidades para Campeao/Libertadores/Sulamericana/Rebaixamento"
#   names(tabelas)[2] <- "Tabela de probabilidades da rodada"
#   names(tabelas)[3] <- "Tabela de media de gols nas partidas"
#   return(tabelas)
#   #return(res)
#
# }
#

# prevCBArodada
# prevCBApartida
# prevCBAcampeonato
