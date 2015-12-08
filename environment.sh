#!/bin/sh
export INCOMING_QUEUE='publish_queue'
export INCOMING_QUEUE_HOSTNAME='amqp://localhost'
export ELASTIC_SEARCH_ENDPOINT='http://localhost:9200'

export POSTGRES_USER='postgres'
export POSTGRES_PASSWORD='password'
export POSTGRES_HOST='172.16.42.43'
export POSTGRES_PORT=5432

export TEST_ENVIRONMENT_WEBSEAL='local'
export WEBSEAL_LOGIN='test'
export WEBSEAL_PASSWORD='test'
