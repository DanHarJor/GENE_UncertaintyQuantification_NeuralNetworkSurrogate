
# Computationaly efficient data collection for large high quality linear GENE datasets

When generating large data sets saving cpu hours where ever possible can be massively beneficial to get more data points with the same cpu hours. 

Python can monitor GENE outputs and stop simulations when they detect numerical instabilities, low standards of convergence, multimodal growthrate oscillations and potentially more.

Convergence checks can be completed efficiently by interpolating the distribution function and only running a few time steps to see if it changes. If it does then it needs to be ran for more timesteps. Then increase the resolution again.

We can use lorenzos adaptive classification strategie to avoid multimodal, stable and crazy unstable regions. Use the lowest resolution possible to find the stable regions of the space.

The main methods to do this with GENE is
	- using numerical instability detector to 


# WHich parameters affect turbulance most??
Which parameters affect turbulence most. Core vs pedestal. Conventional vs spherical. Use use ionut variance method. Can be used to make reduced model fit to non linear simulations. 

# UQ I should show that spatial adaptivity will help with thresholds but not bumpyness. 
Then I should show how many points are needed to UQ a mmg model for up to 24D when there are 5 or so threshold dimensions. Then choose the best method and do it for real GENE. I can plot the mmg with an array of contours, like aaro does it. 

# Curse of dimensionality for UQ
This apparently affects surrogate model methods heavily. Especially when there is high variance. I don't think this will be the case. I make the point that at high dimensionality the out put uncertainty is carried mostly by the uncertainty of the inputs and less on the uncertainty of the surrogatemodel. Meaning the effects cancel and the number of points needed could potentially increase linearly. 

# UQ smooth fit 
I use adaptive methods that are good for integration. Then I use a smooth fit to try and slice evenly through the periodic bumps to use the fact that the imperfections can cancel out if we are taking an integral. Then hopefully the integral will converge with less points. UQ mode information If the max of many gaussians is a good model for the function then the number of points we need for a perfect fit is the number of parameters of the model which scales with the number of dimensions and number of modes. We can use the mode identification to find the modes and get enough points for each mode to get a perfect fit.
# UQ space surrogate sampling and UQ sampling

A UQ parameter space has smaller and less features, easier to fill and GENE always converges (for many UQ spaces). So it is a perfect play ground for trialing different strategies. 

Most obvious and simplest space to explore would be the same one Ionut's explored.

Over-Fill a 3D space, try some active learning methods, see how they compare to random sampling. 

How do different UQ distributions affect the output?
# 2 bad surrogate models get perfect UQ

Explore the amount of data needed for UQ. ie how much data do you need to train a sufficiently accurate surrogate model to get perfect forward UQ given large input model uncertainties. Given a specific function and uncertanties, how do I know I have a sufficiently accurate model for UQ?

The main point is that it is not intuitive for people that a bad surrogate model can be usable for UQ, most think you need a perfect surrogate model to even trust the UQ. 

# Sparce Grids Vs Active learning for Mode classification

Lorenzo said active learning for classification is easy,

Spatially adaptive sparse grids can be applied to classification tasks. 

Mode classification is the first step to regression as it makes sense to regress within each mode because within each mode the function (frequency and growthrate) is smooth. 

# Linear Gyrokinetic Surrogate Model for Pedestal Residual Turbulence Mode Identification at Speed
Today I read William Hornsby's paper. I decided that since he didn't connect to expierment I don't need to for it to be publishable. This means I don't need to include the equilibrium in the surrogate model yet. I will do mode Identification for pedestal plasmas and some stats on what modes are present to what degree compared to eachother. I will compare speeds of surrogate with full GENE. I will do active learning to avoid the stable and high growthrate regions.

Find out what is needed to direct NoN-linear simulations for a saturation rule and see if I can work some of it into the paper.

# Large Scale Mode Identification 

I thought the fingerprints method would work but it seems that quasi-linear is required for that.

Linear gyrokinetics is usefull to identify the instabilities present and their sensitivity to various input parameters, the scales in which they exist (what does that even mean???) and hint at what numerical resolution is needed. Although it is currently too slow to be ran on an entire campaign. Usually a single shot is selected and the linear analysis is conducted before a non-linear analysis is conducted. A goal could be to automate the linear analysis and conduct it for an entire campaign of shots and reporting the statistics.

This is maybe two papers. One going over the automated linear analysis and another reporting its application to an entire campaign.
## Validate linear gene and surrogate model at same time.

Maybe Mattisse matisse.lanzarone@univ-amu.fr can do this since he is not focused on the pedestal and can use a core validation study. 

The validation comes from putting liner gene and the surrogate into a quasi linear model to then go into Astra to predict the new density and temperature profiles and repeat untill the profiles don't change and we have a steady state. Steady state is the goal for any fusion device. 

# KBM height, width limit in EPED-like model. 

This could be the first proof of principle paper for the surrogate. 

We could take some DIII-D experiment where EPED works well for and see if the new implimentations match.

full fidelity
linear gene for KBM, helena mishka for MHD-peeling-ballooning.
COMPARED TO SURROGATE VERSION OF ABOVE
COMPARED TO TRADITIONAL EPED
some empirical model for KBM, helena mishka for MHD-peeling-ballooning.

The heliska surrogate won't improve the match to experiment but going from empirical  model to linear gene might. SO it would be good to test it for shots where EPED does not match experiment. 

## Finding KBM limit - density gradient
The fingerprints paper suggests that KBM greatly affects particle transport but not heat transport. SO we could keep the temperature the gradient the same and increase the density gradient untill we get linear gene gyro KBM instability happen (identified by its finger prints, large particle diffusivity to ). 

# Eigan Solver Surrogate model

It seems this would be a good contribution to the community as eigan value simulations are difficult to procure and so if someone does this once and well to make a good enough training set then it would simplify the process for other physicists. 

# PROFILE FITTING
Chilenski's GRP is the state of the art for profile fitting. In it he seen that a full bayseian analysis where the hyper parameters are margenalised is important for getting accurate gradient information and uncertanties. Although he used EMCEE. In my masters I noticed a high autocorrelation when using emcee for some basic tasks. This discredits the reliability of the full bayesian analysis he did. I think I shoud use his library to get the profiles and gradients and then look at the emcee autocorrelation myself. If it is high as suspected then I could try different MCMC algorythems like PySTAN or PyMC to see if I can remove this problem. 



# review paper on pedestal turbulence and transport

# functions of ky

This is why surrogate model is better than GENE, we can get a value for every ky very fast, more accurate diffusivity. 

plot diffusivities as a function of ky, these will be integrated to get total diffusivity. 

Compare to full gene