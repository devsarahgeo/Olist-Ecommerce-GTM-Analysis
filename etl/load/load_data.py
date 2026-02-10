import os
import yaml

with open("config/config.yaml") as f:
    cfg = yaml.safe_load(f)

raw_data_path = cfg['paths']['raw_data']
processed_data_path = cfg['paths']['processed_data']

def save_raw_to_csv(dataframes):
    os.makedirs(raw_data_path, exist_ok=True)

    for name, df in dataframes.items():
        file_path = f"{raw_data_path}/{name}.csv"
        df.to_csv(file_path, index=False)
        print(f"Saved: {file_path}")


def save_processed_to_csv(dataframes):
    os.makedirs(processed_data_path, exist_ok=True)

    for name, df in dataframes.items():
        file_path = f"{processed_data_path}/{name}.csv"
        df.to_csv(file_path, index=False)
        print(f"Saved: {file_path}")
