## creating an enviroment .yml with all packages you want
use this command and place each repo after a -c and each package seperated by a space. pytorch_ds will be the name of the enviroment. 
`conda create -n pytorch_ds -c conda-forge -c pytorch -c anaconda GPy optuna ipykernel scipy matplotlib seaborn emcee pymc pandas numpy scikit-learn pytorch``
`
Then export the enviroment to a .yml file
conda activate pytorch_ds
conda env export > pytorch_ds.yml
https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment

## scp to lumi
set up ssh key: https://docs.lumi-supercomputer.eu/firststeps/SSH-keys/

scp -i ~/.ssh/myprivatekey ~/dir/to/pytorch_ds.yml lumiusername@lumi.csc.fi:~/destination/path

## creating singularity image with python enviroment ready to go
`module load LUMI`
`module load cotainr`
`cotainr build my_container.sif --system=lumi-c --conda-env=my_conda_env.yml``
`
## running a python file inside the container 
`srun --partition=<partition> --account=<account> singularity exec my_container.sif python3 my_script.py``

--partition=small is recommended unless you are sure you can use a whole node as it will let others share the node.
--account=project_project_number, find it on my csc

I am not sure how to define the resources I want it to have. If I want to run a python script on multiple nodes for example. I would have to read lumi docs on paralell processing. 

## Getting VS code to connect to a singularity container and use the python inside

I followed the instruction on this page
https://docs.icer.msu.edu/2023-11-03_LabNotebook_VSCode_Singularity/

My ssh config file is:
Host ds_lumi
	HostName lumi.csc.fi
    	User danieljordan
    	IdentityFile ~/.ssh/lumi_danieljordan
	RemoteCommand singularity shell /users/danieljordan/GENE_UncertaintyQuantification_NeuralNetworkSurrogate/code/ds.sif

my Preferences: Open User Settings (JSON) file is:
up to left"} was already there and after is new.
``{`
`"git.openRepositoryInParentFolders": "never",`
`"window.zoomLevel": 1,`
`"notebook.cellToolbarLocation": {`
`"default": "right",`
`"jupyter-notebook": "left"`
`}`
`"remote.SSH.enableRemoteCommand": true,`
`"remote.SSH.useLocalServer": true,`
`"remote.SSH.serverInstallPath": {`
`"ds_lumi": "~/.vs-code-container/ds_lumi"`
`},`
`"remote.SSH.configFile": "~/.ssh/config",`
`}`

Then I had issues, it first said I needed to install wget or curl inside the conatiner. After following making a singularity container based on existing one to install wget and curl it worked. 

## Making a singularity container based on a existing one

When getting VS code to connect to the container it gave me an error saying it couldn't install the vs code client and so it asked me to install wget or curl

image.def:
Bootstrap: localimage
From: pathto/image.sif

%post
	apt-get install wget
	apt-get install curl

on local machine use command
singularity build image.sif image.def
