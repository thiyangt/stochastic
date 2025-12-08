
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

## Use cases

### n-step transition probability matrix

``` r
library(stochastic)
x <- c(0.2,0.8,0.4,0.6)
nstepmat(x, 2, 3)
#> [1] "The one-step transition probability matrix is:"
#>      [,1] [,2]
#> [1,]  0.2  0.8
#> [2,]  0.4  0.6
#> [1] "The 3 -step transition probability matrix is:"
#>       [,1]  [,2]
#> [1,] 0.328 0.672
#> [2,] 0.336 0.664
nstepmat(x, 2, 13)
#> [1] "The one-step transition probability matrix is:"
#>      [,1] [,2]
#> [1,]  0.2  0.8
#> [2,]  0.4  0.6
#> [1] "The 13 -step transition probability matrix is:"
#>           [,1]      [,2]
#> [1,] 0.3333333 0.6666667
#> [2,] 0.3333333 0.6666667
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
#>   [1] "Sunny" "Rainy" "Rainy" "Sunny" "Sunny" "Sunny" "Rainy" "Rainy" "Rainy"
#>  [10] "Rainy" "Rainy" "Sunny" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy"
#>  [19] "Rainy" "Sunny" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy"
#>  [28] "Sunny" "Sunny" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy" "Sunny"
#>  [37] "Rainy" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Sunny" "Sunny"
#>  [46] "Sunny" "Sunny" "Rainy" "Sunny" "Sunny" "Sunny" "Sunny" "Sunny" "Sunny"
#>  [55] "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy" "Rainy" "Rainy"
#>  [64] "Sunny" "Rainy" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy"
#>  [73] "Sunny" "Rainy" "Rainy" "Rainy" "Sunny" "Rainy" "Sunny" "Rainy" "Rainy"
#>  [82] "Rainy" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy" "Rainy" "Sunny" "Rainy"
#>  [91] "Sunny" "Sunny" "Rainy" "Sunny" "Sunny" "Rainy" "Rainy" "Sunny" "Sunny"
#> [100] "Rainy" "Rainy"
```
