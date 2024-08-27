David Hatch published a paper [10.1063/5.0087403] where he tests a model for the ETG heat transport in the pedestool.

He uses MGKDB, a database of non linear GENE simulations which scan over the radial positions of the pedestal. The runs were set up to mimic discharges on JET, DIII-D, AUG, and C-Mod.

He then plots various GENE input parameters and one output parameters against the heat transport to see if there is any correlation. 

He then takes the simulation inputs and one output and uses it to compute the heat flux from the model and compares it with that of the non linear GENE simulations.




My understanding of the toy problem is that we want to compute the outward heat-flux from the pedestal due to a specific instability that is a major player in the pedestal.

This heat flux is dependent on the growth-rate of the instability and instabilities wave number perpendicular to the field. These are outputted by GENE.

There is also a fudge factor that you mentioned could be tuned to match experimental data. Does that mean that experiments can measure the heat transport from specific instabilities?

I also noticed that GENE outputs a heat flux. Is this a total heat flux from all modes of transport/instabilities and cannot be compared to the one we wish to compute?

What do you think of these steps?
Toy Problem Steps
 1 Create a database of linear local Eigan value solved gene runs that scan over the minor radius where the pedestal is located. Another GENE input will be profiles that correspond to a H-mode plasma. The runs will also be set up to match the jet tokamak for which we have data.

2 Compute the heat transport caused by a specific instability in the pedestal using the results of GENE and tune the fudge factor to match the experimental data from JET. This will be our test data. 

3 Generate a database of surrogate model training data. Scan through some GENE input parameters yet to be decided and compute the growth rate and wave number that the heat-flux depends on. 

4 Train an ML model to take the same GENE inputs and output the same growth rate and wave number as GENE.

Repeat steps 3 and 4 experimenting with various ML models such as Normalising flows, fully connected NN, Variational Auto Encoder, Active Learning techniques, and physics informed ML.

5 Test the best performing surrogate model on the training data. Place the same inputs as in step 1 into the surrogate model and get the resulting growth-rate and wave number. These can be compared to GENE's outputs. The heat flux can then be computed and compared to GENE's heat flux and experimentally measured heat flux. 