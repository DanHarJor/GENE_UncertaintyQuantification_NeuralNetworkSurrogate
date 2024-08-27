
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