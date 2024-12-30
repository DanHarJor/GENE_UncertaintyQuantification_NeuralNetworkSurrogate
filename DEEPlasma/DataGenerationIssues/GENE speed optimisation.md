The PEPc, SLEPc solvers can be optimised using preconditioners and this will work if you are using it for a specific task. But since we want to run gene for a large parameter space this will not help.

Tobias recently seen that when collisions are involved using a pre-conditioner slows down GENE and I should set the pre-condtitioner to none.
pc_type = 'none'