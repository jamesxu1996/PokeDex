#!/bin/bash
now=$(date +"%Y-%m-%d_%H-%M")
rspec --format documentation >> ./test-documentation/${now}-test.log