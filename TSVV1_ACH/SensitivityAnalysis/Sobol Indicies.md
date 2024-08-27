These measure the sensitivity with the variance. The first order sobol inex of a parameter $Q_i$ from the set of parameters $Q$ tells you how much the output varies when the parameter varies within it's uncertainty.

$$S_i = \frac{V\left[E[Y|Q_i]\right]}{V[Y]} $$
Here $S_i$ is the sobol index and $Y$ is the output of the function we are performing the sensitivity analysis for. $E[Y|Q_i]$ is the expectation of Y when parameter $Q_i$ is fixed. This expectation will change when $Q_i$ is fixed to different values. So to compute this $Q_i$ should be set to many values within it's bounds, maybe sampled from its uncertainty distribution. Then the many expectation values can be found by keeping $Q_i$ fixed and sampling the other parameters from their uncertainty distributions and computing the mean of the outputs. Once you have many means you can compute the variance of the means which is $V\left[E[Y|Q_i]\right]$. $V\left[Y\right]$ is simply the variance of all the outputs when many samples are taken from the uncertainty distributions of those inputs

# Computing them with scipy stats

https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.sobol_indices.html


