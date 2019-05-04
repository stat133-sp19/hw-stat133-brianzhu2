#' @title Plot of binomial distribution
#' @description Plots a histogram of the probabilities for each number of successes
#' @param x an object of class \code{"bindis"}
#' @export
#' @examples
#'  \dontrun{
#'  # plot probability distribution of a binomial random variable
#'  prob <- 0.5
#'  trials <- 5
#'  pdf <- bin_distribution(prob, trials)
#'  plot(pdf)
#'  }
plot.bindis <- function(x) {
  barplot(x$probability, names.arg = x$success, border = NA, las = 0,
          main = "Binomial Probability Distribution Function",
          xlab = "number of successes",
          ylab = "probability")
  title("Binomial Probability Distribution Function")
}

#' @title Plot of cumulative binomial distribution
#' @description Plots a line for the cumulative probability over number of successes
#' @param x an object of class \code{"bincum"}
#' @param prob probability of random variable
#' @param trials number of trials
#' @export
#' @examples
#'  \dontrun{
#'  # plot cumulative distribution of a binomial random variable
#'  prob <- 0.5
#'  trials <- 5
#'  cdf <- bin_cumulative(prob, trials)
#'  plot(cdf)
#'  }
plot.bincum <- function(x) {
  plot(x$success, x$probability, type = "b", ylim = c(0, 1), las = 0,
       main = "Binomial Cumulative Distribution Function",
       xlab = "number of successes",
       ylab = "cumulative probability")
}