// [[Rcpp::depends(RcppProgress)]]
#include <progress.hpp>

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List loop_simulacao_cpp(
    int nsim,
    SEXP data, int rodada, int n_partidas, int n_rodadas,
    SEXP res, double meanCBPfm, double meanCBPsm,
    double meanCBPfv, double meanCBPsv,
    SEXP Lib, SEXP CopaBR,
    Function sim,
    bool progresso
) {

  List sims(nsim);

  // Cria a barra de progresso do RcppProgress
  Progress p(nsim, progresso);

  for (int i = 0; i < nsim; ++i) {

    sims[i] = sim(data, rodada, n_partidas, n_rodadas, res,
                  meanCBPfm, meanCBPsm, meanCBPfv, meanCBPsv,
                  nsim, Lib, CopaBR);

    p.increment(); // Atualiza a barra

    if ((i + 1) % 100 == 0) {
      Rcpp::checkUserInterrupt();
    }
  }

  return sims;
}
