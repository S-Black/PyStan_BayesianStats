data{
  int N; //Number of years
  int X[N]; //List of number of discoveries per year (needs to be integers)
}
parameters{
  real lambda; //rate of occurrence of discoveries
}
model{
  //likelihood
  X ~ poisson(lambda);

  //prior
  lambda ~ lognormal(2,1);
}
generated quantities{
  int lSimData[N];
  int aMax_indicator;
  int aMin_indicator;

  //Generate posterior predictive samples
  for (i in 1:N){
      lSimData[i]=poisson_rng(lambda); //Sample from the posterior predictive density
  }

  //Compare with real data
    aMax_indicator=max(lSimData)>max(X);
    aMin_indicator=min(lSimData)<min(X);
}
