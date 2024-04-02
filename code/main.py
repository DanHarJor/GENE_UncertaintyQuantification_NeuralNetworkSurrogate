import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from pathlib import Path
import yaml
import argparse

def load_configuration(config_path):
    with open(config_path, 'r') as file:
        config = yaml.safe_load(file)
        config = argparse.Namespace(**config)
    return config

def parse_scan_log():
    config_path = Path('/users/danieljordan/GENE_UncertaintyQuantification_NeuralNetworkSurrogate/code/config.yaml')
    config = load_configuration(config_path)
    scan_log_path = Path(config.diagdir, 'scan.log')
    df = pd.read_csv(scan_log_path, sep='|',skiprows=None)
    print('psl')
    return df
