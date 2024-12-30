Aaro's Approach to Paper Writing

Make slides to tell the story. 
Title = Main Message
Figure
3 bullets for main take aways

"you can write a paper in a day by taking the slides, one paragraph each of the title and 3 bullets and then the same figure". Total of 5ish figures, so 5 slides. 
# Introduction

There are many issues to consider when running Gyrokinetic simulations. Resolution, convergence checks, stable regions taking forever, numerical instability detection...

If these are all handled in an expert way to generate the training database for the surrogate model then the responsibility is taken away from the users and high quality runs are readily available to the community.

Data Generation - Dimensionally Adaptive Sparse Grid. 
There are many methods that use surrogate models to boost UQ, see Context-aware learning of hierarchies of low-fidelity models for multi-fidelity uncertainty quantification 10.1016/j.cma.2023.115908. Ionuts Farcas

# Possible Modes:
Macro Instabilities
KBM

Micro Instabilities:
ITG, ETG, MTM, TEM

Not Sure:
Neo-Classicle

Other:
Numerical/Artificial Instabilities (don't exist in real life but appear in the simulation because of low numerical resolution or geometry simplification), High resolution Global simulations have less of these than low resolution flux tube simulations.  


# Instability Finicky

## Our Modes, Classification and Transitions
id points ![f0](https://camo.githubusercontent.com/ea2a5d2501e08cd59cc0efdef8b58ac79761a672e63bc2d001b3c0f19f1a13b4/687474703a2f2f63686172742e617069732e676f6f676c652e636f6d2f63686172743f6368743d74782663686c3d253543766563253742782537445f6a253230253543696e253230253542302532432532303125354425354532)) using piece
ETG is for high ky, we are starting with low ky.

ITG and TEM are suppressed in the pedestal and so unlikely but can easily be detected as (ITG/TEM) class with diffusivities as in fingerprints.

What is left is MTM and MHD-like instabilities. These can be distinguished with diffusivities in fingerprints paper. 

With classification we can classify stable, MTM and MHD-like. The MHD-like should exist with high temp and density gradients. We can plot the grothrate as a function of these, keeping other parameters the same and find where it becomes MTM unstable. Compare surrogate model with real GENE for a few cases. Could be used to replace KBM model in EPED. 

## ETG
"The linear system exhibits multiple (greater than ten) unstable eigenmodes at each perpendicular wave vector, representing different toroidal and slab branches of the ETG instability."

"With this decomposition, one can see how many nonlinear modes need to be considered at each ky to account for the heat flux."

"One might expect the high number of active modes to complicate quasilinear approaches to reduced modeling for this scenario. However, Hatch et al.8 demonstrate that an accurate reduced model can in fact be constructed from the most unstable eigenmode alone (albeit with an additional parameter dependence on g ¼ Ln=LT )."
https://doi.org/10.1063/5.0146968

perhaps this means that the eigan value solver would be necessary, but maybe not as shown by David. 

# Ballooning, KBM
"highly ballooned (i.e., localized at the outboard midplane)"
https://doi.org/10.1063/5.0146968
# Beyond Scope Of Paper-for conclusion

Full quasi-linear transport model.
EPED - KBM limit model for EPED to make it more accurate and potentially faster with surrogate. 

# Key Messages from group:
Daniel - How to we find unphysical grothrates to reduce the domain size to be searched?
David - A couple of thoughts here--sometimes extremely unstable MHD modes (e.g., KBM) are found for fairly reasonable parameters.  KBM growth rates increase very strongly above their threshold, so what you’re really seeing is an indication that you have surpassed the KBM boundary.  This is not something you should discard--rather it’s an important piece of information.  Another possibility is that the mode is somewhat artificial since you’re doing local simulations in the pedestal.  I discuss this in Hatch et al. NF 2019,  Finally--pedestals intrinsically have extremely steep gradients and I think your ranges are probably consistent with experimental data (IIRC).  But density gradients stabilize a certain class of modes (see Kotch. et al. NF 2024), so you can only get to extremely steep temperature gradients if you also have extremely steep density gradients.  Perhaps your scans are taking you to high eta--i.e. steep temperature gradients without steep density gradients.  In any case--as long as your simulations are numerical instabilties, IMO you should keep them and they will be informative regarding points in parameter space that are potentially out of bounds for a real scenario.