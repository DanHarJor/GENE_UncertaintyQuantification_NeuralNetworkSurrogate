Follow singularity guide create a singularity container with everything dask needs installed within. Then follow the singularity guide to open the container from VS code, with a small modification in the ssh config file as seen [[#Getting Container to be able to run slurm commands for dask executor|below]]

## Getting Container to be able to run slurm commands for dask executor

If this command is ran on the login node before entering the shell of the container then the container can access the lumi slurm commands. 
```
export SINGULARITY_BIND=$SINGULARITY_BIND,/usr/bin/sacct,/usr/bin/sacctmgr,/usr/bin/salloc,/usr/bin/sattach,/usr/bin/sbatch,/usr/bin/sbcast,/usr/bin/scancel,/usr/bin/scontrol,/usr/bin/scrontab,/usr/bin/sdiag,/usr/bin/sinfo,/usr/bin/sprio,/usr/bin/squeue,/usr/bin/sreport,/usr/bin/srun,/usr/bin/sshare,/usr/bin/sstat,/usr/bin/strigger,/usr/bin/sview,/usr/bin/sgather,/usr/lib64/slurm/,/etc/slurm,/etc/passwd,/usr/lib64/libmunge.so.2,/run/munge,/var/lib/misc,/etc/nsswitch.conf,/usr/lib64/lua,/usr/share/lua,/usr/bin/lua5.3,/usr/lib64/liblua.so.5.3:/usr/lib/liblua.so.5.3,/usr/lib64/liblua5.3.so.5.3.0:/usr/lib/liblua5.3.so.5.3.0,/usr/lib64/liblua5.3.so.0:/usr/lib/liblua5.3.so.0,/usr/lib64/liblua5.3.so.5.3:/usr/lib/liblua5.3.so.5.3,/usr/lib64/liblua5.3.so.5:/usr/lib/liblua5.3.so.5,/usr/lib64/libjson-c.so.3.0.1:/usr/lib/libjson-c.so.3.0.1,/usr/lib64/libjson-c.so.3:/usr/lib/libjson-c.so.3 && singularity shell -B /scratch/project_462000451/ -B /project/project_462000451/ /project/project_462000451/enchanted_lumi/container.sif
```
To make vs code be able to access a container that can use slurm commands then alter the ssh config like this example:
```
Host enchanted_lumi
        HostName lumi.csc.fi
        User danieljordan
	IdentityFile ~/.ssh/lumi_danieljordan
	#needed for sbartch to work in the container.
	RemoteCommand export SINGULARITY_BIND=$SINGULARITY_BIND,/usr/bin/sacct,/usr/bin/sacctmgr,/usr/bin/salloc,/usr/bin/sattach,/usr/bin/sbatch,/usr/bin/sbcast,/usr/bin/scancel,/usr/bin/scontrol,/usr/bin/scrontab,/usr/bin/sdiag,/usr/bin/sinfo,/usr/bin/sprio,/usr/bin/squeue,/usr/bin/sreport,/usr/bin/srun,/usr/bin/sshare,/usr/bin/sstat,/usr/bin/strigger,/usr/bin/sview,/usr/bin/sgather,/usr/lib64/slurm/,/etc/slurm,/etc/passwd,/usr/lib64/libmunge.so.2,/run/munge,/var/lib/misc,/etc/nsswitch.conf,/usr/lib64/lua,/usr/share/lua,/usr/bin/lua5.3,/usr/lib64/liblua.so.5.3:/usr/lib/liblua.so.5.3,/usr/lib64/liblua5.3.so.5.3.0:/usr/lib/liblua5.3.so.5.3.0,/usr/lib64/liblua5.3.so.0:/usr/lib/liblua5.3.so.0,/usr/lib64/liblua5.3.so.5.3:/usr/lib/liblua5.3.so.5.3,/usr/lib64/liblua5.3.so.5:/usr/lib/liblua5.3.so.5,/usr/lib64/libjson-c.so.3.0.1:/usr/lib/libjson-c.so.3.0.1,/usr/lib64/libjson-c.so.3:/usr/lib/libjson-c.so.3 && singularity shell -B /scratch/project_462000451/ -B /project/project_462000451/ /project/project_462000451/enchanted_lumi/container.sif
```

### Step 2 ensuring each worker starts up a container so it can access python, dask and function with health.

