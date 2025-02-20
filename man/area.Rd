% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-area.R
\name{area}
\alias{area}
\alias{area,giottoPolygon-method}
\alias{area,SpatVector-method}
\title{Get the area of individual polygons}
\usage{
\S4method{area}{giottoPolygon}(x, ...)

\S4method{area}{SpatVector}(x, ...)
}
\arguments{
\item{x}{\code{giottoPolygon}}

\item{...}{additional args to pass}
}
\value{
\code{numeric} vector of spatial area
}
\description{
Compute the area covered by polygons
}
\examples{
sl <- GiottoData::loadSubObjectMini("spatLocsObj")
gpoly <- GiottoData::loadSubObjectMini("giottoPolygon")
gpoints <- GiottoData::loadSubObjectMini("giottoPoints")

# area of polygons
area(gpoly)

# area of the convex hull
area(convHull(sl))
feature_hulls <- convHull(gpoints, by = "feat_ID")
area(feature_hulls)

}
