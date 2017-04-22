#' Antiword
#'
#' Wraps the antiword utility. Takes a path to an word file and returns
#' text from the document.
#'
#' @export
#' @param file path to your word file
antiword <- function(file = NULL){
  args <- normalizePath(file, mustWork = TRUE)
  wd <- getwd()
  on.exit(setwd(wd))
  setwd(system.file("bin", .Platform$r_arch, package = "antiword"))
  path <- file.path(
    system.file("bin", .Platform$r_arch, package = "antiword"),
    "antiword"
  )
  out <- rawConnection(raw(0), "r+")
  on.exit(close(out), add = TRUE)
  if(sys::exec_wait(path, args, std_out = out) == 0){
    return(rawToChar(rawConnectionValue(out)))
  }
  stop("System call to 'antiword' failed")
}
