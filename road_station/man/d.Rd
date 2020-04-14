\name{d}
\alias{d}
\docType{data}
\title{
道の駅データ d
}
\description{
 広島　乙九日祭りに来たお客さんを対象に地産地消に関する意識、購入品目に関するアンケート調査結果、実施日：20171023
 
 ある道の駅では地場産物を多く扱っており、地産地消に取り組んでいる。 

 本調査では、買い物に来た客の地産地消の意識を調べ、購買傾向との関係を把握するためのデータ

 性（1=男性,2=女性）、年齢、地産地消の意識（1=かなり意識している, 2=時々意識している, 3=全く意識していない）、 野菜（1=購入した、0=購入しなかった）、果実（1=購入した、0=購入しなかった）、、、。
 }
\usage{data("d")}
\format{
  A data frame with 69 observations on the following 15 variables.
  \describe{
    \item{\samp{男性}}{a numeric vector, （1=男性,2=女性）}
    \item{\samp{年齢}}{a numeric vector}
    \item{\samp{地産地消意識}}{a numeric vector,（1=かなり意識している, 2=時々意識している, 3=全く意識していない）}
    \item{\samp{野菜~菓子類}}{a numeric vector, (1=購入した、0=購入しなかった)}
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
library(RoadStation)
d
}
\keyword{datasets}
