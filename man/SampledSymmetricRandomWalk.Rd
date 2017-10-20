\name{sampledSymmetricRandomWalk}
\alias{sampledSymmetricRandomWalk}
\title{Generator of a single path of sampled symmetric random walk}
\usage{
sampledSymmetricRandomWalk( steps = 3000,
                            prob = c('head' = 0.5, 'tail' = 0.5))
}
\arguments{
\item{steps}{Number of steps of the random walk}
\item{prob}{Probability of occurence of head and tail for each step}
}
\description{
Generator of symmetric random walk sampled only one time.
It means it corresponds to a single random walk's path.
}
\examples{
# Generate a 150 steps symmetric random walk
sampledSymmetricRandomWalk(steps = 150)
}
