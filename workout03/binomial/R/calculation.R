#' @title Counts number of combinations
#' @description Finds n choose k
#' @param n number of trials
#' @param k number of successes
#' @return a vector of combinations corresponding to n choose k
#' @export
#' @examples
#'  \dontrun{
#'  # find combinations for given n and k
#'  trials <- 5
#'  success <- c(2, 3)
#'  choose <- bin_choose(trials, success)
#'  }
bin_choose <- function(n, k) {
  if (length(n) > 1) {
    stop("\nn cannot be a vector")
  }
  if (any(k > n)) {
    stop("\nk cannot be greater than n")
  }
  factorial(n) / factorial(k) / factorial(n - k)
}

#' @title Finds binomial probability
#' @description Finds the probability for each success
#' @param prob probability of random variable
#' @param trials number of trials
#' @param success number of successes
#' @return a vector of probabilities corresponding to success
#' @export
#' @examples
#'  \dontrun{
#'  # find probability of a binomial random variable
#'  prob <- 0.5
#'  trials <- 5
#'  success <- c(2, 3)
#'  probabilty <- bin_probability(prob, trials, success)
#'  }
bin_probability <- function(prob, trials, success) {
  check_prob(prob)
  check_trials(trials)
  check_success(success, trials)
  bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success)
}

#' @title Finds binomial distribution
#' @description Finds the probability for each possible number of successes
#' @param prob probability of random variable
#' @param trials number of trials
#' @return an object of class \code{"c("bindis", "data.frame")"}
#' @export
#' @examples
#'  \dontrun{
#'  # find probability distribution of a binomial random variable
#'  prob <- 0.5
#'  trials <- 5
#'  pdf <- bin_distribution(prob, trials)
#'  plot(pdf)
#'  }
bin_distribution <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  success <- 0:trials
  probability <- bin_probability(prob = prob, trials = trials, success = success)
  object <- data.frame(success = success, probability = probability)
  class(object) <- c("bindis", "data.frame")
  object
}

#' @title Finds cumulative binomial distribution
#' @description Finds the cumulative probability for each possible number of successes
#' @param prob probability of random variable
#' @param trials number of trials
#' @return an object of class \code{"c("bincum", "data.frame")"}
#' @export
#' @examples
#'  \dontrun{
#'  # find cumulative distribution of a binomial random variable
#'  prob <- 0.5
#'  trials <- 5
#'  cdf <- bin_cumulative(prob, trials)
#'  plot(cdf)
#'  }
bin_cumulative <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  success <- 0:trials
  probability <- bin_probability(prob = prob, trials = trials, success = success)
  object <- data.frame(success = success, probability = cumsum(probability))
  class(object) <- c("bincum", "data.frame")
  object
}
