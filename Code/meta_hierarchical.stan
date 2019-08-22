//Meta-analysis model
//Hierarchical

data{
    int N; //number of studies to include
    int Rt[N]; //number of people who died in the treatment group
    int Rc[N]; //number of people who died in the control group
    int Nt[N]; //number of people who took part in the treatment group
    int Nc[N]; //number of people who took part in the control group
}
parameters{
      vector[N] mu;
      vector[N] delta;
      real d;
      real<lower=0> sigma;
}
model{
    //Likelihood
    Rc ~ binomial_logit(Nc, mu);
    Rt ~ binomial_logit(Nt, mu+delta);

    //Prior
    mu ~ normal(0,10);
    delta ~ normal(d,sigma);

    //Hyper-Priors
    d ~ normal(0,10);
    sigma ~ cauchy(0,2.5);
}
generated quantities {
  real delta_overall; //estimate the cross-study effect of the beta-blockers
  delta_overall = normal_rng(d, sigma);
}
