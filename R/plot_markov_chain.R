#' Plot a Markov Chain Transition Diagram
#'
#' This function visualizes a Markov chain as a directed graph representing the
#' transition probabilities between states. Only transitions with probabilities
#' above a specified threshold are displayed.
#'
#' @param P A numeric square matrix representing the transition probabilities
#'   of the Markov chain. Each row should sum to 1.
#' @param state_names An optional character vector providing names for the states.
#'   If NULL (default), states are labeled as "S1", "S2", ..., "Sn".
#' @param threshold A numeric value specifying the minimum transition probability
#'   required to display an edge in the diagram. Default is 0.01.
#'
#' @return A plot of the Markov chain as a directed graph. Vertices represent
#'   states, and edges represent transitions with probabilities above the threshold.
#'
#' @details
#' This function relies on the following `igraph` functions:
#' \code{graph}, \code{V}, \code{E}, \code{plot}.
#' Users must ensure that the `igraph` package is installed and loaded.
#'
#' Edge widths are scaled by the transition probability, and edge labels
#' display probabilities rounded to two decimal places.
#'
#' @examples
#' library(igraph)
#' P <- matrix(c(0.8, 0.2,
#'               0.1, 0.9), nrow = 2, byrow = TRUE)
#' plot_markov_chain(P)
#'
#' state_names <- c("Sunny", "Rainy")
#' plot_markov_chain(P, state_names, threshold = 0.05)
#'
#' @export
plot_markov_chain <- function(P, state_names = NULL, threshold = 0.01) {
  if (is.null(state_names)) state_names <- paste0("S", 1:nrow(P))

  # Create edges based on probabilities above threshold
  edges <- which(P > threshold, arr.ind = TRUE)
  weights <- P[edges]
  edge_list <- c(rbind(edges[,1], edges[,2]))

  g <- igraph::graph(edges = edge_list, directed = TRUE)

  # Set vertex names and edge weights
  igraph::V(g)$name <- state_names
  igraph::E(g)$weight <- weights
  igraph::E(g)$label <- round(weights, 2)

  plot(g,
               edge.width = 2*igraph::E(g)$weight,
               edge.arrow.size = 0.5,
               vertex.size = 30,
               vertex.color = "lightblue",
               vertex.label.color = "black",
               vertex.label.cex = 0.8,
               main = "Markov Chain Diagram")
}
