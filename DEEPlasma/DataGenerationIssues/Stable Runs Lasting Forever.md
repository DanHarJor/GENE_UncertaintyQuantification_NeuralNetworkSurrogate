Initial Value Stable runs last forever as they are waiting for an instability to emerge, which can happen at any point during a quiet run in any seemingly stable region of the input space.

Underflow Limit: This is when the plasma fluctuations are so small that machine precision are not enough to compute them and so the run is ended and assumed stable even if a mode may still physically appear in the future. It is hard-coded in GENE and not easily tampered with.
# Finding a generous threshold

Most think that transport timescales are a very generous time cap to wait for an instability to emerge.

Tobias thinks that transport time scales may still not be long enough.

# Using Flux to indicate Instability

If a generous simtimelim is reached then one can look at the fluxes, if there is a small flux then it is stabel for the generous simtimelim. If there is a high flux then this suggests there are competing modes and the simulation needs to be ran for longer to let one dominate. 

# Ultra Low Resolution
Maybe an ultra low resolution can speed through the space and run for very generous simtimes to find the stable region. Potentially other regions like KBM region aswell. [[Variable Resolution]]

# Not a solution

## Eigan value solver
In a stable region of the space there is are many stable eigan modes at each location in the grid space and the eigan value solver focuses on the largest growing one which is changing forever in time and it would never be able to choose one to report back with and so this would also just wait for an unstable mode. 


