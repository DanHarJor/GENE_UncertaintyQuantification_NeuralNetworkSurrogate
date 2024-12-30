


# Outlier Investigation
Adam found that his outliers were because of 

1. badly labled data, and the surrogate model actually predicted something more realistic
2. the data input parameters wasn't enough to describe the system as two almost identical inputs had very different labels
3. DO numerical instabilities have anything to say about the outliers?

# Generate plot for simtimelim vs %stable


# Fix simtimelim and timelim

    timelim = 0
    simtimelim = nan
From the parameters file of new_p_test


# Marcin making NN for IV with data we have.

Daniel to
Seperate the NaN's from not converged and stable
work on generating EV data
work on getting dask, containers and lumi to play together
develop active learning methods.

Read tglf papers on developing a saturation rule. 


# Thorough NaN investigation
Currently get 50% of runs returning as NaNs. 

NaNs means not converged:

If is is stable it is unlikely to converge. If is it stable it flags as underflow limit reached.

If it is still unstable then perhaps they are not converging before the simulation time limit. Increasing the time limit or reducing omega_prec could help this. 

mode beating, This is when two modes have the sameish growthrate and so the growthrate never converges to one value but will change as their contributions add in a different proportions every next timestep. Maybe mode beating is something else... but two modes of similar growthrate leads to non convergence. 

# GENE false positive resolved growthrates, linked to numerical instabilities
some times GENE will return a growthrate as if it is resolved but from inspecting the potential as a function of ballooning angle and seeing it is jagged and not smooth, then you can know that it is not indeed resolved and you can try to increase the resolution... if I understand correct. 

# help amanda with GPR thompson scattering. 
