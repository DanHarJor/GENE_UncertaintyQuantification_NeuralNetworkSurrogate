# Active Learning Lines of Code issue
if self.max_samples > completed:

this will be true even when only one sample has been completed. You can't do active learning with one sample.

Solution: active learning shouldn't be in start runs. More infrastructure is needed for active learning.

start runs should be start_next_runs.

Then there needs to be model training: probably seperate class

active_sampling strategie: A specific active child of the sampler class

then start_next_runs: from executor class.

then repeat. 

```
if self.max_samples > completed:
                # TODO: pass the previous result and parameters..
                # For active learning
                params = self.sampler.get_next_parameter()
                if params is None:  # This is hacky
                    continue
                else:
                    new_future = self.client.submit(
                        run_simulation_task, self.runner_args, params, self.base_run_dir
                    )
                    seq.add(new_future)
```
# Hypercube sampler not returning none
amanda said its development is on pauese, this might be why.
it doesn't return none when all the samples have been made to circumvent adams active learning thing. 
# No downstream ML??
The readme mentions that downstream training will not be handled. If we do active learning, then we will be training as we go. This required to decide the next points. This means at the end we will have a surrogate trained on all the generated data. So the downstream training will already have been done...

I suppose the focus right now is on database generation for standard ML and active learning will come later. 

# UQ
UQ is an application of the downstream ML so if you do not want to handle it then it would be odd for me to put UQ in. 

# linting
The linting didn't pick up on the cases of def's and classes so it might still be worth mentioning in readme. 

