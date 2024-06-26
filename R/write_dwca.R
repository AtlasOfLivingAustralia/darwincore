#' Write `darwincore` objects to a Darwin Core Archive
#'
#' `write_dwca()` converts a `darwincore` archive to a zip file.
#' @name write_dwca
#' @param .dwc A `darwincore` object
#' @param path (Optional) Name of the zip file. Defaults to `NULL`, indicating
#' that the file in question should be saved to a temporary directory.
#' @return `write_dwca()` is called for the side-effect of building a 'Darwin
#' Core Archive' (i.e. a zip file).
#' @seealso [read_dwca()]
#' @importFrom glue glue
#' @importFrom readr write_csv
#' @importFrom rlang inform
#' @importFrom xml2 write_xml
#' @importFrom zip zip
#' @export
write_dwca <- function(.dwca,
                       file = NULL) {
  # convert `metadata` slot to be named `eml`
  nmz <- names(.dwca)
  if(any(nmz == "metadata")){
    nmz[nmz == "metadata"] <- "eml"
  }
  names(.dwca) <- nmz

  # add `schema`
  .dwca$meta <- build_schema(.dwca)

  # create a temporary directory to store objects
  temp_dir <- tempdir()
  temp_loc <- Sys.time() |>
    as.character() |>
    gsub("\\s", "-", x = _)
  store_dir <- glue("{temp_dir}/darwincore-{temp_loc}")
  dir.create(store_dir)

  # if no file given, store DwCA in a temporary directory
  if(is.null(file)){
    file <- glue("{temp_dir}/darwincore-{temp_loc}.zip")
  }

  # loop across objects, saving the correct type to the correct name
  object_names <- names(.dwca)
  for(i in seq_along(object_names)){
    obj <- .dwca[[i]]
    file_name <- object_names[i]
    if(inherits(obj, "data.frame")){
      write_csv(obj, file = glue("{store_dir}/{file_name}.csv"))
    }else{
      write_xml(obj, file = glue("{store_dir}/{file_name}.xml"))
    }
  }
  all_files <- list.files(store_dir)

  # build zip file
  zip::zip(zipfile = file,
           files = glue("{store_dir}/{all_files}"),
           mode = "cherry-pick")
  unlink(store_dir)
  .dwca$path <- file
  .dwca
}
