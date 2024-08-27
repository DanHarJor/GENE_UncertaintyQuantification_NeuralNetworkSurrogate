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

# KBM gradient restriction to EPED. 

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