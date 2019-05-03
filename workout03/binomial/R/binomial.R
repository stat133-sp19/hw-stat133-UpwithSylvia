##1.1
# to check whether the input prob is a valid probability value (i.e. 0 <= p <= 1)
check_prob <- function(prob) {
  if (prob<0 | prob>1) {
    stop("invalid prob value")
  }
  TRUE
}


# to check whether the input trials is a valid value for number of trials (i.e. n is a non-negative integer)
check_trials <- function(trials) {
  if (trials < 0) {
    stop("invalid trials value")
  }
  TRUE
}

# to test if an input success is a valid value for number of successes (i.e. 0 <= k <= n)
check_success <- function(success, trials) {
  for (i in success)
    if (is.numeric(i) == F) {
      stop("the success value has to be numeric")
    }
  if (i > trials | i < 0) {
    stop("invalid success value")
  }
  TRUE
}


#1.2
# to get the mean value of the binomial distribution
aux_mean = function (trials, prob) {
  mean = trials * prob
  return (mean)
}

# to get the variance value of the binomial distribution
aux_variance = function (trials, prob) {
  variance = trials*prob*(1-prob)
  return (variance)
}

# to get the mode value of the binomial distribution
aux_mode = function (trials, prob) {
  mode = as.integer(trials*prob + prob)
  return (mode)
}

# to get the skewness value of the binomial distribution
aux_skewness = function (trials, prob) {
  skewness = (1 - 2*prob) / (trials*prob*(1-prob))^0.5
  return (skewness)
}

# to get the kurtosis value of the binomial distribution
aux_kurtosis = function (trials, prob) {
  kurtosis = (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return (kurtosis)
}

# 1.3
#' @title bin choose function
#' @description calculate the number of combinations in which k successes can occur in n trials
#' @param n number of trials (intger)
#' @param k number of success (intger)
#' @return the calculated number of combinations in which k successes can occur in n trials
#' @export
bin_choose = function (n, k) {
  for (i in k) {
    if (i > n) {
      stop("k cannot be greater than n")
    }
  }
  result = factorial(n)/(factorial(k)*factorial(n-k))
  return (result)
}




#1.4
#' @title bin probability function
#' @description calculate the binomial probability
#' @param success number of success (intger)
#' @param trials number of trials (intger)
#' @param prob probability of success on each trial (numeric)
#' @return the calculated binomial probability
#' @export
bin_probability = function (success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  probability = bin_choose(trials,success)*prob^success*(1-prob)^(trials-success)
  return (probability)
}




#1.5
#' @title bin distribution function
#' @description calculate the binomial distribution
#' @param trials number of trials (intger)
#' @param prob number of success (intger)
#' @return a dataframe with the probability distribution of each successes with certain probability and trials
#' @export
bin_distribution = function(trials, prob) {
  success = 0:trials
  probability = bin_probability(success, trials, prob)
  result = data.frame(success, probability)
  class(result) = c("bindis", "data.frame")
  return (result)
}

library(ggplot2)
#' @export
plot.bindis = function(data) {
  ggplot(data, aes(x = data$success, y = data$probability)) +
    geom_bar(stat="identity") + labs(x = "success", y = "probablility") + ggtitle("binomial probability distribution")
}


#1.6
#' @title bin cumulative function
#' @description calculate the binomial probability distribution and the cumulative distribution
#' @param trials number of trials (intger)
#' @param prob number of success (intger)
#' @return a dataframe with both the probability distribution and the cumulative distribution of each successes certain with probability and trials
#' @export
bin_cumulative = function(trials, prob) {
  success = 0:trials
  probability = bin_probability(success, trials, prob)
  cumulative = probability
  for (i in seq(2, length(cumulative))) {
    cumulative[i] = cumulative[i] + cumulative[i-1]
  }
  result = data.frame(success, probability, cumulative)
  class(result) = c("bincum", "data.frame")
  return(result)
}

#' @export
plot.bincum = function(data) {
  ggplot(data, aes(x = data$success, y = data$cumulative)) +
    geom_line(stat="identity") + labs(x = "success", y = "probablility") + geom_point(shape=1) +  ggtitle("binomial cumulative distribution")
}


#1.7
#' @title bin variable function
#' @description get an object of class "binvar" , a binomial random variable object
#' @param trials number of trials (intger)
#' @param prob number of success (intger)
#' @return an object of class "binvar" , a binomial random variable object
#' @export
bin_variable = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  result = list(trials = trials, prob = prob)
  class(result) = "binvar"
  return(result)
}

#' @export
print.binvar <- function(result) {
  cat('"Binomial variable"\n\n')
  cat('Paramaters\n')
  cat('- number of trials:', result[[1]], '\n')
  cat('- prob of success:', result[[2]])
}

#' @export
summary.binvar <- function(result){
  mean = aux_mean(result[[1]], result[[2]])
  variance = aux_variance(result[[1]], result[[2]])
  mode = aux_mode(result[[1]], result[[2]])
  skewness = aux_skewness(result[[1]], result[[2]])
  kurtosis = aux_kurtosis(result[[1]], result[[2]])
  sum = list(trials = result[[1]], prob = result[[2]], mean = mean, variance = variance, mode = mode, skewness = skewness, kurtosis = kurtosis)
  class(sum) = "summary.binvar"
  return(sum)
}

#' @export
print.summary.binvar = function(result) {
  cat('"Summary Binomial"\n\n')
  cat('Paramaters\n')
  cat('- number of trials:', result[[1]], '\n')
  cat('- prob of success:', result[[2]], '\n\n')
  cat('Measures\n')
  cat('- mean    :', result[[3]], '\n')
  cat('- variance:', result[[4]], '\n')
  cat('- mode    :', result[[5]], '\n')
  cat('- skewness:', result[[6]], '\n')
  cat('- kurtosis:', result[[7]], '\n')
}


#' @export
bin_mean = function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}
#' @export
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}
#' @export
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}
#' @export
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}
#' @export
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}




