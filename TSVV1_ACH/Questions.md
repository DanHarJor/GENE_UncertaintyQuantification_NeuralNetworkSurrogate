### Tobias
is omega_prec about consistency checks. where you double the numerical resolution and see if the growthrate changes by a precision given by omega_prec?
### Tobias
Initial value solver. We are using the initial value solver. Is the growthrate recorded in the scan.log file the one at the end time of the simulation? 

### Memory, Tobias
How to decide how much memory a simulation needs, I looked at autopar.dat, is the mem_max for one process and I should multiply that by the number of processes svwxyz ? not considering a scan. 

Inverse UQ
None of the GENE inputs makes sence to do inverse UQ for. Some of them are physical parameters like temperature gradient and equilibrium and the uncertainty should come from experiment. Others are numerical parameters like spatial resolution and timestep, these improve the simulation by being moved in one direction and so they need to have consistency checks but they don't need an uncertainty. 

Are there any input parameters to GENE that need tuned and therefore would benefit from inverse UQ? 
