
What is the growth rate units

how many dimensions are being scanned over for final UQ/surrogate

Why completely frequentest approach, why no bayesian. Can you do it in a bayesian way??

Look to see if SVM works in high dimensions. 12D should be okay. 


The current implimentation scans the temperature gradient for ions and electrons equidistantly and then GENE computes the growthrates. These are placed in a distribution to see the growthrate distribution given a uniform distribution of the input uncertainty. Then the surrogate is used to get more growthrates to get a higher resolution distribution. To improve this to include a more realistic origional distribution I could assume a gaussian error on the inputs and sample from this gaussian to generate the inputs for the GENE runs.