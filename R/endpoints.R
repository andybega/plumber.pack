
#' Endpoint for /
#'
#' Displays the installed plumber.pack version.
#'
#' @export
endpoint_home <- function() {
  package_version = paste(unclass(utils::packageVersion('plumber.pack'))[[1]], collapse = '.')
  list(sprintf("Hello World!; plumber.pack version %s", package_version))
}

#' Endpoint for echo/
#'
#' Echos the message input.
#'
#' @param msg a string
#'
#' @export
endpoint_echo <- function(msg) {
  list(msg = paste0("The message is: '", msg, "'"))
}
