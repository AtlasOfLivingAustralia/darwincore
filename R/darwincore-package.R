#' Object class for storing Darwin Core Archives in R
#'
#' @description
#' `{darwincore}` is an functionally similar to `{finch}`. It provides tools to
#' import Darwin Core Archives in an R-native format; offers summary, print, and
#' conversion functions for those objects; and gives tools to read and
#' incorporate external `.csv` and markdown (`.md`) objects into those archives.
#'
#' @name darwincore-package
#' @docType package
#' @references If you have any questions, comments or suggestions, please email
#' [support@ala.org.au](mailto:support@ala.org.au).
#'
#' @section Functions:
#'
#' **Object manipulation**
#'   * [darwincore()] create a `darwincore` object
#'   * [add_data()]
#'   * [add_metadata()]
#'   * [print.darwincore()], [as_tibble.darwincore()], [summary.darwincore()]
#'
#' **File manipulation**
#'   * [read_dwca()] read a Darwin Core Archive as a `darwincore` object
#'   * [write_dwca()] write a `darwincore` object to a Darwin Core Archive
#'   * [read_md()] read a markdown file as xml
#'   * [write_md()] convert an xml document to a markdown file
#'
#' @keywords internal
"_PACKAGE"
