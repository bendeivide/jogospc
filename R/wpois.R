#' Funcao de Probabilidade da Distribuicao W-Poisson
#'
#' Calcula a probabilidade P(W = x) para a variavel aleatoria
#' W = (X1 + X2)/2, onde X1 ~ Poisson(lambda1) e X2 ~ Poisson(lambda2)
#' sao independentes.
#'
#' @param x vetor de valores (multiplos de 0.5: 0, 0.5, 1, 1.5, ...)
#' @param lambda1 parametro da primeira Poisson (lambda1 > 0)
#' @param lambda2 parametro da segunda Poisson (lambda2 > 0)
#' @param log se TRUE, retorna o logaritmo da probabilidade
#'
#' @return vetor de probabilidades P(W = x)
#'
#' @examples
#' dwpois(c(0, 0.5, 1, 1.5, 2), lambda1 = 2, lambda2 = 3)
#'
#' @export
dwpois <- function(x, lambda1, lambda2, log = FALSE) {

  # Verificar se os parametros sao validos
  if (any(lambda1 <= 0)) {
    stop("lambda1 deve ser maior que zero")
  }
  if (any(lambda2 <= 0)) {
    stop("lambda2 deve ser maior que zero")
  }

  # Verificar se x e um multiplo de 0.5
  if (!all(x >= 0 & x == floor(2 * x) / 2)) {
    warning("x deve ser um multiplo de 0.5 (0, 0.5, 1, 1.5, ...)")
    return(rep(0, length(x)))
  }

  # Calcular k = 2x
  k <- round(2 * x)

  # Somar os parametros
  lambda <- lambda1 + lambda2

  # Calcular a probabilidade usando a Poisson
  resultado <- dpois(k, lambda = lambda, log = log)

  return(resultado)
}

#' Funcao de Distribuicao Acumulada da W-Poisson
#'
#' Calcula a probabilidade P(W <= q) para a variavel aleatoria
#' W = (X1 + X2)/2, onde X1 ~ Poisson(lambda1) e X2 ~ Poisson(lambda2)
#' sao independentes.
#'
#' @param q vetor de quantis (valores reais)
#' @param lambda1 parametro da primeira Poisson (lambda1 > 0)
#' @param lambda2 parametro da segunda Poisson (lambda2 > 0)
#' @param lower.tail se TRUE, calcula P(W <= q); se FALSE, P(W > q)
#' @param log.p se TRUE, retorna o logaritmo da probabilidade
#'
#' @return vetor de probabilidades acumuladas
#'
#' @examples
#' pwpois(c(0, 0.5, 1, 1.5, 2), lambda1 = 2, lambda2 = 3)
#'
#' @export
pwpois <- function(q, lambda1, lambda2, lower.tail = TRUE, log.p = FALSE) {

  # Verificar se os parametros sao validos
  if (any(lambda1 <= 0)) {
    stop("lambda1 deve ser maior que zero")
  }
  if (any(lambda2 <= 0)) {
    stop("lambda2 deve ser maior que zero")
  }

  # Somar os parametros
  lambda <- lambda1 + lambda2

  # Para cada valor de q, calcular P(W <= q)
  resultado <- sapply(q, function(qi) {

    # Se q for negativo, a probabilidade e zero
    if (qi < 0) {
      return(0)
    }

    # k = floor(2q) e o maior inteiro tal que k/2 <= q
    k <- floor(2 * qi)

    # P(W <= q) = P(S <= k) onde S ~ Poisson(lambda)
    ppois(k, lambda = lambda, lower.tail = lower.tail, log.p = log.p)
  })

  return(resultado)
}

#' Funcao de Quantis da W-Poisson
#'
#' Calcula o quantil q tal que P(W <= q) = p para a variavel aleatoria
#' W = (X1 + X2)/2, onde X1 ~ Poisson(lambda1) e X2 ~ Poisson(lambda2)
#' sao independentes.
#'
#' @param p vetor de probabilidades (0 <= p <= 1)
#' @param lambda1 parametro da primeira Poisson (lambda1 > 0)
#' @param lambda2 parametro da segunda Poisson (lambda2 > 0)
#' @param lower.tail se TRUE, calcula o quantil de P(W <= q);
#'                   se FALSE, de P(W > q)
#' @param log.p se TRUE, p e interpretado como logaritmo da probabilidade
#'
#' @return vetor de quantis
#'
#' @examples
#' qwpois(c(0.1, 0.25, 0.5, 0.75, 0.9), lambda1 = 2, lambda2 = 3)
#'
#' @export
qwpois <- function(p, lambda1, lambda2, lower.tail = TRUE, log.p = FALSE) {

  # Verificar se os parametros sao validos
  if (any(lambda1 <= 0)) {
    stop("lambda1 deve ser maior que zero")
  }
  if (any(lambda2 <= 0)) {
    stop("lambda2 deve ser maior que zero")
  }

  # Verificar se as probabilidades sao validas
  if (!log.p) {
    if (any(p < 0 | p > 1)) {
      stop("p deve estar entre 0 e 1")
    }
  }

  # Somar os parametros
  lambda <- lambda1 + lambda2

  # Para cada probabilidade p, encontrar o quantil
  resultado <- sapply(p, function(pi) {

    # Casos especiais
    if (!log.p) {
      if (pi == 0) return(0)
      if (pi == 1) return(Inf)
    }

    # Encontrar k = qpois(p, lambda)
    k <- qpois(pi, lambda = lambda,
               lower.tail = lower.tail, log.p = log.p)

    # w = k/2
    return(k / 2)
  })

  return(resultado)
}

#' Geracao de Numeros Aleatorios da W-Poisson
#'
#' Gera n numeros aleatorios da distribuicao de
#' W = (X1 + X2)/2, onde X1 ~ Poisson(lambda1) e X2 ~ Poisson(lambda2)
#' sao independentes.
#'
#' @param n numero de observacoes a serem geradas
#' @param lambda1 parametro da primeira Poisson (lambda1 > 0)
#' @param lambda2 parametro da segunda Poisson (lambda2 > 0)
#'
#' @return vetor de n numeros aleatorios
#'
#' @examples
#' set.seed(123)
#' amostra <- rwpois(1000, lambda1 = 2, lambda2 = 3)
#' mean(amostra)
#' var(amostra)
#'
#' @export
rwpois <- function(n, lambda1, lambda2) {

  # Verificar se os parametros sao validos
  if (any(lambda1 <= 0)) {
    stop("lambda1 deve ser maior que zero")
  }
  if (any(lambda2 <= 0)) {
    stop("lambda2 deve ser maior que zero")
  }

  # Verificar se n e um numero inteiro positivo
  if (length(n) != 1 || n <= 0 || n != round(n)) {
    stop("n deve ser um numero inteiro positivo")
  }

  # Gerar X1 ~ Poisson(lambda1)
  X1 <- rpois(n, lambda = lambda1)

  # Gerar X2 ~ Poisson(lambda2)
  X2 <- rpois(n, lambda = lambda2)

  # Calcular W = (X1 + X2)/2
  W <- (X1 + X2) / 2

  return(W)
}
