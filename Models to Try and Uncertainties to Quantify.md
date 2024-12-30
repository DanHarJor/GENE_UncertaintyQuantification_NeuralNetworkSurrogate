# Clustering Uncertainty-weighted Embeddings (CLUE)
https://scikit-activeml.github.io/scikit-activeml-docs/latest/generated/sphinx_gallery_examples/pool/plot-Clue-Clustering_Uncertainty-weighted_Embeddings_%28CLUE%29.html

This is when we cluster the data and then select the cluster with the highest uncertainty then maybe a single point from the most uncertain clusters. The reason is there may be 5 points that are the most uncertain but there are all similar by another aspect and so sampling all 5 would be a waist when we only need one. If we cluster the data then we separate the points that have some distinct difference. 

The clustering is usually applied to unlabeled data but we would like to do it to the labeled data as this has the mode information for clustering. 

## GPR no fit and Classification
If the points are smooth then I should be able to use a high l and high amplitude in the kernel and get a good fit. The downside is the error will be large given the prior assumption is the problem in not smooth (high l). But the mean will be smooth. 

This means that if I am confident I can separate smoothness regions with ballooning plots I can make a different GPR for each smooth region and potentially have thousands of regions but I don't need to fit GPR to each region because one lengthscale and amplitude should do them all. When an inference is made, first all the data within that smoothness region is identified and this data is fed into the GPR. 

I could do a single fit to maximize the sum of the marginal likelihood over all the regions. 

This also gets round the problem of GPR not working for large amounts of data, because only the data points within the smoothness region is ever fed into the GPR. 

Smoothness region could be identified with ballooning plot dimensionality reduction and clustering.
## MLP
mlp
### RBF activation
This can allow for smoother interpolation between points compared to relu activation. 
## Kernel Tangent Neural Network

## Normalising Flows

## Bayesian Neural Networks / stochastic NN
Apparently they take a long time to converge can be data hungry and computationally expensive to train since you need to compute the marginal likelihood which involves integration. 

## PINN
Matild, new form of PINN where a correction is made to the weights after training and performs better than a traditional pinn. 

## Neural Operator
Adam said that if my goal is to take a particle distribution and advance it in time then I would use a neural operator. Whilst a PINN would take a position in phase space and compute the distribution value. 

Neural operators are typically used to solve PDE's. It takes a function as input and outputs a function. The outputted function can be discretized to any degree desired (this is the magic).

A transformer is trained on the data that blows it up to higher dimensions. 

## Fourier Neural Operator
https://doi.org/10.48550/arXiv.2010.08895
https://neuraloperator.github.io/neuraloperator/dev/user_guide/fno.html

## Graph Network for Neural Operator Learning

https://neuraloperator.github.io/neuraloperator/dev/user_guide/neural_operators.html

Maybe not a good Idea since this site found the fourrier method to work better.

## Graph Kernel Network
"We observe that the Graph kernel network approximates the map with a minimum (≈ 5) number of
training samples while still possessing a smaller test error comparing to that of a dense neural network trained with
100 samples." [https://doi.org/10.48550/arXiv.2003.03485](https://doi.org/10.48550/arXiv.2003.03485)

Maybe a graph kernel NN could be used to get the mapping from input parameters to growthrate and frequency. 

## Radial Basis Function interpolation

This would be used as another mapping from input parameters to growthrate and frequency. https://en.wikipedia.org/wiki/Radial_basis_function_interpolation

Fairly simple algorythem. Allows for swapping of different kernels and their hyper parameters. The kernel must be a radial basis function ie f(x) = f(|x|). A little like GPR.


# GPR
Only low dimensions. Adam: you could always cast the GPR kernel in terms of a neural tangent kernel ;) then should work out
	- rational quadratic kernel
	- matern kernel
## Mixture of GP - volker trep



# Hidden Physics Model
Adds physics to GPR. Can be used to solve PDE. Good for low data problems. 

# Uncertainties
when making a surrogate model there are the following uncertainties 

- Lack of Data ie parent model outputs
- Incorrect parent model ie numerical errors (giving non physical results is one indicator)
- Model Uncertainty