#!/bin/bash

docker exec -it jhipstermonitor_elastalert_1 elastalert-test-rule rules/$1
