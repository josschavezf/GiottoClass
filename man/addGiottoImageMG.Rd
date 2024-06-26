% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/images.R
\name{addGiottoImageMG}
\alias{addGiottoImageMG}
\title{addGiottoImageMG}
\usage{
addGiottoImageMG(
  gobject,
  images,
  spat_unit = NULL,
  spat_loc_name = NULL,
  scale_factor = NULL,
  negative_y = TRUE
)
}
\arguments{
\item{gobject}{giotto object}

\item{images}{list of giotto image objects,
see \code{\link{createGiottoImage}}}

\item{spat_unit}{spatial unit}

\item{spat_loc_name}{provide spatial location slot in Giotto to align
images. Defaults to first one}

\item{scale_factor}{provide scale of image pixel dimensions relative to
spatial coordinates.}

\item{negative_y}{Map image to negative y spatial values if TRUE during
automatic alignment. Meaning that origin is in upper left instead of lower
left.}
}
\value{
an updated Giotto object with access to the list of images
}
\description{
Adds giotto image objects to your giotto object
}
\examples{
g <- GiottoData::loadGiottoMini("visium")
g_image <- getGiottoImage(g, image_type = "largeImage")

addGiottoImageMG(g, images = list(g_image))
}
