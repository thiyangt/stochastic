
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stochastic

<!-- badges: start -->

<!-- badges: end -->

The goal of stochastic is to provide calculations related to the Markov
chain processes.

## Installation

You can install the development version of stochastic from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("thiyangt/stochastic")
```

## Examples

### n-step transition probability matrix

``` r
library(stochastic)
x <- c(0.7,0.3,0.4,0.6)
nstepmat(x, 2, 3)
#> [1] "The one-step transition probability matrix is:"
#>      [,1] [,2]
#> [1,]  0.7  0.3
#> [2,]  0.4  0.6
#> [1] "The 3 -step transition probability matrix is:"
#>       [,1]  [,2]
#> [1,] 0.583 0.417
#> [2,] 0.556 0.444
nstepmat(x, 2, 13)
#> [1] "The one-step transition probability matrix is:"
#>      [,1] [,2]
#> [1,]  0.7  0.3
#> [2,]  0.4  0.6
#> [1] "The 13 -step transition probability matrix is:"
#>           [,1]      [,2]
#> [1,] 0.5714286 0.4285714
#> [2,] 0.5714285 0.4285715
```

### Compute stationary probabilities

``` r
mat <- matrix(c(0.5, 0.5, 0.7, 0.3), byrow=TRUE, ncol=2)
stationary_prob(onestep=mat)
#> [1] 0.5833333 0.4166667
```

### Simulate a Markov Chain process

``` r
init <- c(0.1, 0.9)
mat <- matrix(c(0.5, 0.5, 0.7, 0.3), byrow=TRUE, ncol=2)
simmarkov(init, mat, 100, c("Rainy", "Sunny"))
#>   [1] "Sunny" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Sunny"
#>  [10] "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy"
#>  [19] "Sunny" "Sunny" "Sunny" "Rainy" "Rainy" "Sunny" "Sunny" "Sunny" "Sunny"
#>  [28] "Sunny" "Rainy" "Sunny" "Rainy" "Sunny" "Sunny" "Rainy" "Sunny" "Rainy"
#>  [37] "Sunny" "Rainy" "Sunny" "Sunny" "Sunny" "Sunny" "Sunny" "Sunny" "Rainy"
#>  [46] "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy"
#>  [55] "Rainy" "Rainy" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy"
#>  [64] "Rainy" "Sunny" "Rainy" "Sunny" "Sunny" "Rainy" "Rainy" "Rainy" "Sunny"
#>  [73] "Sunny" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy"
#>  [82] "Rainy" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy"
#>  [91] "Rainy" "Sunny" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Sunny"
#> [100] "Sunny" "Sunny"
```

### Transition diagram

``` r
plot_markov_chain(mat)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />
