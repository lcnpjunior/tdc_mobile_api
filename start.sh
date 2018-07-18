#!/bin/bash

docker build -t tdc-mobile-api .
docker run -it --rm -p 3000:3000 --name tdc-api tdc-service-tests