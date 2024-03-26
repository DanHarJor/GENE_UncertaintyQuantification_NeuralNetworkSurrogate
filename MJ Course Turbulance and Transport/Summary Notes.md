
## Intro
maybe some of the non fusion people would like a recap

Why fusion over fision? Binding energy
Why DT reaction? 
What is the Q factor, ignition, tripple product?
$Q = \frac{P_n}{P_H}$
$P_\alpha > P_L$
$nT \tau_E > 3 \times 10^{21} m^{-3} keVs$ 
    $\vec B^{2} \beta \tau_E \propto nT \tau_E$
How do we heat the plasma?
$\omega_c = \frac{\vec Bq}{m}$

What is a plasma? 
	- deye shielding 
	$\phi = \phi_0 \exp\left(-\frac{r}{\lambda_D}\right),$ $\, \lambda_D = \left(\frac{\epsilon_0k_BT}{n_ee²}\right)$
	- plasma waves
	- plasma frequency $\omega_p = \left(\frac{n_ee²}{\epsilon_0 m_e}\right)$
		- EM below $\omega_p$ is reflected, above penetrate
		- instabilities from resonance with plasma frequency
	- Landau Damping
Historic confinement attempts
Magnetic mirror
	- fails because fast particles escape and Maxwellian allows some particles to be fast, eventually all particles escape
First torus, drifts lost all plasma
Stellerator or polodial field and drifts cancel
Magnetic Flux Surfaces, Why D shape, Divertor
safety factor
Profiles, density, safety factor, 
Bananna orbits
H-mode, how achieved and ELMS


What are the goals of ITER?

Classical (assume gas behavious), neoclassical (take gyration, fild line following and banana orbits into account) and anomalous/turbulent transport. 

Ways to describe the plasma, Fluid model, two fluid, MHD, fully kinetic, gyrokinetics
# L2
19)How the instability can be treated as a perturbation (L2 slide 19). The linear part of the taylor expanded time derivitave would show that if the perturbation instability has an imaginary frequency then the amplitude grows or shrinks depending if the real frequency is +ve or -ve. Stays the same if real. 

20)When the instability grows the non linear parts become important and the amplitude saturates (hence saturation rule) rather than growing for ever like in the linear case. Heat flux saturates rather than growing forever. 

23)what is kilmogorov turbulance, what is the kolmogorov inertial range, does it apply to plamsmas and why?

24)How does a fourrier transform help us solve non linear PDE? What happens to a differential after a fourrier transform. What is a fourrier convelution

# L3
3-6)How is the horton holland fluid model derived, what is the coordiante space used to get ky and kperp

how do we get to the dispersion relation analytically
and numerically? Both ways start with the wave ansats and plugging it into the partial differential equations to get an expression that contains the complex frequency and wave numbers ky and kperp. For horton holland fluid model this is quadratic and we can can be solved with quadratic formula. Numerically we can do LHS - RHS = 0, take a specific value for kperp and ky and plot the imaginary result of LHS-RHS for a range of complex frequencies as a contour plot. When can then find when it is 0 and this is the complex frequency for that specific kperp and ky. This can be done for many ky and kperp to get the dispersion relation. Very brute force method. 

The imaginary parts of the complex frequency from the dispersion relation tell us about the growth or decay of the waves and can be used to determine the growth rate. How exactly is the growth rate computed?

7)Unclear, what are the crosses in the plot, 
What is the mechanism for stable modes to return energy to the gradients (seems like not even MJ knows the mechanism)

9)theory frameworks 

you can just try and get the transport coefficients.

you can go from the big daddy 6D kinetics to gyrokinetics or to fluid model MHD. From gyrokinetics you can go to a gyrofluid model.

How does one go form a kinetic model to a fluid model?

10)some often assume a constant heat and particle diffusivities across the minor radius and tune them to match experiments or theoretical expectations. Linear gyrokinetics can't provide the diffusivities and many papers don't have supercomputers to get them which is why they rely on this technique of tuning to experiment or expectations. The better method is to do non linear gyrokinetics to get dissusivities and pass onto transport modelers.

11)kinetics
is the vlasov equation the same as the foker plankk, what are the differences. How is the vlasov equation derived?

What is particle in cell, what equations would it use and how were they derived. Why is there noise build up issues when ran for long times?

How does using distributions circumvent the noise build up? 

Does the vlasov equation include collisions? what would a collision operator look like or how is it formed? vlasov RHS=0 normally or RHS=Colision operator(f)

12)how does finding moments go on forever, how do you decide a closure point?

13)MHD, how does one derive MHD equations, what are the other types and their use cases. When is MHD valid.

14)Usual general description of gyrokinetics
summary of ways to derive it,
Jenko, MJ and most obvious. 
Intuition on how this goes from 6D to 5D

16)What is drift kinetics, how is it derived, under what assumptions is it valid. 

19)What is Landau Damping and its consequences,

# L4
4)torodial co-ordinates, reminder about safety factor and periodic field lines and turbulance resonance. Is turbulance isotropic? What about the stellerator, stllerator has no current, so no poloidial field and thus the field lines always bite their own tail. But it is possible to optimise their shape to avoid turbulance.

place in, global vs flux tube gene pro's and cons.
Flux tube can represent entire flux surface, less computational cost and makes fourrier transforms cleaner,

5)How is the grid space defined and discretised for a flux tube.

6)Code Simplification against reality to make flux tubes work. The center of the flux tube must be at a periodic field line. A simplification is required for the code to be able to deal with non perodic field lines. For non periodic field lines beside the central one the code will basically teleport particles. As the particles move along the non periodic field line in one torodial turn they are at a different grid cell point. which is some distance away from the origional starting point along the flux surface. The code then teleports it back this distance to where it origionally started so that particles don't eventually leave the flux tube.

Why flux tube doesn't represent flux surface for stellerator.

7)to avoid dealing with this complex geometry the 1D Ballooning representation was created. How is it ballooning angle calculated. How does it relate to the real geometry. It can be used to categorise instabilities. What is a balooned mode vs a slab-like mode?

slab geometry means paralell fiels lines. like before polodial field was introduced. 

flux tube is an estimate and for real/critical applications global vs flux tube comparisons should be made. 

10)look at email for grad shafranov explination. 

11-17)zoo of instabilities, understand each of the ways to tell instabilities apart. Understand the drives for each instability, at least have literature on it. 

It is useful to characterize instabilities so that we know how to create or suppress them. Sometimes they have desirable properties, eg used to suck fuel into the core. So we need to be able to distinguish between them. But then you can have hybrid modes. SO anything can happen

# L5
summary questions
***how many eiganmodes per wavenumber exist in a fusion plasma?***
There is an infinite number but in a simulation we find a number on the order of the product of the resolutions. 

Although all the unstable modes will be found and there is an infinate number of stable modes or numerical modes. 

I don't understand, a wavenumber corresponds to the wavelength of the wave that is propegating. How can this single wave have many modes? what even is a mode? Does this mean there can be many waves of the same wavelength and only some of them will grow. I really need to understand exactly what the **wavenumber is and exactly what an eigan mode is.**

***How can we make more or fewer modes unstable?*** by lowering the drive, temperature and density gradients, beta, viscosity or shear McKinney JPP 2019

each mode gets a growthrate, not the wavenumbers. I think the wavenumber is just because we are in k space and is refering to the new space rather than the actual realspace wave...?

***Under what conditions is the gyrokinetic framework valid?*** 

When the physical phenomena being studied operates in timescales much slower than the gyro motion. Nearly closed larmor orbits ie small drifts. When the size of the system being studied is small compared to the larmor orbit.  

## Gyrokinetics Derivation
I should also partially derive the vlasov equation. 

It is very complicated, took MJ pueschel 3 months.
There has been three methods I have seen, 
The obvious one with many pitfalls, frank jenko one and MJ's one. 

The obvious way:
Take the equations of motion for charges particles in a magnetic field and then transition to guiding center co-ordinates and average over the gyration angle and then dervie the vlasov equation in the ususal way. 

It is difficult to do this co-ordiante transition and the method in general makes it difficult to avoid the pitfalls of energy conservation. 

So instead the jenko and MJ way start with the Langrangian for charged particles in a magnetic field. and the Euler lagrange equations which can be used to derive the equations of motion anyway. It is easier to do the transformation for the euler langrange equations. 

MJ used a LIE transformation to conserve energy whilst jenko said the langrangian mechanics takes care of that. 

MJ then reduces the gene gyrokinetic equations to have various assumptions, beta=0. This assumes the magnetic field is infinatly strong, instant guitar string restorations ie no magnetic field fluctuations. This also allows us to remove the non linear term, purple part on slide 18. Of which the fourrier transform takes most of the time

then we can assume no collisions. With no collisions the particle distribution is frozen in time and so df/dt =0. 

We can have a homogenious magnetic field, the background field does not change in space.
MJ also mentioned each gene parameter I can use to make these assumptions. IN paper notes.

I can also take the drift kinetic limit where the turbulance structures have small or large spacial scales compared to the gyroradius and thus overall the it doesn't feel a much different field depending on the gyro position and we can take the field at the gyro center as the field. 

To reduce the strain on the numerical implementation you can normalise the values

for linear runs all real space information is kept in the ballooning function. balloning angle spans kx and z for a single ky. 

I dont understant the rest of the lecture. from 29 onwards. Not like I understood much before either.

for Initial value solvers the fastest growing mode dominates and that is all we see. We can use an eigan value solver to see other modes. 

Instabilities can be identified by looking at the ballooning angle electrostatic potential function. 
# L6
finite differenceing is a numerical differentiation technique where the differential of a function is a small change of the functions value over a small change in the variable. If we make the difference small enough then it gets closer to the actual differential value. 

When we get to the domain boundary we hit a problem as there should be no function values past the boundary so how can we find the gradient there? We simply have ghost cells. these are the cells a little past the boundary of interest so we can compute the gradient within the boundary.

There is also the concept of the stencil. There are many ways to do the finite difference in terms of how many points to take on either side of the point of interest, this determins the length of the stencil. The longer the stencil the more accurate the derivite computed but the function needs to be evaluated more times leading to longer compute times. 

The stencils can be computed using a taylor expansion of the function. See screenshot

look at alternatives to finite differencing. 

hyper diffusion is not just diffusion on more dimensions. 

slide 7 
There is a problem with the simulation. MJ said it was because the numerical resolution is not high
enough. But it is high enough to capture the physics but not enough to dodge this "hyperdiffusion" issue from finite differencing. I think k=0 should be the same as k = pi/deltax 

The issue is that high k modes are being numerically calculated to have a high grothrate when they are actually stable modes. to fix it there is a fudge factor. look in paper notes to find it for GENE. You can plot grothrate as a function of kparalell to see if it is an issue. If high kparalell have a positive grothrate then there is an issue. So long as the fudge factor is high enough to make the growthrate below 0 then we are happy. They don't need to be exactly the true value. If they are below 0 then they won't grow and thus won't outgrow the truely unstable modes we want to identify and study. 

# 7 
instabilities can saturate because their energy source is depleted or because the begin being turbulant and the non linear terms become sizeable compared to the linear terms

What are zonal flows?
Zonal flows are a polodial flow of plasma that is driven by complec interactions of instabilities, turbulance, and gradients. It is like the gulf stream in the ocean. There are also zonal flows in the earths atmosphere. They can work to improve confinement. Imagin a swirl of turbulant features, and then blast it with a fast flowing jet. The turbulant structures are blasted away and the particles follow the jet stream. 

A secondary instability is one that is powered by alterations of another instability. Eg the temperature gradient caused by a tubulent eddy can casue a secondary ETG instability. 

9) MJ said the following slides are at the forfront of turbulance research and not easy to get.
10) the plot on the right shows something known as an overshoot. He said it is often not realistic as it is dependant on the initial conditions of the plasma and these are unknown. Besides that initial conditions that have an overshoot are often chosen as they allow one to easily know when they have saturated. Therwise a longer simulation is needed to ensure one has saturated. The graph shows that in a simulation the zonal flows reduce the heat transfer from the ITG turbulance. 
Zonal flows affect different turbuland modes differently. The modes have different drives and drifts.

high beta runaway. 
12) left plot shows a simulation that encounters the heat tranfer explosion after some time. The right shows that this happens when beta reaches a critical point. In both the zonal flows dissapear. 
for many years it was not explained. Pueschel thinks he knows why. The idea is that a random pertubation of the electron as it polodially goes round causes it to move to another flux surface and then electrons can enter and leave the zonal flow region. something like this creates a charge inbalence which creates an electric field which causes a drift which causes more to enter the flow and it is a visious cycle that carries on unitll the flow is completly quenched. I know it is wrong but he said something like that. See if you can find some MJ literature on it. He calles it field line decorrelation causing a non-zonal transition. He says it allows for an excelent prediction of massive q rise with beta. 

Apparently it has something to do with stiff profiles. Meaning we can´t increase the plasma pressure. 

20) qualsi linear
what is available from linear simulations, growthrate, frequency of instability oscillation, perpindicular wave vector, eiganmode(what even is this), electrostatic potential(balooning angle), distribution function f,

Practically what we want are non-linear heat and particle fluxes, linear fluxes grow forever but the non-linear ones saturate and so we want to know when it saturates. Non-linear simulations are expensive. Using dimensional analysis we see the heat and particle diffusivity goes as growthrate / kperp² and adding is a fudge factor or saturation rule tuned to non linear simulations or experimental results we can get a function that provides us with non linear heat and particle diffusivities. So long as we stay close to the operational space of what was used to tune the saturation rule. 

This gets us the heat/particle flux for one mode in the wavenumber ky. We need to sum over all modes and ky to get the total heat/particle flux. 

There is a further correction Pueschel mentioned called the weight. It is the  Φ×T phase, I think this when you multiply the complex part of each number, I am not sure. They are complex because we are in fourrier space. 

the kperp² is an average and to take the average we do an integral. The limits of this integral used are arbitrary, it should be -inf to +inf, MJ chose 3pi to -3pi. I think to know good values of the limits we should look at the electrostatic potential as a function of ballooning angle. 

I am not sure what the omegaT is.

This concludes standard quasilinear approximation.

After MJ goes into how to add in stable modes and triplet correlation time which is to do with the resonance of modes. These require expert manual intervention to impliment and has many pot holes. These corrections are beyond the scope of the project. MJ said he thinks it unlikely I will ever get there. 

25) he then shows an example of when this beyond standard quasilinear works well. Some times standard quasi linear is quite far off but the extra correction is quite close. 

MJ sent me some code to get the standard quasi linear information from a linear run. I want to try and make this an inbuilt part of GENE. 

# L8

6) what would be an ideal benchmark parameter point?
something simple that doesn't take much computational time. 

at the limits of one of the models. 

topical benchmark for an area of scientific interest. 



MJ touched on integrated modeling. we need to develop many models that all need to communicate together to make a digital twin/ flight simulator. Both real time and high fidelity. 

most modeling tools stop at the pedestal. 

We can take the 0 order moments of the vlasov equation to get particle transport equations dv and similar to get energy balance equaton m/2 dv²

19) Then flux surfaces, can use MHD and gradshafranov equations to get the fluz surfaces. It says we also need neoclassical fux surfaces, especially for stellerator. WHy??

Turbulant transport model heirarchy
full kinetics
non-linear gyrokinetics,
quasilinear gyrokinetics
reduced QL model QuaLiKiz or TGLF
simple transport coefficients and critical gradient models. 
Need ML for real time control.

Why do we study turbulance. 
21) it was discovered that by injecting impurities in the edge turbulance causes the core to rise in temperature. 
1) I was discovered that turbulance causes fuel injected at the edge to be pulled into the core. While another form of turbulance ejects some of it back at the same time. Because of the gradient shift. 
2) by modeling the transport of tungston it was found it will collect in the core and cause radiative collapse in JET and that using ITG turbulance you can push the tungston to the edge of the tokamak. Apparently its not useful in ITER but the study is usefull as we can explain/predict the experiment. Such turbulance understanding might be useful in the future.








