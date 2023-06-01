import requests

url = 'http://169.254.169.254/metadata/instance?api-version=2021-02-01'
headers = {'Metadata': 'true'}

try:
    response = requests.get(url, headers=headers)
    metadata = response.json()
    print(metadata)

    if metadata and 'compute' in metadata and 'azEnvironment' in metadata['compute']:
        az_environment = metadata['compute']['azEnvironment']
        print(f'Value for "azEnvironment": {az_environment}')
    else:
        print('Value for "azEnvironment" not found in instance metadata.')

except requests.exceptions.RequestException as e:
    print(f'Error retrieving instance metadata: {e}')