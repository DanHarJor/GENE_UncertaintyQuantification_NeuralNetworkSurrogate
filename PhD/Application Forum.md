https://www.helsinki.fi/en/admissions-and-education/apply-doctoral-programmes/application-form

# Personal Details
## Start by providing your personal details and educational history. Remember, once you save the application, personal information cannot be edited.

## Tell us about the degree that qualifies you for doctoral studies (e.g., master's degree, licentiate of medicine).

Master of Physics (Mphys) University of Liverpool
## Write a brief summary of the thesis from your qualifying degree (max 1500 characters): 
Fundamental Direct Band Gap of Antimony Selenide (Sb$_2$Se$_3$) and Implications for Potential use in Photovoltaics

In 2017 Antimony selenide (Sb2Se3) was an promising light absorber for use in photovoltaic solar pannels. It is composed of cheap, Earth-abundant, non-toxic elements, has benign grain boundaries (reducing recombination losses) and is easy to deposit onto a substrate. Spectrophotometry was used on samples grown via close space sublimation, to measure the absorption spectra and infer the fundamental direct band gap. Which is a very important value to know when trying to absorb a specific wavelength of light from the sun. My thesis reported the fundamental direct band gap to be 1.19 ± 0.04 eV at room temperature. The Shockley Quiesser limit shows antimony selenide has a theoretical maximum efficiency of 32% if used in solar cells. 
## Attach your transcript of records and degree certificate as PDF files. Keep in mind that these files might need to be accompanied by officially certified paper copies or electronic documents through a credential service for official consideration.

Find legalised copy of certificate and transcript

# Language Skills 

my language skills are proven by my education history

# Research Plan

## Preliminary title of the doctoral thesis

Physics informed machine learning models for acceleration of gyrokinetic turbulence simulation of tokamak edge

## field of research
1043 Fluid and Plasma Physics
https://www.aka.fi/en/research-funding/apply-for-funding/how-to-apply-for-funding/az-index-of-application-guidelines2/research-field-classification

# Brief summary of the research plan (2000 characters

The plasma wall interaction a crucial challenge facing the magnetic fusion research community today. Temperatures inside a fusion device are hotter than the core of the sun. The materials of the plasma facing wall and plasma control systems need to be developed to prevent damage to the plasma facing wall inside a magnetic fusion device such as a tokamak. The pedestal is a plasma formation at the edge of a tokamak plasma  when configured in high confinement mode. Developing fast and accurate physics based simulations for the pedestal is vital for researchers to test their ideas on plasma control systems and plasma facing wall materials without large investments in device construction. 

GENE is a gyrokinetic code that simulates the positions of plasma particles within an external magnetic field. The plan is to use physics informed machine learning to create a surrogate model of GENE that is tuned to accurately model the pedestal. Similar projects used more traditional machine learning for the core of the plasma [citrin 4]. The pedestal is a more complex than the core. Generating high fidelity data for model training is more computationally expensive. The plan includes developing an AI method to generate highly informative or instability relevant data; allowing an effective model to be created with less data.

A proof of principle version will be created using linear gyrokinetics for a simple magnetic geometry that is cheap to compute. The benefits of physics informed machine learning and informative data creation will be tested against more simple methods.

Introducing the pedestal magnetic geometry and non linear gyrokinetics will be a major challenge.

The model will be trained to maximum performance with a large database and its usability for various extended research tasks will be tested.

  - why pedestool physics is so important
  - why it has been difficult to study so far
  - How Gyrokinetics could be the best model we have
  - data base creation with information theory and Bayesian Statistics
  - how physics informed ML could be a solution to allow future research at a realistic pace.


# Motivation for conducting doctoral research (2000 characters)
Describe your motivation for conducting doctoral research in general and for this topic in particular. Also explain why you have chosen the doctoral programme you are applying to.

My career goal is to use artificial intelligence to accelerate the development of nuclear fusion technologies. Modern data science techniques have not been fully utilised for solving today’s nuclear fusion issues. The careful application of data science could be the paradigm shift needed to accelerate fusion growth to a point where it is commercially viable. I am excited to contribute to real pioneering research that has the potential to help make fusion a reality. I think a research position suits my personality and preferred work style. I am very self motivated. I value the ability to follow my curiosity and be creative with my work.

This topic is extremely vital for the realisation of magnetic confinement fusion. I take motivation from the pressing need from society for large amounts of clean and cheap energy. 

The benefits of physics informed machine learning and informative data creation on plasma simulations can also be applied to interstellar plasma. The 'doctorial program in particle physics and universe sciences' matches the research profile well.

# Rationale for the research project (2000 characters)
How is the project linked to previous research? What are the most significant theoretical and methodological premises of the project?

The project aims to create a surrogate model for GENE (Gyrokinetic Electromagnetic Numerical Experiment). Gyrokinetics strikes an excellent balance between model fidelity and computational cost. To alleviate the curse of conditionality it takes the 6D kinetic Vlasov equations and reduces them into a set of 5D gyrokinetic Vlasov equations by averaging over the gyration of particles around the magnetic field. It thus keeps track of the particles in the form of charge rings.

Physics informed machine learning will be used to guide the training of the surrogate model. It is an emerging discipline that has had many successful implementations so far [1 and references therin]. It mainly focuses on incorporating physics derived differential equations into the loss function to be optimised when training model weights. There is also an element of model architecture creation to remove the possibility of physically impossible results and include physical symetries.

To collect highly informative data for model training Bayesian statistics and information theory will be deployed. The Kulback Leiber divergence measures how different two distributions are and can be used to measure the information gain of a Bayesian posterior compared to the prior. This can potentially be utalised to identify highly informative data

The uncertainty of the models predictions can be analysed in the same way as is currently deployed for GENE ref[]. This could also aid in model development.  




- a bit about previous research into physics informed ML
- Physics Informed Machine Learning with Active Learning for Gyrokinetics[[Zanisi_physInfALforGyrokinetics.pdf]]section 3.2 Physics-informed Active Learning for gyro-kinetic models with ADEPT. How it has also been applied to gyrokinetics.
- it has never been done for the pedestool. 
# Objectives of the research and scientific impact of research results (2000 characters)
What are the **objectives** of the project? Shortly present the **hypotheses** and the research questions. Describe the expected research result and their anticipated novelty value in terms of the research field and the current scientific discussion on the research topic. You may also shortly outline the reach, potential applications and utilization value of the research beyond the scientific community.

objectives
hypothesis : research questions and expected results
novilty
use for other research and beyond. 

The first objective is to create a baseline surrogate model using traditional machine learning methods for a linear gyrokinetic simulation with a simple magnetic geometry (flux tube). The next objective is to pipeline the use of uncertainty quantification to guide the model development. After, incorporate the physics of gyrokinetics into the training of the model. Tests can be conducted for the hypothesis that physics informed machine learning allows a model to perform well on data outside of the training domain. Another objective is to create the informative data generation system. The hypothesis to test is that if a similar or improved model accuracy can be achieved with less data when using this system. Each of these research questions can be reposed when incorporating the physics at the pedestal and its unique magnetic geometry. Although similar research questions have been asked, to the best of my knowledge they have currently never been applied to Gyrokinetics or the pedestal. Once trained to max performance, can the surrogate model accurately predict pedestal instabilities in real time for current tokamak control systems to act.

With the infinite many research questions and fusion technologies that could be developed deciding which ones to fund or spend time on is an audacious task. Faster simulations allow researches to quickly select the most promising of ideas and more accurate simulations increase the chance them being the ones to succeed. Time and money is limited and this project could save a significant amount of it for the development of fusion technology to serve the people clean and abundant energy.

More specifically a model of this region of the plasma would be useful to develop systems for instabilitiy mitigation, impurity handeling, impurity pellet injection, wall material synthesis. It would also add to a larger goal of the fusion community of creaiting a core to edge simulation of the plasma that combines multiple codes for various regions; and an even larger goal of creating a tokamak digital twin.  


construct a small database of highly informative or instability relivant data and test if when trained on this data can the model improve perfomance simply by using well selected training data.

analyse the uncertainties of the model in a similar way that gene analyses their uncertainties, mention PINN uncertianties mentioned in Joosts review paper.

Collaborate on the application of the model to go from linear gyrokinetics to pedestel transport model.

- Useful for many researchers who want to gain insight into processes at the pedestool for 
	- impurity handeling
	- impurity injection for heat load handeling
	- damage mitigation
	- maintenance checks
	- confinement time  modeling
	- with relevant compute times 
	- creating a high fidelity core to edge plasma simulation based on many models following various theories, maybe need gyro linear to pedestal transport mapping first. 

- useful for Joe to classify what is a hybrid plasma and what is a scaling law for one.

- linear gyrokinetic stability predicitons could be mapped to a transport model to create a fast transport model for pedestal plasmas. Internation parterns in US, is working on the mapping. This could be used in the high fidelity core to edge plasma simulation. 

PEGENENN would provide fast local, linear stability predictions, which when coupled with appropriate mapping from the linear stability to transport would yield a very fast, GK-based transport model for pedestal plasmas. This mapping from linear GK to transport is the focus of complementary research of our international partners in US. When coupling the two components, (1) PEGENENN from DEEPlasma with (2) the linear to transport mapping from the research in US, the resulting GK-based pedestal transport model can yield a new paradigm in core-edge integrated scenario simulations. Eventually, when coupled with fast models for global pedestal magnetohydrodynamic (MHD) stability and scrape-off layer (SOL) transport, which are being addressed through other research activities within EUROfusion, a fast, high-fidelity, physics-based model for the entire edge from the pedestal top to the reactor wall will become possible. Such a model would represent a scientific breakthrough for power exhaust and core edge integration predictions in these fusion devices. 

Helps the public get a fusion reactor for all their energy needs. 
# Research methods and materials to be used and its significance for the project (3500 characters) 
Outline the research methods, described so as to explain how they will contribute to answering the research questions/confirming the hypotheses, or how they will support the chosen approach.

research methods for objectives and hypothesis
objectives and hypothesis:
baseline model
incorperate gyrokinetics PINN
does PINN do well outside of training domain?
informative data system
does it allow for similar perfromance with less data?
max performance

For computation power the project has 500'000 CPU hours and 50'000 GPU hours on the LUMI supercomputer managed by CSC. This is the most powerful supercomputer in Europe. Small nodes will be used for machine learning model development. Larger resources will be requested for initial database generation. Eventually the entirety of LUMI will be requested for final database creation, training and testing of the max performance model.

The baseline model will be created using standard neural network architectures available on PyTorch and TensorFlow. The uncertainty quantification code has been developed and is openly available []. The model structure that minimises the uncertainty can be selected. The physics of Gyrokinetics can inform the model training with various libraries based on PyTorch and TensorFlow, such as DeepXDE, SimNet, PyDEns, NeuroDiff, NeuralPDE and SciANN; as these are based on solving partial differential equations. The method to include the pedestal physics within the machine learning is still an open question. SciPy-Stats is a library for probabilistic distributions and statistical operations and can be used to develop the Bayesian highly informative data generator.

The performance of machine learning surrogate models are measured by their ability to produce the same or similar results as their parent model when given the same inputs. This can be used to evaluate if the surrogate performs well outside of the training domain and if the informative data creation system can reduce the data required for high performance. There is a project begining called MGKDB in the USA that aims to build an open Gyrokinetic database for benchmarking various codes and surrogate models. Their framework will be developed alongside the project and will aid in the deciding the data format, collection and storage strategies. 




ACH, LUMI, GENE, ML frameworks, PINN frameworks, collaboration with david hatch 

Variational bayes theorum can be applied to test many models in a systematic way to find the best model. 

testing on untrained data. 

compare gene and surrogate uncertainties. 

compare with other models making similar predictions, qualkitz, EPED MHD
# Preliminary plan on the collection, usage and storage of the research material (1500 characters) 
(except for Doctoral Programme in School, Education, Society and Culture, read the instructions below)
Briefly describe how you plan to collect the research material and use it. Are there any data protection or copyright issues related to data storage that need to be taken into account? Is it possible to make the data available for the use of other researchers?

Reference literature will be stored on an encrypted work laptop hard drive and not made accessible to the public. GENE is open source and data created by GENE can be made open to the public. Any model trained using the GENE data can also be made available to the public. There is reason to believe that real experimental data from JET could be beneficial for training, testing or hyper parameter tuning the model. This would improve the models ability to model reality. The experimental data from the JET tokamak is governed by EUROfusion. VTT is the representative entity of Finland in the EUROfusion consortium. VTT employees and linked third parties, such as University of Helsinki, can gain access to EUROfusion data through signing a user agreement. The applicant already has the necessary user account to access the data at JET. Any model trained on the JET data would not be made available to the public but could be made available to those within the EUROfusion consortium.

# Ethical issues (1000 characters) 
Are there ethical issues (e.g. ethical governance procedures, informed consent, and anonymity of subjects) that need to be taken into account when conducting the research? Does conducting the research require a research permit or a permit from the ethical board and/or the Animal Experiment Board? 

There are no ethical issues.

# The most important literature for the research plan (2500 characters) 

[1] George Em Karniadakis, et al. [_Nature Reviews Physics_](https://www.nature.com/natrevphys) 3, 422–440 (2021)
A review on fundamental concepts of physics informed machine learning being used and some specific examples including turbulent transport in fusion devices.

[2] Dhruv Patel, et al.  [Computer Methods in Applied Mechanics and Engineering](https://www.sciencedirect.com/journal/computer-methods-in-applied-mechanics-and-engineering "Go to Computer Methods in Applied Mechanics and Engineering on ScienceDirect")
[Volume 419](https://www.sciencedirect.com/journal/computer-methods-in-applied-mechanics-and-engineering/vol/419/suppl/C "Go to table of contents for this volume/issue") page 116536 (2024)
A method to solve partial differential equations using neural networks in a way that does not involve retraining for every input parameters.

[3] L. Zanisi, et al. arXiv:2310.09024v1 (2023)
A similar project that also aims to use active learning to create a surrogate model for turbulent transport codes.

[4] J. Citrin, et al. Physics of Plasmas 30, 062501 (2023)
A GENE surrogate model that alowed the prediction of ITER fusion gain to be within targets and achieved 8 orders of magnitude faster computation compared to GENE. Showcases a potential method for model development.

[5] Ionuţ-Gabriel Farcaş, et al. Communications Engineering 1, 43 (2022)
A framework for determining the uncertainty of complex models that has already been applied to GENE. This could be useful for determining the uncertainty of proposed machine learning models for model comparison and hyper parameter tuning. It also boasts the method intrinsically creates a surrogate model that is 9 orders of magnitude faster than origional model. This could aid in the development of a physics informed surrogate model or be used for verification. 

# Publication plan and timetable for the articles or Preliminary outline of the monograph (1500 characters)

4 paper, titles and small description. 

Physics Informed Machine Learning Gyrokinetic Surrogate Model for Pedestal Plasmas within a Tokamak. 
Once the research has developed to a point where the surrogate model has been trained and tested on simulations of plasmas with a pedestal magnetic geometry and fusion related particle population this is a truely novel contribution.

Pedestal Physics Incorporated into Gyrokinetic Surrogate Model
There is a direct workflow to Include the gyrokinetic differntial equations within physics informed machine learning for the first mentioned paper. Including specificaly pedestool physics is still an open question for the project and if solved would deserve a paper on it's own. 

Data Reduction via Physics Informed Machine Learning and Bayseian Oracle Active Learning for Gyrokinetic Pedestal Plasma Surrogate Model.
The bayesian oracle active learining is the technical term in the machine learning world for what the highly informative data generator would be. Both the physics involvement and informative data generator contribute to needing less data for training. This paper can quantify exactly how much less data is required for the same performance when using these methods. 

High Performance Gyrokinetic Surrogate Model for Pedestal Plasmas
After everything has been incorporated into the surrogate it will be beyond physics informed, it will be something new of its own right. After training the surrogate on a large amount of data and testing it on an even larger amount of data the results will hopefully be a spectacle to behold in terms of speed and accuracy for gyro-kinetic simulations. 

# Planned funding for the research project including received and applied notable funding thus far (1000 characters) 

Employment at VTT in the Fusion energy and decommissioning team