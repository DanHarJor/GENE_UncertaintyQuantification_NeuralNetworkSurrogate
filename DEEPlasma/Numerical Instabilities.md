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



