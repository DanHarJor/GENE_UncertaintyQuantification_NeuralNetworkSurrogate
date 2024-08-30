GENE has many forms of resolution, we should try to save compute by varying them gradually. 

omega_prec, This is simply the number of significant figures for the output. If this is too low there can be discontinuities that make it difficult for surrogate models and UQ. 

# Checkpoints to save compute

chapter 3 in the docs, checkpoints. 

Using checkpoints GENE can interpolate and can increase the resolution using a previous run, this saves compute time but it still uses more compute than running the simulation once in the high resolution. Although if a high checkpoint frequency is used then more and more compute can be saved at the expense of larger disk space usage and the time needed to read all that disk info. 

*does this actually work, I would think that low time step resolution would cause the distribution to be significantly different after a long simtime than at high resolution. SO the check points would all be wrong and interpolating between them would not help.*

See email with subject line: Convergence Checks to Tobias