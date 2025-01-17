functions{                                  //user defined function to calculate something
  real covariateMean(real aX, real aBeta){
    return(aBeta * log(aX));
  }
}
data{
  int N; //Number of people in sample
  real Y[N]; //Heights for N people
  real X[N]; //Weights for N people
}
parameters{
  real beta;
  real<lower=0> sigma; //sd of height pop distribution
}
model{
  //likelihood
  for (i in 1:N){
    Y[i] ~ normal(covariateMean(X[i],beta),sigma); //use user defined function to calculate the mean for likelihood
  }

  //priors
  beta ~ normal(0,1);
  sigma ~ gamma(1,1);
}
