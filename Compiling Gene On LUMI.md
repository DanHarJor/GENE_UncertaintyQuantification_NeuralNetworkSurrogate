# List of Issues and Solutions

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
# compiling Gene on work laptop

docs created fine
make mach_wrapper did now work
I follow instruction on setting up new machine
tried gmake -j to compile
	I needed to install cmake
	I needed to install fortran  
	