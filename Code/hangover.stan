data{
  int N; //Number of data points
  vector[N] Y; //List of search volume per data point
  vector[N] H; //Indicator variable if it's holiday season or not
}
parameters{
  real beta0;
  real beta1;
  real<lower=0> sigma;
}
model{
  //likelihood
  Y ~ normal(beta0 + beta1 * H, sigma);

  //priors
  beta0 ~ normal(0,50);
  beta1 ~ normal(0,50);
  sigma ~ normal(0,10); //https://github.com/stan-dev/stan/wiki/Prior-Choice-Recommendations says half normal is normal with <lower=0>
}
generated quantities{
  real uplift;
  uplift = beta1 / beta0;
}
