
In these I have been developing the GENE-ML framework that is made up of samplers, parsers, models and datasets. It is similar to Adams enchanted surrogates framework. The two main difference are 1. GENE-ML runs locally and then ssh's into LUMI to run the code whilst enchanted surrogates runs on an interactive node on the HPC. 2. GENE-ML utalises the scan functionality of GENE to run many data points from samplers whilst enchanted surrogates uses a DASK cluster to do many runs of the code with many parameters files. Both can limit the number of sbatch calls to the same degree and parallelise to the same degree.
