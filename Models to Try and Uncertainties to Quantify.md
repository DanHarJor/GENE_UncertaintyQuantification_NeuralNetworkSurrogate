
Kernel Tangent Neural Network

Normalising Flows

Bayesian Neural Networks / stochastic NN
Apparently they take a long time to converge can be data hungry and computationally expensive to train since you need to compute the marginal likelihood which involves integration. 

PINN

GPR
Only low dimensions. Adam: you could always cast the GPR kernel in terms of a neural tangent kernel ;) then should work out

Hidden Physics Model
Adds physics to GPR. Can be used to solve PDE. Good for low data problems. 

# Uncertainties
when making a surrogate model there are the following uncertainties 

- Lack of Data ie parent model outputs
- Incorrect parent model ie numerical errors (giving non physical results is one indicator)
- Model Uncertainty