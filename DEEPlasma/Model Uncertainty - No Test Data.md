If we rigorously quantify the model uncertainty based on lack of data, using Bayesian statistics, like GPR then we do not need to use test data. This reduces the need for making data, makes it viable for high cost UQ and can be directly used for active learning. 

Could we do this using bayes theorum and model inferences??

# Full Bayesian
The GPR to full bayseian by sampling kernel hyper parameters, like in chilenski, 10.1088/0029-5515/55/2/023012

Or some other generic bayesian way that doesn't involve assuming prior knowledge like in GPR with smoothness. 

This is great but can be slow due to posterior methods via MCMC being lengthy and tricky. So we want a faster way to uncertainties, but this should be the gold standard to compare other methods too in terms of uncertainty value. It quantifies the uncertainty from lack of information. 





# Bootstrapping Uncertainties
https://www.cambridge.org/core/journals/journal-of-plasma-physics/article/advanced-surrogate-model-for-electronscale-turbulence-in-tokamak-pedestals/3E0DAEFE95FFB7B6303BC03DD0CC46DD

## NN family for relative uncertainty, plus bayesian for scaling

A family of NN that are trained with different initial weights and different random permutations of the data into batches can be used to get an uncertainty based on the agreement of the family. If they all agree small error, if many disagree large error. This can determine how sure the family is of it's prediction relative to another prediction. This can capture uncertanties from the weight initalisation, training data shuffle. But does it capture the uncertainty from the lack of data?

The idea is that if we have relative uncertanties that we believe to be accurate but not to scale then we can scale them using a scaling factor. We can decide the scaling factor with a maximum likelihood estimation.







