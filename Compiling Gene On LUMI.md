# First Attempt

make doc 
diff: /users/danieljordan/gene/bin/lumi_csc.mk: No such file or directory
/bin/sh: pdflatex: command not found
/bin/sh: line 1: latex: command not found
make[1]: *** [makefile:7: gene.pdf] Error 127
make: *** [makefile:171: doc] Error 2

ran on personal laptop to get docs

after executing gmake -j i got the error
*** Cannot access PETSc/SLEPc libraries compiled for GENE. Please get in touch with the maintainer tobias.goerler@ipp.mpg.de to obtain read access..  Stop.  
gmake[1]: Leaving directory '/pfs/lustrep1/users/danieljordan/gene'

After messaging tobais he asked if I could access
cd /pfs/lustrep3/users/gorlerto/soft/petsc-gnu-double

I could. I think he needed to compile PETSc and SLEPc for the cpu as he mentioned this in his email.

then he said to run 
gmake get_required_modules
module purge
module load
gmake -j

This solved the issue

Now the compiler isn't linked

order of execution trial 1
cd gene
module load PrgEnv-cray, If I load this then it can't find PETSc/SLEPc
if I don't load it then it can't find fortran. But fortan is there it is just in 
export FC=/usr/bin/gfortran
gmake get_required_modules
gmake -j

order of execution trial 2
export FC=/usr/bin/gfortran
export MACHINE="dan_mac"
module purge
cd gene
gmake get_required_modules
gmake -j



# Seccond Attempt
I discovered gmake get_required_modules only prints a command to execute, it does not execute it
I don't need to make a new machine configuration file as there is already one for lumi

fresh clone
request access to gene gitlab: https://genecode.org/
mkdir gene
git clone --recurse-submodules https://g-danieljordan@gitlab.mpcdf.mpg.de/GENE/gene.git -b release-3.0 $PWD/gene
cd gene
make mach_wrapper  "it prints lumi_csc"
echo $MACHINE
print should be lumi_csc, for me it wasn't
if not then run: 
export MACHINE=lumi_csc
$(gmake get_required_modules)
paste the print out and run to get the required modules
gmake -j "j is for multicore"
check this file is created, for me it was
.../bin/gene_$MACHINE

testing
cd testsuite
gmake -f ../makefile
./testsuite

when testing on an interactive node I get error number of requested cores exccedes the number of allowed cores. trying to submit jobs on slurm to get more cores. 

if I use this bash script on a login node then the test works perfectly. Put the bash script in the gene directory and run `sbatch slurmtest.sh`

slurmtest.sh
```
#!/bin/bash
#SBATCH --job-name=test
#SBATCH --account=project_462000451
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks=8
# mem per node required by job
#SBATCH --mem=14000
#SBATCH --partition=small
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
###set openmp threads
export OMP_NUM_THREADS=1

#do not use file locking for hdf5
export HDF5_USE_FILE_LOCKING=FALSE
#HDF5 is a data format used in gene. File locking limits the access rights to the files and can cause errors.

#each node has 120 cpu cores 
export MEMORY_PER_CORE=1800

echo "starting now"
set -x #prints all following commands before executing
$(make get_required_modules) #$(command) will execute the output of command

cd testsuite
./testsuite
echo "ending now"
```

when trying the GUI it can't find tinker even if it is installed. to solve this I am going to use my personal laptop and its gene clone to run the GUI than copy and paste the relevant parameters file. To start I used the GUI to generate a parameters file for the linear local gene with an eigan solver. I checked the button for automatic paralellisation for all fields then the parameters file had n_proc_sim = 8.0. This is a bug and n_proc_sim should be deleted. It is only useful for scans. I submitted an issue on gitlab and it should be fixed soon.

I then changed the diagdir in the parameters file. This is where is saves the output files of the simulation.

here is my parameters file:
```
&parallelization
n_procs_s = 0
n_procs_v = 0
n_procs_w = 0
n_procs_x = 0
n_procs_y = 0
n_procs_z = 0
/

&box
n_spec = 2
nx0 = 8
nky0 = 1
nz0 = 16
nv0 = 32
nw0 = 8

kymin = 0.3
lv = 3.0
lw = 9.0
/

&in_out
diagdir = "/users/danieljordan/gene/firstrun/results/"
read_checkpoint = .F.
istep_nrg = 10
istep_field = 100
istep_mom = 100
istep_energy = 0
istep_energy3d = 0
istep_vsp = 500
istep_neoclass = 0
istep_schpt = 5000
/

&general
nonlinear = .F.
comp_type = 'EV'
calc_dt = .T.
ntimesteps = 0
timelim = 3600
n_ev = 1
underflow_limit = 1e-15
beta = 0.001
hyp_z = 2.0
hyp_v = 0.2
init_cond = 'alm'
/

&nonloc_x
/

&external_contr
/

&geometry
magn_geometry = 'circular'
trpeps = 0.18
q0 = 1.4
shat = 0.796
major_R = 1
/

&species
name = 'Ions'
mass = 1.0
charge = 1

temp = 1.
omt = 6.92
dens = 1.
omn = 2.22
/

&species
name = 'Electrons'
mass = 2.725e-4
charge = -1

temp = 1.
omt = 6.92
dens = 1.
omn = 2.22
/

&units
Tref = 3
nref = 5
Bref = 2.5
Lref = 1.65
mref = 1.0
/
```


go to the gene dir on LUMI and run
./newprob
change created problem folder to something that makes scence
mv prob01 firstrun
cd firstrun
mkdir results

Then copy-paste the paramaters file text created on personal laptop with GUI into the parameters file in the problem directory (firstrun) on LUMI.

copy and paste this sbatch text into submit.cmd to replace all text there.
```
#!/bin/bash -l
## LUMI-C (CPU partition) submit script template
## Submit via: sbatch submit.cmd (parameters below can be overwritten by command line options)
#SBATCH -t 00:30:00                # wallclock limit
#SBATCH -N 1                       # total number of nodes, 2 CPUs with 64 rank each
#SBATCH --ntasks-per-node=8      # 64 per CPU. Additional 2 hyperthreads disabled
##SBATCH -c 1                       # cpus per task, 2 if full CPU. Adjust accordingly
#SBATCH --mem=14000                    # Allocate all the memory on each node
#SBATCH -p small                # small allows node sharing with other jobs:all options see: show control partition
#SBATCH -J GENE                    # Job name
##SBATCH -o ./%x.%j.out
##SBATCH -e ./%x.%j.err
##uncomment to set specific account to charge or define SBATCH_ACCOUNT globally in ~/.bashrc
#SBATCH -A project_462000451

## set openmp threads
export OMP_NUM_THREADS=1

#do not use file locking for hdf5
export HDF5_USE_FILE_LOCKING=FALSE

echo "start"
set -x
##run GENE
srun -l -K -n $SLURM_NTASKS ./gene_lumi_csc

## run scanscript
##./scanscript --np $SLURM_NTASKS --ppn $SLURM_NTASKS_PER_NODE --mps 4 --syscall='srun -l -K -n $SLURM_NTASKS ./gene_lumi_csc'

set +x
echo "end"
```

run this
`sbatch submit.cmd`
then check the .out and .err files for the outputs and errors.
Then check the results folder for the output files. Check you have everything the docs mentions. 



# compiling Gene on work laptop

docs created fine
make mach_wrapper did now work
I follow instruction on setting up new machine
tried gmake -j to compile
	I needed to install cmake
	I needed to install fortran  

# Slurm

sinfo
sinfo -Nl
squeue
squeue --me
sbatch slurmscript.sh

example slurm script:
#!/bin/bash
#SBATCH --job-name=hello_world_python
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
above is required for simple tasks
#SBATCH --mem=1M
#SBATCH --cpus-per-task=<number_of_cpus> shared memory ie one node
#SBATCH --ntasks-per-node=<number_of_cpus> distributed ie many nodes

#SBATCH --nodes=<number_of_nodes>
#SBATCH --cpus-per-task=<number_of_cpus> 
#SBATCH --ntasks-per-node=<number_of_processes_pr_node>

python3 main.py

To cancel an entire job array, you do the same as with a normal job. You write scancel and then the job id of the array job.
To cancel a specific job in an array job, you write 
scancel <jobid>_<arrayid>

cancel all jobs on partition
You run scancel -p <partition_name> On this cluster, it would be scancel -p learning because that is our only partition.

## run two tasks in parallel
bash
#!/bin/bash
#SBATCH --ntasks=2

# Run two tasks in parallel
srun command1 &
srun command2 &
wait

# Processes Consistent with chosen grids
Please also note that the number of processes needs to be consistent with the chosen grids. For instance, 9 processes would either require a dimension that has grid points divisible by 9 (e.g., nz0 = 36) or at least two dimensions which include a factor of 3. This is definitely not the case for all grids within the standard test set. Also, methods like finite differences need to exchange the information for the supporting grid points at the process boundaries (i.e., so-called ghost cells are added and filled from the neighbouring process). So, selecting 18 processes along the nz0=36 parallel grid points in above example would be borderline wrt performance (large ghost to real cell ratio).

# Tobias Example Script

#!/bin/bash -l  
 ##LUMI-C (CPU partition) submit script template  
##Submit via: sbatch submit.cmd (parameters below can be overwritten by command line options)  
#SBATCH -t 00:30:00                
#SBATCH --nodes=1                  
#SBATCH --ntasks=8  
#SBATCH --mem=14000                
#SBATCH -p debug  
#SBATCH -J STDTST                  
#SBATCH -o ./%x.%j.out  
#SBATCH -e ./%x.%j.err  
#SBATCH -A project_465000821   #needs to be adjusted  
  
 ## set openmp threads  
export OMP_NUM_THREADS=1  
  
#do not use file locking for hdf5  
export HDF5_USE_FILE_LOCKING=FALSE  
export MEMORY_PER_CORE=1800  
  
set -x  
 #run GENE  
export TESTSET=standard  
export TESTDIR=/scratch/project_465000821/$USER/testsuite/$TESTSET    $project needs to be adjusted  
mkdir -p $TESTDIR  
./testsuite -t $TESTSET -wa -f -o $TESTDIR  --syscall="srun -l -K -n $SLURM_NTASKS ./gene_lumi_csc -v"  
set +x

# Helpful Bash for Lumi


## removing a folder with write-protected files
yes "yes" | rm -R folder

# questions for tobias

neoclassical equilibrium solver

numerical options, hyperdiffusion

output intervals
for initial value solver each step in time is a solution to the gyrokinetic vlasov equations. and I interpret the output intervals as the number of steps before saving output.

for eigan value solver how is a step defined. this tries to find the base solutions of which any linear combination is also a solution.

