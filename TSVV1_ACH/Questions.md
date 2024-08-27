### Tobias - Resource Allocation
When playing with gene I often got an error when the number of MPI processes didn't exactly match the number of tasks requested in sbatch.

I noticed in the sbatch you sent it uses exactly 2 nodes. The parameters file also specifies that some s_procs\*s are negative. Does this mean that gene can take the amount of resources available in the automatic decision for the parallelization values n_proc\*? 

### Temperature Gradients
I know I need to preserve quasineutrality which means the densities and density gradients need to depend on eachother, but do the temperature gradients depend on eachother? Can I use this to reduce the search space?

### Tobias - Eigan Value Solver

Do you want us to use the EV solver at some point too? It can be computationally more demanding and tricky to work with. But there is a easy, fast and unreliable one. 

#### NaN
Sometimes gene throws a nan. This is either because the mode is stable or it is because the Initial Value solver doesn't converge to a single mode. How can we tell the difference? Will the eigan value solver circumvent this issue?

cole "You can check this with the GENE diagnostic tools by looking at the time traces of various quantities."

WIll the Eigan value solver circumvents this issue? SO all nans are because the growthrate is negative/stable?

### Tobias - How long does gene take? PARTIALLY ANSWERED
What affects how long a gene simulation takes?

Is it just paralellisation and numerical parameters or do the physical parameters also matter. ANS for initial value simulations the time definitely changes with physical parameters as they change the growthrates of the various turbulent modes. It will take a long time to finish if two modes have a similar growthrate and the dominant mode needs time to outgrow the subdominant one so the overall linear growthrate converges to the specified precision. WHAT ABOUT FOR EIGANVALUE SOLVER?

in the scanfiles there are two files called geneerr.log and geneerr.log_0001_eff. ANS generr.log shows the wall time for all runs, geneerr.log_0001_eff is only created if doing parallel simulations and is the wall time of the 1st simulation. 

Will it always show in seconds or does it sometimes show in h, min. For parsing. ANS It seems to always show in seconds.

### Tobias, quasi-neutrality
I got gene errors when quasi-neutrality was not respected. The ion and electron density gradients needed to be the same.  If we have more ion species then perhaps the gradients don't need to be the same. Are there any rules in place for their gradients? Is it possible that in reality these rules are not completely respected and that is a limitation of the gene simulation? 
	**ANS** yes there are rules governing their gradients and densities, Ionuts already implimented them you have them in a recording and potentially on github. You can check them or work them out for yourself. 

### Tobias
is omega_prec about consistency checks. where you double the numerical resolution and see if the growthrate changes by a precision given by omega_prec? 
	**ANS** omega_prec determines the resolution of the growthrate due to there being multiple unstable modes with different growthrates. This causes the linear growthrate to change over time. Due to exponential growth after some time a particular mode dominates and its growthrate becomes the instability growthrate. Once the difference in growthrate between two timesteps is less than omega_prec, the simulation stops. Maybe its frequency rather than growthrate since it is omega??

### Inverse UQ

This is when we have an experimental uncertainty for the growthrate and from this we want to know what is the uncertainty of some input parameters. Which gene parameters does this make sence for. Can we not get uncertainties form all of the physical gene parameters from experiment? This leaves maybe numerical parameters but these don't really have an uncertainty, more is we change it towards a known direction we get higher resolution at a computational cost. 

None of the GENE inputs makes sence to do inverse UQ for. Some of them are physical parameters like temperature gradient and equilibrium and the uncertainty should come from experiment. Others are numerical parameters like spatial resolution and timestep, these improve the simulation by being moved in one direction and so they need to have consistency checks but they don't need an uncertainty. 

Are there any input parameters to GENE that need tuned and therefore would benefit from inverse UQ? 
