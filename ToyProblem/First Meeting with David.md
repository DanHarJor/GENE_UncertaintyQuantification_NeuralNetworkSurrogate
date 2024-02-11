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
$\chi$ is diffusivity $\propto \frac{L²}{T}$  , $T$ is grothrate of the instability, $L$ is inverse timescale   

$\chi = \frac{\gamma c}{<k_{\perp}>²}$ , $k_{\perp}$ comes from the eigan mode solver, c is a fudge factor that we can tune to match the non linear data or experimental results.


