#include <Rcpp.h>
using namespace Rcpp;

NumericVector cr_srd(double x_0, double k, double theta, double sigma,
              int N, double h = 1);