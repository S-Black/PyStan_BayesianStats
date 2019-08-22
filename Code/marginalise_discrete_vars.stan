data{
  int<lower=1> nStudy; //Number of studies
  int<lower=1> N; //samples per study
  int<lower=0,upper=N> X[nStudy]; //number of successes
}
parameters{
  ordered[2] alpha;
}
transformed parameters{
  real<lower=0,upper=1> theta[2];
  matrix[nStudy,2] lp;

  for (i in 1:2){
    theta[i]=inv_logit(alpha[i]);
  }
  for (n in 1:nStudy){
    for (s in 1:2){
      lp[n,s]=log(0.5)+binomial_logit_lpmf(X[n]|N,alpha[s]);
    }
  }
}
model{
  for (n in 1:nStudy){
    target += log_sum_exp(lp[n]);
  }
}
generated quantities{  //estimate probabilities of state s=1
  real pstate[nStudy];
  for (n in 1:nStudy){
    pstate[n] = exp(lp[n,1])/(exp(lp[n,1])+exp(lp[n,2])); //OR more robustly: pstate[n]=exp(lp[n,1])-log_sum_exp(lp[n])
  }
}
