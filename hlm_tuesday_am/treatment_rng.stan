functions {
  matrix [] treatment_rng(int S, vector z) {
    int N = rows(z);
    matrix[N, 2] PPD[S];
    for (s in 1:S) {
      // parameters
      real alpha = exponential_rng(1);
      real beta = normal_rng(1, 2);
      real sigma = exponential_rng(1);
      for (n in 1:N) {
        real u = normal_rng(0, 1);
        // realizations of binary t and then continuous y
        real t = bernoulli_logit_rng(alpha);
        
        PPD[s][n,] = [t, y];
      }
    }
    return PPD;
  }
}

