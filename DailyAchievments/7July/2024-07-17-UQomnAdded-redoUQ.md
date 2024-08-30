Worked on UQ

I worked to impliment the latest framework updates and new precision into the previous UQ-demo and UQ-ssg notebooks to see if there is any difference. I also added omn into the list of parameters being alterd which required some framework tweeks since it needs to be the same for each species.

Some more functionality needs to be inputed to ensure the data collected form lumi has parameters in the same order as defined in the notebook so that when the uniform or gaussian error samples are taken they have the same order the ML model was trained to accept them as. This may have been causing hidden issues in the pas since I was not controlling this specifically. 