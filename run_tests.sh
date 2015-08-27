#!/bin/bash

set -e

rm -rf diff2*
rm -rf tmpimg*
rm -rf data/test-generated/screenshots/*
rm -rf data/test-generated/pdf/*

source environment.sh

RAILS_ENV=test
bundle install

if [ -z "$1" ]
 then
   cucumber --tags ~@wip --tags ~@removed --tags ~@pdf-off --tags ~@private-indiv-off --tags ~@w3cvalidation
else
   cucumber $@
fi
