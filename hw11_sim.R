generate_data <- function(n,p){
  covariates <- matrix(rnorm(n*p),n)
  responses <- rnorm(n)
  out <- list(covariates, responses); names(out) <- c("covarites", "responses")
  return(out)
}

chicken <- generate_data(2500,190)


model_select <- function(covariates, responses, cutoff){
  linmod <- lm(responses ~ covariates)
  keep <- summary(linmod)$coefficients[,4]
  index <- which(keep<cutoff)
  linmod.1 <- lm(responses ~ covariates[,index])
  p <- summary(linmod.1)$coefficients[,4]
  return(p)
}

values <- model_select(chicken$covarites, chicken$responses, 0.05)
