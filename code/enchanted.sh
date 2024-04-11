conda create -n enchanted -c conda-forge -c pytorch -c anaconda ipykernel scipy matplotlib pandas numpy scikit-learn tqdm nb_conda_kernels f90nml=1.4.4 pylint flake8 pytest PyYAML dask dask-jobqueue coverage
conda env export --name enchanted > enchanted.yml
