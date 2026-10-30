library(tibble)
library(dplyr)

# ------------------------------------------------------------------
# Dados extraidos fielmente do PDF cbfsa2024.pdf
# Siglas utilizadas:
#   ACG = Atletico GO    |  CAM = Atletico MG    |  CAP = Athletico PR
#   BAH = Bahia          |  BOT = Botafogo RJ    |  COR = Corinthians SP
#   CRI = Criciuma SC    |  CRU = Cruzeiro MG    |  CUI = Cuiaba MT
#   FLA = Flamengo RJ    |  FLU = Fluminense RJ  |  FOR = Fortaleza CE
#   GRE = Gremio RS      |  INT = Internacional RS |  JUV = Juventude RS
#   PAL = Palmeiras SP   |  RBB = Red Bull Bragantino SP |  SAO = Sao Paulo SP
#   VAS = Vasco da Gama RJ |  VIT = Vitoria BA
# ------------------------------------------------------------------
jogos_2024 <- tribble(
  ~Rodada, ~Time1, ~Time2, ~Gols_Time1, ~Gols_Time2,

  # ===================== RODADA 1 =====================
  1, "INT", "BAH", 2, 1,
  1, "CRI", "JUV", 1, 1,
  1, "FLU", "RBB", 2, 2,
  1, "SAO", "FOR", 1, 2,
  1, "ACG", "FLA", 1, 2,
  1, "VAS", "GRE", 2, 1,
  1, "COR", "CAM", 0, 0,
  1, "CAP", "CUI", 4, 0,
  1, "CRU", "BOT", 3, 2,
  1, "VIT", "PAL", 0, 1,

  # ===================== RODADA 2 =====================
  2, "BAH", "FLU", 2, 1,
  2, "GRE", "CAP", 2, 0,
  2, "RBB", "VAS", 2, 1,
  2, "CAM", "CRI", 1, 1,
  2, "FOR", "CRU", 1, 1,
  2, "JUV", "COR", 2, 0,
  2, "PAL", "INT", 0, 1,
  2, "FLA", "SAO", 2, 1,
  2, "BOT", "ACG", 1, 0,
  2, "CUI", "VIT", 0, 0,

  # ===================== RODADA 3 =====================
  3, "FLU", "VAS", 2, 1,
  3, "GRE", "CUI", 1, 0,
  3, "RBB", "COR", 1, 0,
  3, "CAM", "CRU", 3, 0,
  3, "VIT", "BAH", 2, 2,
  3, "PAL", "FLA", 0, 0,
  3, "CAP", "INT", 1, 0,
  3, "BOT", "JUV", 5, 1,
  3, "ACG", "SAO", 0, 3,
  3, "CRI", "FOR", 1, 1,

  # ===================== RODADA 4 =====================
  4, "VAS", "CRI", 0, 4,
  4, "CUI", "CAM", 0, 3,
  4, "BAH", "GRE", 1, 0,
  4, "FLA", "BOT", 0, 2,
  4, "CRU", "VIT", 3, 1,
  4, "COR", "FLU", 3, 0,
  4, "FOR", "RBB", 1, 1,
  4, "JUV", "CAP", 1, 1,
  4, "INT", "ACG", 1, 1,
  4, "SAO", "PAL", 0, 0,

  # ===================== RODADA 5 =====================
  5, "FLU", "CAM", 2, 2,
  5, "RBB", "FLA", 1, 1,
  5, "COR", "FOR", 0, 0,
  5, "VIT", "SAO", 1, 3,
  5, "CAP", "VAS", 1, 0,
  5, "BOT", "BAH", 1, 2,
  5, "CUI", "PAL", 0, 2,
  5, "JUV", "ACG", 1, 0,
  5, "CRU", "INT", 0, 0,
  5, "GRE", "CRI", 1, 2,

  # ===================== RODADA 6 =====================
  6, "FLA", "COR", 2, 0,
  6, "ACG", "CRU", 0, 1,
  6, "PAL", "CAP", 0, 2,
  6, "FOR", "BOT", 1, 1,
  6, "VAS", "VIT", 2, 1,
  6, "BAH", "RBB", 1, 0,
  6, "SAO", "FLU", 2, 1,
  6, "CRI", "CUI", 2, 5,
  6, "INT", "JUV", 2, 1,
  6, "CAM", "GRE", 2, 1,

  # ===================== RODADA 7 =====================
  7, "GRE", "RBB", 0, 2,
  7, "VIT", "ACG", 0, 2,
  7, "FLU", "JUV", 1, 1,
  7, "CUI", "INT", 0, 1,
  7, "COR", "BOT", 0, 1,
  7, "CAM", "BAH", 1, 1,
  7, "VAS", "FLA", 1, 6,
  7, "CRI", "PAL", 1, 2,
  7, "SAO", "CRU", 2, 0,
  7, "FOR", "CAP", 1, 0,

  # ===================== RODADA 8 =====================
  8, "ACG", "COR", 2, 2,
  8, "JUV", "VIT", 1, 1,
  8, "BOT", "FLU", 1, 0,
  8, "RBB", "CAM", 1, 2,
  8, "CRU", "CUI", 2, 1,
  8, "INT", "SAO", 0, 0,
  8, "FLA", "GRE", 2, 1,
  8, "CAP", "CRI", 3, 1,
  8, "BAH", "FOR", 1, 0,
  8, "PAL", "VAS", 2, 0,

  # ===================== RODADA 9 =====================
  9, "RBB", "JUV", 2, 1,
  9, "FLU", "ACG", 1, 2,
  9, "VIT", "INT", 2, 1,
  9, "COR", "SAO", 2, 2,
  9, "CAP", "FLA", 1, 1,
  9, "GRE", "BOT", 1, 2,
  9, "VAS", "CRU", 0, 0,
  9, "CUI", "FOR", 5, 0,
  9, "CRI", "BAH", 2, 2,
  9, "CAM", "PAL", 0, 4,

  # ===================== RODADA 10 =====================
  10, "BOT", "CAP", 1, 1,
  10, "ACG", "CRI", 1, 2,
  10, "SAO", "CUI", 0, 1,
  10, "JUV", "VAS", 2, 0,
  10, "FOR", "GRE", 1, 0,
  10, "INT", "COR", 1, 0,
  10, "CRU", "FLU", 2, 0,
  10, "VIT", "CAM", 4, 2,
  10, "FLA", "BAH", 2, 1,
  10, "PAL", "RBB", 2, 1,

  # ===================== RODADA 11 =====================
  11, "CRI", "BOT", 2, 1,
  11, "GRE", "INT", 0, 1,
  11, "CUI", "ACG", 0, 0,
  11, "VAS", "SAO", 4, 1,
  11, "FLU", "FLA", 0, 1,
  11, "CAP", "COR", 1, 1,
  11, "BAH", "CRU", 4, 1,
  11, "CAM", "FOR", 1, 1,
  11, "PAL", "JUV", 3, 1,
  11, "RBB", "VIT", 2, 1,

  # ===================== RODADA 12 =====================
  12, "CRU", "CAP", 2, 0,
  12, "BOT", "RBB", 2, 1,
  12, "COR", "CUI", 1, 1,
  12, "JUV", "FLA", 2, 1,
  12, "ACG", "GRE", 1, 1,
  12, "INT", "CAM", 1, 2,
  12, "BAH", "VAS", 2, 1,
  12, "FOR", "PAL", 3, 0,
  12, "FLU", "VIT", 0, 1,
  12, "SAO", "CRI", 2, 1,

  # ===================== RODADA 13 =====================
  13, "CUI", "RBB", 1, 1,
  13, "VAS", "BOT", 1, 1,
  13, "CAM", "ACG", 1, 1,
  13, "GRE", "FLU", 1, 0,
  13, "SAO", "BAH", 3, 1,
  13, "VIT", "CAP", 0, 1,
  13, "FLA", "CRU", 2, 1,
  13, "CRI", "INT", 1, 1,
  13, "PAL", "COR", 2, 0,
  13, "FOR", "JUV", 2, 1,

  # ===================== RODADA 14 =====================
  14, "CUI", "BOT", 1, 2,
  14, "VAS", "FOR", 2, 0,
  14, "CRI", "CRU", 1, 0,
  14, "RBB", "ACG", 3, 1,
  14, "CAM", "FLA", 2, 4,
  14, "CAP", "SAO", 1, 2,
  14, "GRE", "PAL", 2, 2,
  14, "BAH", "JUV", 2, 0,
  14, "COR", "VIT", 3, 2,
  14, "FLU", "INT", 1, 1,

  # ===================== RODADA 15 =====================
  15, "FLA", "CUI", 1, 1,
  15, "SAO", "RBB", 2, 0,
  15, "CRU", "GRE", 3, 0,
  15, "JUV", "FOR", 3, 0,
  15, "FLU", "CRI", 1, 0,
  15, "INT", "VAS", 1, 2,
  15, "VIT", "CRI", 2, 1,
  15, "PAL", "BAH", 2, 0,
  15, "ACG", "CAP", 1, 2,
  15, "BOT", "CAM", 3, 0,

  # ===================== RODADA 16 =====================
  16, "GRE", "CRU", 0, 2,
  16, "VAS", "COR", 2, 0,
  16, "CAP", "BAH", 1, 3,
  16, "PAL", "ACG", 3, 1,
  16, "FLA", "FOR", 1, 2,
  16, "CRI", "FLU", 1, 1,
  16, "CAM", "SAO", 2, 1,
  16, "VIT", "BOT", 0, 1,
  16, "CUI", "JUV", 0, 0,
  16, "RBB", "INT", 2, 2,

  # ===================== RODADA 17 =====================
  17, "CRU", "RBB", 2, 1,
  17, "BAH", "CUI", 1, 2,
  17, "JUV", "CAM", 1, 1,
  17, "COR", "CRI", 2, 1,
  17, "ACG", "VAS", 0, 1,
  17, "SAO", "GRE", 1, 0,
  17, "BOT", "PAL", 1, 0,
  17, "FOR", "VIT", 3, 1,
  17, "FLU", "CAP", 1, 0,
  17, "INT", "FLA", 1, 1,

  # ===================== RODADA 18 =====================
  18, "FLA", "CRI", 2, 1,
  18, "BOT", "INT", 1, 0,
  18, "PAL", "CRU", 2, 0,
  18, "GRE", "VIT", 2, 0,
  18, "CAM", "VAS", 2, 0,
  18, "BAH", "COR", 0, 1,
  18, "JUV", "SAO", 0, 0,
  18, "FOR", "ACG", 3, 1,
  18, "RBB", "CAP", 1, 0,
  18, "CUI", "FLU", 0, 1,

  # ===================== RODADA 19 =====================
  19, "CRU", "JUV", 2, 0,
  19, "SAO", "BOT", 2, 2,
  19, "VIT", "FLA", 1, 2,
  19, "FLU", "PAL", 1, 0,
  19, "ACG", "BAH", 1, 1,
  19, "COR", "GRE", 2, 2,
  19, "CRI", "RBB", 1, 0,
  19, "INT", "FOR", 2, 1,
  19, "VAS", "CUI", 1, 0,
  19, "CAP", "CAM", 1, 0,

  # ===================== RODADA 20 =====================
  20, "PAL", "VIT", 0, 2,
  20, "JUV", "CRI", 1, 2,
  20, "BAH", "INT", 1, 1,
  20, "BOT", "CRU", 0, 3,
  20, "FOR", "SAO", 1, 0,
  20, "RBB", "FLU", 0, 1,
  20, "FLA", "ACG", 2, 0,
  20, "GRE", "VAS", 1, 0,
  20, "CAM", "COR", 2, 1,
  20, "CUI", "CAP", 1, 2,

  # ===================== RODADA 21 =====================
  21, "VIT", "CUI", 1, 0,
  21, "VAS", "RBB", 2, 2,
  21, "ACG", "BOT", 1, 4,
  21, "CRI", "CAM", 2, 1,
  21, "SAO", "FLA", 1, 0,
  21, "FLU", "BAH", 1, 0,
  21, "COR", "JUV", 1, 1,
  21, "CAP", "GRE", 0, 2,
  21, "INT", "PAL", 1, 1,
  21, "CRU", "FOR", 1, 2,

  # ===================== RODADA 22 =====================
  22, "FOR", "CRI", 1, 0,
  22, "CUI", "GRE", 1, 3,
  22, "CRU", "CAM", 0, 0,
  22, "VAS", "FLU", 2, 0,
  22, "COR", "RBB", 1, 1,
  22, "JUV", "BOT", 3, 2,
  22, "BAH", "VIT", 2, 0,
  22, "FLA", "PAL", 1, 1,
  22, "SAO", "ACG", 1, 0,
  22, "INT", "CAP", 2, 2,

  # ===================== RODADA 23 =====================
  23, "CAM", "CUI", 1, 1,
  23, "GRE", "BAH", 0, 2,
  23, "RBB", "FOR", 1, 2,
  23, "FLU", "COR", 0, 0,
  23, "PAL", "SAO", 2, 1,
  23, "ACG", "INT", 1, 0,
  23, "CRI", "VAS", 2, 2,
  23, "CAP", "JUV", 1, 2,
  23, "BOT", "FLA", 4, 1,
  23, "VIT", "CRU", 2, 2,

  # ===================== RODADA 24 =====================
  24, "ACG", "JUV", 2, 1,
  24, "PAL", "CUI", 5, 0,
  24, "CAM", "FLU", 0, 2,
  24, "CRI", "GRE", 0, 1,
  24, "BAH", "BOT", 0, 0,
  24, "FOR", "COR", 1, 0,
  24, "SAO", "VIT", 2, 1,
  24, "INT", "CRU", 1, 0,
  24, "FLA", "RBB", 2, 1,
  24, "VAS", "CAP", 2, 1,

  # ===================== RODADA 25 =====================
  25, "CUI", "CRI", 2, 1,
  25, "BOT", "FOR", 2, 0,
  25, "CRU", "ACG", 3, 1,
  25, "GRE", "CAM", 2, 3,
  25, "COR", "FLA", 2, 1,
  25, "CAP", "PAL", 0, 2,
  25, "VIT", "VAS", 0, 1,
  25, "FLU", "SAO", 2, 0,
  25, "RBB", "BAH", 2, 1,
  25, "JUV", "INT", 1, 3,

  # ===================== RODADA 26 =====================
  26, "ACG", "VIT", 0, 2,
  26, "CAP", "FOR", 1, 1,
  26, "BOT", "COR", 2, 1,
  26, "PAL", "CRI", 5, 0,
  26, "RBB", "GRE", 2, 2,
  26, "JUV", "FLU", 2, 1,
  26, "CRU", "SAO", 0, 1,
  26, "BAH", "CAM", 3, 0,
  26, "FLA", "VAS", 1, 1,
  26, "INT", "CUI", 3, 0,

  # ===================== RODADA 27 =====================
  27, "VIT", "JUV", 1, 0,
  27, "COR", "ACG", 3, 0,
  27, "FLU", "BOT", 0, 1,
  27, "FOR", "BAH", 4, 1,
  27, "CAM", "RBB", 3, 0,
  27, "VAS", "PAL", 0, 1,
  27, "SAO", "INT", 1, 3,
  27, "CUI", "CRU", 0, 0,
  27, "GRE", "FLA", 3, 2,
  27, "CRI", "CAP", 0, 0,

  # ===================== RODADA 28 =====================
  28, "PAL", "CAM", 2, 1,
  28, "BOT", "GRE", 0, 0,
  28, "JUV", "RBB", 1, 1,
  28, "SAO", "COR", 3, 1,
  28, "FOR", "CUI", 1, 0,
  28, "ACG", "FLU", 1, 0,
  28, "INT", "VIT", 3, 1,
  28, "CRU", "VAS", 1, 1,
  28, "BAH", "CRI", 1, 0,
  28, "FLA", "CAP", 1, 0,

  # ===================== RODADA 29 =====================
  29, "CRI", "ACG", 2, 0,
  29, "FLU", "CRU", 1, 0,
  29, "GRE", "FOR", 3, 1,
  29, "CAM", "VIT", 2, 2,
  29, "RBB", "PAL", 0, 0,
  29, "CAP", "BOT", 0, 1,
  29, "BAH", "FLA", 0, 2,
  29, "COR", "INT", 2, 2,
  29, "CUI", "SAO", 2, 0,
  29, "VAS", "JUV", 1, 1,

  # ===================== RODADA 30 =====================
  30, "SAO", "VAS", 3, 0,
  30, "FOR", "CAM", 1, 1,
  30, "FLA", "FLU", 0, 2,
  30, "COR", "CAP", 5, 2,
  30, "ACG", "CUI", 0, 0,
  30, "BOT", "CRI", 1, 1,
  30, "CRU", "BAH", 1, 1,
  30, "INT", "GRE", 1, 0,
  30, "VIT", "RBB", 1, 0,
  30, "JUV", "PAL", 3, 5,

  # ===================== RODADA 31 =====================
  31, "GRE", "ACG", 3, 1,
  31, "VIT", "FLU", 2, 1,
  31, "FLA", "JUV", 4, 2,
  31, "PAL", "FOR", 2, 2,
  31, "CAP", "CRU", 3, 0,
  31, "CAM", "INT", 1, 3,
  31, "RBB", "BOT", 0, 1,
  31, "CRI", "SAO", 1, 1,
  31, "CUI", "COR", 0, 1,
  31, "VAS", "BAH", 3, 2,

  # ===================== RODADA 32 =====================
  32, "FLU", "GRE", 2, 2,
  32, "RBB", "CUI", 0, 0,
  32, "CAP", "VIT", 1, 2,
  32, "JUV", "FOR", 0, 3,
  32, "COR", "PAL", 2, 0,
  32, "INT", "CRI", 2, 0,
  32, "BAH", "SAO", 0, 3,
  32, "BOT", "VAS", 3, 0,
  32, "CRU", "FLA", 0, 1,
  32, "ACG", "CAM", 1, 0,

  # ===================== RODADA 33 =====================
  33, "INT", "FLU", 2, 0,
  33, "PAL", "GRE", 1, 0,
  33, "VIT", "COR", 1, 2,
  33, "BOT", "CUI", 0, 0,
  33, "CRU", "CRI", 2, 1,
  33, "FOR", "VAS", 3, 0,
  33, "ACG", "RBB", 0, 0,
  33, "JUV", "BAH", 2, 1,
  33, "SAO", "CAP", 2, 1,
  33, "FLA", "CAM", 0, 0,

  # ===================== RODADA 34 =====================
  34, "COR", "CRU", 2, 1,
  34, "RBB", "SAO", 1, 1,
  34, "CAP", "ACG", 2, 0,
  34, "CRI", "VIT", 0, 1,
  34, "BAH", "PAL", 1, 2,
  34, "GRE", "JUV", 2, 2,
  34, "CUI", "FLA", 1, 2,
  34, "CAM", "BOT", 0, 0,
  34, "VAS", "INT", 0, 1,
  34, "FLU", "FOR", 2, 2,

  # ===================== RODADA 35 =====================
  35, "BOT", "VIT", 1, 1,
  35, "ACG", "PAL", 0, 1,
  35, "JUV", "CUI", 1, 1,
  35, "SAO", "CAM", 2, 2,
  35, "INT", "RBB", 4, 1,
  35, "BAH", "CAP", 1, 1,
  35, "COR", "VAS", 3, 1,
  35, "FLU", "CRI", 0, 0,
  35, "FOR", "FLA", 0, 0,
  35, "CRU", "GRE", 1, 1,

  # ===================== RODADA 36 =====================
  36, "CAM", "JUV", 2, 3,
  36, "PAL", "BOT", 1, 3,
  36, "CUI", "BAH", 1, 2,
  36, "CRI", "COR", 2, 4,
  36, "VAS", "ACG", 2, 2,
  36, "GRE", "SAO", 2, 1,
  36, "FLA", "INT", 3, 2,
  36, "VIT", "FOR", 2, 0,
  36, "RBB", "CRU", 1, 1,
  36, "CAP", "FLU", 1, 1,

  # ===================== RODADA 37 =====================
  37, "COR", "BAH", 3, 0,
  37, "VAS", "CAM", 2, 0,
  37, "VIT", "GRE", 1, 1,
  37, "SAO", "JUV", 1, 2,
  37, "CRI", "FLA", 0, 3,
  37, "INT", "BOT", 0, 1,
  37, "CRU", "PAL", 1, 2,
  37, "ACG", "FOR", 3, 1,
  37, "FLU", "CUI", 1, 0,
  37, "CAP", "RBB", 1, 2,

  # ===================== RODADA 38 =====================
  38, "GRE", "COR", 0, 3,
  38, "CAM", "CAP", 1, 0,
  38, "BAH", "ACG", 2, 0,
  38, "FLA", "VIT", 2, 2,
  38, "BOT", "SAO", 2, 1,
  38, "PAL", "FLU", 0, 1,
  38, "RBB", "CRI", 5, 1,
  38, "FOR", "INT", 3, 0,
  38, "CUI", "VAS", 1, 2,
  38, "JUV", "CRU", 0, 1
)

# ------------------------------------------------------------------
# Criar o tibble final com GFM, GSM, GSV, GFV
# ------------------------------------------------------------------
cbfsa2024_brutos <- jogos_2024 %>%
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

