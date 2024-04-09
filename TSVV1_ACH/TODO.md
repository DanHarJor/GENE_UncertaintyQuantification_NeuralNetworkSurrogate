# Different Input Uncertainty Distributions

Currently to get the growthrate distribution for a single ky, I run gene within the uncertainty domain, create a surrogate model from this data, make many grothrate predictions with the surrogate and put the predictions into a histogram. The inputs placed into the surrogate are equidistant within the uncertainty domain. This assumes the uncertinty follows a uniform distribution. The real distribtuion would reflect that the nominal value is more likely to be true. A gaussian can thus be used with the limits being 95% confidance interval. Non physical values of inputs can be ingnored. The input points for the growthrate predictions should be sampled from these distributions. 

I should place them both side by side so that you can see the difference between uncertainty having a uniform distribution and a gaussian. 

