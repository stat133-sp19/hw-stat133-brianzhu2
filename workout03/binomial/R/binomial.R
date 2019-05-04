#' @title Binomial Variable
#' @description Creates an object of class \code{"binvar"}
#' @param prob probability of random variable
#' @param trials number of trials
#' @return an object of class \code{"binvar"}
#' @export
#' @examples
#'  \dontrun{
#'  bin <- bin_variable(prob = 0.5, trials = 5)
#'  binsum <- summary(bin)
#'  bin
#'  binsum 
#'  }
bin_variable <- function(prob = 0.5, trials = 10) {
  check_prob(prob)
  check_trials(trials)
  object <- list(prob = prob,
                 trials = trials)
  class(object) <- "binvar"
  object
}

#' @title Binomial Mean
#' @description Finds the binomial mean for a given probability and number of trials
#' @param prob probability of random variable
#' @param trials number of trials
#' @return a numeric value
#' @export
#' @examples
#'  \dontrun{
#'  bin_mean(prob = 0.5, trials = 5)
#'  }
bin_mean <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  aux_mean(prob = prob, trials = trials)
}

#' @title Binomial Variance
#' @description Finds the binomial variance for a given probability and number of trials
#' @param prob probability of random variable
#' @param trials number of trials
#' @return a numeric value
#' @export
#' @examples
#'  \dontrun{
#'  bin_variance(prob = 0.5, trials = 5)
#'  }
bin_variance <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  aux_variance(prob = prob, trials = trials)
}

#' @title Binomial Mode
#' @description Finds the binomial mode for a given probability and number of trials
#' @param prob probability of random variable
#' @param trials number of trials
#' @return a numeric value
#' @export
#' @examples
#'  \dontrun{
#'  bin_mode(prob = 0.5, trials = 5)
#'  }
bin_mode <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  aux_mode(prob = prob, trials = trials)
}

#' @title Binomial Skewness
#' @description Finds the binomial skewness for a given probability and number of trials
#' @param prob probability of random variable
#' @param trials number of trials
#' @return a numeric value
#' @export
#' @examples
#'  \dontrun{
#'  bin_skewness(prob = 0.5, trials = 5)
#'  }
bin_skewness <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  aux_skewness(prob = prob, trials = trials)
}

#' @title Binomial Kurtosis
#' @description Finds the binomial kurtosis for a given probability and number of trials
#' @param prob probability of random variable
#' @param trials number of trials
#' @return a numeric value
#' @export
#' @examples
#'  \dontrun{
#'  bin_kurtosis(prob = 0.5, trials = 5)
#'  }
bin_kurtosis <- function(prob, trials) {
  check_prob(prob)
  check_trials(trials)
  aux_kurtosis(prob = prob, trials = trials)
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial Variable"\n\n')
  cat("Parameters\n")
  cat(sprintf("- number of trials: %s\n", x$trials))
  cat(sprintf("- probability of success: %s\n", x$prob))
  invisible(x)
}

#' @export
summary.binvar <- function(x, ...) {
  object <- list(trials = x$trials,
                 prob = x$prob,
                 mean = aux_mean(prob = x$prob, trials = x$trials),
                 variance = aux_variance(prob = x$prob, trials = x$trials),
                 mode = aux_mode(prob = x$prob, trials = x$trials),
                 skewness = aux_skewness(prob = x$prob, trials = x$trials),
                 kurtosis = aux_kurtosis(prob = x$prob, trials = x$trials))
  class(object) <- "summary.binvar"
  object
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat(sprintf("- number of trials: %s\n", x$trials))
  cat(sprintf("- probability of success: %s\n\n", x$prob))
  cat("Measures\n")
  cat(sprintf("- mean: %s\n", x$mean))
  cat(sprintf("- variance: %s\n", x$variance))
  cat(sprintf("- mode: %s\n", x$mode))
  cat(sprintf("- skewness: %s\n", x$skewness))
  cat(sprintf("- kurtosis: %s\n", x$kurtosis))
  invisible(x)
}

# auxiliary function to find expected value given n trials with probability p
aux_mean <- function(prob, trials) {
  trials * prob
}

# auxiliary function to find variance given n trials with probability p
aux_variance <- function(prob, trials) {
  trials * prob * (1 - prob)
}

# auxiliary function to find mode given n trials with probability p
aux_mode <- function(prob, trials) {
  as.integer(trials * prob + prob)
}

# auxiliary function to find skewness given n trials with probability p
aux_skewness <- function(prob, trials) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}

# auxiliary function to find kurtosis given n trials with probability p
aux_kurtosis <- function(prob, trials) {
  (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
}

# private function to check probability
check_prob <- function(prob) {
  if (!is.numeric(prob)) {
    stop("\n'prob' must be a numeric value")
  }
  if (length(prob) > 1) {
    stop("\n'prob' must be a single value")
  }
  if (prob < 0 | prob > 1) {
    stop("\n'prob' must be between 0 and 1")
  }
  TRUE
}

# private function to check trials
check_trials <- function(trials) {
  if (length(trials) > 1) {
    stop("\n'trials' must be a single value")
  }
  if (trials != round(trials)) {
    stop("\n'trials' must be an integer")
  }
  if (trials < 0) {
    stop("\n'trials' cannot be negative")
  }
  TRUE
}

# private function to check success
check_success <- function(success, trials) {
  if (any(success != round(success))) {
    stop("\n'success' must be integer values")
  }
  if (any(is.na(success))) {
    stop("\n'success' cannot contain missing values")
  }
  if (any(success < 0)) {
    stop("\n'success' cannot be negative")
  }
  if (any(success > trials)) {
    stop("\n'success' cannot be greater than trials")
  }
TRUE
}