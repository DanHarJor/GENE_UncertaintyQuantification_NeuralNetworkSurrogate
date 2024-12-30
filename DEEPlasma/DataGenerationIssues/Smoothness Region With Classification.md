The idea is to use the fact that discontinuities occur at mode transitions and so within one instability the function should be smooth. You need less points to model a smooth function. Maybe we can use this to efficiently explore the space.

# Problems

There can be multiple adjacent discontinuities within fingerprints classifications

First part ky = 0 to ~0.25 is MTM after that it is ETG,
There are many MTMs adjacent on small scales, leading to the fuzzy growthrate(ky) at low ky, then there are at least 2 ETG instabilities adjacent after that.
![[Pasted image 20241030212644.png]]

We could use the balloon plots to identify when the instability changes. 

Given the varying scales it is clear that spatial adaptivity will be needed. 
