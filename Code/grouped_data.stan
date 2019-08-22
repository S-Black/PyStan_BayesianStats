data{
  int N; //Number of people in sample
  int K; //number of studies
  real Y[N]; //Heights for N people
  int groups[N]; //Id of each observation (11,222,3333...)
}
parameters{
  real mu[K]; //mean height of population (there will be 3 means for each study)
  real<lower=0> sigma[K]; //sd of height pop distribution
}
model{
  //likelihood
  for (i in 1:K){   //select relevant means and sd for each study
    Y[i] ~ normal(mu[groups[i]],sigma[groups[i]]);
  }

  //priors
  mu ~ normal(1.5,0.1); //prior for each mu [can have different priors for different studies e.g. mu[1]~ etc]
  sigma ~ gamma(1,1);  //prior for each sigma
}
