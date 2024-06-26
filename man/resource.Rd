% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resource.R
\name{resource}
\alias{resource}
\alias{resource_create}
\alias{resource_update}
\alias{resource_upload}
\alias{resource_patch}
\alias{resource_delete}
\title{Work with RIDL resources (files)}
\usage{
resource_create(package_id, res_metadata)

resource_update(id, res_metadata)

resource_upload(package_id, res_metadata)

resource_patch(id, res_metadata)

resource_delete(id)
}
\arguments{
\item{package_id}{The id or name of the dataset to which this resource belongs to.}

\item{res_metadata}{Metadata created by \code{\link{resource_metadata()}}.}

\item{id}{The id or name of the resource.}
}
\value{
metadata resource.

updated metadata resource.

upload metadata resource.
}
\description{
Work with RIDL resources (files)
}
\details{
You must have the necessary permissions to create, edit, or delete
datasets and their resources.

Note that several fields are required for \code{resource_update()}, \code{resource_create()} and
\code{resource_update()} operations to succeed.
Consult \code{\link{resource_metadata()}} for the details.

\code{resource_update()} will check if the resource exists in the dataset.
If the resource name does not exist in the dataset, \code{resource_update()} will
create a new resource. If the resource name already exists in the dataset,
\code{resource_update()} will upload the resource and also increase the number
in the version.

For \code{resource_update()}/\code{resource_patch()} operations, it is recommended to
call \code{resource_show()}, make the desired changes to the result, and then
call \code{resource_update()}/\code{resource_patch()} with it.

The difference between the update and patch methods is that the patch will
perform an update of the provided parameters, while leaving all other
parameters unchanged, whereas the update methods deletes all parameters
not explicitly provided in the \code{metadata}.
}
\examples{
# ## Full example available with the fetch function..
#-----
# ## Test search in prod
# Sys.unsetenv("USE_UAT")
# p <-  dataset_search("rms_v4")
# p
# list_of_resources <- p[["resources"]][[1]]
# knitr::kable(list_of_resources)

#-----
# ## Test search in uat
# Sys.setenv(USE_UAT=1)
# p <-  dataset_search("tests")
# p
# ##take the first one
# ridlid <- as.character(p[9, c("id")])

#-----
# ## Test resource in UAT
# Sys.setenv(USE_UAT=1)
# m <- riddle::dataset_metadata(title = "Testing Riddle Interface",
#                       name = "riddleapitest",
#                       notes = "Making an API test",
#                       owner_org = "americas",  ## be careful- all lower case!!!
#                       visibility = "public",
#                       geographies = "UNSPECIFIED",
#                       external_access_level = "open_access",
#                       data_collector = "myself",
#                       keywords = keywords[c("Environment", "Other")],
#                       unit_of_measurement = "byte",
#                       data_collection_technique = "oth",
#                       archived = "False")
# ## For the above to work - you need to make sure you have at least editor access
# ## to the corresponding container - i.e. owner_org = "exercise-container"
# p <- dataset_create(metadata = m)
# p <-  dataset_show('riddleapitest')
# ## Now testing adding the file "resource.R" as an attachment
# new_attachment <- riddle::resource_metadata(type = "attachment",
#                        url = "resourceR", 
#  upload = httr::upload_file(here::here("R","resource.R") ),
#                         name = "Rscript",
#                        format = "R",
#                        file_type = "report",
#                        version = "1",
#                        visibility = "public" )
 
# r <- resource_create(package_id = p$id,  res_metadata = new_attachment )
# resource_create(package_id = p$name,  res_metadata = new_attachment )
# ## Like before, the return value is a tibble representation of the resource.
# r

# ## Another example with a data ressource
# m <- riddle::resource_metadata(type = "data",
#                        url = "mtcars.csv",
#   upload = httr::upload_file(system.file("extdata/mtcars.csv", package = "readr")),         
#                        name = "mtcars.csv",
#                        format = "csv",
#                        file_type = "microdata",
#                        date_range_start = "1973-01-01",
#                        date_range_end = "1973-12-31",
#                        version = "1",
#                        visibility = "public",
#                        process_status = "raw",
#                        identifiability = "anonymized_public")
# r <- resource_create(package_id = p$id, 
#                          res_metadata = m )
# ## let's get again the details of the dataset we want to add the resource in..
# r 
 
# ## and now can search for it - checking it is correctly there... 
#  resource_search("name:mtcarsriddle")

# ## And once we’re done experimenting with the API, we should take down our
# ## toy dataset since we don’t really need it on RIDL.
# dataset_delete(p$id)

# The return value is a representation of the dataset we just created in
# RIDL that you could inspect like any other R object.
# p
## Now deleting this!
# dataset_delete(id = p$id)


}
