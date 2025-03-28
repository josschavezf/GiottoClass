% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aggregate.R
\name{calculateOverlap}
\alias{calculateOverlap}
\alias{calculateOverlap,giotto,missing-method}
\alias{calculateOverlap,giottoPolygon,giottoPoints-method}
\alias{calculateOverlap,giottoPolygon,giottoLargeImage-method}
\alias{calculateOverlap,giottoPolygon,giottoAffineImage-method}
\alias{calculateOverlap,giottoPolygon,SpatRaster-method}
\alias{calculateOverlap,SpatVector,SpatRaster-method}
\alias{calculateOverlap,SpatVector,SpatVector-method}
\title{Calculate features overlapped by polygons}
\usage{
\S4method{calculateOverlap}{giotto,missing}(
  x,
  name_overlap = NULL,
  spatial_info = NULL,
  feat_info = NULL,
  image_names = NULL,
  poly_subset_ids = NULL,
  return_gobject = TRUE,
  verbose = TRUE,
  ...
)

\S4method{calculateOverlap}{giottoPolygon,giottoPoints}(
  x,
  y,
  name_overlap = NULL,
  poly_subset_ids = NULL,
  feat_subset_column = NULL,
  feat_subset_ids = NULL,
  count_info_column = NULL,
  return_gpolygon = TRUE,
  verbose = TRUE,
  ...
)

\S4method{calculateOverlap}{giottoPolygon,giottoLargeImage}(
  x,
  y,
  name_overlap = NULL,
  poly_subset_ids = NULL,
  return_gpolygon = TRUE,
  verbose = TRUE,
  ...
)

\S4method{calculateOverlap}{giottoPolygon,giottoAffineImage}(
  x,
  y,
  name_overlap = NULL,
  poly_subset_ids = NULL,
  return_gpolygon = TRUE,
  verbose = TRUE,
  ...
)

\S4method{calculateOverlap}{giottoPolygon,SpatRaster}(
  x,
  y,
  name_overlap = NULL,
  poly_subset_ids = NULL,
  return_gpolygon = TRUE,
  verbose = TRUE,
  ...
)

\S4method{calculateOverlap}{SpatVector,SpatRaster}(x, y, poly_subset_ids = NULL, verbose = TRUE, ...)

\S4method{calculateOverlap}{SpatVector,SpatVector}(
  x,
  y,
  poly_subset_ids = NULL,
  feat_subset_column = NULL,
  feat_subset_ids = NULL,
  count_info_column = NULL,
  verbose = TRUE
)
}
\arguments{
\item{x}{Object with spatial annotations: \code{giottoPolygon}, or \code{SpatVector}
polygons. Can also be a \code{giotto} object}

\item{name_overlap}{name for the overlap
results (default to feat_info parameter)}

\item{spatial_info}{character. Name polygon information}

\item{feat_info}{character. Name of vector feature information to overlap}

\item{image_names}{character vector. Name(s) of the image feature information
to overlap}

\item{poly_subset_ids}{character vector. (optional) Specific poly_IDs to use}

\item{return_gobject}{return giotto object (default: TRUE)}

\item{verbose}{be verbose}

\item{\dots}{additional params to pass to methods.}

\item{y}{Object with features to overlap: \code{giottoPoints}, \code{giottoLargeImage},
\code{SpatVector} points or \code{SpatRaster}}

\item{feat_subset_column}{character. (optional) feature info attribute to
subset feature points on when performing overlap calculation.}

\item{feat_subset_ids}{(optional) values matched against
in \code{feat_subset_column} in order to subset feature points when performing
overlap calculation.}

\item{count_info_column}{character. (optional) column with count information.
Useful in cases when more than one detection is reported per point.}

\item{return_gpolygon}{default = TRUE. Whether to return the entire
giottoPolygon provided to \code{x}, but with the overlaps information appended or
as a bare terra \code{SpatVector}}
}
\value{
Usually an object of the same class as \code{x}, with the overlaps
information appended. \verb{return_*} logical params usually allow return of
a lower-level representation of the results instead. Only the
\verb{SpatVector,SpatRaster} method is different in that it returns a \code{data.table}
}
\description{
Calculate subcellular points/feature info or image values overlapped by
polygon annotations. This provides a summary of the spatial data overlapped
by the polygon which can be further processed to become an expression matrix.
}
\details{
\code{feat_subset_column}, \code{feat_subset_ids}, and \code{count_info_column} are
specific to overlaps on feature points info, and should not be provided
when overlapping image data. These three params can also be passed to the
\code{giotto} method through the \code{...} param when working with overlaps on feature
points info.
}
\examples{
g <- GiottoData::loadGiottoMini("vizgen")
gpoly <- getPolygonInfo(g,
    polygon_name = "aggregate",
    return_giottoPolygon = TRUE
)
gpoints <- getFeatureInfo(g, return_giottoPoints = TRUE)
gimg <- getGiottoImage(g, image_type = "largeImage")

slot(gpoly, "overlaps") <- NULL
overlaps(gpoly) # Should now be NULL

# detections from 2 z-layers are provided
table(gpoints$global_z)

# calculate all transcripts overlapped
out_all <- calculateOverlap(gpoly, gpoints)
overlaps_all <- overlaps(out_all)
overlaps_all$rna

# calculate z1 only
out_z1 <- calculateOverlap(gpoly, gpoints,
    feat_subset_column = "global_z",
    feat_subset_ids = c(1)
)
overlaps_z1 <- overlaps(out_z1)
overlaps_z1$rna

# overlap image to get sum intensities per cell
out_img <- calculateOverlap(gpoly, gimg, progress = FALSE)
overlaps_img <- overlaps(out_img)
overlaps_img$intensity

# giotto method
# calculate z0 overlaps and return as gobject
out_g <- calculateOverlap(g,
    feat_subset_column = "global_z",
    feat_subset_ids = 0
)
overlaps(getPolygonInfo(out_g, return_giottoPolygon = TRUE))

# note that z0 and z1 nrows match that from the table of global z values.
# With points overlaps, all points are returned, but non-overlapped points
# only have an `NA` value for the `poly_ID` column. Overlapped points will
# have the `poly_ID` of their overlapping polygon.
}
