#' Generate Samples of Square-Root Diffusion
#' 
#' @description 
#' Generate samples of Square-Root Diffusion.
#' 
#' @details 
#' Square-Root Diffusion is described by the following stochastic differential
#' equation:
#' \deqn{dx(t) = k(\theta - x(t))dt + \sigma\sqrt{x(t)}dw(t),}
#' where \eqn{k,\theta,\sigma} are parameters with positive values and 
#' satisfy the condition \eqn{\sigma^2 \leq 2k\theta}, \eqn{w(t)} is a
#' standard Wiener process. In addition, the initial value of \eqn{x(t)} 
#' should be positive, i.e., \eqn{x(0) > 0}. 
#' 
#' Given \eqn{x(s)}, the transition distribution of
#' \eqn{x(t)} for \eqn{t > s} is a noncentral chi-squared distribution
#' multiplied with a scale factor (see Cox et al. 1985), i.e.,
#' \deqn{x(t) = \frac{\sigma^2[1-e^{-k(t-s)}]}{4k} \chi'^2_d
#'       \left(\frac{4k e^{-k(t-s)}}
#'       {\sigma^2[1-e^{-k(t-s)}]}x(s) \right)
#'       ,\quad s < t, }
#'  where \eqn{\chi'^2_d(\lambda)} represents the noncentral chi-squared 
#'  random variable with \eqn{d} degrees of freedom and non-centrality 
#'  parameter \eqn{\lambda}, and \eqn{d=4k\theta/\sigma^2}. 
#' 
#' @param x_0 current value of the Square-Root Diffusion.
#' @param k parameter k, mean-reverting velocity parameter.
#' @param theta parameter \eqn{\theta}, long-run mean.
#' @param sigma parameter \eqn{\sigma}, volatility parameter.
#' @param N length of samples to generate.
#' @param h time interval length.
#' 
#' @return A series of N samples of the Square-Root Diffusion, a vector.
#' @export
#' 
#' @seealso 
#' Sample one-step transition refers to [r_next_srd][r_next_srd()].
#' 
#' @examples 
#' k = 2; theta = 1.5; sigma = 1.6
#' v_0 = theta; N = 200; h = 1
#' r_srd(v_0, k, theta, sigma, N, h)
r_srd <- function(x_0, k, theta, sigma, N, h=1) {
  x_series = rep(0,N)
  x_series[1] = x_0
  # 
  for (n in 1:(N-1)) {
    x_n = r_next_srd(x_0, k, theta, sigma, h)
    x_series[n+1] = x_n
    x_0 = x_n
  }
  return(x_series)
}
