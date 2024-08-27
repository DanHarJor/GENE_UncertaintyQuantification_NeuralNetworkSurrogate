It was found that low precision caused large discontinuities and messed up the UQ. We seen this because the SSG-poly and GPR grothrate ditributions were different untill we increased the precision. Also the mode transition test showed the discontinuities clearly, 

omega_prec = 1e-3
![[Pasted image 20240731194828.png]]

omega_prec = 1e-5
![[Pasted image 20240731194900.png]]

To combat this we don't want to simply increase the precision as this dramatically increases the computation resources required and is often not necessary. So we want some kind of adaptive precision.

I have a hunch that the sensitivity analysis [[Sobol Indicies]], won't be affect much by the precision of the data used to create the surrogate model (TEST THIS). Then we can use low precision to get the sensitivity information and ignore low sensitive variables like omt2 that suffer the most from the low precision issues. We can set them to their nominal values. 

We could also build a discontinuity detector and increase precision untill it disappears. Might be hard to differentiate between a precision discontinuity and a mode transition discontinuity. 