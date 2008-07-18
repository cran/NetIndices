\name{AscInd}
\alias{AscInd}
\title{Ascendency network indices}
\description{Calculates measures of system growth and development: Ascendency, Overhead and Capacity for several (sub)networks}
\usage{AscInd(Flow=NULL, Tij=t(Flow), Import=NULL, 
  Export=NULL, Dissipation=NULL)}
\arguments{
  \item{Flow }{Network matrix with Flow[i,j] the flow from i (row) to j (column); component positions in rows and columns must be the same; 
    if present, rownames or columnnames denote the compartment names}
  \item{Tij }{Network matrix where connectance is from column j to row i; component positions in rows and columns must be the same ;
    if present, rownames or columnnames denote the compartment names}
  \item{Import }{Vector with either the *indices* or the *names* of \emph{external} compartmens from where flow enters the network; the indices point to the \bold{column} positions in \code{Tij} (and the row positions in Flow)}
  \item{Export }{Vector with either the *indices* or the *names* of \emph{external} compartmens to where flow leaves the network; the indices point to the \bold{row} positions in \code{Tij} (and the column positions in Flow)}
  \item{Dissipation }{Vector with either the *indices* or the *names* to \emph{external} compartments that dissipate flows (e.g. respiration); the indices point to the \bold{row} positions in \code{Tij} (and the column positions in Flow)}
}
\value{
   A matrix with ascendency values (columns) for several subnetworks (rows).
   
The subnetworks (rows) are:
\cr \code{total} network
\cr \code{internal} network (excluding flows from and to external)
\cr \code{import} flows
\cr \code{export} flows; this includes the usuable and unusable flows (i.e. +dissipation)
\cr \code{dissipation} flows

The ascendency indices comprise (columns:)
\cr \code{asc} the ascendency of the network, a measure of growth and development
\cr \code{overh} the overhead of the network
\cr \code{cap} the development capacity of the network, an upper bound on ascendency
\cr \code{ACratio} the ratio of ascendency and capacity
                          
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>,
   Julius kipkeygon Kones<jkones@uonbi.ac.ke>}
\examples{# The takapoto atoll network
AscInd(Takapoto,Import ="CO2",
       Export=c("CO2","Sedimentation","Grazing"),
       Dissipation="CO2")
       
# Conesprings is the example set 1a from Latham 2006.
as.data.frame(AscInd(Tij=Conesprings,Import="Inflows",
    Export=c("Export","Dissipation"),Dissipation="Dissipation"))}
\references{Latham LG. 2006. Network flow analysis algorithms. Ecological Modelling 192: 586-600.
  \cr Ulanowicz RE. 2000. Ascendency: a measure of ecosystem performacne. Jorgensen SE, Muller F, editors. Handbook of Ecosystem Theories and Management. Lewis Publishers, Boca Raton, p303-315.
  \cr Ulanowicz RE, Norden JS. 1990. Symmetrical overhead in flow networks. International Journal of System Science 21: 429-437.}
\details{The mathematical formulation of these indices can be found in the package vignette - \emph{vignette("NetIndices")}.

The PDF can be found in the subdirectory \file{doc} of the NetIndices package}
\keyword{utilities}
