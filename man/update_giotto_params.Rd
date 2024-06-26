% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function_logging.R
\name{update_giotto_params}
\alias{update_giotto_params}
\title{Update giotto parameters}
\usage{
update_giotto_params(
  gobject,
  description = "_test",
  return_gobject = TRUE,
  toplevel = 2
)
}
\arguments{
\item{gobject}{giotto object}

\item{description}{description of function run}

\item{return_gobject}{logical. Whether the giotto object should be returned}

\item{toplevel}{expected relative stackframe where call that is being
recorded was made}
}
\value{
giotto object or list of parameters
}
\description{
Update giotto parameters
}
\examples{
g <- GiottoData::loadGiottoMini("visium")

update_giotto_params(g, toplevel = 1)
}
