generate_data <- function(n,p){
  covariates <- matrix(rnorm(n*p),n)
  responses <- rnorm(n)
  out <- list(covariates, responses); names(out) <- c("covarites", "responses")
  return(out)
}

chicken <- generate_data(2500,190)
chicken
