Slack For IMAS Improvements, 

Oliver Hoenen, maybe IMAS contact.

The regressor part of the surrogate model could be used to help locate the stable and KBM boundary regions. If the regressor is -ve grothrate then it is likely stable and if it is high grothrate then it is likely KBM unstable. 

When EMI was trining her surrogate model she simulated a large ky space and only took the ky with the largest grothrate for the model training. This is probably not a good idea since many ky's are needed to get the diffusion coefficient. 

Convergence checks for linear runs? Maybe. It is always good to do but can use a lot of compute. I should see if I can increase the resolution without running from scratch. 

Emmi: With the elm frequency and energy loss you can get the inter EML microturbulence transport coefficients. 

When making an inference with our surrogate model we should determine if the point requested is far outside our training domain to help determine if it could be accurately inferred by the surrogate.

We need to determine spaces that experiments never reach and discover the boundary between these spaces. 

Need to explore using active learning to avoid running in parameter locations that experiments never reach. 

UMAPE is a non-linear dimensionality reduction that 'preservs the manifold'. "We can see if the data fills the space by seeing if it fills the UMAPE 2D space."







