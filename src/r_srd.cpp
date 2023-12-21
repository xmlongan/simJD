#include <Rcpp.h>
#include "cr_next_srd.h"
using namespace Rcpp;

//' @rdname r_srd
// [[Rcpp::export]]
NumericVector cr_srd(double x_0, double k, double theta, double sigma,
              int N, double h) {
  NumericVector x_series(N);
  double x_n;
  x_series[0] = x_0;
  //
  for (int n=1; n < N; n++) {
    x_n = cr_next_srd(x_0,k,theta,sigma,h);
    x_series[n] = x_n;
    x_0 = x_n;
  }
  return x_series;
}