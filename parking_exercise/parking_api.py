import dlt
import json
import requests
import pandas as pd
from pathlib import Path
import os

def _get_ads(url):
    headers = {'accept': 'application/json'}
    response = requests.get(url, headers=headers)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.resource(write_disposition="replace")
def parking_api_resource():
    url = "https://openparking.stockholm.se/LTF-Tolken/v1/pmotorcykel/all?maxFeatures=100&outputFormat=json&apiKey=580edc56-114a-4327-8337-733cadaf88c9"
    for ad in _get_ads(url)["features"]:
        yield ad

    # this is the test data for loading validation, delete it once you yield actual data

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
    pipeline_name='parking_mc',
    destination='snowflake',
    dataset_name='staging_mc',
    )
    load_info = pipeline.run(parking_api_resource(), table_name=table_name)
    print(load_info)

if __name__ == "__main__":
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    table_name = "data_field_parking_mc"
    run_pipeline(table_name)

    

