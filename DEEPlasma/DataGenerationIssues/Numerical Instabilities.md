Ignore for first paper

Try to get data from joe to help with numerical instability solver.
# Key Messages
___________________________________
Cole Stephens
There are semi-rigorous but time-consuming approaches. One is to increase the resolution until the growth rate doesn’t change even when you double the resolution along one axis.In practice, people often examine it by eye. A tell-tale sign of a numerical instability is when the eigenfunction and geometry are “discontinuous” and jagged, or if the eigenfunction does not decay to zero at the edge of the box.(I put discontinuous in quotes because we’re working on a discrete grid after all.)

[9:33](https://deeplasma.slack.com/archives/C076S8BFD6H/p1724351612418519)

Cole Stephens

I believe when Jonathan Citrin trained a neural network on GENE a few years ago, he checked that there were no numerical instabilities by hand for a very small subset (like 0.01% or something). But he was probably also looking at core-like parameters, so it’s fairly easy to figure out resolution settings that are good enough.
________________
Joeseph Michael Schmit
Yeah, currently working on numerical instability checker and haven't found a quick, algorithmic way to check except by visual inspection.
_______

# question to Tobias about detecting Numerical Instabilities

Tobias:
> 1st Question: Do you think a convergence check like this is sufficient for ensuring you do not have any Numerical Instabilities? My understanding is that these can be caused by lack of resolution.

Numerical instabilities would usually show up as rather violent instabilities (e.g., extremely large growth rate) or curious mode structures (grid-scale oscillations). Excluding the former is easy, the latter should still be visible by growth rate / frequency changes with resolution.

> 2nd Question: When increasing the resolution is it necessary to compute from scratch? or is it possible to somehow use the previous low-res run and "fill in the gaps" to increase the resolution.

That depends on the code capabilities. GENE is able to read+interpolate its own checkpoints but does not support changes of grid sizes (lx,lv,lw, etc). In other words, resolution checks are supported but not grid convergence checks.


