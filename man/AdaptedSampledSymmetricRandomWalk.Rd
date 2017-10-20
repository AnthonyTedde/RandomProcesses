\name{adaptedSampledSymmetricRandomWalk}
\alias{adaptedSampledSymmetricRandomWalk}
\title{Generator of a sinle path of sampled symmetric random walk along with the description of each of its steps}
\usage{
adaptedSampledSymmetricRandomWalk(steps = 3000,
                                  prob = c('head' = 0.5, 'tail' = 0.5))
}
\arguments{
\item{steps}{Number of steps of the random walk}
\item{prob}{Probability of occurence of head and tail for each step}
}
\description{
Generator of symmetric random walk sampled only one time along with its time periods.
The time period goes from 0 up to T (0: steps)
It corresponds to a single random walk's path with each of its associated time period.
}
\examples{
# Generate a 150 steps symmetric random walk
adaptedSampledSymmetricRandomWalk(steps = 150)
}
