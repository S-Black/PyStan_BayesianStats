//This is an example model from Chapter 16 from Ben Lambert Book, A student's guide to Bayesian Statistics

data {
  real Y [10]; //heights for 10 people
}
parameters{
  real mu; //mean height in population
  real<lower=0> sigma; //sd of height distribution
}
model{
  //priors
  mu ~ gamma(1.5,0.1);
  sigma ~ normal(1,1);

  //likelihood
  Y ~ normal(mu, sigma);
}
generated quantities{
  vector[10] lSimData;
  int aMax_indicator;
  int aMin_indicator;

  //Generate posterior predictive samples
  for (i in 1:10){
      lSimData[i]=normal_rng(mu,sigma); //randomly draw form a normal distribution with out parameters
  }

  //Compare with real data
    aMax_indicator=max(lSimData)>max(Y);
    aMin_indicator=min(lSimData)<min(Y);
}
