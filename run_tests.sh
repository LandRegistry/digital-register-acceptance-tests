#!/bin/bash

set -e

rm -rf diff2*
rm -rf tmpimg*
rm -rf sshot*

source ../environment.sh

if [ -f ../environment_acceptance.sh ]
then
    source ../environment_acceptance.sh
fi

RAILS_ENV=test bundle install

if [ -z "$1" ]
 then
   cucumber --tags ~@wip --tags ~@removed --tags ~@performance_test
else
   cucumber $@
fi
