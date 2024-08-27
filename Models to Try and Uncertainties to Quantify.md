
## Kernel Tangent Neural Network

## Normalising Flows

## Bayesian Neural Networks / stochastic NN
Apparently they take a long time to converge can be data hungry and computationally expensive to train since you need to compute the marginal likelihood which involves integration. 

## PINN

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

# Hidden Physics Model
Adds physics to GPR. Can be used to solve PDE. Good for low data problems. 

# Uncertainties
when making a surrogate model there are the following uncertainties 

- Lack of Data ie parent model outputs
- Incorrect parent model ie numerical errors (giving non physical results is one indicator)
- Model Uncertainty