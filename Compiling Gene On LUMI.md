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
make mach_wrapper
echo $MACHINE
print should be lumi_csc, for me it wasn't
if not then run: 
export MACHINE=lumi_csc
gmake get_required_modules
paste the print out and run to get the required modules
gmake -j
check this file is created
cd .../bin/gene_$MACHINE

testing
cd testsuite
gmake -f ../makefile
# compiling Gene on work laptop

docs created fine
make mach_wrapper did now work
I follow instruction on setting up new machine
tried gmake -j to compile
	I needed to install cmake
	I needed to install fortran  
	