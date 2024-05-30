# Internal checking functions

#' check a provided object is of class `darwincore`
#' @importFrom rlang abort
#' @noRd
#' @keywords Internal
check_darwincore <- function(x){
  if(!inherits(x, "darwincore")){
    abort("Supplied object must be of class `darwincore`")
  }
}
