import json

# specify the path to your Json configuration file
config_file_path = 'config/config.json'

# load the JSON configuration file
with open(config_file_path, 'r') as config_file:
    config = json.load(config_file)

#print the configuration
Connection_STRING = (config["connectionString"])

##test
