% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculation.R
\name{bin_cumulative}
\alias{bin_cumulative}
\title{Finds cumulative binomial distribution}
\usage{
bin_cumulative(prob, trials)
}
\arguments{
\item{prob}{probability of random variable}

\item{trials}{number of trials}
}
\value{
an object of class \code{"c("bincum", "data.frame")"}
}
\description{
Finds the cumulative probability for each possible number of successes
}
\examples{
 \dontrun{
 # find cumulative distribution of a binomial random variable
 prob <- 0.5
 trials <- 5
 cdf <- bin_cumulative(prob, trials)
 plot(cdf)
 }
}
