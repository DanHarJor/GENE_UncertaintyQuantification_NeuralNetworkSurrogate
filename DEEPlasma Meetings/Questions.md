Simmo Sarka and Braga
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