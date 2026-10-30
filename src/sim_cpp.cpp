#include <Rcpp.h>
#include <cmath>
using namespace Rcpp;

// Traducao exata da sua funcao pwpois
NumericVector pwpois_cpp(NumericVector q, double lambda1, double lambda2) {
  double lambda = lambda1 + lambda2;
  int n = q.size();
  NumericVector resultado(n);

  for (int i = 0; i < n; ++i) {
    if (q[i] < 0) {
      resultado[i] = 0.0;
    } else {
      double k = std::floor(2.0 * q[i]);
      resultado[i] = R::ppois(k, lambda, true, false);
    }
  }
  return resultado;
}

// Funcao para sortear o gol baseado na probabilidade acumulada
int simular_gols_time(double u, NumericVector escala) {
  for (int k = 0; k < escala.size(); ++k) {
    if (u <= escala[k]) return k;
  }
  return escala.size();
}

// [[Rcpp::export]]
List sim_cpp(
    IntegerVector Rodada,
    CharacterVector Time1,
    CharacterVector Time2,
    IntegerVector GFM,
    IntegerVector GSM,
    IntegerVector GFV,
    IntegerVector GSV,
    int rodada_inicio,
    int n_partidas,
    int n_rodadas,
    double meanCBPfm, double meanCBPsm,
    double meanCBPfv, double meanCBPsv
) {

  // O loop que varre as rodadas (igual ao seu R)
  for (int i = rodada_inicio; i <= n_rodadas; ++i) {

    // ATENCAO: Como as funcoes 'meanCBPxx_atual' nao foram traduzidas para C++,
    // usamos as medias fixas globais.
    // Se quiser atualizar rodada a rodada, precisara passar as medias pre-calculadas
    // como matrizes para o C++.
    double lauxfm = meanCBPfm;
    double lauxsv = meanCBPsv;
    double lauxfv = meanCBPfv;
    double lauxsm = meanCBPsm;

    int j = n_partidas * (i - 1) + 1;

    for (int r = j; r <= (j + n_partidas - 1); ++r) {

      int r_idx = r - 1; // Ajuste do indice R (base 1) para C++ (base 0)

      double lfm, lsv, lfv, lsm;

      if (i == 1) {
        lfm = meanCBPfm; lsv = meanCBPsv;
        lfv = meanCBPfv; lsm = meanCBPsm;
      } else {
        lfm = lauxfm; lsv = lauxsv;
        lfv = lauxfv; lsm = lauxsm;
      }

      NumericVector q = NumericVector::create(0, 1, 2, 3, 4, 5);
      NumericVector escm = pwpois_cpp(q, lfm, lsv);
      NumericVector escv = pwpois_cpp(q, lsm, lfv);

      double u_m = R::runif(0, 1);
      double u_v = R::runif(0, 1);

      int resm = simular_gols_time(u_m, escm);
      int resv = simular_gols_time(u_v, escv);

      GFM[r_idx] = resm;
      GSM[r_idx] = resv;
      GFV[r_idx] = resv;
      GSV[r_idx] = resm;
    }
  }

  // Retorna os vetores preenchidos
  return List::create(
    _["GFM"] = GFM,
    _["GSM"] = GSM,
    _["GFV"] = GFV,
    _["GSV"] = GSV
  );
}
