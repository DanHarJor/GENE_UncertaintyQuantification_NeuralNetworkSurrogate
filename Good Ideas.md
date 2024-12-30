
Normalising flows.
Jake used this method to make a surrogate of SEVEN. I got to look into it. 

MJ pueschel said maybe we can get an AI to say which eigan modes are relevant because we can't look at them all.

# Try fixed grid ky vs random sampling for a small UQ space

# Regions of High fidelity
Some instability modes will have little effect on the flux and will dominate certain input space regions. We can create a loss function that prioitises model accuracy at the input space region that affects the flux the most, for example at ion scale ky regions. 

# Get some data from MJ
One, it seems weird to focus on quasi linear when johanthin citrin has worked a lot on it. 

Anyway, MJ has papers where he does a non linear scan, fits the quasilinear to one point and then sees how much they deviate after a few points. 

I can ask him for the non linear data of one of those scans. And the parameter file. Then maybe I can add some more non-linear points inbetween. 

Then I can train a PINN on the non linear points and see how well it matches the quasilinear. Ideally we would have many non-linear points, only train on some of them, then we can see where diviates from the truth and quasi-linear. 

For the simple 1D graphs in the paper, I suspect the neural network would be able to do the interpolation perfectly, since it would be like fitting a polynomial to the data. Maybe its not a good idea... NN work best for high dimensional data. A simple NN would just do something similar to polynomial fitting. But a physics informed NN might do more and get closer to non linear. 

# Real Input Dist instead of uniform
The current implimentation scans the temperature gradient for ions and electrons equidistantly and then GENE computes the growthrates. These are placed in a distribution to see the growthrate distribution given a uniform distribution of the input uncertainty. Then the surrogate is used to get more growthrates to get a higher resolution distribution. To improve this to include a more realistic origional distribution I could assume a gaussian error on the inputs and sample from this gaussian to generate the inputs for the GENE runs.

# Use UQ to generate database for large domain surrogate. 

The UQ uses small surrogates trained within the uncertainty domain around a nominal value. This can generate a distribution of growthrates, (or quantity of interest). You can use the results to get a different distribution for different uncertainty ranges. Then the surrogate can learn to map the inputs and uncertainties to a distribution. Doing it all in one.

## Train an autoencoder and do GPR / SVM / XGBoost on the feature space.

The autoencoder is a neural network that starts with I nodes and goes down to I-N nodes in the middle then finished with I nodes again. Then it is trained so that the output is the same as the input. This allows the I-N nodes in the middle to have a lowerdimensional set of features that represents really well the input. 

If I have a high dimensional space but all points lie on a lower dimensional space then this should remove the redundant dimensionality.

This is similar to PCA. PCA can only find a linear combination of the input dimensions whilst the transformer introduces some non-linearity with the relu function. 

# DO "linear?" interpolation using barycentric co-ordinates of delainy simplex's. 

something like this:
![[Pasted image 20240703152607.png]]

A simplex is a high dimensional triangle. A delainy simplex has verticies (triangle points) on data points that are nearest neighbour to the points and satisfys some other criteria so there is only one unique set delainy simplex's for a set of points. 










