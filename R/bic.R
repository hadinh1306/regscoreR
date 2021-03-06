#' BIC scorer function
#'
#' @author Simran Sethi
#'
#' @param y True target variable(s) - array-like of shape = (n_samples) or (n_samples, n_outputs)
#' @param y_pred is a list of numbers and p which is an int
#' @param p Number of predictive variable(s) used in the model - int
#'
#' @description BIC stands for Bayesian Information Criterion.
#' Like AIC, it also estimates the quality of a model.
#' When fitting models, it is possible to increase model fitness by adding more parameters.
#' Doing this may results in model overfit.
#' Both AIC and BIC helps to resolve this problem by using a penalty term for the number of parameters in the model.
#' This term is bigger in BIC than in AIC.
#'
#' @details BIC = n X log(residual sum of squares/n) + K X log(n)
#'
#' @return double
#'
#' @examples
#' library(regscoreR)
#' y <-c(1,2,3,4)
#' y_pred <- c(5,6,7,8)
#' p <- 3
#' regscoreR::bic(y, y_pred, p)
#'
#' @export


bic <- function(y, y_pred, p){

  ################## input type error exceptions ##################

  if(!is.vector(y)){
    stop("Error: Argument 1 is not a vector")
  }

  if(!is.vector(y_pred)){
    stop("Error: Argument 2 is not a vector")
  }

  for(i in y){
    if(!is.double(i)) stop("Error: Elements of argument 1 must be double")
  }

  for(i in y_pred){
    if(!is.double(i)) stop("Error: Elements of argument 2 must be double")
  }

  # if(is.vector(p)) stop("Error: Number of variables must be a double")

  if(!is.double(p)) stop("Error: Number of variables must be a double")

  if(!(p%%1==0)) stop("Error: Number of variables must be a positive integer")

  if(p<=0) stop("Error: Number of variables must be a positive integer")

  if(length(y) <= 1) stop("Error: Length of argument 1 cannot be less than or equal to 1")

  if(length(y_pred) <= 1) stop("Error: Length of argument 2 cannot be less than or equal to 1")

  ################## length of input vectors exceptions ##################

  if(length(y)!=length(y_pred)) stop("Error: Input vectors must be of equal lengths") else n <- length(y)

  ################## calculate score ##################

  # calculate residuals, calculate residual sum of square, and calculate BIC score
  
  residual <- y_pred - y
  RSS <- sum(residual^2)
  Bic <- n * log(RSS/n) + p * log(n)
  return(Bic)

}

















