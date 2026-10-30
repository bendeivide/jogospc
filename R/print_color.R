#' @export
print.jogospc <- function(x, ...) {
  aux <- attr(x, "output")
  # Print
  switch(aux,
         tabcbfsa = output_tabcbfsa(x)
        )
}


output_tabcbfsa <- function(x, ...) {
  print_color(
    x,
    n = c(1:4, 5, 6:11, 17:20),
    color = c(rep("cyan", 4), "yellow", rep("green", 6), rep("red", 4)),
    legend = c(
      cyan = "Fase de grupos da CONMEBOL Libertadores",
      yellow = "Qualificatorias da CONMEBOL Libertadores",
      green = "Fase de grupos da CONMEBOL Sudamericana",
      red = "Rebaixamento"
    )
  )
}




# Funcao que imprime a classificacao do campeonato brasileiro
# baseado nos clubes que estao na libertadores, sulamericana,
# rebaixamento
print_color <- function(x, n = 1, color = "green",
                        legend = NULL) {

  # Cria uma copia sem a classe personalizada
  x_print <- x
  class(x_print) <- "data.frame"

  # Captura a impressao do data frame
  linhas <- capture.output(print(x_print))

  # Verifica se os indices das linhas sao validos
  if (anyNA(n) || any(!is.finite(n)) ||
      any(n != as.integer(n)) ||
      any(n < 1 | n > nrow(x))) {
    stop("'n' must contain valid row indices.")
  }

  # Permite utilizar uma unica cor para todas as linhas
  if (length(color) == 1L) {
    color <- rep(color, length(n))
  }

  # Verifica se o numero de cores corresponde ao numero de linhas
  if (length(color) != length(n)) {
    stop("'color' must have length 1 or the same length as 'n'.")
  }

  # Define as cores permitidas
  valid_colors <- c(
    "black", "red", "green", "yellow", "blue",
    "magenta", "cyan", "white", "silver", "grey",
    "gray", "bold", "italic", "underline", "inverse"
  )

  # Verifica se todas as cores sao validas
  if (anyNA(color) || any(!color %in% valid_colors)) {
    stop("Invalid color specified.")
  }

  # Percorre e imprime todas as linhas da tabela
  for (i in seq_along(linhas)) {

    # Identifica a linha correspondente no data frame
    # A primeira linha da impressao contem os nomes das colunas
    row_index <- i - 1L

    # Verifica se a linha deve receber uma cor
    if (row_index %in% n) {

      # Localiza a cor correspondente a linha selecionada
      j <- match(row_index, n)

      # Obtem a funcao responsavel pela cor
      cor <- get(color[j], envir = asNamespace("crayon"))

      # Imprime a linha com a cor selecionada
      cat(cor(linhas[i]), "\n")

    } else {

      # Imprime a linha sem alterar sua cor
      cat(linhas[i], "\n")
    }
  }

  # Verifica se foi fornecida uma legenda
  if (!is.null(legend)) {

    # Imprime o titulo da legenda
    cat("\n")
    cat(crayon::bold("Qualificacao/Rebaixamento:"), "\n")

    # Percorre as cores e seus respectivos significados
    for (cor_nome in names(legend)) {

      # Obtem a funcao correspondente a cor
      cor <- get(cor_nome, envir = asNamespace("crayon"))

      # Imprime a cor e sua descricao
      cat(
        "  ",
        cor(paste0("\u25A0 ", cor_nome)),
        " - ",
        legend[[cor_nome]],
        "\n",
        sep = ""
      )
    }
  }

  # Retorna o objeto original sem exibi-lo novamente
  invisible(x)
}
