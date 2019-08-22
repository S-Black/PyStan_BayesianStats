data{
  int N;
  real X[N];
}
parameters{
  real mu;
  real sigma;
}
model{
  //Likelihood
  X ~ normal(mu,sigma);
  //priors
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[N] logLikelihood;
  for(i in 1:N){
    logLikelihood[i]=normal_lpdf(X[i]|mu,sigma);
  }
}
