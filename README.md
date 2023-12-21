# simJD

`simJD`: an R package for simulating Jump-Diffusion models

Currently supports:

-   Square-Root Diffusion (exact simulation)

To-be included:

-   Ornstein-Uhlenbeck Process (exact simulation)
-   some Affine Jump-Diffusion

## Installation

First intall the `devtools` package by `install.packages("devtools")`, and install `Rtools`, then

``` r
library(devtools)
devtools::install_github("xmlongan/simJD")
```

## Example Usage

``` r
library(simJD)

k = 2; theta = 1.5; sigma = 1.6
x_0 = theta; N = 200; h = 1
x_series = r_srd(x_0, k, theta, sigma, N, h)

plot(x_series, type='b', col='blue')
```

## Notes

Refer to the help of each function for details, through such as `?r_srd`.
