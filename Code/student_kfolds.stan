data{
  int NTest;
  int NTrain;
  real XTest[NTest];
  real XTrain[NTrain];
}
parameters{
  real mu;
  real sigma;
  real nu;
}
model{
  //Likelihood
  XTrain ~ student_t(nu,mu,sigma);
  //priors
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
  nu ~ lognormal(0,1);
}
generated quantities {
  vector[NTest] logLikelihood;
  for(i in 1:NTest){
    logLikelihood[i]=student_t_lpdf(XTest[i]|nu,mu,sigma);
  }
}
