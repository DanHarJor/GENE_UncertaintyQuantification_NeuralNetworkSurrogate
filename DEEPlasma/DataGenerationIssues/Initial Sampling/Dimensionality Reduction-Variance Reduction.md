
# Experiment for functional dependence between input parameters

## 

I can take a shot and measure the gene input parameters at each point in time (or for steady state profile). These points can then put through PCA or other dimensionality reduction methods to reduce the dimensionality from variance consideration possible due to functional dependence between the parameters that can be seen from nature.

The points can be made up of different profile locations. If using steady state I can scan through many shots. If looking at profile time slices I can potentially use Thompson Super resolution by Azarakhsh Jalalvand (princeton uni).

Could make these points samples that are ran though GENE and sample more within the lower dimensional space.



# PCA 

# Non linear versions of PCA, ask george Holt

# Auto Encoder / Transformer

# Chop off the head of a NN

# Dimensionally adaptive sparse grids achieve the same goal. 

Uses the sobol indicies. This is good as it separates the inputs from the outputs (so does chop of head of NN). Usually only second order sobol indicies can be computed, thus only 2 variable combinations can be considered. Whilst PCA can combine many variables into the same principle component. Unclear whether the combinations are linear or non-linear. 

Can do for multiple iterations. It is unclear to me how PCA can do this without simply re-enforcing the initial principle components. 


