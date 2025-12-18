#'
#' Compute Stationary probability distribution
#'
#'@param onestep one step transition probability matrix
#'@return returns stationary probability distribution
#'@export
stationary_prob <- function(onestep) {

  # --- Check matrix validity ---
  if (!is.matrix(onestep))
    stop("Input must be a matrix.")

  n <- nrow(onestep)
  if (n != ncol(onestep))
    stop("Transition matrix must be square.")

  # Check each row sums to 1
  for (i in 1:n) {
    if (abs(sum(onestep[i, ]) - 1) > 1e-10)
      stop(paste("Row", i, "of transition matrix does not sum to 1."))
  }

  # --- Solve πP = π  <=>  π(P - I) = 0 with sum(π)=1 ---

  # Create matrix A = (P' - I)
  A <- t(onestep) - diag(n)

  # Replace one row with ones to enforce sum(pi)=1
  A[n, ] <- rep(1, n)

  b <- c(rep(0, n-1), 1)

  # Solve the linear system
  pi <- solve(A, b)

  # Ensure non-negative (numerical precision)
  pi[abs(pi) < 1e-10] <- 0

  return(pi)
}
#'@example
#' mat <- matrix(c(0.5, 0.5, 0.7, 0.3), byrow=TRUE, ncol=2)
#' stationary_prob(onestep=mat)
