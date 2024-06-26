% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auxilliary.R
\name{addFeatMetadata}
\alias{addFeatMetadata}
\title{Add feature metadata}
\usage{
addFeatMetadata(
  gobject,
  feat_type = NULL,
  spat_unit = NULL,
  new_metadata,
  vector_name = NULL,
  by_column = FALSE,
  column_feat_ID = NULL
)
}
\arguments{
\item{gobject}{giotto object}

\item{feat_type}{feature type}

\item{spat_unit}{spatial unit}

\item{new_metadata}{new metadata to use)}

\item{vector_name}{(optional) custom name if you provide a single vector}

\item{by_column}{merge metadata based on \emph{feat_ID} column
in \code{\link{fDataDT}}}

\item{column_feat_ID}{column name of new metadata to use if by_column = TRUE}
}
\value{
giotto object
}
\description{
Adds feature metadata to the giotto object
}
\details{
You can add additional feature metadata in several manners:
\itemize{
\item{1. Provide a data.table or data.frame with feature annotations in
the same order as the \emph{feat_ID} column in fDataDT(gobject) This is
a bit risky and not the most recommended.}
\item{2. Provide a data.table or data.frame with feature annotations and
specify which column contains the feature IDs, these feature IDs need to
match with the \emph{feat_ID} column in fDataDT(gobject)}
\item{3. Provide a vector or factor that is named with the feature IDs
they correspond to. These names will be matched against
the \emph{feat_ID} column in fDataDT(gobject).}
}
}
\examples{
g <- GiottoData::loadGiottoMini("visium")

m <- fDataDT(g)
m <- m[, "feat_ID"]
m$new_feat_ID <- paste0("gene_", m$feat_ID)

g <- addFeatMetadata(
    g,
    new_metadata = m,
    by_column = TRUE,
    column_feat_ID = "feat_ID"
)

fDataDT(g)
}
