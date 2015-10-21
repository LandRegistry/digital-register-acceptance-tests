$DIGITAL_REGISTER_URL = ENV.fetch('DIGITAL_REGISTER_URL', 'http://localhost:8003')
$DIGITAL_LOGIN_API = ENV.fetch('DIGITAL_LOGIN_API', 'http://localhost:8005')
$ELASTICSEARCH_HOST = ENV.fetch('ELASTICSEARCH_HOST', 'localhost')
$ELASTICSEARCH_PORT = ENV.fetch('ELASTICSEARCH_PORT', '9200')
$ELASTICSEARCH_UPDATER_PORT = ENV.fetch('ELASTICSEARCH_UPDATER_PORT', '8006')
$ELASTICSEARCH_SLEEP = ENV.fetch('ELASTICSEARCH_SLEEP', 1)
$ELASTIC_SEARCH_ENDPOINT= ENV.fetch('ELASTIC_SEARCH_ENDPOINT', 'http://localhost:9200')
$ELASTICSEARCH_ADDRESSBASE = ENV.fetch('ELASTICSEARCH_ADDRESSBASE', 'address-search-api-index')
$ELASTICSEARCH_POSTCODE_SEARCH = ENV.fetch('ELASTICSEARCH_POSTCODE_SEARCH', 'address_by_postcode')
$QUEUE_WAIT_TIMEOUT = ENV.fetch('QUEUE_WAIT_TIMEOUT', 30.0).to_f
$POSTGRES_HOST = ENV.fetch('POSTGRES_HOST', '172.16.42.43')
$POSTGRES_DB = ENV.fetch('POSTGRES_DB', 'register_data')
$POSTGRES_USER = ENV.fetch('POSTGRES_USER', 'postgres')
$POSTGRES_PASSWORD = ENV.fetch('POSTGRES_PASSWORD', 'password')
$POSTGRES_PORT = ENV.fetch('POSTGRES_PORT', '5432')


$POSTGRES_USERDB_PASSWORD = ENV.fetch('POSTGRES_USERDB_PASSWORD', 'password')
$POSTGRES_USERDB_HOST = ENV.fetch('POSTGRES_USERDB_HOST', 'localhost')
$POSTGRES_USERDB_DB = ENV.fetch('POSTGRES_USERDB_DB', 'user_data')
$POSTGRES_USERDB_USER = ENV.fetch('POSTGRES_USERDB_USER', 'postgres')
$ELASTICSEARCH_UPDATER_HOST = ENV.fetch('ELASTICSEARCH_UPDATER_HOST', 'localhost')

$INCOMING_QUEUE_HOSTNAME = ENV.fetch('INCOMING_QUEUE_HOSTNAME')
$INCOMING_QUEUE = ENV.fetch('INCOMING_QUEUE')
