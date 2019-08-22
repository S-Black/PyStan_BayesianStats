data{
  int N; //Number of years
  int X[N]; //List of number of discoveries per year (needs to be integers)
}
parameters{
  real mu; //mean of discoveries per years
  real kappa; //degree of overdispersion
}
model{
  //likelihood
  X  ~ neg_binomial_2(mu, kappa);

  //priors
  mu ~ lognormal(2,1);
  kappa ~ lognormal(2,1);
}
generated quantities{
  int lSimData[N];
  int aMax_indicator;
  int aMin_indicator;

  //Generate posterior predictive samples
  for (i in 1:N){
      lSimData[i]=neg_binomial_2_rng(mu,kappa); //Sample from the posterior predictive density
  }

  //Compare with real data
    aMax_indicator=max(lSimData)>max(X);
    aMin_indicator=min(lSimData)<min(X);
}
