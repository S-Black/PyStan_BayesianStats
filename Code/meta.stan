//Meta-analysis model
//Heterogeneous

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
}
model{
    //Likelihood
    Rc ~ binomial_logit(Nc, mu);
    Rt ~ binomial_logit(Nt, mu+delta);

    //Priors
    mu ~ normal(0,10);
    delta ~ normal(0,10);
}
