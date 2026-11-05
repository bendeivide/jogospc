#################################
# Gerando os dados de 2024 - CBSA
#################################
cbfsa2024 <- list(
  clubes = c(
    "athletico_pr",
    "atletico_go",
    "atletico_mg",
    "bahia",
    "botafogo",
    "corinthians",
    "criciuma",
    "cruzeiro",
    "cuiaba",
    "flamengo",
    "fluminense",
    "fortaleza",
    "gremio",
    "internacional",
    "juventude",
    "palmeiras",
    "red_bull_bragantino",
    "sao_paulo",
    "vasco_da_gama",
    "vitoria"
  ),
  siglas = c("CAP", "ACG", "CAM", "BAH", "BOT", "COR", "CRI", "CRU",
             "CUI", "FLA", "FLU", "FOR", "GRE", "INT", "JUV", "PAL",
             "RBB", "SAO", "VAS", "VIT"),
  jogos = jogos_2024[1:3],
  resultados = cbfsa2024_brutos,
  data_atualizacao = as.Date("08/12/2024", format = "%d/%m/%Y")
)

# Salva o objeto 'cbfsa2026' na pasta data/ do pacote
usethis::use_data(cbfsa2024, overwrite = TRUE)

#################################
# Gerando os dados de 2025 - CBSA
#################################
cbfsa2025 <- list(
  clubes = c(
    "bahia",
    "botafogo",
    "ceara",
    "corinthians",
    "coritiba",
    "cruzeiro",
    "flamengo",
    "fluminense",
    "fortaleza",
    "gremio",
    "internacional",
    "juventude",
    "mirassol",
    "palmeiras",
    "red_bull_bragantino",
    "santos",
    "sao_paulo",
    "sport",
    "vasco_da_gama",
    "vitoria"
  ),
  siglas = c("BAH", "BOT", "CEA", "COR", "CFC", "CRU",
             "FLA", "FLU", "FOR", "GRE", "INT", "JUV",
             "MIR", "PAL", "RBB", "SAN", "SAO", "SPO",
             "VAS", "VIT"),
  jogos = jogos_2025[1:3], # Supondo que o tribble com os jogos se chame jogos_2025
  resultados = cbfsa2025_brutos, # Supondo que o tibble final se chame cbfsa2025_brutos
  data_atualizacao = as.Date("07/12/2025", format = "%d/%m/%Y")
)

# Salva o objeto 'cbfsa2026' na pasta data/ do pacote
usethis::use_data(cbfsa2025, overwrite = TRUE)

#################################
# Gerando os dados de 2026 - CBSA
#################################
cbfsa2026 <- list(
  clubes = c(
    "bahia",
    "botafogo",
    "atletico_mg",
    "athletico_pr",
    "coritiba",
    "chapecoense",
    "corinthians",
    "cruzeiro",
    "flamengo",
    "fluminense",
    "gremio",
    "internacional",
    "mirassol",
    "palmeiras",
    "red_bull_bragantino",
    "remo",
    "santos",
    "sao_paulo",
    "vasco_da_gama",
    "vitoria"
  ),
  siglas = c("BAH", "BOT", "CAM", "CAP", "CFC", "CHA", "COR", "CRU",
              "FLA", "FLU", "GRE", "INT", "MIR", "PAL", "RBB", "REM", "SAN",
              "SAO", "VAS", "VIT"),
  jogos = jogos_2026[1:3],
  resultados = cbfsa2026_brutos,
  data_atualizacao = as.Date("04/11/2026", format = "%d/%m/%Y")
)

# Salva o objeto 'cbfsa2026' na pasta data/ do pacote
usethis::use_data(cbfsa2026, overwrite = TRUE)
