
### David, input deck
nref, equilibrium electron density 
Tref, is electron temperature and is not being scanned
Bref, equilibrium magnetic field strength

- beta: Depandant on Tref and Bref, and nothing else. Setting to -1 for computation based on reference values. Scan this keeping reference values constant.
- coll: Dependant on nref, Lref, Tref, and nothing else. Set to -1 for computation based on reference values. Scan this keeping reference values constant.
- debye2: Dependant on rho_ref and debylength or Bref nref mref and mp (not sure what mp is). Possible to set to -1 if all reference values required are specified. I thought deby length was dependant on electron density and temperature (maybe the Debye **wave**length doesn't have temperature dependancy)??? 
- zeff: Dependant on electron density, ion density and ion charge. setting to -1 seems to only be able to use iterdb file. Perhaps we should calculate this from the &species groups? 
	- since we are not scanning these right now zeff is constant
- tau: Dependant on zeff, electron and ion temperature. Setting to -1 only works if profiles are specified. Perhaps we should calculate from &species groups.
	- We will potentially scan the ion temperature so this should be calculated for each point. This makes the parameter file for the scan tricky and needs to be parsed.
- amhd: Dependant on charge and beta gradient. Setting to -1 will allow it to be calculated on beta specified and temperature and density gradients in &species groups. Since these will be scanned it should be set to -1.

I have two thoughts for beta, col
Is it that the reference values are the equilibrium, and computing beta and col from the equilibrium wouldn't reflect the oscillations from equilibrium. **id say no, people can't know the off eqilibrium to input into gene. All people can know is the equilibrium**

or do we want the beta and coll inputed into gene to be that of the equilibrium **id say yes**

My gut feeling is that if we scan over beta and coll, then for a specific beta and coll we have lowered the potential values that the temperature magnetic field strength and density can have. Then there is a greater potential that when scanning another parameter dependant on these we could potentially input a value that is pysically impossible given the beta and coll specified or physically unlikely. Whilst if we scan the reference values and compute everything off of it then everything will be a true reflection of reality. The caveat is that for parameters partially dependent on the reference values we would need to specify their other dependencies to get a value for them. We could fix their other dependencies to get a value that is fixed for each scan point or scan their dependencies.

after reading the docs this may not be a problem but my gut feeling was that if we scan over col and beta, then we are effectivly changing the equilibrium values of B,T,n in a way where we don't know what they are. If other values are computed from the reference values then there will be inconsistencies (i guess this is why david suggested removing the reference values). Also perhaps there is a combination of beta and coll that is extreamly unlikely as they would only exist with extream equlibrium values, and by scanning the reference values we would never see this combination.

Should electron and ion temperature be kept the same and scanned together?

conclusion: scan the parameters and not the reference values: ensure nothing is computed from the reference values: ensure anything that is dependant on the 

what to do about zeff and tau?
### Simmo Sarka and Braga
What Physics informed ML research have you got going on

### David Hatch
Can each eiganmode be linked to a particular instability mode? For initial value solver we can find the growthrate at certain values of t. Through various methods we can identify the instability mode causing the density fluctuation amplitude growth.

### David hatch:
Your parameters file has minor r=1, is this at the seperatrix? why there, isn't the pedestal better captured by r=0.9.
### David Hatch:  Linear is cheap why surrogate?
When is linear gene too slow and the community would benifit from a surrogate model?? Not sure what we are trying to achieve with a linear surrogate model as linear GENE is already cheap.

ans Aaro: Linear Gene is still a kinetic model, for real time it is too slow. For large solution space scoping it is also too slow. We need answers instantly.

ans Adam: to make it differentiable, linear gene is fast but it is not differentiable. It is nice to have a differentiable function to explore the parameter space and identify places where a non-linear gene run should be made. 

just focus on making a super fast linear GENE for now.

### David Hatch: Standard Quasi Linear Derivation
Is there a good derivation for the quasi-linear heat transfer equation or is dimensional analysis all we got?

### Discussion Point: Qualikiz
By trying to do the standard quasilinear and surrogate it are we not just doing a poorer version of Qualikiz. Maybe Qualikiz is only for core and doesn't go into the pedestool.

### Discussion Point: GENE Pedestal Surrogate before experimental validation,
Seems strange to do a GENE surrogate of the pedestal before people have verified that GENE matches experiment in the pedestal. 

### Open, Answered in MJ course
What physics problems are researches interested in using GENE / Linear GENE, for apart from heat transport? 

Particle transport and turbulance, see last few slides of MJ 

$Q = \frac{P_n + P_\alpha}{P_H}$ 