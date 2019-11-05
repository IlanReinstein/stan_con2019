data {
  int<lower=1> N;
  vector[N] age;
  vector[N] income;
  int<lower = 0, upper = 1> vote[N];
}

parameters {
  real alpha; //log-odd parameter for voting
  real beta; // slope of income in log-odds of voting
  
  vector[2] lambda;
}

model {
  vector[N] beta_age = lambda[1] + lambda[2] * income;
  vector[N] eta = alpha + beta * income + beta_age .* age;
  target += bernoulli_logit_lpmf(vote | beta);
  // priors on alpha, beta, lambda
  target += normal_lpdf(alpha|0, 1);
  
}