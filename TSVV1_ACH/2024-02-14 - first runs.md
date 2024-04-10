Second meeting

nproc_sims in parmaeters file is only for scans, basically runs each scan in parallel.

Local vs Global
for large machines like iter, local is fine as gyroradius is so small compared to machine.

	local is one flux tube, ie one field line at a specific minor radius or flux surface. you can expand the radius to see a large range of the plasma in a tokamak. the simulation is bounded by a tube going around the helical field lines. 
	In global you can simulate the entire tokamak or a small section of it decided by the minor radius range. It is more relivant for pedestool for high gradient profiles. complex to set up. with global you can set up a heat source to mimic NBI and add heat sinks at the edge 

even for eigan solver there is no direct solve so you must start somewhere with some initial parameters. 


ionuts, thinks his surrogate model is great. gets rid of the need for large amounts of training data and performs well. He is developing a method to test it without test data. he said test data isn't the best. 

it sounds like what ionuts has done could be a paradigm shift in ML methods in general. 

# Toy Problem
The problem in the email. 

We should visualise grothrates as a function of input parameters. 