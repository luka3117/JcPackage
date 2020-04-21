\name{count.to.case}
\alias{count.to.case}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
changing grouped data frame into ordinary data frame
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
count.to.case(df, count.variabe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df}{
data frame with count
}
  \item{count.variabe}{
variable name contains count, character \code{"Freq"}
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
titanic <- as.data.frame(Titanic)
count.to.case(titanic, "Freq")
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
