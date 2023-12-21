#include <Rcpp.h>
#include <Rmath.h>
#include <cmath>
using namespace Rcpp;

//' @rdname r_next_srd
// [[Rcpp::export]]
double cr_next_srd(double x_0, double k, double theta, double sigma,
                   double h) {
  double c, df, ncp, x_t;
  c = (sigma*sigma) * (1-std::exp(-k*h))/(4*k);  // scale factor
  df = 4*k*theta / (sigma*sigma);                // degrees of freedom
  ncp = std::exp(-k*h) * x_0 / c;                // non-centrality parameter
  // 
  x_t = c * R::rnchisq(df, ncp);
  return x_t;
}