Inverse UQ
None of the GENE inputs makes sence to do inverse UQ for. Some of them are physical parameters like temperature gradient and equilibrium and the uncertainty should come from experiment. Others are numerical parameters like spatial resolution and timestep, these improve the simulation by being moved in one direction and so they need to have consistency checks but they don't need an uncertainty. 

Are there any input parameters to GENE that need tuned and therefore would benefit from inverse UQ? 
