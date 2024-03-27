import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path
import yaml
import argparse

def load_configuration(config_path):
    with open(config_path, 'r') as file:
        config = yaml.safe_load(file)
        config = argparse.Namespace(**config)
    return config

config_path = Path('/users/danieljordan/GENE_UncertaintyQuantification_NeuralNetworkSurrogate/code/config.yaml')
config = load_configuration(config_path)

fig = plt.figure()
plt.plot(np.arange(3), np.arange(3))
sp = Path(config.diagdir,'growthrate_ky.png')
fig.savefig(sp)

#need to impliment scp to my laptop