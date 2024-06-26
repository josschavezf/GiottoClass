% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slot_accessors.R
\name{getDimReduction}
\alias{getDimReduction}
\title{Get dimension reduction}
\usage{
getDimReduction(
  gobject,
  spat_unit = NULL,
  feat_type = NULL,
  reduction = c("cells", "feats"),
  reduction_method = c("pca", "umap", "tsne"),
  name = "pca",
  output = c("dimObj", "matrix"),
  set_defaults = TRUE
)
}
\arguments{
\item{gobject}{giotto object}

\item{spat_unit}{spatial unit (e.g. "cell")}

\item{feat_type}{feature type (e.g. "rna", "dna", "protein")}

\item{reduction}{reduction on cells or features (e.g. "cells", "feats")}

\item{reduction_method}{reduction method (e.g. "pca", "umap", "tsne")}

\item{name}{name of reduction results}

\item{output}{object type to return as. Either 'dimObj' (default) or 'matrix'
of the embedding coordinates.}

\item{set_defaults}{set default spat_unit and feat_type. Change to FALSE only when
expression and spat_info are not expected to exist.}
}
\value{
dim reduction object (default) or dim reduction coordinates
}
\description{
Function to get a dimension reduction object
}
\examples{
g <- GiottoData::loadGiottoMini("visium")

getDimReduction(g)
}
\seealso{
Other dimensional reduction data accessor functions: 
\code{\link{get_dimReduction}()},
\code{\link{setDimReduction}()},
\code{\link{set_dimReduction}()}

Other functions to get data from giotto object: 
\code{\link{getExpression}()},
\code{\link{getFeatureInfo}()},
\code{\link{getGiottoImage}()},
\code{\link{getMultiomics}()},
\code{\link{getNearestNetwork}()},
\code{\link{getPolygonInfo}()},
\code{\link{getSpatialEnrichment}()},
\code{\link{getSpatialGrid}()},
\code{\link{getSpatialLocations}()},
\code{\link{getSpatialNetwork}()},
\code{\link{get_NearestNetwork}()},
\code{\link{get_dimReduction}()},
\code{\link{get_feature_info}()},
\code{\link{get_giottoImage}()},
\code{\link{get_multiomics}()},
\code{\link{get_polygon_info}()},
\code{\link{get_spatialGrid}()},
\code{\link{get_spatialNetwork}()},
\code{\link{get_spatial_enrichment}()},
\code{\link{get_spatial_locations}()}
}
\concept{dimensional reduction data accessor functions}
\concept{functions to get data from giotto object}
