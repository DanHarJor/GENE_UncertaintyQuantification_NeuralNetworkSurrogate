What sparked this:
1. David mentioning that my search space can be non-physical leading to strange results
2. Aaro mentioning that experimental data is sometimes used for dimensionality reduction
3. Talking to Adam about getting suitable parameter ranges he suggested using experiment to choose ranges that cover the radial pedestal positions in a single shot.
4. I what Adam said was Davids intention (he said he makes surrogate models for one shot, so the ranges he gave me are likely for different radial values of a shot)

Using experiments to generate data can help avoid using non-physical or irrelevant combinations of input parameters.

***"Density gradients stabilize a certain class of modes (see Kotch. et al. NF 2024), so you can only get to extremely steep temperature gradients if you also have extremely steep density gradients."***

There could be many more such situations we are not aware of.

Experiments can be used to greatly reduce the search space before any GENE is ran. Other dimensionality reduction methods that use GENE output will have less to do.

From experiment one can observe, temp, density, q, their gradients, and Bref (7D input, 6D if discluding Bref as only looking at one shot). Beta, collisionality, deby_length and alpha_mhd can be computed form these.

***Keep in mind we cannot observe ion temperature profiles and David wants the model to scan different ion temperatures to give a temperature ratio***

# Collecting Observed Points
We can collect points in the 6/7D input space that existed within an experiment. These points can be called observed points.

The observed points could be ran through GENE and used for training and testing just like sampled points. Potentially if looking at many shots enough observed points could be collected that sampled points are not required.
## One Shot 
Bref is constant
Good idea to deploy [[#Sampling from GPR posterior]] for single shot to increase number of data points in a way that is probable given experimental data.
### Steady State
The temp, dens measurements can be captured just before each elm and plotted onto one graph that is fitted to find the steady state profile. The profile can be scanned along with the q profile to get the values and gradients. Bref is constant. 
### Time Varying
The diagnostic measurements and profiles can be evaluated for different points in time as well as the radius scanned. This allows the turbulance to be evaluated at different stages in the profile build before the elm crash. With Thompson scattering super resolution one could potentially look at the elm crash profiles too, Azarakhsh JALALVAND.
## Multiple Shots
Allows for different Bref values to be seen by the model.

Allows for different profile shapes to be covered by the model. Helps reduce the effect of stochastic measurement uncertainties. 

Perhaps other parameters need to be changed that could be fixed for a single shot.

Could eventually cover a whole campaign for large scale mode identification.

The extra experiments could help uncover or dissolve functional dependencies between the input parameters which improves the accuracy of the dimensionality reduction.

Both steady state and time varying methods could be deployed for each shot.
# Dimensionality Reduction
This can be applied to the experimentally observed points.

Then [[Dimensionality Reduction-Variance Reduction]] methods can be deployed to find the dimensions that capture the variance of the parameters the best which will be a lower dimensional space that can be sampled. Further reduction can be made using GENE output information and functional relationships between the dimensions and GENE out that causes dimensions of high variance. These lower D spaces can be explored efficiently with active learning and or sparse grids, (including the active classification method and regression within each classification).

# Sampling from GPR posterior

Data points could be sampled by sampling from the GPR posterior for the profiles. The actual physical profile is unknown, this sampling allows us to explore the instabilities that exist in possible profiles.

The underlying physical dependencies between the profiles is not taken into account. So a better strategy would be to include multiple shots.

This could be used to either replace or augment Dimensionality reduction via experiment. Replace because by sampling from the Posterior we likely to avoid physically impossible or irrelevant points so the dimensionality reduction becomes less important. 

Can be used for both single shots and many shots, steady state and time varying. 

# Using Experiment Points as GENE inputs

Aside from the techniques above a simple improvement to all of them is to run GENE for the points that existed within an experiment.