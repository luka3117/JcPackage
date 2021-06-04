\name{JcPCA}
\alias{JcPCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
因子分析関数}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
JcFA(m)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{m}{
data frame型、内部で行列に変換, 2列のrotation 変数score}
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
temp<-zemi::USCrime %>%
zemi::JcFA(temp)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
