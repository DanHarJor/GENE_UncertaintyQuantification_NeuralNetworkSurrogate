Today I made a quick fix to the poster and re-uploaded it to the pin-board. I also fixed the workpackage error that tobias caught and messaged fredric saying it was changed.

I looked at Gabriels Thesis and think some of the experimental validations there could be a good candidate for validating a GENE surrogate model. Since Matisse is doing a Gyrokinetic surrogate model for the core he could potentially work on this. I emailed him.

I messaged on slack about a meeting tomorrow. 

I then did some UQ and tried to compute the KL-divergence between the GPR and SSG-poly growthrate distributions. I had issues with it giving me drastically different results depending on how many discretisations I used. I think I need to use an integral rather than a sum. Any way it is still useful when I want to compare the surrogate distributions with the true distribution.

I then looked at doing a sensitivity analysis and found sobel indicies, [[Sobol Indicies]]. These use the variance to get the sensitivity. There is a scipy stats function that can take the surrogate model and parameter uncertianty distributions to compute the sobel indicies. (look into using these for active learning like Ionut did)

I could try using uncertainpy for UQ and see how it does... https://uncertainpy.readthedocs.io/en/latest/theory/qmc.html

I could use the Hammersley sequence ([Hammersley, 1960](http://dx.doi.org/10.1111/j.1749-6632.1960.tb42846.x)), to try and evenly cover the uncertainty space, apparently better than random sampling, not as good as SSG for reducing the curse of dimensionality. Although I think only adaptive SG can realistically do that. 

