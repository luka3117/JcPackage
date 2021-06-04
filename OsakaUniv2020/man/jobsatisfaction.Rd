\name{Satisfaction table}
\alias{Satisfaction table}
\docType{data}
\title{
Satisfaction table
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("Satisfaction table")}
\format{
  A table 3 dimesions
  Income , Job Satisfaction, Gender
  \describe{
    \item{\code{Income}}{value : "<5000","5000-15000","15000-25000",">25000"}
    \item{\code{Job Satisfaction}}{value: "V_D" "L_S" "M_S" "V_S"}
    \item{\code{Gender}}{value: "Female" "Male"}
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

# change to data frame example
Satisfaction <- as.data.frame(Satisfaction);
%>% tbl_df() %>%
Satisfaction <- count.to.case(Satisfaction, "Freq")
}
\keyword{datasets}
