data{
  int N; //Number of people in sample
  real Y[N]; //Heights for N people
}
parameters{
  real mu; // mean hight in population
  real<lower=0> sigmaSq; //var of height pop distribution
}
transformed parameters{
  real sigma;
  sigma=sqrt(sigmaSq);
}
model{
  //likelihood
  Y ~ normal(mu,sigma);

  //priors
  mu ~ normal(1.5,0.1);
  sigmaSq ~ gamma(5,1);
}
