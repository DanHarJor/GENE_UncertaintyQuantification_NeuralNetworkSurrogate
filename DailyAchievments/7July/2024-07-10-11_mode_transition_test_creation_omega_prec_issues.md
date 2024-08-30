Today I worked on UQ and made a notebook for performing a mode transition test where 1D mode transitions can be identified and the ability of the surrogate models to capture the transitions can be assessed.  

I discovered a precision issue where omega prec is too high causing discontinuities in the 1D plots. 
![[Pasted image 20240717103810.png]]
Omega_prec is 1e-3. The discontinuties are jumps across this precision gap. Since discontinuities are important for identifying mode transitions and cause issues with the UQ this issue needs to be addressed. 

Simply increasing the precision all around will waste compute. 

Perhaps they can be delt with by detecting a jump that exactly matches the precision gap and increasing the precision in the surrounding area. 