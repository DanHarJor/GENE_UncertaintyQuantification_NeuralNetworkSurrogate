https://www.helsinki.fi/en/admissions-and-education/apply-doctoral-programmes/application-form
## Start by providing your personal details and educational history. Remember, once you save the application, personal information cannot be edited.

## Tell us about the degree that qualifies you for doctoral studies (e.g., master's degree, licentiate of medicine).

Master of Physics (Mphys) University of Liverpool
## Write a brief summary of the thesis from your qualifying degree (max 1500 characters): 
Fundamental Direct Band Gap of Antimony Selenide (Sb$_2$Se$_3$) and Implications for Potential use in Photovoltaics
abstract:
Antimony selenide (Sb2Se3) has been identified to be a promising light absorber for use in photovoltaic electricity production that could help satisfy society’s energy needs. It is composed of cheap, Earth-abundant, non-toxic elements, has benign grain boundaries (reducing recombination losses) and has an evaporation temperature lower than its degradation temperature, allowing for easy deposition. This investigation uses transmission data taken from spectrophotometry, on samples grown via close space sublimation, to infer absorption spectra and extract the fundamental direct band gap. This thesis reports the fundamental direct band gap to be 1.19 ± 0.04 eV at room temperature. The top of the absorption edge is measured to be close to 5×104 cm−1, meaning a 1μm film would absorb approximately 99.3% of light. The discovered band gap places it in a position on the Shockley Quiesser limit of maximum efficiency to accommodate the potential for 32% efficient thin film solar cells. This optimal band gap and high absorption coefficient add to the list of properties that make Sb2Se3 promising for future use in photovoltaics.

## Attach your transcript of records and degree certificate as PDF files. Keep in mind that these files might need to be accompanied by officially certified paper copies or electronic documents through a credential service for official consideration.

Find legalised copy of certificate and transcript

# Language Skills 

my language skills are proven by my education history

# Research Plan

## Preliminary title of the doctoral thesis

Physics informed neural network surrogate model for gyrokinetic plasma turbulence simulation of tokamak pedestool dynamics

## field of research
1043 Fluid and Plasma Physics
https://www.aka.fi/en/research-funding/apply-for-funding/how-to-apply-for-funding/az-index-of-application-guidelines2/research-field-classification

# Brief summary of the research plan (2000 characters
  - why pedestool physics is so important
  - why it has been difficult to study so far
  - How Gyrokinetics could be the best model we have
  - data base creation with information theory and Bayesian Statistics
  - how physics informed ML could be a solution to allow future research at a realistic pace.


# Motivation for conducting doctoral research (2000 characters)
Describe your motivation for conducting doctoral research in general and for this topic in particular. Also explain why you have chosen the doctoral programme you are applying to.

My career goal is to use artificial intelligence to accelerate the development of nuclear fusion technologies. Modern data science techniques have not been fully utilised for solving today’s nuclear fusion issues. The careful application of data science could be the paradigm shift needed to accelerate fusion growth to a point where it is commercially viable. I am excited to contribute to real pioneering research that has the potential to help make fusion a reality. I think a research position suits my personality and preferred workstyle. I am very self motivated. I value the ability to follow my curiosity and be creative with my work.

This topic is extremely vital for the realisation of magnetic confinement fusion. One of the most pressing issues for fusion devices is the plasma wall interaction. Since the plasma core is hotter than the core of the sun the plasma facing wall is exposed to extreme temperatures. The issue is made worse by plasma turbulence and instabilities. Having a way to simulate this region of the plasma in a fast way where uncertainties are quantifiable would allow the scientific community to investigate how to avoid turbulence and instabilities. This is what the gyrokinetic surrogate model hopes to achieve.

The DOCTORAL PROGRAMME IN PARTICLE PHYSICS AND UNIVERSE SCIENCES was chosen as it is the most relevant program to my field of research. If accepted to join the program my research can be acknowledged as a significant contribution to the scientific community worthy of a PhD.

# Rationale for the research project (2000 characters)
How is the project linked to previous research? What are the most significant theoretical and methodological premises of the project?

- a bit about previous research into physics informed ML
- Physics Informed Machine Learning with Active Learning for Gyrokinetics[[Zanisi_physInfALforGyrokinetics.pdf]]section 3.2 Physics-informed Active Learning for gyro-kinetic models with ADEPT. How it has also been applied to gyrokinetics.
- it has never been done for the pedestool. 
# Objectives of the research and scientific impact of research results (2000 characters)
What are the objectives of the project? Shortly present the hypotheses and the research questions. Describe the expected research result and their anticipated novelty value in terms of the research field and the current scientific discussion on the research topic. You may also shortly outline the reach, potential applications and utilization value of the research beyond the scientific community.

Main objectives in order of completion 
create a proof of principle baseline surrogate model that uses a small database of GENE outputs that uses basic machine learning algorythems and training mechanisms. 

incorporate physics informed machine learning and test if this improves performance over the baseline when trained and tested on the same data. Test if this also allows the model to extrapolate outside of the training domain. If thurroughly tested this could help reassure the scientific community of the usefullness of ML surrogates even if they are trained outside of the domain of interest. 

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

ACH, LUMI, GENE, ML frameworks, PINN frameworks, collaboration with david hatch 

Variational bayes theorum can be applied to test many models in a systematic way to find the best model. 

testing on untrained data. 

compare gene and surrogate uncertainties. 

compare with other models making similar predictions, qualkitz, EPED MHD
# Preliminary plan on the collection, usage and storage of the research material (1500 characters) 
(except for Doctoral Programme in School, Education, Society and Culture, read the instructions below)
Briefly describe how you plan to collect the research material and use it. Are there any data protection or copyright issues related to data storage that need to be taken into account? Is it possible to make the data available for the use of other researchers?

previous articles will be stored on an encrypted work laptop hard drive and not made accessible to the public.
Gene is open source and data created by gene can be made open to the public
Any model trained using the Gene data can also be made available to the public.
There is reason to believe that real experimental data from JET could be benifical for training, testing or hyper parameter tuning the model. This would improve the models ability to model reality.

The experimental data from the JET tokamak is governed by EUROfusion. VTT is the representative entity of Finland in the EUROfusion consortium and the employees of VTT and linked third parties, such as University of Helsinki, can gain access to EUROfusion data through signing a user agreement. The applicant already has the necessary user account to access the data at JET. Any model trained on the JET data would not be made available to the public but could be made available to those within the EUROfusion consortium. 

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

# Planned funding for the research project including received and applied notable funding thus far (1000 characters) 

Employment at VTT in the Fusion energy and decommissioning team