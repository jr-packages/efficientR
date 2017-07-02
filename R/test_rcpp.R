globalVariables("add_c")
#' Rcpp test function
#' 
#' A simple function to test whether Rcpp is installed and working.
#' @return Returns \code{TRUE} if everything is OK.
#' @export
test_rcpp = function() {
  Rcpp::cppFunction('
  int add_c(int x, int y){
    return x + y;
  }
')
  if(add_c(1, 1) == 2) {
    message("Everything seems fine")
    return(TRUE)
  }
  return(FALSE)
}