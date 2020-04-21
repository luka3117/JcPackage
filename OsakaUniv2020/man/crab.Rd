\name{crab}
\alias{crab}
\docType{data}
\title{
CDA horshoe crab data}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("crab")}
\format{
  A data frame with 173 observations on the following 5 variables.
  \describe{
  "satell", "color", "spine", "width" ,  "weight"
    \item{\code{satell}}{integer}
    \item{\code{color}}{odered categorical variable}
    \item{\code{spine}}{spine condition, categorical variable}
    \item{\code{width}}{cm, continuous variable}
    \item{\code{weight}}{kg, continuous variable}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(crab)
plot(crab) ...
}
\keyword{datasets}
