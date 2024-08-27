# shat = 0 

Throws an error:
STOP lx.eq.0.0 and kx_center .eq. 0, can not determine x box size.

## Cole answer:
for GENE fluxtube simulations, the radial box size is determined automatically by kymin and shat such that the twist-and-shift boundary condition is satisfied according to a quantization condition. (Read Beer's PhD thesis for an exhaustive explanation if you're curious.) TLDR, this means your other parameters determine what the radial box size must be; it's dependent on other parameters.The radial box size is lx. By default it's equal to 0, and then GENE internally sets it according to the above condition.This only works if |shat| > 0. If you set shat = 0, then the quantization condition disappears, turning the radial box size into a free parameter. This means you must set the box size manually (larger than the correlation lengths). That's what GENE is complaining about; it thinks you're trying to do a flux tube simulation where the radial box size is 0. (edited)

# Quasi Neutrality
Gene throws an error when this is not respected

For 2 species ion and electrons, their density gradients should be the same 

