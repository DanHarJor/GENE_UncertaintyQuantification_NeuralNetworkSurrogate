First train a very good mode classifier. The within each mode the function should be smooth so use SSG, dimensionaly adaptive sparse grids or dimensionality reduction (PCA - autoencoders) to generate regression data points.

The final model could be a combination of the classifier and regressors. A different regressor for each mode.

Use Lorenzos active classification method to fine tune the mode boundaries. 

# Space Separation
A problem is that the SSG works by setting ranges of dimensions and within these ranges the function must be smooth. This means the domain needs to be within a hypercube that does not contain any other domain. How to achieve this.

SVM classifiers use kernels to project the space to a larger dimensional space where a linear classification plane can be found. Many of these planes defined with box boundaries or other SVM planes cold define a volume that could be transformed into a hypercube that contains no other domain with linear algebra.

Maybe a could make a neural network do this with a well posed loss function. 