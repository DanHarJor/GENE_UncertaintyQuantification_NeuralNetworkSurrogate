I spent all day trying to get dask to work on lumi. When using a container the new workers are not in the container and do not have access to python.

The pytorch module has dask. When a module is loaded into a session then each sbatch session loaded from that one should have the same modules as the parent. For some reason the client still has no workers when it tries to start the cluster. The clusters appear on squeue --me but die very fast. 

