% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mallow.R
\name{mallow}
\alias{mallow}
\title{Mallow's Cp function}
\usage{
mallow(y, y_pred, y_sub, k, p)
}
\arguments{
\item{y}{array-like of shape = (n_samples) or (n_samples, n_outputs), True target variable(s)}

\item{y_pred}{array-like of shape = (n_samples) or (n_samples, n_outputs)
Fitted target variable(s) obtained from your regression model}

\item{y_sub}{array-like of shape = (n_samples) or (n_samples, n_outputs)
Fitted target variable(s) obtained from your subset regression model}

\item{k}{(int,like 2L)Number of predictive variable(s) used in the model}

\item{p}{(int,like 2L)Number of predictive variable(s) used in the subset model}
}
\value{
mallow_score: float
}
\description{
Mallow's C_p is named for Colin Lingwood Mallows.
It is used to assess the fit of regression model,
finding the best model involving a subset of predictive variables available
for predicting some outcome.
}
\details{
C_p = (SSE_p/MSE) - (n - 2p)
}
\examples{
library(regscoreR)
y <-c(1,2,3,4)
y_pred <- c(5,6,7,8)
y_sub <- c(1,2,3,5)
k <- 3L
p <- 2L
regscoreR::mallow(y, y_pred, y_sub, k, p)

}
\author{
Ruoqi XU
}
