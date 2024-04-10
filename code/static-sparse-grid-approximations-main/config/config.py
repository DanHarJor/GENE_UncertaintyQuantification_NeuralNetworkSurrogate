import numpy as np
from pathlib import Path

parameters_template_dir = Path('/users/danieljordan/GENE_UncertaintyQuantification_NeuralNetworkSurrogate/code/static-sparse-grid-approximations-main/parameters_template')

### parameter bounds
# temp ratio
# left_temp  	= 1.6 - 0.2*1.6
# right_temp 	= 1.6 + 0.2*1.6

# grad n
# left_omn  	= 0.8 - 0.2*0.8
# right_omn   = 0.8 + 0.2*0.8

# grad T_i
left_omt_ions  	= 2.79 - 0.7
right_omt_ions 	= 2.79 + 0.7

# grad T_e
left_omt_elecs  	= 5.38 - 0.3
right_omt_elecs  	= 3.0 + 0.3

left_stoch_boundary 	= [left_omt_ions, left_omt_elecs]
right_stoch_boundary 	= [right_omt_ions, right_omt_elecs]


### sparse grid setup
dim 			= 2 # no of input parameters of interest 
level_to_nodes 	= 1 # this parameter determines the growth of the Leja points. A value of 1 indicates that we add only one extra point per level
level 			= 3 # with this setup, the maxium degree of the 1D monomials will be level - 1
######


### setup for the standard uniform distribution
weights 		= [lambda x: 1. for d in range(dim)]
left_bounds    	= np.zeros(dim)
right_bounds   	= np.ones(dim)
######


### mapping from [0, 1] -> [a, b]
mapping_to_a_b = lambda a, b, x: a + (b - a)*x
######



### other config steps