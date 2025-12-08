#'
#'Plot the transition diagram
#'@param P transition probability matrix
#'@param state_names Optional vector of state labels
#'@param threshold Minimum probability to display an edge
#'@return Transition diagram
#'@export
plot_markov_chain <- function(P, state_names = NULL, threshold = 0.01) {
  # P: Transition probability matrix
  # state_names: Optional vector of state labels
  #
  # layout_algo: Layout function from igraph

  if (is.null(state_names)) state_names <- paste0("S", 1:nrow(P))

  library(igraph)

  # Create edges based on probabilities above threshold
  edges <- which(P > threshold, arr.ind = TRUE)
  weights <- P[edges]
  edge_list <- c(rbind(edges[,1], edges[,2]))

  g <- graph(edges = edge_list, directed = TRUE)

  # Set vertex names and edge weights
  V(g)$name <- state_names
  E(g)$weight <- weights
  E(g)$label <- round(weights, 2)

  plot(g, edge.width = 2*E(g)$weight,
       edge.arrow.size = 0.5,
       vertex.size = 30,
       vertex.color = "lightblue",
       vertex.label.color = "black",
       vertex.label.cex = 0.8,
       main = "Markov Chain Diagram")
}
