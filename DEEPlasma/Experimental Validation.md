Quasi linear - see how the quasilinear heat flux matches experimental heat flux.

Unstable Profile Matching - Verify this is correct: It can be experimentally observed what profile gradient is needed to cause an instability. We should check that the surrogate model can identify what gradient is needed to cause an instability for a real tokamak. 

David can have other uses.

# How to
to experimentally validate linear gene or its surrogate model I need: 
1. ***an experiment***
2. ***I need non-linear gene runs within the parameter space of the experiment***
3. I need to tune the saturation rule to map linear to non linear runs within the experimental parameter space.

4. I need to then use the linear surrogate with saturation rule and run it many times to update the temp and dens profiles until they reach steady state and hope it matches the experiment profiles which would successfully validate the models. 

# Stages of validation

When you and me had that first meeting with David, he was saying that we should use experiment to get a saturation rule. He called it a fudge factor at the time lol but now I know it as the saturation rule. To my understanding that is a new concept; saturation rules are usually gained from non-linear data.I definitely want to do the easiest thing first and work up. SO that would probably be something like:

1 Validate without saturation rule, find pedestal gradient where the plasma would be unstable and see if this matches with experimental profile. (Not sure if this is doable)

2 Validate with someone else's saturation rule made from fitting to non-linear data  

3 Validate with saturation rule I create but from someone else's non-linear runs on a particular shot.  

4 Create a saturation rule from experiment and validate it with other experiments.

In all of those options I never had to do any non-linear runs myself. That would be level 5, probably never get there.

Also it is worth noting that tuning the saturation rule to non-linear data is essentially creating a physics informed, data-driven non-linear surrogate model that uses linear output as input and only learns the correction. (Physics informed since it uses dimensional analysis, data driven as it is tuned to non-linear data). If we ever do make a saturation rule it would be cool to play with different ML models.

Aaro:
I agree that the ML model approach to saturation rules can be quite interesting ![:slightly_smiling_face:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-medium/1f642.png). Right now, I would not worry too much about validation. Just getting access to certain relevant experimental cases would give connection reality. In the end of the day, it is best probably to discuss this in a meeting with David. The original proposal was written such that David and his team would focus on the saturation rules and we would focus on generating the surrogate for the linear simulations. If you would for example generate a capability to predict the linear GENE output with ML for an arbitrary DIII-D pedestal profile, that would be a very useful result already.

[10:38](https://deeplasma.slack.com/archives/D06CDT8AG9Z/p1717400296218659)

Aaro Järvinen

Demonstrating that would be a paper quite clearly

![white_check_mark](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/2705.png)![eyes](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/1f440.png)![raised_hands](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-small/1f64c.png)

[10:39](https://deeplasma.slack.com/archives/D06CDT8AG9Z/p1717400342959949)

Aaro Järvinen

Does not have to fully span the entire DIII-D operational space. Even a proof-of-principle for a smallish operational space would be enough for a publication.