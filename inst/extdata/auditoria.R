library(dplyr)
library(tidyr)

# 1. Cria uma base unificada de todos os times que jogaram em cada rodada
auditoria_times <- jogos_2024 %>%
  select(Rodada, Time1, Time2) %>%
  pivot_longer(cols = c(Time1, Time2),
               names_to = "Tipo",
               values_to = "Time") %>%
  # Conta quantas vezes cada time aparece na mesma rodada
  group_by(Rodada, Time) %>%
  summarise(aparicoes = n(), .groups = "drop") %>%
  # Filtra apenas onde o time aparece mais de uma vez
  filter(aparicoes > 1)

# 2. Exibe o resultado
if (nrow(auditoria_times) == 0) {
  cat("Tudo certo! Nenhum time se repete na mesma rodada.\n")
} else {
  cat("Atenção! Encontramos times duplicados nas seguintes rodadas:\n")
  print(auditoria_times)
}
