
## Active Learning Steps to Surrogate a Physics Code:
1. Initiate the search space, Sample_initial
    - decide lower and upper bound of input parameters
    - select some initial points within the space
    - **Dummy Example** Generate random floats between 0 and 10
2. Run The code on new points (ask the oracle for lables)
   - The code needs to ran once for each new point to generate output
   - this can be handled with the dask slurm deployments [dask](https://jobqueue.dask.org/en/latest/examples.html#slurm-deployments)
   - **Dymmy Example** Assign label 0 to numbers below 5 and 1 to labels above.
3. Train ML Model
    - potentially reserve some validation data that could be useful for active learning step
    - training uses the inputs as data points and outputs as lables
    - this part is no different than any standard ML training algorythem
    - **Dummy Example** Train 3 SKLearn classifiers to do the binary classification from data to labels, just train for a few epochs so they don't get too good, to make active step viable
5. Active Learning step to generate new points, Sample_active
   - Using information from the current inputs, outputs and current model performance the most informative new data points can be determined via various means
   - **Dummy Example** Generate more floats between 0 and 10 that the oracle hasn't labeled and hasn't been seen in training. Run an inference with the 3 SKlearn classifiers and see where they disagree to suggest new points
6. Repeat steps 2-5 untill a certain perfoemance level is reached, resource limit is reached or loss converges.

We should write the framework so it is easy to swap out different **Sample_initial** (static sparse grids, latin hypercube), **Physics Codes**, **ML Models**/ training strategies, **Sample_active** 
enchanted-surrogates is a framework for creating surrogate models of complex physics codes with active learning on HPC systems.

enchanted-surrogates is still in the initial stages of development. 

The following physics codes are being integrated:

- TGLF
- HELENA/MISHKA
- GENE

The following HPC systems are being integrated:

- MAHTI
- LUMI

Currently enchanted surrogates can be used in the following way: 

TODO: Write user guide