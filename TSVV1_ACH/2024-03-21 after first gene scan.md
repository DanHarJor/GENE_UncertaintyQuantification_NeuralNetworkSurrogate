# current status
At this point I had sucessfully made the gene scan and was trying to get the gene diagnostics to work. I was not sucessful then had this meeting.

# important file
scan.log is the only file I need to get the grothrate as a function of ky. 
if scan didn't finish you can use 
scanscript --mks short for make scan log.
file can be visualised with glueplot. 

other diagnostics are relevant when I want to identify modes.

# what is ky min
for non linear simulations ky = 0 is the first one then ky=kymin is the first finite ky and has many harmonics. The non linear simulations simulate many ky at once whilst the linear ones only do one ky at a time. But ky min was kept as the variable name for the linear simulations. 

ky min is, the min is more for non linear simulations but it is kept min for linear too by convention. ky min also decides the box size in the ky direction. 

2pi/ky = Ly so defines box size in y direction. 
# ky range
depends on dominant turbulance interested in. 

# why many flux tubes for one minor radius? 
We scan over ky, making multiple flux tube simulations in the same radial location, this allows the time step to be altered for each ky which reduces the computation needed to reach convergence for each one. 


# what is hypercube sampling? sobel sampling and more
in montecarlo simulations we typically have no control over the sampling space and latin hypercube sampling is a way to address this to ensure the whole space is explored. It divides your space into boxes and samples from each box. 

you have other types of sampling like sobel sequences, almost deterministic and cover the space really well. Still inifecient for our problems, maybe okay for linear problems. 

other family of methods for quadrature are colocation based methods.

other, laya points are the ones we will use
diadic points we will use this with sg++ when we approach the case with mode transitions. It puts one point in the middle then points at the quarters and so on. 

the points are fixed in space. The problems with this type of approch is that you suffer from the curse of dimensionality. Sparce grid solves that by releasing the assumption that all parameters are equally coupled together. In practice they are almost never equally coupled. If they were then scientific computing wouldn't be possible because we wouldn't be able to use symmetries and internal structure to reduce the problem. 

static sp might say use 1000 points, adaptive can see only a few parameters are important which allows it to be reduced to 100ish which is the difference between tractable and non tractable for non linear. 

the quadrature nodes are the input parameter points to be interpolated. 

# static sparse grid points
The static sparse grid points are the best points for interpolation we can guess if we have no information about the function we are interpolating. They reduce the curse of dimensionality for UQ. They assume the parameters are anisotropically coupled which is generally true when you have smooth functions. For a 1D function these are "chebyshire???" points. 

These work well if the function is smooth with respect to the inputs. 

Also if there is a low number of input parameters. Active sparse grids lower the number of nodes required by looking at sensitivity information.

# Equidistant are the worst for interpolation

They are the worst for many reasons including the appearance of gibbs oscilations etc 

Apparently when selecting nodes for 1D interpolation (assuming no knolwdge of the function itself) the most optimum nodes to evenly distribute interpolation error are known as the Chebyshev nodes. The static sparce grid nodes are an extension of this concept into higher dimensions. They are better than equdistant nodes and random nodes.

chebyshev nodes are uniform but respect to a non uniform measure. 

# what is the level?
in the notebook on his github static-sparse-grid-approximations the level decides the order of the polynomial used for interpolation. A higher order requires more points on the grid as you need more points to capture the shape of a more complex polynomial. Sparce grids is very good as keeping the number of points low as the level increases. You only get one or two more points for one jump up in level (also depends on number of dimensions). For other methods (eg chebyshev grid) the number of points increases drastically as the level increases. 

# input uncertainty distribution
At the moment the uncertainty is assumed to be uniform distribution. In the future realistic distributions from experiments could be implemented. The code is mostly set up to handle it. This is what the weights are about in the static-sparse-grid-notebook

# Adaptive sparse grids
These will do a run with a static sparse grids then use this information to determine the next grid points. They use the variance information to determine the most important input parameters. If a small change in the input creates a large change in the output then it has a high variance, high sensitivity and high importance so we want to have a denser grid on this dimension. It is similar to PCA but PCA looks at the variance of points in a space. Whilst adaptive sparce grids looks at the variance caused at an output of a function depending on the inputs. Basically the adaptive sparce grids involves a function. 

For linear gene the number of runs per adaptive step is small so it is not really worth parlellising. 
For non linear you must post-process each run between adaptive steps, grid resultion fine enough, has it converged are the results physically valid? Thus not worth paralellising for non linear either. 

# output of UQ
he will give me a script that will do the UQ which will get the mean and variance of the outputs as well as the sensitivity information. For free it will give a polynomial for interpolation ie growthrate = c1 x temperature gradient^p1 + c2 x density gradient^p2 ... 

# mode transition
you can have a mode transition over time with the initial value solver but you can also have a mode transition over ky 

# Nominal value vs mean
the mean value of growthrate UQ should be similar to the nominal value. Growthrate computed when we put in out estimated temperature gradient with no uncertainty. 

# video time stamps
Timestamps: 
00:00 intro questions, Any other fourrier transform for non linear? ans: yes for special gpu fft but no NN 
01:38 exclamation mark is a comment in parameters file? ans: yes
02:45 kymin scan? 
04:48 scan.log file
07:27 why ky min and not ky 
08:40 sparse grid need to make a run to decide points? 
13:32 hypercube sampling, for approximating integrals 
19:10 equidistant points are the worst for interpolation, chebyshev nodes 
20:32 active learning vs sparce grids, PCA variance 22:25 static sparce grids code 
26:01 level of the grid 
30:48 weights for putting in other than uniform error distribution 
38:44 some Details of UQ after we have the sparse grid points 
40:25 My nieve approach to UQ 
45:52 what did ionut do for UQ 
54:00 tobias's graphs for errors and distributions