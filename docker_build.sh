#!/bin/bash

set -e
docker build --rm -t rubyday/ruby:2.1 ruby21_docker_image/
docker build --rm -t rubyday/todo .
