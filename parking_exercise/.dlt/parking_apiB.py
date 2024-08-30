import dlt
import requests
import json
from pathlib import Path
import os

def _get_ads(url_for_search, params):
    headers = {'accept': 'application/json'}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.resource(write_disposition="replace")
def parking_api_resource(
    params
):
    url = 'https://openparking.stockholm.se/LTF-Tolken/v1/pmotorcykel/all?maxFeatures=&apiKey={APIKEY}'
    url_for_search = f"{url}/search"

    for ad in _get_ads(url_for_search, params)["hits"]:
        yield ad

def run_pipline(query, table_name):
    pipeline = dlt.pipeline(
        pipeline_name='parking_api',
        destination='snowflake',
        dataset_name='staging',
    )

    params = {"q": query, "limit":100}
    load_info = pipeline.run(parking_api_resource(params=params), table_name=table_name)
    print(load_info)

if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    query = "data engineer"
    table_name = "data_field_job_ads"

    run_pipline(query, table_name)