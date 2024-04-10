https://www.helsinki.fi/en/admissions-and-education/apply-doctoral-programmes/application-form
# Personal Details
## Start by providing your personal details and educational history. Remember, once you save the application, personal information cannot be edited.

## Tell us about the degree that qualifies you for doctoral studies (e.g., master's degree, licentiate of medicine).

Master of Physics, University of Liverpool
## Write a brief summary of the thesis from your qualifying degree (max 1500 characters): 
Fundamental Direct Band Gap of Antimony Selenide (Sb$_2$Se$_3$) and Implications for Potential use in Photovoltaics

grade 67/100

In 2017 Antimony selenide (Sb2Se3) was an promising light absorber for use in photovoltaic solar pannels. It is composed of cheap, Earth-abundant, non-toxic elements, has benign grain boundaries (reducing recombination losses) and is easy to deposit onto a substrate. Spectrophotometry was used on samples grown via close space sublimation, to measure the absorption spectra and infer the fundamental direct band gap. Which is a very important value to know when trying to absorb a specific wavelength of light from the sun. My thesis reported the fundamental direct band gap to be 1.19 ± 0.04 eV at room temperature. The Shockley Quiesser limit shows antimony selenide has a theoretical maximum efficiency of 32% if used in solar cells. 
## Attach your transcript of records and degree certificate as PDF files. Keep in mind that these files might need to be accompanied by officially certified paper copies or electronic documents through a credential service for official consideration.

Find legalised copy of certificate and transcript

## Language Skills 

my language skills are proven by my education history

# Research Plan

## Preliminary title of the doctoral thesis

Physics informed neural network surrogate model for gyrokinetic plasma turbulence simulation of tokamak pedestool dynamics

## field of research
1043 Fluid and Plasma Physics
https://www.aka.fi/en/research-funding/apply-for-funding/how-to-apply-for-funding/az-index-of-application-guidelines2/research-field-classification

## Brief summary of the research plan (2000 characters) 

Gyrokinetic simulations are applied in plasma physics research to gain insight into turbulent transport. One area of research that is highly demanding to simulate with these approaches is the residual turbulence that remains in self-organized, shear-flow driven, transport barriers in the edge of tokamak plasmas, called pedestals. These plasmas are chacterized by steep pressure, density, and temperature gradients, sheared drift flows, and presence of neutral particles, leading to a very challenging mixture of spatiotemporal scales and physics features to follow in high-fidelity predictive approaches. However, such self-organized structures are also key to the conventional high performance fusion reactor scenarios, as planned in ITER. 

This PhD thesis investigates data science methods to develop fast surrogate models for the residual turbulence simulations as well as to provide data efficient uncertainty quantification for these tools. The gyrokinetic model used in this work is the continuum gyrokinetic code GENE [Jenko2000]. Previous surrogate model research for GENE for core plasmas was discussed by Citrin et al. in [2]. This PhD thesis work will start by producing first a proof-of-principle database of local, linear GENE simulations for a parameter range relevant for Electron Temperature Gradient (ETG) modes in pedestal [HatchPoP2022]. Methods to constrain the model with physics will be investigated [1]. A collaborating team in USA is investigating methods to develop turbulence saturation rules based on experimental observations. Application of the fast linear surrogate model with experiment-based saturation rules should provide fast predictions of fluxes. The developed surrogate model is also expected to become useful in data efficient uncertainty quantification. Further expansions of the model to other parameter ranges or between local and global or testing non-linear saturation can be considered towards the end of the thesis work.
## Motivation for conducting doctoral research (2000 characters) 

Describe your motivation for conducting doctoral research in general and for this topic in particular. Also, explain why you have chosen the doctoral programme you are applying to.

My career goal is to use artificial intelligence to accelerate the development of nuclear fusion technologies. Modern data science techniques have not been fully utilised for solving today’s nuclear fusion issues. The careful application of data science could be the paradigm shift needed to accelerate fusion growth to a point where it is commercially viable. I am excited to contribute to real pioneering research that has the potential to help make fusion a reality. I think a research position suits my personality and preferred work style. I am very self-motivated. I value the ability to follow my curiosity and be creative with my work. 

This topic is extremely vital for the realisation of magnetic confinement fusion. I take motivation from the pressing need from society for large amounts of clean and cheap energy.  

The benefits of physics informed machine learning and informative data creation on plasma simulations can also be applied to interstellar plasmas. The 'doctorial program in particle physics and universe sciences' matches the research profile well.

## Rationale for the research project (2000 characters)
How is the project linked to previous research? What are the most significant theoretical and methodological premises of the project?

This project investigates methods to generate fast surrogate models for the residual turbulence that remains in self-organized, shear-driven, transport barriers in tokamak plasmas. GENE is the physics model that predicts the gyrokinetic features that the surrogate model aims to capture. While surrogate models have been generated for core turbulence transport in tokamaks [Citrin, QLKNN, TGLFNN], there has not yet been as much activity in generating reduced models for the pedestal region [HatchPoP2022, ITHINKPUESCHELSHAVEPUBLISHEDSOMETHINGHEREALREADY]. In a summary, this research projects aims to contribute in filling this void. 

Physics-informed machine learning will be used to guide the training of the surrogate model. It is an emerging discipline that has had many successful implementations so far [1 and references therin]. It mainly focuses on incorporating physics derived differential equations into the loss function to be optimised when training model weights. There is also an element of model architecture creation to remove the possibility of physically impossible results and include physical symmetries. 

To collect highly informative data for model training Bayesian statistics and information theory will be deployed. The Kulback-Leiber divergence measures how different two distributions are and can be used to measure the information gain of a Bayesian posterior compared to the prior. This can potentially be utilised to identify highly informative data. 

The current uncertainty quantification for GENE relies on a surrogate model. The model developed in this work could also be used to generate accurate uncertainty predictions of GENE's outputs when provided with the uncertainty of the inputs [3].
## Objectives of the research and scientific impact of research results (2000 characters)
What are the **objectives** of the project? Shortly present the **hypotheses** and the research questions. Describe the expected research result and their anticipated novelty value in terms of the research field and the current scientific discussion on the research topic. You may also shortly outline the reach, potential applications and utilization value of the research beyond the scientific community.

The first objective is to create a baseline surrogate model using traditional machine learning methods for a local and linear gyrokinetic simulation. The next is to incorporate the physics of gyrokinetics into the training of the model. Tests can be conducted for the hypothesis that physics informed machine learning allows a model to perform well on data outside of the training domain. Another objective is to create an informative data generation system. The hypothesis to test is; can a similar or improved model accuracy can be achieved with less data. Each of these research questions can be reposed when incorporating the physics of the pedestal and its unique magnetic geometry. Although similar research questions have been asked, to the best of my knowledge they have currently never been applied to gyrokinetics or the pedestal. Once trained to max performance, can the surrogate model accurately predict residual pedestal instabilities in real time for current tokamak control systems.

With the many research questions and fusion technologies that could be developed, deciding which ones to fund or spend time on is an audacious task. Fast simulations allow researchers to quickly select the most promising of ideas and accurate simulations increase the chance of them succeeding. Time and money are limited and this project could save a significant amount of it for the development of fusion technology to serve the people clean and abundant energy. 

A model of the pedestal would be useful for developing systems for instability mitigation, impurity handling, impurity pellet injection, and wall material synthesis. It would also add to a larger goal of the fusion community of creating a core to edge simulation of the plasma that combines multiple codes for various regions; and an even larger goal of creating a tokamak digital twin and flight simulator.
## Research methods and materials to be used and its significance for the project (3500 characters) 
Outline the research methods, described so as to explain how they will contribute to answering the research questions/confirming the hypotheses, or how they will support the chosen approach.

The project is using CSC high-peformance computing resource. At the moment, there is an allocation of about half million CPU hours and 50 000 GPU hours on the LUMI HPC for testing, development and proof-of-principle work. Once these are consumed, an application for a factor of a few larger allocation will be prepared.  LUMI is the most powerful supercomputer in Europe. Small nodes will be used for machine learning model development. Larger resources will be requested for initial database generation. Eventually, the entirety of LUMI will be requested for final database creation, training and testing of the max performance model. 

The baseline model will be created using standard neural network architectures available on PyTorch and TensorFlow. The uncertainty quantification code has been developed and is openly available [3]. The model structure that minimises the uncertainty can be selected. The physics of Gyrokinetics can inform the model training with various libraries based on PyTorch and TensorFlow, such as DeepXDE, SimNet, PyDEns, NeuroDiff, NeuralPDE and SciANN; as these are based on solving partial differential equations. The method to include the pedestal physics within machine learning is still an open question. SciPy-Stats is a library for probabilistic distributions and statistical operations and can be used to develop the Bayesian highly informative data generator. 

The performance of machine learning surrogate models are measured by their ability to produce the same, or similar, results as their parent model when given the same inputs. This can be used to evaluate if the surrogate performs well outside of the training domain and if the informative data creation system can reduce the data required for high performance. There is a project called MGKDB in the USA that aims to build an open Gyrokinetic database for benchmarking various codes and surrogate models. Their framework will be developed alongside the project and will aid in deciding the data format, collection and storage strategies. 
## Preliminary plan on the collection, usage and storage of the research material (1500 characters) 
(except for Doctoral Programme in School, Education, Society and Culture, read the instructions below)

Briefly describe how you plan to collect the research material and use it. Are there any data protection or copyright issues related to data storage that need to be taken into account? Is it possible to make the data available for the use of other researchers?

GENE is open source and data created by GENE can be made open to the public. Any model trained using the GENE data can also be made available to the public. There is reason to believe that real experimental data from JET could be beneficial for training, testing or hyperparameter tuning the model. This would improve the models' accuracy for real life situations. The experimental data from the JET tokamak is governed by EUROfusion. VTT is the representative entity of Finland in the EUROfusion consortium. VTT employees and linked third parties, such as the University of Helsinki, can gain access to EUROfusion data through signing a user agreement. The applicant already has the necessary user account to access the data at JET. The review and release of models that apply experimental data in training is governed by the clearance procedures within EUROfusion.

## Ethical issues (1000 characters) 
Are there ethical issues (e.g. ethical governance procedures, informed consent, and anonymity of subjects) that need to be taken into account when conducting the research? Does conducting the research require a research permit or a permit from the ethical board and/or the Animal Experiment Board? 

There are no ethical issues.

## The most important literature for the research plan (2500 characters) 

[1] George Em Karniadakis, et al. [_Nature Reviews Physics_](https://www.nature.com/natrevphys) 3, 422–440 (2021) 

A review for fundamental concepts of physics informed machine learning being used and some specific examples including turbulent transport in fusion devices. 

[2] J. Citrin, et al. Physics of Plasmas 30, 062501 (2023) 

A GENE surrogate model that allowed the prediction of ITER fusion gain to be within targets and achieved 8 orders of magnitude faster computation compared to GENE. Showcases a potential method for model development. 

[3] Ionuţ-Gabriel Farcaş, et al. Communications Engineering 1, 43 (2022) 

A framework for determining the uncertainty of complex models that has already been applied to GENE.   

[3] Dhruv Patel, et al. Computer Methods in Applied Mechanics and Engineering 419, 116536 (2024) 
A method to solve partial differential equations using neural networks in a way that does not involve retraining for every set of input parameters. 

[4] L. Zanisi, et al. arXiv:2310.09024v1 (2023) 
A similar project that also aims to use active learning to create a surrogate model for turbulent transport codes. 

[5] M.T Curie, et al. Physics of Plasmas 29, 042503 (2022) 
A survey of pedestal magnetic fluctuations using gyrokinetics and a global reduced model for micro tearing stability. 

[6] J. Citrin et al.  Nuclear Fusion 55, 092001 (2015) 
Real-time capable first principle based modelling of tokamak turbulent transport. 

[7] K. L. van de Plassche et al. Physics of Plasmas 27, 022310 (2020)  
Fast modeling of turbulent transport in fusion plasmas using neural networks 

[8] O. Meneghini et al. Nuclear Fusion 57, 086034 (2017) 
Self-consistent core-pedestal transport simulations with neural network accelerated models 

[9] DR. Hatch et al. Physics of Plasmas 29, 062501 (2022) 
Reduced models for ETG transport in the tokamak pedestal
## Publication plan and timetable for the articles or Preliminary outline of the monograph (1500 characters)

1. Proof-of-principle demonstration of a machine learning surrogate for local, linear GENE simulations of pedestal relevant parameters, probably focusing on ETG. Investigations of physics-informed constraints. Report the results in the 5th International Conference on Data-Driven Plasma Science. Target Physics of Plasmas or Plasma Physics and Controlled Fusion 2024 or early 2025. 
    

2. Demonstrate application of the developed surrogate model in amortized inference and uncertainty quantification application. These methods are likely to be very useful in the active learning applications for the 3rd publication. Demonstrate the capability of the approach to process through large quantities of experimental data, which would have many use cases in fusion research. Target publication Plasma Physics and Controlled Fusion 2025 or early 2026. 
    

3. Extend the proof-of-principle model to cover relevant parameters for a significant fraction of plasmas relevant for JET tokamak, comparison to experimental data. Test coupling with the experiment-based saturation rules developed by collaborating colleagues in USA. Investigate whether global simulations are needed. Apply active learning or Bayesian approaches to data efficiently add these to the training dataset. Target submission to Nuclear Fusion in 2026 or early 2027. 
    

4. If time permits, further research fidelity increase of the surrogate model with broader parameter ranges, global simulations or non-linear turbulence features.

Preliminary Timetable for your research

For the 5th International Conference on Data-Driven Plasma Science on August 12th I plan to have a framework for generating surrogate models for complex physics models that allows experimentation with physics informed techniques and machine learning models. I will have generated surrogate models using standard machine learning techniques and assessed their performance. I will have developed a deep understanding of the turbulence physics at the pedestal region of a tokamak.

By the end of 2024 I plan to have tested many machine learning models and physics informed approaches and be able to write a paper that compares the various implementations for specific tubulence problems within the pedestal.

By the end of 2025 I plan to apply the developed surrogate model in amortized inference and uncertainty quantification. I will demonstrate the capability of the approach to process through large quantities of experimental data, which would have many use cases in fusion research. 

By the end of 2026 I plan to validate the model against many experiments within the JET tokamak. I will couple the surrogate model of linear GENE with an experiment-based saturation rules developed by collaborating colleagues in USA. Apply active learning or Bayesian approaches to data efficiently add these to the training dataset.

With any extra time I would further research fidelity increase of the surrogate model with broader parameter ranges, global simulations or non-linear turbulence features.


## Planned funding for the research project including received and applied notable funding thus far (1000 characters) 

Employment at VTT in the Fusion energy and decommissioning team

# Supervision arrangements
I need a signed supervision agreement

Palmroth, Minna
Professor
Space Physics Research Group
minna.palmroth@helsinki.fi

Jarvinen, Aaro
Senior Scientist
VTT, Technical Research Center Finland
aaro.jarvinen@vtt.fi
# Previously Acquired Knowledge CV

## Previously acquired research knowledge (1500)
Previous experience in research work, other scientific work and/or scientific merits, including possible academic awards and other academic acknowledgements.

Masters Thesis
Fundamental Direct Band Gap of Antimony Selenide (Sb$_2$Se$_3$) and Implications for Potential use in Photovoltaics
My masters thesis explored the properties of a new material and was used to direct further research.

Physics of Data
On the 18th of April 2024 I will graduate from a second masters in Physics of Data from the University of Padua for which I received the prestigious scholarship of Excellence. This involved many projects related to machine learning. One of these involved working with a supervisor to contribute to their research. My group worked with Michella Mapelli and was using decision trees to identify the properties of binary black holes that contribute the most to their lifetime.

For my second masters thesis I conducted research with Ghent university under Geert Verdoolaege for 3 months and completed a project that explored using Bayesian inference with a Gaussian process prior to infer the electron density profile of a tokamak plasma with interferometry data.


## Possible publications and conference presentations (1500 characters)

Currently I have made no publications and have not presented at any conferences

## Possible international experience and other work experience relevant to your doctoral research(1500 characters).

Employment at VTT:
Since January 2nd I have been employed full-time as a scientific researcher within the VTT Technical Research center.  I have already begun gathering the required knowledge for this PhD project. I attended a Turbulence and Transport crash course from a world-leading expert in plasma turbulence, MJ Peuschel. I have familiarized myself with running GENE and interpreting its results. I am currently collaborating with co-workers to develop a framework for generating databases of results from complex physics codes for surrogate model training. Thus the project being proposed for this PhD is currently underway.
## Possible career breaks (1500 characters)

After my first physics masters in 2017 I took a career break before starting my second physics of data masters in 2021.

I traveled in France as a volunteer. I worked with various permaculture groups, including a vegan community within the Pyrenees mountains. I studied and practiced the french language. This experience helped me learn how to respect foreign cultures and how to see cultural differences as personal development opportunities.

After 1 year of travelling in France, I went home to my family in Northern Ireland. I began writing my novel entitled Entropy. A thrilling adventure of galactic proportions, where our conception of life is stretched, and a story is told of a young alien girl's discovery of friendship and the universe. After fifty thousand words, I had completed the first draft for book 1 of the story.

After I was contempt with the progress of my novel I focused on a variety of projects. I began tutoring mathematics and physics. I followed my curiosity within books and videos, mostly on machine learning and plasma physics. I experimented with Arduino's and programming them with C++. Which led me to develop a prototype dispensing system for addictive medications. I began a business partnership with my sister. We sell personalised household items. My role is to have an in-depth understanding of the machinery and processes for troubleshooting and product development.

## Discipline-specific studies (30 ECTS) (1500 characters)

Partial Differential Equations I, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2324-f4ee8447-53cb-46a0-a628-e4d495024b48/MAST30172

Partial Differential Equations II, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2324-c0180d83-3464-4196-9c65-275d57365fcf/MAST30173

Distributed Systems, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2223-b8ec1422-835b-4bdb-bd2c-25df506de0f8/CSM13001

Programming for Performance, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2223-a7f1e684-d6dc-4a9c-9ade-1ccdcdb59fd8/BSCS2011

Plasma Physics, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2223-e00c318a-7c11-40f4-badd-b7d02cb42ace/PAP304

Advanced Course in Machine Learning, 5cr
https://studies.helsinki.fi/courses/course-implementation/hy-opt-cur-2324-b76f7ea8-2498-4127-9526-dfa63260084a/DATA12001

## Transferable skills (10 ECTS) (1500 characters)
https://studies.helsinki.fi/degree-structure/study-module/otm-dbc1890d-bf01-4ba6-a760-f57442fa42b9?fbclid=IwAR2UY-6CShnmuAFyCP2f83Y7RP4VW6LhOkL8nGSL1tFGx-lM273Bovd9rAE

Philosephy of Science, 1-5cr
https://studies.helsinki.fi/courses/course-unit/otm-868dc888-f7ac-46c4-b319-6330a7b4526a?cpId=hy-lv-74

Facing the Final Frontier: Writing the Article-Based Dissertation (1 cr)
https://studies.helsinki.fi/courses/course-unit/otm-56aa42f8-3689-4725-b13d-1601d3b65d0d?cpId=hy-lv-74

Academic Writing for Doctoral Researchers (2 cr)
https://studies.helsinki.fi/courses/course-unit/otm-83555aac-9a93-45bd-b7df-2867d7444690?cpId=hy-lv-74

Leading a creative expert organisation (1–5 cr)
https://studies.helsinki.fi/courses/course-unit/otm-e3be4ad9-abe7-4283-84d8-ddfc3c801b01?cpId=hy-lv-74

Sustainability course (3 cr)
https://studies.helsinki.fi/courses/course-unit/otm-cb1bbe03-9b38-427a-8613-d2e43475dcb4?cpId=hy-lv-74


