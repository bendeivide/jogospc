sim <- function(data, rodada, n_partidas, n_rodadas, res,
                meanCBPfm = 1.38, meanCBPsm = 1.04,
                meanCBPfv = 1.04, meanCBPsv = 1.38, nsim = 1,
                CopaBR = NULL, Lib = NULL) {

  # 1. Prepara os dados (sua funcao original em R)
  prevdados <- criar_prevdados(data, rodada, n_partidas)

  # Extrai os vetores para mandar para o C++ de forma otimizada
  v_rodada <- as.integer(prevdados$Rodada)
  v_time1  <- as.character(prevdados$Time1)
  v_time2  <- as.character(prevdados$Time2)
  v_gfm    <- as.integer(prevdados$GFM)
  v_gsm    <- as.integer(prevdados$GSM)
  v_gfv    <- as.integer(prevdados$GFV)
  v_gsv    <- as.integer(prevdados$GSV)

  # 2. Chama o C++ para simular as partidas
  sim_res <- sim_cpp(
    Rodada = v_rodada,
    Time1 = v_time1,
    Time2 = v_time2,
    GFM = v_gfm,
    GSM = v_gsm,
    GFV = v_gfv,
    GSV = v_gsv,
    rodada_inicio = rodada,
    n_partidas = n_partidas,
    n_rodadas = n_rodadas,
    meanCBPfm = meanCBPfm,
    meanCBPsm = meanCBPsm,
    meanCBPfv = meanCBPfv,
    meanCBPsv = meanCBPsv
  )

  # 3. Atualiza o prevdados com os resultados simulados do C++
  prevdados$GFM <- sim_res$GFM
  prevdados$GSM <- sim_res$GSM
  prevdados$GFV <- sim_res$GFV
  prevdados$GSV <- sim_res$GSV

  # 4. Recria o objeto prevjogos (que no seu codigo R original
  # era preenchido dentro do loop for)
  prevjogos <- data.frame(
    Rodada = prevdados$Rodada,
    Time1 = prevdados$Time1,
    res1 = prevdados$GFM,
    x = "x",
    res2 = prevdados$GFV,
    Time2 = prevdados$Time2
  )

  # 5. Retorna os resultados usando as suas funcoes originais
  list(
    prevprob = atualizar_prevprob(prevdados, rodada, nsim),
    res = atualizar_res(prevdados, res, nsim, CopaBR, Lib),
    jogos = prevjogos[-c(1:(rodada * 10 - 10)),]
  )
}
