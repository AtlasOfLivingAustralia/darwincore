#' Convert a `darwincore` object to a `tibble`
#'
#' Necessary in many cases, but particularly required by `galah`
#' @importFrom rlang abort
#' @importFrom tibble as_tibble
#' @export
as_tibble.darwincore <- function(x, ...){
  if(any(names(x$data) == "events")){
    # expand events and occurrences using `full_join()` or similar
  }else if(any(names(data) == "occurrences")){
    result <- x$data$occurrences
    if(inherits(result, "tbl_df")){
      result
    }else{
      as_tibble(result)
    }
  }else{
    abort("No data stored in `x`")
  }
}
