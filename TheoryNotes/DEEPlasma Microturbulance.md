# Toy Perturbations
Micro-instabilities can be seen as perturbations from an equilibrium. 

Lets consider a toy problem. For a specific location in space there will be an equilibrium density and a small perturbation.

$n = n_0 + n_1$ 
Where $n_0$ is the equilibrium density and $n_1$ is a small perturbation.

We have some partial differential equation derived from experimental data or fundamental physics that describes the evolution of the system through time.

$$\frac{\partial n_1}{\partial t} = A n_1 + Bn_1² ...$$
The linear part can be solved by guessing the functional form, ansatz and using an eigan value solver
$$
n_1 = n_1(t=0) e^{st}
$$
where $s$ is a complex frequency

$$s = \gamma + i \omega$$
remember $n_1$ is the change from equilibrum. We can then write it as,

$$n_1 = n_{1(t=0)} \ e^{\gamma t} e^{i\omega t}$$
The value of gamma decides if and how fast the amplitude grows or shrinks exponentially with time. If the amplitude grows exponentially with time then the perturbation grows and grows and we call this unstable. Since we are interested in instability more than decay we call $\gamma$ the growthrate. To truely know the perturbation function $n_1(t)$ we must, find values of gamma and omega or s. 

## Initial value Solver
An inital value solver would solve the PDE numerically essentially evaluating the RHS of the PDE (eg with runge-kutta method) and multipling by a small $\Delta t$ to shift $n_1$ by a small timestep. The growthrate can be computed by tracking how the density changes over time. Perhaps by tracking the wave like pattern and using the distince between the peaks as an estimate for amplitude, the amplitude should exponentially grow (if turbulance is present) and by fitting an exponential to the data you can get the growthrate.

Formula used to get growthrate for toy initial value solver in MJ's course. 
$$\log \left[ \frac{\bar n_{1(t=[0...n])}}{\bar n_{1(t=0...n-1)}}  \right] \frac{1}{\Delta t} = \gamma$$

## Eigan value solver
This is where we can use an eigan value solver. In matrix from the eigan problem is this: for an operator A what vectors can it be applied to so that it only changes in size and not direction? It changes in size by an ammount given by its corresponding eigan value $\lambda$. These vectors would be particularly good as a basis.

$$A \vec v = \lambda \vec v$$
$$\frac{\partial}{\partial t} n_1 = \Lambda n_1$$

The true value of $n_1$ at some time t can be expressed as a linear combination of the infinate many eigan functions. 
$$n_1(t) = a \ n_1¹ + b\ n_1² + c \ n_1³ ...$$
Each eigan function $n_1^i$ has a different $\gamma$ and $\omega$ Some of the eigan functions will have a -ve gamma and thus their amplitude will decay exponentially over time. We don't care about those. Others have a +ve gamma and will dominate the function $n_1(t)$ after a long time. These are known as unstable eigan modes. These are the only ones Linear GENE will return. After some time the mode with the largest growthrate will dominate. Although sub-dominant modes are still returned. With an initial value solver you tend to only see the dominant modes. While there are infinate eigan modes the number of unstable ones are finite. Also since computers can't deal with infinities, the number of modes in the simulation is dependent on the numerical resolution. 

## Vlasov Equation

