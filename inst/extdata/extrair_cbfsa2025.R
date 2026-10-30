library(tibble)
library(dplyr)

library(tibble)
library(dplyr)

# ------------------------------------------------------------------
# Dados extraidos do PDF cbfsa2025.pdf
# Siglas utilizadas:
#   CAM = Atletico MG    |  BAH = Bahia          |  BOT = Botafogo RJ     |  COR = Corinthians SP
#   CRU = Cruzeiro MG    |  FLA = Flamengo RJ    |  FLU = Fluminense RJ   |  FOR = Fortaleza CE
#   GRE = Gremio RS      |  INT = Internacional RS |  JUV = Juventude RS  |  MIR = Mirassol SP
#   PAL = Palmeiras SP   |  RBB = Red Bull Bragantino SP | SAN = Santos SP |  SAO = Sao Paulo SP
#   SPO = Sport PE       |  VAS = Vasco da Gama RJ |  VIT = Vitoria BA    |  CEA = Ceara SC
# ------------------------------------------------------------------
jogos_2025 <- tribble(
  ~Rodada, ~Time1, ~Time2, ~Gols_Time1, ~Gols_Time2,

  # ===================== RODADA 1 =====================
  1, "CRU", "MIR", 2, 1,
  1, "GRE", "CAM", 2, 1,
  1, "FOR", "FLU", 2, 0,
  1, "JUV", "VIT", 2, 0,
  1, "SAO", "SPO", 0, 0,
  1, "FLA", "INT", 1, 1,
  1, "PAL", "BOT", 0, 0,
  1, "VAS", "SAN", 2, 1,
  1, "BAH", "COR", 1, 1,
  1, "RBB", "CEA", 2, 2,

  # ===================== RODADA 2 =====================
  2, "COR", "VAS", 3, 0,
  2, "CEA", "GRE", 2, 0,
  2, "BOT", "JUV", 2, 0,
  2, "FLU", "RBB", 2, 1,
  2, "CAM", "SAO", 0, 0,
  2, "MIR", "FOR", 1, 1,
  2, "INT", "CRU", 3, 0,
  2, "VIT", "FLA", 1, 2,
  2, "SPO", "PAL", 1, 2,
  2, "SAN", "BAH", 2, 2,

  # ===================== RODADA 3 =====================
  3, "RBB", "BOT", 1, 0,
  3, "JUV", "CEA", 2, 1,
  3, "PAL", "COR", 2, 0,
  3, "VAS", "SPO", 3, 1,
  3, "BAH", "MIR", 1, 1,
  3, "SAO", "CRU", 1, 1,
  3, "GRE", "FLA", 0, 2,
  3, "FLU", "SAN", 1, 0,
  3, "FOR", "INT", 0, 0,
  3, "CAM", "VIT", 2, 2,

  # ===================== RODADA 4 =====================
  4, "CEA", "VAS", 2, 1,
  4, "BOT", "SAO", 2, 2,
  4, "MIR", "GRE", 4, 1,
  4, "SPO", "RBB", 0, 1,
  4, "COR", "FLU", 0, 2,
  4, "INT", "PAL", 0, 1,
  4, "FLA", "JUV", 6, 0,
  4, "SAN", "CAM", 2, 0,
  4, "VIT", "FOR", 2, 1,
  4, "CRU", "BAH", 3, 0,

  # ===================== RODADA 5 =====================
  5, "COR", "SPO", 2, 1,
  5, "VAS", "FLA", 0, 0,
  5, "GRE", "INT", 1, 1,
  5, "JUV", "MIR", 2, 2,
  5, "SAO", "SAN", 2, 1,
  5, "CAM", "BOT", 1, 0,
  5, "FLU", "VIT", 1, 1,
  5, "FOR", "PAL", 1, 2,
  5, "RBB", "CRU", 1, 0,
  5, "BAH", "CEA", 1, 0,

  # ===================== RODADA 6 =====================
  6, "INT", "JUV", 3, 1,
  6, "MIR", "CAM", 2, 2,
  6, "CEA", "SAO", 1, 1,
  6, "SPO", "FOR", 0, 0,
  6, "BOT", "FLU", 2, 0,
  6, "FLA", "COR", 4, 0,
  6, "PAL", "BAH", 0, 1,
  6, "CRU", "VAS", 1, 0,
  6, "VIT", "GRE", 1, 1,
  6, "SAN", "RBB", 1, 2,

  # ===================== RODADA 7 =====================
  7, "SAO", "FOR", 0, 0,
  7, "FLU", "SPO", 2, 1,
  7, "COR", "INT", 4, 2,
  7, "CEA", "VIT", 1, 0,
  7, "BAH", "BOT", 1, 0,
  7, "VAS", "PAL", 0, 1,
  7, "GRE", "SAN", 1, 0,
  7, "CRU", "FLA", 2, 1,
  7, "RBB", "MIR", 1, 0,
  7, "JUV", "CAM", 0, 1,

  # ===================== RODADA 8 =====================
  8, "FOR", "JUV", 5, 0,
  8, "MIR", "COR", 2, 1,
  8, "GRE", "RBB", 1, 1,
  8, "VIT", "VAS", 2, 1,
  8, "FLA", "BAH", 1, 0,
  8, "SPO", "CRU", 0, 4,
  8, "PAL", "SAO", 1, 0,
  8, "CAM", "FLU", 3, 2,
  8, "BOT", "INT", 4, 0,
  8, "SAN", "CEA", 0, 0,

  # ===================== RODADA 9 =====================
  9, "CEA", "SPO", 2, 0,
  9, "VAS", "FOR", 3, 0,
  9, "SAO", "GRE", 2, 1,
  9, "COR", "SAN", 1, 0,
  9, "BAH", "VIT", 2, 1,
  9, "JUV", "FLU", 1, 1,
  9, "FLA", "BOT", 0, 0,
  9, "RBB", "PAL", 1, 2,
  9, "CRU", "CAM", 0, 0,
  9, "INT", "MIR", 1, 1,

  # ===================== RODADA 10 =====================
  10, "FLU", "VAS", 2, 1,
  10, "SAO", "MIR", 0, 2,
  10, "CAM", "COR", 0, 0,
  10, "GRE", "BAH", 1, 0,
  10, "PAL", "FLA", 0, 2,
  10, "SPO", "INT", 1, 1,
  10, "VIT", "SAN", 0, 1,
  10, "FOR", "CRU", 0, 2,
  10, "RBB", "JUV", 1, 0,
  10, "BOT", "CEA", 3, 2,

  # ===================== RODADA 11 =====================
  11, "BAH", "SAO", 2, 1,
  11, "VAS", "RBB", 0, 2,
  11, "MIR", "SPO", 1, 0,
  11, "SAN", "BOT", 0, 1,
  11, "JUV", "GRE", 0, 2,
  11, "FLA", "FOR", 5, 0,
  11, "COR", "VIT", 0, 0,
  11, "CEA", "CAM", 0, 1,
  11, "CRU", "PAL", 2, 1,
  11, "INT", "FLU", 0, 2,

  # ===================== RODADA 12 =====================
  12, "RBB", "BAH", 0, 3,
  12, "VIT", "CRU", 0, 0,
  12, "FOR", "SAN", 2, 3,
  12, "GRE", "COR", 1, 1,
  12, "SAO", "VAS", 1, 3,
  12, "CAM", "INT", 2, 0,
  12, "BOT", "MIR", 3, 3,
  12, "PAL", "JUV", 4, 1,
  12, "FLU", "CEA", 1, 0,
  12, "SPO", "FLA", 1, 5,

  # ===================== RODADA 13 =====================
  13, "FLA", "SAO", 2, 0,
  13, "INT", "VIT", 1, 0,
  13, "VAS", "BOT", 0, 2,
  13, "BAH", "CAM", 2, 1,
  13, "COR", "RBB", 1, 2,
  13, "CRU", "GRE", 4, 1,
  13, "FOR", "CEA", 0, 1,
  13, "JUV", "SPO", 2, 0,
  13, "MIR", "FLU", 2, 1,
  13, "SAN", "PAL", 1, 0,

  # ===================== RODADA 14 =====================
  14, "PAL", "MIR", 1, 1,
  14, "CEA", "COR", 0, 1,
  14, "SAN", "FLA", 1, 0,
  14, "BOT", "VIT", 0, 0,
  14, "RBB", "SAO", 2, 2,
  14, "FLU", "CRU", 0, 2,
  14, "GRE", "FOR", 2, 1,
  14, "JUV", "VAS", 2, 0,
  14, "CAM", "SPO", 3, 1,
  14, "BAH", "INT", 1, 0,

  # ===================== RODADA 15 =====================
  15, "FOR", "BAH", 1, 1,
  15, "VAS", "GRE", 1, 1,
  15, "MIR", "SAN", 3, 0,
  15, "SAO", "COR", 2, 0,
  15, "INT", "CEA", 1, 0,
  15, "CRU", "JUV", 4, 0,
  15, "VIT", "RBB", 1, 0,
  15, "PAL", "CAM", 3, 2,
  15, "SPO", "BOT", 0, 1,
  15, "FLA", "FLU", 1, 0,

  # ===================== RODADA 16 =====================
  16, "FLU", "PAL", 1, 2,
  16, "CEA", "MIR", 0, 2,
  16, "COR", "CRU", 0, 0,
  16, "SAN", "INT", 1, 2,
  16, "RBB", "FLA", 1, 2,
  16, "VIT", "SPO", 2, 2,
  16, "JUV", "SAO", 0, 1,
  16, "VAS", "BAH", 3, 1,
  16, "GRE", "BOT", 1, 1,
  16, "CAM", "FOR", 3, 3,

  # ===================== RODADA 17 =====================
  17, "BOT", "COR", 1, 1,
  17, "MIR", "VIT", 1, 1,
  17, "FOR", "RBB", 3, 1,
  17, "SPO", "SAN", 2, 2,
  17, "PAL", "GRE", 1, 0,
  17, "SAO", "FLU", 3, 1,
  17, "CRU", "CEA", 1, 2,
  17, "INT", "VAS", 1, 1,
  17, "BAH", "JUV", 3, 0,
  17, "FLA", "CAM", 1, 0,

  # ===================== RODADA 18 =====================
  18, "SPO", "BAH", 0, 0,
  18, "MIR", "VAS", 3, 2,
  18, "FLU", "GRE", 1, 0,
  18, "BOT", "CRU", 0, 2,
  18, "COR", "FOR", 1, 1,
  18, "CAM", "RBB", 2, 1,
  18, "CEA", "FLA", 1, 1,
  18, "VIT", "PAL", 2, 2,
  18, "INT", "SAO", 1, 2,
  18, "SAN", "JUV", 3, 1,

  # ===================== RODADA 19 =====================
  19, "FLA", "MIR", 2, 1,
  19, "SAO", "VIT", 2, 0,
  19, "RBB", "INT", 1, 3,
  19, "FOR", "BOT", 0, 5,
  19, "BAH", "FLU", 3, 3,
  19, "VAS", "CAM", 1, 1,
  19, "PAL", "CEA", 2, 1,
  19, "CRU", "SAN", 1, 2,
  19, "GRE", "SPO", 0, 1,
  19, "JUV", "COR", 2, 1,

  # ===================== RODADA 20 =====================
  20, "FLU", "FOR", 2, 1,
  20, "CEA", "RBB", 1, 0,
  20, "VIT", "JUV", 2, 2,
  20, "SPO", "SAO", 2, 2,
  20, "COR", "BAH", 1, 2,
  20, "SAN", "VAS", 0, 6,
  20, "CAM", "GRE", 1, 3,
  20, "INT", "FLA", 1, 3,
  20, "BOT", "PAL", 0, 1,
  20, "MIR", "CRU", 1, 1,

  # ===================== RODADA 21 =====================
  21, "RBB", "FLU", 4, 2,
  21, "CRU", "INT", 2, 1,
  21, "GRE", "CEA", 0, 0,
  21, "VAS", "COR", 2, 3,
  21, "BAH", "SAN", 2, 0,
  21, "FOR", "MIR", 0, 1,
  21, "JUV", "BOT", 1, 3,
  21, "SAO", "CAM", 2, 0,
  21, "PAL", "SPO", 3, 0,
  21, "FLA", "VIT", 8, 0,

  # ===================== RODADA 22 =====================
  22, "CEA", "JUV", 0, 1,
  22, "BOT", "RBB", 4, 1,
  22, "CRU", "SAO", 1, 0,
  22, "FLA", "GRE", 1, 1,
  22, "SAN", "FLU", 0, 0,
  22, "COR", "PAL", 1, 1,
  22, "MIR", "BAH", 5, 1,
  22, "VIT", "CAM", 1, 0,
  22, "INT", "FOR", 2, 1,
  22, "SPO", "VAS", 2, 3,

  # ===================== RODADA 23 =====================
  23, "GRE", "MIR", 0, 1,
  23, "FOR", "VIT", 2, 0,
  23, "PAL", "INT", 4, 1,
  23, "FLU", "COR", 0, 1,
  23, "RBB", "SPO", 1, 1,
  23, "CAM", "SAN", 1, 1,
  23, "JUV", "FLA", 0, 2,
  23, "SAO", "BOT", 1, 0,
  23, "VAS", "CEA", 2, 2,
  23, "BAH", "CRU", 1, 2,

  # ===================== RODADA 24 =====================
  24, "VIT", "FLU", 0, 1,
  24, "BOT", "CAM", 1, 0,
  24, "CEA", "BAH", 1, 1,
  24, "PAL", "FOR", 4, 1,
  24, "MIR", "JUV", 2, 0,
  24, "FLA", "VAS", 1, 1,
  24, "INT", "GRE", 2, 3,
  24, "SPO", "COR", 1, 0,
  24, "SAN", "SAO", 1, 0,
  24, "CRU", "RBB", 2, 1,

  # ===================== RODADA 25 =====================
  25, "FOR", "SPO", 1, 0,
  25, "VAS", "CRU", 2, 0,
  25, "JUV", "INT", 1, 1,
  25, "CAM", "MIR", 1, 0,
  25, "GRE", "VIT", 3, 1,
  25, "FLU", "BOT", 2, 0,
  25, "BAH", "PAL", 1, 0,
  25, "RBB", "SAN", 2, 2,
  25, "COR", "FLA", 1, 2,
  25, "SAO", "CEA", 0, 1,

  # ===================== RODADA 26 =====================
  26, "CAM", "JUV", 0, 0,
  26, "PAL", "VAS", 3, 0,
  26, "MIR", "RBB", 1, 1,
  26, "SPO", "FLU", 2, 2,
  26, "INT", "COR", 1, 1,
  26, "BOT", "BAH", 2, 1,
  26, "SAN", "GRE", 1, 1,
  26, "VIT", "CEA", 1, 0,
  26, "FOR", "SAO", 0, 2,
  26, "FLA", "CRU", 0, 0,

  # ===================== RODADA 27 =====================
  27, "FLU", "CAM", 3, 0,
  27, "RBB", "GRE", 1, 0,
  27, "INT", "BOT", 2, 0,
  27, "COR", "MIR", 3, 0,
  27, "VAS", "VIT", 4, 3,
  27, "SAO", "PAL", 2, 3,
  27, "BAH", "FLA", 1, 0,
  27, "JUV", "FOR", 1, 2,
  27, "CRU", "SPO", 1, 1,
  27, "CEA", "SAN", 3, 0,

  # ===================== RODADA 28 =====================
  28, "PAL", "RBB", 5, 1,
  28, "BOT", "FLA", 0, 3,
  28, "MIR", "INT", 3, 1,
  28, "SPO", "CEA", 1, 1,
  28, "SAN", "COR", 3, 1,
  28, "CAM", "CRU", 1, 1,
  28, "FOR", "VAS", 0, 2,
  28, "GRE", "SAO", 2, 0,
  28, "FLU", "JUV", 1, 0,
  28, "VIT", "BAH", 2, 1,

  # ===================== RODADA 29 =====================
  29, "COR", "CAM", 1, 0,
  29, "CRU", "FOR", 1, 0,
  29, "FLA", "PAL", 3, 2,
  29, "MIR", "SAO", 3, 0,
  29, "INT", "SPO", 2, 0,
  29, "CEA", "BOT", 0, 2,
  29, "BAH", "GRE", 4, 0,
  29, "JUV", "RBB", 1, 0,
  29, "VAS", "FLU", 2, 0,
  29, "SAN", "VIT", 0, 1,

  # ===================== RODADA 30 =====================
  30, "CAM", "CEA", 1, 0,
  30, "VIT", "COR", 0, 1,
  30, "FLU", "INT", 1, 0,
  30, "SPO", "MIR", 1, 2,
  30, "FOR", "FLA", 1, 0,
  30, "SAO", "BAH", 2, 0,
  30, "BOT", "SAN", 2, 2,
  30, "GRE", "JUV", 3, 1,
  30, "RBB", "VAS", 0, 3,
  30, "PAL", "CRU", 0, 0,

  # ===================== RODADA 31 =====================
  31, "SAN", "FOR", 1, 1,
  31, "CRU", "VIT", 3, 1,
  31, "MIR", "BOT", 0, 0,
  31, "FLA", "SPO", 3, 0,
  31, "COR", "GRE", 2, 0,
  31, "BAH", "RBB", 2, 1,
  31, "CEA", "FLU", 2, 0,
  31, "INT", "CAM", 0, 0,
  31, "JUV", "PAL", 0, 2,
  31, "VAS", "SAO", 0, 2,

  # ===================== RODADA 32 =====================
  32, "RBB", "COR", 2, 1,
  32, "VIT", "INT", 1, 0,
  32, "SPO", "JUV", 0, 2,
  32, "BOT", "VAS", 3, 0,
  32, "CAM", "BAH", 3, 0,
  32, "GRE", "CRU", 0, 1,
  32, "SAO", "FLA", 2, 2,
  32, "FLU", "MIR", 1, 0,
  32, "CEA", "FOR", 1, 1,
  32, "PAL", "SAN", 2, 0,

  # ===================== RODADA 33 =====================
  33, "SPO", "CAM", 2, 4,
  33, "VAS", "JUV", 1, 3,
  33, "INT", "BAH", 2, 2,
  33, "SAO", "RBB", 0, 1,
  33, "COR", "CEA", 0, 1,
  33, "CRU", "FLU", 0, 0,
  33, "VIT", "BOT", 0, 0,
  33, "FLA", "SAN", 3, 2,
  33, "MIR", "PAL", 2, 1,
  33, "FOR", "GRE", 2, 2,

  # ===================== RODADA 34 =====================
  34, "BOT", "SPO", 3, 2,
  34, "FLU", "FLA", 2, 1,
  34, "SAN", "MIR", 1, 1,
  34, "GRE", "VAS", 2, 0,
  34, "JUV", "CRU", 3, 3,
  34, "BAH", "FOR", 2, 3,
  34, "COR", "SAO", 3, 1,
  34, "CEA", "INT", 1, 2,
  34, "RBB", "VIT", 4, 0,
  34, "CAM", "PAL", 0, 3,

  # ===================== RODADA 35 =====================
  35, "BOT", "GRE", 3, 2,
  35, "FLA", "RBB", 3, 0,
  35, "PAL", "FLU", 0, 0,
  35, "SAO", "JUV", 2, 1,
  35, "BAH", "VAS", 1, 0,
  35, "SPO", "VIT", 1, 3,
  35, "CRU", "COR", 3, 0,
  35, "MIR", "CEA", 3, 0,
  35, "INT", "SAN", 1, 1,
  35, "FOR", "CAM", 1, 0,

  # ===================== RODADA 36 =====================
  36, "CAM", "FLA", 1, 1,
  36, "GRE", "PAL", 3, 2,
  36, "RBB", "FOR", 0, 1,
  36, "FLU", "SAO", 6, 0,
  36, "JUV", "BAH", 1, 1,
  36, "VAS", "INT", 5, 1,
  36, "SAN", "SPO", 3, 0,
  36, "VIT", "MIR", 2, 0,
  36, "CEA", "CRU", 1, 1,
  36, "COR", "BOT", 2, 2,

  # ===================== RODADA 37 =====================
  37, "RBB", "CAM", 2, 0,
  37, "PAL", "VIT", 0, 0,
  37, "VAS", "MIR", 0, 2,
  37, "GRE", "FLU", 1, 2,
  37, "FOR", "COR", 2, 1,
  37, "JUV", "SAN", 0, 3,
  37, "SAO", "INT", 3, 0,
  37, "BAH", "SPO", 2, 0,
  37, "FLA", "CEA", 1, 0,
  37, "CRU", "BOT", 2, 2,

  # ===================== RODADA 38 =====================
  38, "MIR", "FLA", 3, 3,
  38, "FLU", "BAH", 2, 0,
  38, "BOT", "FOR", 4, 2,
  38, "COR", "JUV", 1, 1,
  38, "SAN", "CRU", 3, 0,
  38, "CAM", "VAS", 5, 0,
  38, "INT", "RBB", 3, 1,
  38, "VIT", "SAO", 1, 0,
  38, "CEA", "PAL", 1, 3,
  38, "SPO", "GRE", 0, 4
)

# ------------------------------------------------------------------
# Criar o tibble final com GFM, GSM, GSV, GFV
#   GFM = Gols Feitos pelo Mandante
#   GSM = Gols Sofridos pelo Mandante
#   GSV = Gols Sofridos pelo Visitante
#   GFV = Gols Feitos pelo Visitante
# Garantindo: GFM == GSV  e  GFV == GSM
# ------------------------------------------------------------------
cbfsa2025_brutos <- jogos_2025 %>%
  mutate(
    GFM = as.integer(Gols_Time1),
    GSV = as.integer(Gols_Time1),
    GFV = as.integer(Gols_Time2),
    GSM = as.integer(Gols_Time2)
  ) %>%
  select(Rodada, Time1, Time2, GFM, GSM, GSV, GFV) %>%
  mutate(
    Rodada = as.integer(Rodada),
    Time1  = as.character(Time1),
    Time2  = as.character(Time2)
  )

