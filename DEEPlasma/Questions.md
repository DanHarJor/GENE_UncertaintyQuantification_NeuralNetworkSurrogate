# New Postdoc
Will you get him to work on getting a saturation rule or help with surrogate modeling?
# Can I compute the fingerprints without a saturation rule?

since the fingerprints require diffusivity then I should need a quasi-linear approach to compute them.

In the fingerprints paper it mentions that "The	transport	fingerprints,	calculated	from	GENE	simulations,	are	displayed	below.		 The	***local	quasi-linear***	results	for	the	MTM,	are	shown	in	Fig.8."

But in the caption for figure 8 it says "Transport	characteristics	for	***local	linear***	MTM"

Its seems that quasi-linear and linear is being used interchangeably and so potentially any refference to linear gene results does not provide any hope that a saturation rule is not needed. 

# Quasi-linear pedestal simulations already done??

In the finger-prints paper there are quasi-linear GENE simulations of two shots of D-IIID pedestal which provide diffusivities that agree with what is expermentally observed through profile evolution (interpretive transport analysis). 

To me this means there is already a saturation rule and I can validate the linear surrogate model in the same way. 
# Is local still worth-while even though global finds different dominant instabilities?
In david hatches paper and the finger prints paper the local simulations show different instabilites than the global ones. "We	now	turn	to	linear	global	simulations	with	GENE;	these	include	the	full	variation	 of	the	pedestal	profiles,	including	the	Er	profile	from	CXS.	***The	only	instabilities	that	 survive	are	the	MTM***	(Fig.10)."

"These	fingerprints	(calculated	from	local quasi-linear	simulations)	are	as	expected,	and	 similar	to	ones	obtained	from	global	linear,	and	nonlinear,	results	(see	section	VII)."

These statements contradict eachother. If in global simulations there are no kbm then why would there still be KBM fingerprints in the global quasi-linear and nonlinear simulations.   

# Is KBM a micro-instability? If do then why does the fingerprints paper call it an MHD-like mode?

MHD is a fluid model and so can only model macro instabilities. Gyrokinetics can theoretically resolve both macro and micro instabilities ALTHOUGH I thought the grothrates that gene outputs are only for micro-instabilities. I also thought it could get a KBM growthrate. So then why is the fingerprints paper calling it an MHD-like mode. 

# Why compute growthrate from potential and not distribution function
I talked to Joseph and he said that he is making something to compute the growthrate by tracking the changes in the potential as a function of ballooning angle over time. 
# What is the status of GENE experimental validation?

 - Has non-linear GENE been experimentally validated for both core and pedestal?
 - What experimental measurements are used to validate it and how?
 - Is it possible to experimentally validate linear gyro-kinetics? Has linear GENE been validated? How?
 - Wouldn't it be a little strange to make a linear GENE pedestal *surrogate* **before** linear GENE has been experimentally validated to work for the pedestal? 
 - A benefit of a surrogate is that the surrogate could be validated against many shots while the original model is too slow and can only be validated against a few.
# What do you forsee a linear gene surrogate being used for? Why is linear gene not fast enough? 

# David, EV surrogate usefull?
Do you think a EV solver surrogate would be useful to the community since it is important for subdominant modes and computationally expensive and would it be worth a publication. Or is IV solver enough for the vast majority of use cases?

Would it be useful at a large scale for mode identification or something else?

# Would Automated linear gyro mode identification for mass scale be possible and usefull?
In the paper doi:10.1088/0029-5515/56/10/104003
Microtearing turbulence limiting the JET-ILW pedestal D.R. Hatch

David goes through an linear identification of the modes present in the experimental shot at different points along the pedestal and within experimental uncertainty. Is it possible to automate this analysis?

Would it be useful to apply it to an entire campaign using a linear surrogate if gene is too slow? Is such a study credible if linear gene isn't experimentally validated for the pedestal? 

	- to do this we would need to make a gloabl linear gene surrogate, since the paper highlights that there is an important discrepancy between local and global. Should we do this first? 


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

### David Hatch
Can each eiganmode be linked to a particular instability mode? 
ANS- yes but I con't know why...
,For initial value solver we can find the growthrate at certain values of t. Through various methods we can identify the instability mode causing the density fluctuation amplitude growth.

### David hatch:
Your parameters file has minor r=1, is this at the seperatrix? why there, isn't the pedestal better captured by r=0.9. answered in slack I think.

### David Hatch: Standard Quasi Linear Derivation
Is there a good derivation for the quasi-linear heat transfer equation or is dimensional analysis all we got?

### Discussion Point: Qualikiz
By trying to do the standard quasilinear and surrogate it are we not just doing a poorer version of Qualikiz. Maybe Qualikiz is only for core and doesn't go into the pedestool.

### Open, Answered in MJ course
What physics problems are researches interested in using GENE / Linear GENE, for apart from heat transport? 

Particle transport and turbulance, see last few slides of MJ 

$Q = \frac{P_n + P_\alpha}{P_H}$ 