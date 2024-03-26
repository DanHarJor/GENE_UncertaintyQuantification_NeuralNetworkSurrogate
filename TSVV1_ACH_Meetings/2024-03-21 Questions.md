
Tobias:
MJ mentioned that the slowest part of GENE is the fourrier transform of the non linear part. Has there been any efforts to speed this up with a reduced version of the Fourier transform, eg NN?

Tobias:
In the parameters file there are some parameters with this ! +/- 15%. Is this just a comment?

Ionut:
To get growthrate uncertainty this is what I imagine. You have your many inputs with their errors. You use SG or scan to get many growthrates. You can then plot a distribution of growthrates. To get even more growthrates for the distribution you can use interpolation between the parameter values. 

Ionut:
Does SG do a run to decide where to place the next points? 

Tobias:
Why are we scanning over kymin. Why is it kymin and not just ky.

Tobias:
The py-diag requires the time range, is it only for initial value solver?



if small $\Delta T_{grad}$  $\rightarrow$ large $\Delta \gamma$ then $T_{grad}$ is important