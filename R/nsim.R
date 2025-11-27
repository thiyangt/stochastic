#'
#' Simulate a homogeneous Markov Chain Process
#' @param init initial unconditional probability distribution over the states.
#' @param onestep onestep transitional probability matrix
#' @param lengthmc length of the Markov chain process except state at t=0
#' @param statespace state space or state labels as of the order of init
#' @return vector of statespace in simulated markov chain process
simmarkov <- function(init, onestep, lengthmc, statespace) {

  # --- Basic dimension checks ---
  if (!is.numeric(init) || any(init <= 0))
    stop("Initial probabilities must be numeric and strictly positive.")

  if (abs(sum(init) - 1) > 1e-10)
    stop("Initial probabilities must sum to 1.")

  if (!is.matrix(onestep))
    stop("Transition matrix must be a numeric matrix.")

  if (nrow(onestep) != length(init) || ncol(onestep) != length(init))
    stop("Transition matrix dimensions must match number of states.")

  # --- Check each row sums to 1 and contains no zeros ---
  for (i in 1:nrow(onestep)) {
    if (any(onestep[i, ] <= 0))
      stop(paste("Row", i, "contains zero or negative probabilities. All must be > 0."))

    if (abs(sum(onestep[i, ]) - 1) > 1e-10)
      stop(paste("Row", i, "of transition matrix does not sum to 1."))
  }

  # --- States ---
  if (missing(statespace)) statespace <- 1:length(init)

  # --- Simulation ---
  sim.states <- numeric(lengthmc + 1)
  states <- 1:length(init)

  # initial state simulation
  sim.states[1] <- sample(states, 1, prob = init)

  # transitions based on the previous step values
  for (i in 2:(lengthmc + 1)) {
    sim.states[i] <- sample(states, 1, prob = mat[simlist[i - 1], ])
  }

  return(statespace[sim.states])
}
#'@example
#' init <- c(0.1, 0.9)
#' mat <- matrix(c(0.5, 0.5, 0.7, 0.3), byrow=TRUE, ncol=2)
#' simmarkov(init, mat, 100, c("Rainy", "Sunny"))
