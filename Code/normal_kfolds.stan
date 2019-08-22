data{
  int NTest;
  int NTrain;
  real XTest[NTest];
  real XTrain[NTrain];
}
parameters{
  real mu;
  real<lower=0> sigma;
}
model{
  //Likelihood
  XTrain ~ normal(mu,sigma);
  //priors
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[NTest] logLikelihood;
  for(i in 1:NTest){
    logLikelihood[i]=normal_lpdf(XTest[i]|mu,sigma);
  }
}
