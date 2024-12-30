> Tobias: I was in Texas recently and spoke with David hatch. It seems  
> he has a lower standard of convergence than GENE. He will fix the  
> number of time steps then look at the fluctuations of the  
> electrostatic potential at the midplane to get the growth rate. I  
> believe GENE makes sure the distribution function fluctuations have  
> converged in the entire space.  
  
Not entirely correct - our criterion considers all x and z grid points  
but includes weighing by amplitude(!). Hence, it would automatically  
consider the outboard midplane if being the most relevant. This is  
already close to my main concern - some of the edge / pedestal modes may  
not localize well at the outboard midplane (slab ETG, some weirdly  
tilted ETG modes) and the results could be biased. But if you have an  
automated refinement procedure in mind(?), it could be less critical.  
  
> He would like me to adopt the lower standards of convergence for out  
> surrogate model dataset. It will save us some compute. I can make a  
> function that uses the continue scan functionality to deploy this  
> automatically. My question is would you be interested in potentially  
> incorporating this lower standard of convergence as an option in GENE?  
> It would mean I can let GENE run without stopping and starting it to  
> do convergence checks with python. It might be beneficial to other  
> users as well. I am not asking you to do it personally but only if you  
> think it would be a good idea and useful for others.  
  
Yes, I would be interested. However, I would like to throw in another  
interesting observable -> our energy/entropy balance analysis stored in  
energy.dat (i.e. energy_0001 etc in scans).  
  
Plotting the 3rd column of said file divided by the 2nd and dividing by  
two gives the _exact_ instantaneous growth rate (as opposed to  
approximated growth rates / frequencies from finite differences between  
consecutive analysis time steps).  
  
Gnuplot example:  
  
plot 'energy.dat' u 1:(0.5*$3/$2) w lp  
  
You could analyze this time trace and apply criteria for reaching the  
desired level of convergence (the growth rate vs time is typically a  
damped oscillation around the time-converged value <-> mode beating).  
Unfortunately, there are only real-valued entries available in  
energy.dat and the frequency remains inaccessible. However, once GENE is  
stopped (a python layer could create an empty file GENE.stop_0XYZ and  
terminate the individual simulation), it will write the preliminary  
growth rate / frequency to stdout. A recent update makes sure that the  
individual simulation ID (or file extension) is found nearby in stdout  
(as discussed a couple of weeks ago).  
  
Best regards,  
Tobias