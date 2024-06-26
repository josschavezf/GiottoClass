% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatial_structures.R
\name{annotate_spatlocs_with_spatgrid_2D}
\alias{annotate_spatlocs_with_spatgrid_2D}
\title{annotate_spatlocs_with_spatgrid_2D}
\usage{
annotate_spatlocs_with_spatgrid_2D(spatloc, spatgrid)
}
\arguments{
\item{spatloc}{spatial_locs slot from giotto object}

\item{spatgrid}{selected spatial_grid slot from giotto object}
}
\value{
annotated spatial location data.table
}
\description{
annotate spatial locations with 2D spatial grid information
}
\examples{
g <- GiottoData::loadGiottoMini("visium")
g <- createSpatialGrid(g, sdimx_stepsize = 5, sdimy_stepsize = 5)
g_spatloc <- getSpatialLocations(g, output = "data.table")
g_spatgrid <- getSpatialGrid(g)

annotate_spatlocs_with_spatgrid_2D(
    spatloc = g_spatloc,
    spatgrid = g_spatgrid
)
}
