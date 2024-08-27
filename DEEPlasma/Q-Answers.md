# Linear is cheap why surrogate?
When is linear gene too slow and the community would benifit from a surrogate model?? Not sure what we are trying to achieve with a linear surrogate model as linear GENE is already cheap.

ans Aaro: Linear Gene is still a kinetic model, for real time it is too slow. For large solution space scoping it is also too slow. We need answers instantly.

ans Adam: to make it differentiable, linear gene is fast but it is not differentiable. It is nice to have a differentiable function to explore the parameter space and identify places where a non-linear gene run should be made. 

just focus on making a super fast linear GENE for now.




# Grid ky or Random ky
Daniel Harley JordanDaniel Harley Jordan  [8:38 PM](https://deeplasma.slack.com/archives/C06CE0VDAG2/p1717695530235129)  

[@Cole Stephens](https://deeplasma.slack.com/team/U070CL88FU6), hey you mentioned that we usually sum up the contributions from different ky values. Can you link me to a paper or something that describes that? So I can get an understanding about whether fixed ky grid or random sampling is better.

![](https://ca.slack-edge.com/T06BZEBHZ7H-U070CL88FU6-gc964475c01a-48)

Cole StephensCole Stephens  [10:16 PM](https://deeplasma.slack.com/archives/C06CE0VDAG2/p1717701380979449)  

[@Daniel Harley Jordan](https://deeplasma.slack.com/team/U06CE14JN10) example here:  
[https://gitlab.com/qualikiz-group/QuaLiKiz-documents/-/blob/main/reports/saturation_rule.pdf](https://gitlab.com/qualikiz-group/QuaLiKiz-documents/-/blob/main/reports/saturation_rule.pdf)

![GitLab](https://slack-imgs.com/?c=1&o1=wi32.he32.si&url=https%3A%2F%2Fgitlab.com%2Fassets%2Fapple-touch-icon-b049d4bc0dd9626f31db825d61880737befc7835982586d015bded10b4435460.png)GitLab

[reports/saturation_rule.pdf · main · QuaLiKiz-group / QuaLiKiz-documents · GitLab](https://gitlab.com/qualikiz-group/QuaLiKiz-documents/-/blob/main/reports/saturation_rule.pdf)

[GitLab.com](http://gitlab.com/)

![white_check_mark](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/2705.png)![eyes](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/1f440.png)![raised_hands](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/1f64c.png)

![](https://ca.slack-edge.com/T06BZEBHZ7H-U070CL88FU6-gc964475c01a-48)

Cole StephensCole Stephens  [10:22 PM](https://deeplasma.slack.com/archives/C06CE0VDAG2/p1717701721195269)  

It just comes from the fact that in a spectral code, quantities like \phi, \delta f, and so on are written down with a discrete Fourier transform. So when you want to calculate quantities in real space, you need to write out the sum of the Fourier coefficients.E.g. `phi ~ \sum_ky phi_ky exp(i ky * y)`So when you want to compute something like the flux-surface averaged particle flux, e.g.  
`Gamma = <\delta n \delta v>`  
you need to write out the sum and then integrate over the flux tube volume. But this ends up just being another sum of Fourier coefficients due to Parseval's theorem