#' Compute n-th Step Transition Probability Matrix
#'
#' Given one-step transition probability matrix compute higher-order transition
#' probability of a homogeneous Markov chain process
#'@param onestep One step transition probability matrix
#'@param states Number of states
#'@param n Higher order
#'@param byrow To fill the matrix row-wise or column-wise
#'@importFrom matrixcalc is.square.matrix
#'@importFrom expm %^%
#'@return a list containing one-step transition probability matrix and n-step transition
#'@export
nstepmat <- function(x, k, n, byrow=TRUE){

  # Step 1
  # validity of the number of states
  if(is.na(k) == TRUE & k < 0){
    stop("Invalid number of states. This should be a positive value.")
  }else if(length(x) != k*k){
    stop("Invalid input: The number of elements provided is insufficient to fill the specified matrix dimensions.")
  }else{
    mt <- matrix(x, nrow= k, ncol= k, byrow = TRUE)
  }

# Step 2: Check the validity of the transition prob matrix
 #To check whether transition probability matrix is square matrix
 if(is.square.matrix(mt) == FALSE){
   stop("error- Given transition matrix is not a square matrix.")
 }

 #To check whether transition probability matrix contain non numeric elements
 else if (!(is.numeric(mt))) {
   stop("error-The elements of transition probability matrix are not numeric.")
 }

 #To check whether transition probability matrix contains negative or values greater than 1
 else if (any(mt < 0) | any(mt > 1)) {
   stop("error-The transition probability matrix contains negative or values greater than 1")
 }

 #To check whether row sums of transition probability matrix equal to 1
 else if (any(rowSums(mt) != 1)) {
   stop("error-The row sums of the transition probability matrix not equal to 1")
 }
  m <- as.numeric(mt)



      matn <- mt %^% n
      print(paste("The one-step transition probability matrix is:"))
      prmatrix(mt)
      print(paste("The", n,"-step transition probability matrix is:"))
      prmatrix(matn)



}
#'example
#'x <- c(0.2,0.8,0.4,0.6)
#'nstepmat(x, 2, 3)
#'nstepmat(x, 2, 13)
#'
#'y <- c(0.2,0.8,0.4,-0.6)
#'nstepmat(y, 2, 3)



