
- Introduction​
	- High level motivation, H-mode, fusion power​
	- What is the pedestal and how is it formed​
	- Instability modes, drives and stabalisers​
	- Highlight differences between core and pedestal instabilities​
	- Quasi-linear flux​
	- Show qualikeys plot for growthrate as function of ky for core​
	- Explain the rest of the sections briefly​
    
- Core vs Edge Spectra​
	- Make a parameters file from a JET shot (or a few) [plot profiles and equilibrium]​
	- Plot core vs pedestal growthrate spectra​
	- Make the point that core is predictible and small fixed ky grid is okay while in pedestal data efficient sampling methods are needed.​
	- Explain that smooth functions require less data and the function is smooth for each mode, thus an efficient sampling method should utilise mode informaton​
    
- Instability Classification Method​
	- Show a few ky plots and their classification​
- Data Efficient Spectra Sampling with Mode Information​
	- Make a linear interpolator to be Fake GENE and explore 1D efficient sampling methods that utilise mode information.​
	- Main metric is a plot of y=mse, x=number of data points. Best sampling method has the lowest integral. ​
	- Compare methods with and without mode information.​
- Conclusion

The community would not benefit because an 8 point fixed grid gets very close to an accurate integral and mode information would only benefit if a high resolution surrogate model was required for an accurate integral, which it isn't.