#' Compute n-th Step Transition Probability Matrix
#'
#' Given a one-step transition probability matrix, compute higher-order transition
#' probabilities of a homogeneous Markov chain process.
#'
#' @param x Numeric vector of one-step transition probability matrix values.
#' @param k Number of states.
#' @param n Higher order (number of steps).
#' @param byrow Logical; fill matrix by row or by column.
#' @return A list containing the one-step transition matrix and the n-step transition matrix.
#' @importFrom matrixcalc is.square.matrix
#' @importFrom expm %^%
#' @export
nstepmat <- function(x, k, n, byrow = TRUE) {

  if (is.na(k) || k <= 0) {
    stop("Invalid number of states. This should be a positive value.")
  } else if (length(x) != k * k) {
    stop("Invalid input: Number of elements does not match matrix dimensions.")
  } else {
    mt <- matrix(x, nrow = k, ncol = k, byrow = byrow)
  }

  # Check validity of transition matrix
  if (!matrixcalc::is.square.matrix(mt)) {
    stop("Error: Given transition matrix is not a square matrix.")
  } else if (!is.numeric(mt)) {
    stop("Error: Elements of transition probability matrix are not numeric.")
  } else if (any(mt < 0) | any(mt > 1)) {
    stop("Error: Matrix contains negative values or values greater than 1.")
  } else if (any(abs(rowSums(mt) - 1) > 1)) {
    stop("Error: Row sums of the transition probability matrix do not equal 1.")
  }

 # matn <- expm::`%^%`(mt, n)

  m <- as.numeric(mt)



  matn <- mt %^% n
  print(paste("The one-step transition probability matrix is:"))
  prmatrix(mt)
  print(paste("The", n,"-step transition probability matrix is:"))
  prmatrix(matn)

  # Return results as a list
  #return(list(one_step = mt, n_step = matn))
}
