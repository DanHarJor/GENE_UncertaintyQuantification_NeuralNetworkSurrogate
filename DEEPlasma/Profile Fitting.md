We should use chilensky GPR for more accurate gradients. 

Adam would rather use monte carlo sampling of mtanh over GPR because it is unclear what the uncertainty is coming from. Here is my answer:

For GPR fitting to the profile it just clicked what you ment by it being unclear with there being multiple incertainties. 

The resolution is this: When you monte carlo sample the mtanh parameters you then get a set of profiles that are effectlivly samples of the posterior and your take the mean and variance to get your final profile and uncertainty.

Then with the GPR you do the same thing but you change the mtanh parameters for kernel parameters. You forget that each sampled set of kernel parameters has an uncertainty and you only take the mean. If you sample 100 kernel parameters you then have 100 GPR mean profiles **and you discard the 100 uncertainties**. Then you find the mean and variance of the 100 profiles and this is your final profile and uncertainty. This is called the full Bayesian approach and the uncertainty comes mainly from the lack of data. Practically no prior information is assumed in this approach.  

The advantage of using GPR over the MTANH is simply you get better profiles because the model is more flexible. It isn't that you need GPR to get an uncertainty. 
