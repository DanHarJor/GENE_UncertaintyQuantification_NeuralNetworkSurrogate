it is not as simple as 1 instability leads to one transport mechanic. Multiple instabilities can contribute to one transport mechanic. There is always more than one transport mechanic in play. 

Although it is possible to link certain instabilaties to certain transport channels. The various particle populations are suceptible to various instabilities and transport mechanics. 

We will look at eigan modes solver, probably not developed for GPU.

Toy Problem
simple geometry, eigan mode solver

we want to predict parameters for multiple modes. 

The surrogate we want should obviously predict heat flux

$$
Q = n \Delta T \chi
$$
$$\chi \propto \frac{L²}{T_g}$$

$$\chi = \frac{\gamma c}{<k_{\perp}>²}$$
$\gamma$ is the growth-rate of the instability, $<k_{\perp}>$
is the average micro instability wave vector perpendicular to the magnetic field, c is the saturation rule; it is a fudge factor that is tuned to match non linear simulations or experiment.

$\chi$ is diffusivity, $T_g$ is growth rate of the instability, $L$ is inverse timescale, c is a fudge factor that we can tune to match the non linear data or experimental results and $k_{\perp}$ is the Eigenmode-averaged perpendicular wave number and is computed by the GENE Eigen mode solver

$\chi = \frac{\gamma c}{<k_{\perp}>²}$ , , 

