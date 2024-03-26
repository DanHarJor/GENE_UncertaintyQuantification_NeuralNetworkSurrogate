
# Data cleaning to get surrogate better than parent model
[[2024-02-06>09#crazy idea|tarvaniemi]]
I learned that many of these codes produce unrealistic results, including SOLPS and GENE. 
I thought ML could help improve these code by only training on the physically realistic results and interpolating to where the original model was wrong. 

I thought you could make a ML model to identify when the output is physically realistic to help with large dataset cleaning. 

Speak to David about identifying an experiment where GENE outputs results that are sometimes drastically different from the experiment but mostly good. Then clean the gene outputs and train so see if the surrogate can match the experiment better than the parent. 

MJ said in his course I will learn to quantify how physically realistic an output from gene is.
# Auto Encoder to Sample important outputs
Make a ML model that does a similar thing to sparse grids. Like PCA but in a non linear fashion and with ML. Use variational autoencoder to encode into the non linear principle components, sample many of these compressed states then decode to the full states. Still not sure how you would train it to encode into the no linear principle components. But if you could then you could simply random sample in this state between some bounds given by extream uncompressed states that have been compressed.

**I neural network in gerneral kind of does non linear PCA. You can make a neural newtwork that compressed it down then when decompressed it doesn't output the origional inputs like a VAE but outputs the surrogate model outputs. Then it will learn what is the important compressed states to get the correct outputs of the parent model. Then you can train a separate second half of the neural network to** decode the compressed states to get the uncompressed initial conditions. Then you can sample many compressed states.

A problem is you can learn what compressed states are important for you to get your current data but not what compressed states are important for unseen data. But the data you have now is all you have so you got to live with that somehow. 


# Like the driving car ML for data sampling
Lisa trained a car to drive through a virtual city by rewarding it when it didn't crash. We could do the same thing but reward it when it suggests new data points that are highly informative. It starts randomly sampling the data and checking the KL div between post and prior then it learns how to sample data so as to max KL div. 

Her car had cameras. Your car would be blind

# Iterative Model Improvement for Informative Data Generation

The idea is that we can use poor versions of the child model to find informative data. Do heavy computation of parent model to generate only informative data. Then improve the child model with this data to start the process again.  

You can use the KL divergence between posterior and prior to measure information gain. As you add another batch of data you can see how much information you have gained and compare with a different batch of data. 

To get both batches of data you need to use the heavy parent model which defeats the purpose of finding the most informative data. 

So you use your fast poor quality surrogate model to generate the data. see which ones are more informative and keep them.

this isn't going to work as is because the parameters you use to generate the data are deffinetly going to be the best parameters to match the data so both batches of data should be just as informative which is not informative at all in terms of finding the true model. Needs more thinking. 

maybe you could adapt to only look near true data points as this should be where you model performs best. 

# AI Fourier transform to speed up non linear runs

MJ peuschel on the crash mentioned that the fourrier transform takes a massive amount of the computation for non linear runs. This could be sped up with AI techniques. 


# only AI solve the non linear part
MJ highlighted a purple part in part 5, slide 18, gyrokinetics derivation part of his course. Maybe only try to AI this part and keep the numerical solver for the linear part.

