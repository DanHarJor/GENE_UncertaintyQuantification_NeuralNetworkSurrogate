# Search Space Classification
To save compute we would like to split the domain into ['stable', 'non-stable-physically-viable', 'non-stable-not-physically-viable']

'non-stable-not-physically-viable' splits into:
 1. KBM threshold limit reached. This could be identified with the mode identification tool (fingerprints) and then all KBM regions could be avoided with the classifier.
 2. 'High eta' ie steep temperature gradient but not steep density gradient. 
 3. Artificial modes (These could be masking some real physical modes, perhaps I need an eigan value solver to get to the real physical modes)
 [WE COULD POTENTIALLY USE SVM TO FIND THE DECISION BOUNDARY AND SAMPLE NEAR THE BOUNDARY TO GNERATE MORE DATA TO BETTER RESOLVE THE BOUNDARY]

We then want to regress through the non-stable-physically-viable space so we want to sample a lot of data in that region. 

Some regions are not physically viable because they have an extreamly high growthrate and the profile would never evolve to have gradients that drive such instabilities because the transport would instantly relax the profile. If I am operating in a space that matches an experiment then I can look for the maximum gradients reached and limit the space to slightly beyond that. If I am trying to simulate ITER, where there are no experiments, then this boundary will need to be learned. **Not sure how to do that.** Aaro thinks I shouldn't focus on a hard boundary but try to softly deter the active learning from exploring the not physically possible space. 

# GENE Input Deck

David sent me this parameters file for miller geometry.  
Is there are reason that it is using the initial value solver over the eiganvalue solver?

**Parameters with Range Suggestions**

_x0_ = 0.7 to 1, to cover the pedestal

_kymin_ = 0 to 300, because you went to 240 in your parameters file

_hyp_z_ = -2 to 0 (you have it set to -2 and default is 0, I believe this was in MJ's course and can massively affect the results)

**Parameters of current unknown Range**

_beta_

_q0 :_ safety factor q at the central radial position of the flux tube

shat : [real 0.0]: magnetic shear parameter as defined by ŝ = (ρ/q)(dq/dρ)

  

      electrons:

omt: temperature gradient:

omn: density gradient:

temp:

dens: 

  

      Ions:

omt: temperature gradient:

omn: density gradient:

temp:

dens: 

  

**Parameter Change Suggestions**

_amhd_ :α parameter as used in magnetohydrodynamics and defined by αMHD = −q 2 R (dβ/dr) where β = 8πp/Bref;

 for amhd=-1, it is set automatically such that it is consistent with β and the temperature and density gradients of active (and dilution) species; 

otherwise, any other value can be chosen in order to study Shafranov shift effects in the geometry independently of dynamical finite β effects (associated with magnetic field fluctuations); note:

  

I suggest changing this to -1 to make it consistent with other parameters and avoid doing to calculation myself.

  

**Parameter Dependencies:**

Whenever parameters are dependant on other parameters I would suggest that some are specified and the others calculated for database generation. The specified ones would be the inputs to the surrogate model and the others left out.

  

_debye2_ [real 0.0]:  squared debye wavelength normalized to ρref. I am not sure I have heard about deby wavelength. If it is the same as the deby length then it depends on

electron temperature and density which are also parameters. I would suggest this to be calculated from the other parameters.

  

_tau:_ This is also dependant on other specified parameters. tau = Zeff*Te/Ti,   Zeff =  (1/n_e)  ion_species_sum(dens_ion_species*charge_ion_species_squared). The charge and density of each species is specified as well as electron and ion temperatures. I suggest tau is calculated from other parameters.  
_  
trpeps:_ trpeps [real 0.0]: inverse aspect ratio at the flux tube position, ϵ = r/R. This confuses me since the aspect ratio is supposed to change for each device not flux tube position. I would guess that the tokamak minor radius r is exchanged for the flux tube radial position when computing aspect ratio. This is dependant on the parameters x0 and R. I suggest trpeps is calculated.

  

**Mag Geometry**

I would like the surrogate to take as input the magnetic equilibrium. For now the miller geometry you sent will be used.