#' Create an object of class `darwincore`
#' @name darwincore
#' @returns Objects of class `darwincore` are listlike, and contain two slots:
#' `data` and `metadata`. The former contains and supplied data. The latter
#' contains `statement` and `schema`.
#' @export
darwincore <- function(){
  x <- list()
  class(x) <- "darwincore"
  x
}


#' @rdname darwincore
#' @importFrom glue glue_collapse
#' @importFrom rlang inform
#' @export
print.darwincore <- function(x, ...){
  if(length(x) < 1){
    inform("An empty Darwin Core object (class `darwincore`)")
  }else{
    inform(c("A Darwin Core object (class `darwincore`) containing: ",
             glue_collapse(names(x), sep = "; ")))
  }
}
