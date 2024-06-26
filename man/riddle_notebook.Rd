% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/riddle_notebook.R
\name{riddle_notebook}
\alias{riddle_notebook}
\title{riddle_notebook}
\usage{
riddle_notebook(ridl, datafolder, namethisfile, visibility = "public")
}
\arguments{
\item{ridl}{ridl container where the resources should be added}

\item{datafolder}{folder where the data used by the notebook are stored}

\item{namethisfile}{all files are archived based on the name of notebook you created.
The function automatically get the name of the notebook where it is run from,
using
basename(rstudioapi::getSourceEditorContext()$path )}

\item{visibility}{can be  "public" per default or set to private for obscure reasons..}
}
\value{
nothing all analysis files are added as a resources
}
\description{
Archive all crunching files in RIDL
}
\details{
RIDL is UNHCR instance of a CKAN server and is accessible for UNHCR staff at
https://ridl.unhcr.org . It is designed to keep track and
document dataset within an organisation.

You conveniently archive there your generated report and save
the work you did on a notebook: As you have been working on the data, you want
to keep track of it and save your work in a place where it can be useful for
other people and available for peer review and quality assessment.

The function saves within the  the RIDL container you used to get the data
from the following resources:
\itemize{
\item the generated report
\item the source notebook
}

The function behavior is the following -
\enumerate{
\item Get metadata from the RIDL dataset
\item check if the resources to be uploaded is already shared based on the name
\item if already there update, if not create
}

The function relies on   # install.packages("pak")
# pak::pkg_install("edouard-legoupil/riddle")
}
\examples{
## Time to archive your work once done!!
# used in the  RIDL_Notebook markdown template in the package
# if( params$publish == "yes"){
#   namethisfile = basename(rstudioapi::getSourceEditorContext()$path )  
#   riddle_notebook(ridl = params$ridl,
#             datafolder = params$datafolder, 
#             namethisfile =  namethisfile ,
#             visibility =  params$visibility ) }
}
