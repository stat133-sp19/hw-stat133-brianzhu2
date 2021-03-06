% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.bindis}
\alias{plot.bindis}
\title{Plot of binomial distribution}
\usage{
\method{plot}{bindis}(x)
}
\arguments{
\item{x}{an object of class \code{"bindis"}}
}
\description{
Plots a histogram of the probabilities for each number of successes
}
\examples{
 \dontrun{
 # plot probability distribution of a binomial random variable
 prob <- 0.5
 trials <- 5
 pdf <- bin_distribution(prob, trials)
 plot(pdf)
 }
}
