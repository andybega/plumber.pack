#' Start service
#'
#' Start the API using [plumber::plumb()]. Shortcut for some boilerplate code.
#'
#' @param port Port on which to run the API, see [plumber::plumb()].
#'
#' @export
start_api <- function(port = 5018) {
  if (!interactive()) stop("For interactive use only")

  pr <- plumber::plumb(system.file("plumber.R", package = "plumber.pack"))
  pr$run(port = port)
  invisible(pr)
}
