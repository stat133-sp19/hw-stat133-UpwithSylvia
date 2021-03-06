## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(binomial)

## ------------------------------------------------------------------------
bin_var <- bin_variable(trials=10, prob=0.5)
bin_var

## ------------------------------------------------------------------------
bin_sum <- summary(bin_var)
bin_sum

## ------------------------------------------------------------------------
bin_choose(n = 10, k = 4)

## ------------------------------------------------------------------------
bin_probability(success = 3, trials = 6, prob = 0.5)

