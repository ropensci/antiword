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
    file <- normalizePath(file, mustWork = TRUE)
    # Path with spaces need shQuote() on Windows, see https://github.com/jeroen/sys/issues/4
    c(
      ifelse(isTRUE(format), "-f", "-t"),
      ifelse(is_windows(), shQuote(file), file)
    )
  }
  wd <- getwd()
  on.exit(setwd(wd))
  bindir <- system.file("bin", package = "antiword")
  setwd(bindir)
  postfix <- if(is_windows()) .Machine$sizeof.pointer * 8
  path <- file.path(bindir, paste0("antiword", postfix))
  out <- rawConnection(raw(0), "r+")
  on.exit(close(out), add = TRUE)
  if(sys::exec_wait(path, args, std_out = out) == 0){
    return(rawToChar(rawConnectionValue(out)))
  }
  stop("System call to 'antiword' failed")
}

is_windows <- function(){
  identical(.Platform$OS.type, "windows")
}
