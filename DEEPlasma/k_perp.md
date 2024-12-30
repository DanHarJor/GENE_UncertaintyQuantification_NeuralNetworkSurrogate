mixing length is $\gamma/k_\perp$ but how do we calculate k_perp?

I asked Cole:
The perpendicular wavenumber is approximately  
$k_\perp \approx k_y^2 + k_x^2 \approx k_y^2 (1 + s^2 z^2)$. This is also a function of z.The calculation then is just:    $\frac{\int |phi|^2 k_\perp^2 dz}{\int |phi|^2 dz}$. The denominator just normalizes
[5:45](https://deeplasma.slack.com/archives/D070WUF43MZ/p1732549502815009)
Cole Stephens
So it’s like how in stats we take moments of the probability distribution, it’s like we’re calculating E[k_perp^2]