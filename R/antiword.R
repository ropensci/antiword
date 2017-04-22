#' Antiword
#'
#' Wraps the antiword utility. Takes a path to an word file and returns
#' text from the document.
#'
#' @export
#' @param file path or url to your word file
#' @param format format the output text (-f parameter)
#' @examples text <- antiword("http://homepages.inf.ed.ac.uk/neilb/TestWordDoc.doc")
#' cat(text)
antiword <- function(file = NULL, format = FALSE){
  args <- if(length(file)){
    if(grepl("^https?://", file)){
      tmp <- tempfile(fileext = ".doc")
      utils::download.file(file, tmp, mode = "wb")
      file <- tmp
    }
    c(
      ifelse(isTRUE(format), "-f", "-t"),
      normalizePath(file, mustWork = TRUE)
    )
  }
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
