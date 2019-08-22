data{
  int N;
  real X[N];
}
parameters{
  real mu;
  real sigma;
  real nu;
}
model{
  //Likelihood
  X ~ student_t(nu,mu,sigma);
  //priors
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
  nu ~ lognormal(0,1);
}
generated quantities {
  vector[N] logLikelihood;
  for(i in 1:N){
    logLikelihood[i]=student_t_lpdf(X[i]|nu,mu,sigma);
  }
}
