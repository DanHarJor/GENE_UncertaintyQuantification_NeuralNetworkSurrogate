
Tobias and Ionuts said that linear gene would be a trivial problem for a neural operator and that it would be more interesting to apply it to non linear runs.

Maybe we could use a linear neural operator to inform an non-linear operation in multi-fidelity methods. Kind of like a super fancy saturation rule. 

GENE would just need the last distribution function to get everything it usually outputs. "If I have the last one then that is the converged solution and I don't care about the rest. to solve the vlasov equation I just need delta f so I can just move it one time step to get differentials and I can get all of the GENE outputs" Tobias

If you want a 5D real space distribution function you would need to piece together multiple distribution functions for provided by gene for multiple ky values. 

The eigan value solver can get the eigan vectors/ eigan functions which are the distribution functions and can output these at different points in time which could be used to train the fourier neural operator. 