# introcausaldata

<!-- badges: start -->

[![R-CMD-check](https://github.com/mpancia/firstcoursecausaldata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mpancia/firstcoursecausaldata/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

An R data package accompanying Peng Ding's (2024) book *A First Course in Causal Inference*. This package contains datasets used to illustrate key concepts and methods in causal inference research.

## Installation

You can install the development version of `firstcoursecausaldata` from GitHub:

``` r
# Install devtools if you don't have it already
# install.packages("devtools")

# Install the package from GitHub
devtools::install_github("mpancia/firstcoursecausaldata")
```

## Datasets

-   **lalonde**: National Supported Work program data from Lalonde (1986) for evaluating treatment effects
-   **resumecallback**: Resume audit study data from Bertrand and Mullainathan (2004) on racial discrimination in hiring
-   **finasteride**: Multicenter trial data from Gould (1998) studying finasteride treatment for benign prostatic hyperplasia
-   **imbens2015star**: Student/Teacher Achievement Ratio (STAR) experiment data from Imbens and Rubin (2015) evaluating class size effects on student achievement
-   **koenker2002**: Job training program data from Koenker and Xiao (2002) studying duration before employment with stratified randomization on quarter

## License

This package is licensed under CC0. See [LICENSE.md](LICENSE.md) for details.
