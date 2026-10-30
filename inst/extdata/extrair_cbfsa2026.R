library(tibble)
library(dplyr)

# ------------------------------------------------------------------
# Dados extraídos do PDF cbfsa2026.pdf
# Siglas utilizadas:
#   COR = Corinthians SP
#   CFC = Coritiba PR
#   CAM = Atlético MG   |  CAP = Athletico PR  |  RBB = Red Bull Bragantino SP
#   BOT = Botafogo RJ   |  CRU = Cruzeiro MG   |  FLU = Fluminense RJ
#   FLA = FlCAMngo RJ   |  GRE = Grêmio RS     |  INT = Internacional RS
#   MIR = Mirassol SP   |  PAL = Palmeiras SP  |  REM = Remo PA
#   SAN = Santos SP     |  SAO = São Paulo SP  |  VAS = Vasco da Gama RJ
#   VIT = Vitória BA    |  BAH = Bahia BA      |  CHA = Chapecoense SC
# ------------------------------------------------------------------
jogos_2026 <- tribble(
  ~Rodada, ~Time1, ~Time2, ~Gols_Time1, ~Gols_Time2,

  # ===================== RODADA 1 =====================
  1, "CAM", "PAL", 2, 2,
  1, "INT", "CAP", 0, 1,
  1, "CFC", "RBB", 0, 1,
  1, "VIT", "REM", 2, 0,
  1, "FLU", "GRE", 2, 1,
  1, "COR", "BAH", 1, 2,
  1, "CHA", "SAN", 4, 2,
  1, "SAO", "FLA", 2, 1,
  1, "MIR", "VAS", 2, 1,
  1, "BOT", "CRU", 4, 0,

  # ===================== RODADA 2 =====================
  2, "FLA", "INT", 1, 1,
  2, "RBB", "CAM", 1, 0,
  2, "SAN", "SAO", 1, 1,
  2, "REM", "MIR", 2, 2,
  2, "PAL", "VIT", 5, 1,
  2, "GRE", "BOT", 5, 3,
  2, "BAH", "FLU", 1, 1,
  2, "VAS", "CHA", 1, 1,
  2, "CRU", "CFC", 1, 2,
  2, "CAP", "COR", 0, 1,

  # ===================== RODADA 3 =====================
  3, "VIT", "FLA", 1, 2,
  3, "MIR", "CRU", 2, 2,
  3, "CHA", "CFC", 3, 3,
  3, "CAM", "REM", 3, 3,
  3, "VAS", "BAH", 0, 1,
  3, "SAO", "GRE", 2, 0,
  3, "CAP", "SAN", 2, 1,
  3, "FLU", "BOT", 1, 0,
  3, "COR", "RBB", 2, 0,
  3, "INT", "PAL", 1, 3,

  # ===================== RODADA 4 =====================
  4, "RBB", "CAP", 1, 1,
  4, "REM", "INT", 1, 1,
  4, "CRU", "COR", 1, 1,
  4, "GRE", "CAM", 2, 1,
  4, "PAL", "FLU", 2, 1,
  4, "CFC", "SAO", 0, 1,
  4, "SAN", "VAS", 2, 1,
  4, "BAH", "CHA", 2, 0,
  4, "BOT", "VIT", 0, 0,
  4, "FLA", "MIR", 2, 0,

  # ===================== RODADA 5 =====================
  5, "MIR", "SAN", 2, 2,
  5, "CAM", "INT", 1, 0,
  5, "BAH", "VIT", 1, 1,
  5, "FLA", "CRU", 2, 0,
  5, "COR", "CFC", 0, 2,
  5, "REM", "FLU", 0, 2,
  5, "VAS", "PAL", 2, 1,
  5, "SAO", "CHA", 2, 0,
  5, "GRE", "RBB", 1, 1,
  5, "CAP", "BOT", 4, 1,

  # ===================== RODADA 6 =====================
  6, "VIT", "CAM", 2, 0,
  6, "BOT", "FLA", 0, 3,
  6, "FLU", "CAP", 3, 2,
  6, "SAN", "COR", 1, 1,
  6, "INT", "BAH", 0, 1,
  6, "PAL", "MIR", 1, 0,
  6, "CFC", "REM", 1, 0,
  6, "RBB", "SAO", 1, 2,
  6, "CRU", "VAS", 3, 3,
  6, "CHA", "GRE", 1, 1,

  # ===================== RODADA 7 =====================
  7, "BAH", "RBB", 2, 0,
  7, "PAL", "BOT", 2, 1,
  7, "CAP", "CRU", 2, 1,
  7, "CAM", "SAO", 1, 0,
  7, "MIR", "CFC", 0, 1,
  7, "SAN", "INT", 1, 2,
  7, "VAS", "FLU", 3, 2,
  7, "GRE", "VIT", 2, 0,
  7, "FLA", "REM", 3, 0,
  7, "CHA", "COR", 0, 0,

  # ===================== RODADA 8 =====================
  8, "RBB", "BOT", 1, 2,
  8, "FLU", "CAM", 1, 0,
  8, "SAO", "PAL", 0, 1,
  8, "VAS", "GRE", 2, 1,
  8, "CRU", "SAN", 0, 0,
  8, "CAP", "CFC", 2, 0,
  8, "REM", "BAH", 4, 1,
  8, "INT", "CHA", 2, 0,
  8, "VIT", "MIR", 1, 0,
  8, "COR", "FLA", 1, 1,

  # ===================== RODADA 9 =====================
  9, "BOT", "MIR", 3, 2,
  9, "INT", "SAO", 1, 1,
  9, "CRU", "VIT", 3, 0,
  9, "BAH", "CAP", 3, 0,
  9, "CFC", "VAS", 1, 1,
  9, "FLU", "COR", 3, 1,
  9, "SAN", "REM", 2, 0,
  9, "CHA", "CAM", 0, 4,
  9, "PAL", "GRE", 2, 1,
  9, "RBB", "FLA", 3, 0,

  # ===================== RODADA 10 =====================
  10, "SAO", "CRU", 4, 1,
  10, "CFC", "FLU", 1, 1,
  10, "VAS", "BOT", 1, 2,
  10, "CHA", "VIT", 1, 1,
  10, "FLA", "SAN", 3, 1,
  10, "CAM", "CAP", 2, 1,
  10, "COR", "INT", 0, 1,
  10, "BAH", "PAL", 1, 2,
  10, "MIR", "RBB", 0, 1,
  10, "GRE", "REM", 0, 0,

  # ===================== RODADA 11 =====================
  11, "VIT", "SAO", 2, 0,
  11, "REM", "VAS", 1, 1,
  11, "MIR", "BAH", 1, 2,
  11, "SAN", "CAM", 1, 0,
  11, "INT", "GRE", 0, 0,
  11, "CAP", "CHA", 2, 0,
  11, "BOT", "CFC", 2, 2,
  11, "FLU", "FLA", 1, 2,
  11, "COR", "PAL", 0, 0,
  11, "CRU", "RBB", 2, 1,

  # ===================== RODADA 12 =====================
  12, "VAS", "SAO", 2, 1,
  12, "CHA", "BOT", 1, 4,
  12, "VIT", "COR", 0, 0,
  12, "CRU", "GRE", 2, 0,
  12, "INT", "MIR", 1, 2,
  12, "SAN", "FLU", 2, 3,
  12, "CFC", "CAM", 2, 0,
  12, "PAL", "CAP", 1, 0,
  12, "RBB", "REM", 4, 2,
  12, "FLA", "BAH", 2, 0,

  # ===================== RODADA 13 =====================
  13, "BOT", "INT", 2, 2,
  13, "BAH", "SAN", 2, 2,
  13, "REM", "CRU", 0, 1,
  13, "SAO", "MIR", 1, 0,
  13, "COR", "VAS", 1, 0,
  13, "GRE", "CFC", 1, 0,
  13, "RBB", "PAL", 0, 1,
  13, "CAP", "VIT", 3, 1,
  13, "FLU", "CHA", 2, 1,
  13, "CAM", "FLA", 0, 4,

  # ===================== RODADA 14 =====================
  14, "BOT", "REM", 1, 2,
  14, "VIT", "CFC", 4, 1,
  14, "PAL", "SAN", 1, 1,
  14, "CAP", "GRE", 0, 0,
  14, "CRU", "CAM", 1, 3,
  14, "FLA", "VAS", 2, 2,
  14, "SAO", "BAH", 2, 2,
  14, "INT", "FLU", 2, 0,
  14, "CHA", "RBB", 1, 2,
  14, "MIR", "COR", 2, 1,

  # ===================== RODADA 15 =====================
  15, "CFC", "INT", 2, 2,
  15, "FLU", "VIT", 2, 2,
  15, "BAH", "CRU", 1, 2,
  15, "CAM", "BOT", 1, 1,
  15, "REM", "PAL", 1, 1,
  15, "SAN", "RBB", 2, 0,
  15, "COR", "SAO", 3, 2,
  15, "MIR", "CHA", 1, 1,
  15, "GRE", "FLA", 0, 1,
  15, "VAS", "CAP", 1, 0,

  # ===================== RODADA 16 =====================
  16, "CAM", "MIR", 3, 1,
  16, "INT", "VAS", 4, 1,
  16, "FLU", "SAO", 2, 1,
  16, "PAL", "CRU", 1, 1,
  16, "SAN", "CFC", 0, 3,
  16, "BOT", "COR", 3, 1,
  16, "BAH", "GRE", 1, 1,
  16, "RBB", "VIT", 2, 0,
  16, "CHA", "REM", 2, 3,
  16, "CAP", "FLA", 1, 1,

  # ===================== RODADA 17 =====================
  17, "SAO", "BOT", 1, 1,
  17, "VIT", "INT", 2, 0,
  17, "MIR", "FLU", 1, 0,
  17, "GRE", "SAN", 3, 2,
  17, "FLA", "PAL", 0, 3,
  17, "CRU", "CHA", 2, 1,
  17, "REM", "CAP", 1, 2,
  17, "COR", "CAM", 1, 0,
  17, "VAS", "RBB", 0, 3,
  17, "CFC", "BAH", 3, 2,

  # ===================== RODADA 18 =====================
  18, "FLA", "CFC", 3, 0,
  18, "CAP", "MIR", 1, 0,
  18, "GRE", "COR", 1, 3,
  18, "BAH", "BOT", 2, 1,
  18, "SAN", "VIT", 3, 1,
  18, "RBB", "INT", 3, 1,
  18, "VAS", "CAM", 0, 1,
  18, "PAL", "CHA", 1, 0,
  18, "CRU", "FLU", 1, 1,
  18, "REM", "SAO", 1, 0,

  # ===================== RODADA 19 =====================
  19, "BOT", "SAN", 2, 1,
  19, "VIT", "VAS", 1, 0,
  19, "FLU", "RBB", 1, 1,
  19, "MIR", "GRE", 2, 1,
  19, "CAM", "BAH", 1, 1,
  19, "CFC", "PAL", 1, 3,
  19, "SAO", "CAP", 1, 2,
  19, "INT", "CRU", 1, 2,
  19, "CHA", "FLA", 0, 4,
  19, "COR", "REM", 3, 0,

  # ===================== RODADA 20 =====================
  20, "SAN", "CHA", 2, 2,
  20, "CAP", "INT", 2, 0,
  20, "VAS", "MIR", 1, 1,
  20, "CRU", "BOT", 0, 1,
  20, "BAH", "COR", 1, 1,
  20, "FLA", "SAO", 1, 1,
  20, "RBB", "CFC", 0, 0,
  20, "GRE", "FLU", 1, 1,
  20, "PAL", "CAM", 1, 2,
  20, "REM", "VIT", 2, 0,

  # ===================== RODADA 21 =====================
  21, "MIR", "REM", 2, 1,
  21, "INT", "FLA", 1, 1,
  21, "FLU", "BAH", 0, 0,
  21, "VIT", "PAL", 0, 4,
  21, "COR", "CAP", 0, 0,
  21, "CFC", "CRU", 0, 1,
  21, "BOT", "GRE", 3, 2,
  21, "SAO", "SAN", 1, 2,
  21, "CAM", "RBB", 1, 0,
  21, "CHA", "VAS", NA, NA,  # A definir no PDF -> 0

  # ===================== RODADA 22 =====================
  22, "GRE", "SAO", 2, 1,
  22, "REM", "CAM", 2, 2,
  22, "CFC", "CHA", 2, 1,
  22, "BOT", "FLU", 1, 1,
  22, "CRU", "MIR", 3, 1,
  22, "PAL", "INT", 0, 0,
  22, "BAH", "VAS", 0, 0,
  22, "SAN", "CAP", 0, 2,
  22, "RBB", "COR", 0, 2,
  22, "FLA", "VIT", 2, 0,

  # ===================== RODADA 23 =====================
  23, "FLU", "PAL", 3, 2,
  23, "CAP", "RBB", 1, 1,
  23, "SAO", "CFC", 1, 1,
  23, "CHA", "BAH", 3, 3,
  23, "VAS", "SAN", 0, 3,
  23, "CAM", "GRE", 3, 0,
  23, "MIR", "FLA", 1, 5,
  23, "VIT", "BOT", 1, 0,
  23, "COR", "CRU", 1, 2,
  23, "INT", "REM", 1, 1,

  # ===================== RODADA 24 =====================
  24, "FLU", "REM", 2, 1,
  24, "INT", "CAM", 0, 0,
  24, "CRU", "FLA", 2, 1,
  24, "PAL", "VAS", 4, 1,
  24, "RBB", "GRE", 1, 0,
  24, "VIT", "BAH", 0, 2,
  24, "SAN", "MIR", 1, 1,
  24, "CHA", "SAO", 1, 0,
  24, "CFC", "COR", 2, 1,
  24, "BOT", "CAP", 2, 3,

  # ===================== RODADA 25 =====================
  25, "CAM", "VIT", 2, 1,
  25, "SAO", "RBB", 2, 1,
  25, "VAS", "CRU", 3, 1,
  25, "CAP", "FLU", 3, 3,
  25, "FLA", "BOT", 3, 0,
  25, "COR", "SAN", 0, 1,
  25, "GRE", "CHA", 3, 1,
  25, "MIR", "PAL", 1, 1,
  25, "BAH", "INT", 3, 2,
  25, "REM", "CFC", 2, 3,

  # ===================== RODADA 26 =====================
  26, "RBB", "BAH", 2, 3,
  26, "SAO", "CAM", 2, 0,
  26, "FLU", "VAS", 1, 0,
  26, "CFC", "MIR", 1, 2,
  26, "CRU", "CAP", 3, 1,
  26, "INT", "SAN", 2, 3,
  26, "REM", "FLA", 0, 1,
  26, "BOT", "PAL", 0, 0,
  26, "COR", "CHA", 1, 2,
  26, "VIT", "GRE", 1, 0,

  # ===================== RODADA 27 =====================
  27, "CAM", "FLU", 3, 1,
  27, "GRE", "VAS", 1, 2,
  27, "CHA", "INT", 1, 2,
  27, "PAL", "SAO", 2, 0,
  27, "BOT", "RBB", 1, 1,
  27, "SAN", "CRU", 2, 1,
  27, "MIR", "VIT", 2, 2,
  27, "FLA", "COR", 2, 1,
  27, "BAH", "REM", 2, 1,
  27, "CFC", "CAP", 3, 3,

  # ===================== RODADA 28 =====================
  28, "CAM", "CHA", 1, 1,
  28, "MIR", "BOT", 2, 0,
  28, "REM", "SAN", 1, 2,
  28, "VAS", "CFC", 5, 0,
  28, "SAO", "INT", 1, 0,
  28, "GRE", "PAL", 0, 0,
  28, "COR", "FLU", 1, 3,
  28, "VIT", "CRU", 1, 3,
  28, "FLA", "RBB", 2, 1,
  28, "CAP", "BAH", 2, 1,

  # ===================== RODADA 29 =====================
  29, "RBB", "MIR", 1, 1,
  29, "INT", "COR", 2, 1,
  29, "REM", "GRE", 1, 1,
  29, "VIT", "CHA", 4, 0,
  29, "BOT", "VAS", 1, 2,
  29, "CRU", "SAO", 2, 0,
  29, "SAN", "FLA", 2, 2,
  29, "CAP", "CAM", 2, 2,
  29, "FLU", "CFC", 4, 0,
  29, "PAL", "BAH", 1, 0,

  # ===================== RODADA 30 =====================
  30, "VAS", "REM", 0, 0,
  30, "SAO", "VIT", 2, 1,
  30, "CAM", "SAN", 2, 1,
  30, "FLA", "FLU", 1, 0,
  30, "PAL", "COR", 4, 1,
  30, "GRE", "INT", 1, 1,
  30, "BAH", "MIR", 1, 0,
  30, "CFC", "BOT", 1, 1,
  30, "CHA", "CAP", 1, 4,
  30, "RBB", "CRU", 4, 2,

  # ============ RODADA 31 ============
  31, "MIR", "INT", 2, 0,
  31, "BOT", "CHA", 1, 0,
  31, "CAM", "CFC", 1, 0,
  31, "CAP", "PAL", 0, 2,
  31, "SAO", "VAS", 1, 0,
  31, "FLU", "SAN", 1, 2,
  31, "GRE", "CRU", 2, 4,
  31, "BAH", "FLA", 0, 3,
  31, "REM", "RBB", 1, 1,
  31, "COR", "VIT", 1, 1,

  # Rodada 32
  32, "CRU", "REM", 1, 0,
  32, "MIR", "SAO", 1, 1,
  32, "INT", "BOT", 3, 0,
  32, "VIT", "CAP", 1, 1,
  32, "VAS", "COR", 3, 2,
  32, "PAL", "RBB", 2, 0,
  32, "CHA", "FLU", 2, 1,
  32, "SAN", "BAH", 1, 1,
  32, "CFC", "GRE", 0, 1,
  32, "FLA", "CAM", 3, 2,

  # Rodada 33
  33, "FLU", "INT", 2, 1,
  33, "SAN", "PAL", 0, 0,
  33, "RBB", "CHA", 3, 0,
  33, "BAH", "SAO", 3, 2,
  33, "REM", "BOT", 2, 1,
  33, "CAM", "CRU", 0, 1,
  33, "CFC", "VIT", NA, NA,
  33, "VAS", "FLA", 1, 3,
  33, "GRE", "CAP", 0, 0,
  33, "COR", "MIR", NA, NA,

  # Rodada 34
  34, "RBB", "SAN", NA, NA,
  34, "CHA", "MIR", NA, NA,
  34, "INT", "COR", NA, NA,
  34, "FLA", "GRE", NA, NA,
  34, "CAP", "VAS", NA, NA,
  34, "BOT", "CAM", NA, NA,
  34, "SAO", "CFC", NA, NA,
  34, "PAL", "REM", NA, NA,
  34, "CRU", "BAH", NA, NA,
  34, "VIT", "FLU", NA, NA,

  # Rodada 35
  35, "FLA", "CAP", NA, NA,
  35, "VAS", "INT", NA, NA,
  35, "SAO", "FLU", NA, NA,
  35, "COR", "BOT", NA, NA,
  35, "MIR", "CAM", NA, NA,
  35, "CRU", "PAL", NA, NA,
  35, "GRE", "BAH", NA, NA,
  35, "CFC", "SAN", NA, NA,
  35, "VIT", "RBB", NA, NA,
  35, "REM", "CHA", NA, NA,

  # Rodada 36
  36, "FLU", "MIR", NA, NA,
  36, "BOT", "SAO", NA, NA,
  36, "SAN", "GRE", NA, NA,
  36, "PAL", "FLA", NA, NA,
  36, "RBB", "VAS", NA, NA,
  36, "CAM", "COR", NA, NA,
  36, "INT", "VIT", NA, NA,
  36, "CAP", "REM", NA, NA,
  36, "BAH", "CFC", NA, NA,
  36, "CHA", "CRU", NA, NA,

  # Rodada 37
  37, "FLU", "CRU", NA, NA,
  37, "BOT", "BAH", NA, NA,
  37, "SAO", "REM", NA, NA,
  37, "COR", "GRE", NA, NA,
  37, "MIR", "CAP", NA, NA,
  37, "CAM", "VAS", NA, NA,
  37, "INT", "RBB", NA, NA,
  37, "CFC", "FLA", NA, NA,
  37, "VIT", "SAN", NA, NA,
  37, "CHA", "PAL", NA, NA,

  # Rodada 38
  38, "FLA", "CHA", NA, NA,
  38, "VAS", "VIT", NA, NA,
  38, "SAN", "BOT", NA, NA,
  38, "PAL", "CFC", NA, NA,
  38, "RBB", "FLU", NA, NA,
  38, "CRU", "INT", NA, NA,
  38, "GRE", "MIR", NA, NA,
  38, "CAP", "SAO", NA, NA,
  38, "BAH", "CAM", NA, NA,
  38, "REM", "COR", NA, NA
)

# ------------------------------------------------------------------
# Criar o tibble final com GFM, GSM, GSV, GFV
#   GFM = Gols Feitos pelo Mandante
#   GSM = Gols Sofridos pelo Mandante
#   GSV = Gols Sofridos pelo Visitante
#   GFV = Gols Feitos pelo Visitante
# Garantindo: GFM == GSV  e  GFV == GSM
# ------------------------------------------------------------------
cbfsa2026_brutos <- jogos_2026 %>%
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

