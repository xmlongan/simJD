#' Generate Next Sample of Square-Root Diffusion
#' 
#' @description 
#' Generate next sample of Square-Root Diffusion given a current value x_0.
#' 
#' @details 
#' Square-Root Diffusion is described by the following stochastic differential
#' equation:
#' \deqn{dx(t) = k(\theta - x(t))dt + \sigma\sqrt(x(t))dw(t),}
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
#'  parameter \eqn{\lambda}, and \eqn{d=4k_i\theta_i/\sigma_{xi}^2}. 
#' 
#' @param x_0 current value of the Square-Root Diffusion.
#' @param k parameter k, mean-reverting velocity parameter.
#' @param theta parameter \eqn{\theta}, long-run mean.
#' @param sigma parameter \eqn{\sigma}, volatility parameter.
#' @param h time interval length.
#' 
#' @return Next sample of the Square-Root Diffusion, a scale value.
#' @export
#' 
#' @examples 
#' k = 2; theta = 1.5; sigma = 1.6; v_0 = theta; h = 1
#' r_next_srd(v_0, k, theta, sigma, h)
r_next_srd <- function(x_0, k, theta, sigma, h=1) {
  c = sigma^2*(1-exp(-k*h))/(4*k) # scale factor
  df = 4*k*theta/sigma^2          # degrees of freedom
  ncp = exp(-k*h)*x_0/c           # non-centrality parameter
  # 
  x_t = c * rchisq(1, df, ncp)
  return(x_t)
}
