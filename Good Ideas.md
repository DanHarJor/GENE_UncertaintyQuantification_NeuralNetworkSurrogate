
Normalising flows.
Jake used this method to make a surrogate of SEVEN. I got to look into it. 

MJ pueschel said maybe we can get an AI to say which eigan modes are relevant because we can't look at them all.

# Get some data from MJ
One, it seems weird to focus on quasi linear when johanthin citrin has worked a lot on it. 

Anyway, MJ has papers where he does a non linear scan, fits the quasilinear to one point and then sees how much they deviate after a few points. 

I can ask him for the non linear data of one of those scans. And the parameter file. Then maybe I can add some more non-linear points inbetween. 

Then I can train a PINN on the non linear points and see how well it matches the quasilinear. Ideally we would have many non-linear points, only train on some of them, then we can see where diviates from the truth and quasi-linear. 

For the simple 1D graphs in the paper, I suspect the neural network would be able to do the interpolation perfectly, since it would be like fitting a polynomial to the data. Maybe its not a good idea... NN work best for high dimensional data. A simple NN would just do something similar to polynomial fitting. But a physics informed NN might do more and get closer to non linear. 








