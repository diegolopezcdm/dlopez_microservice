#!/bin/bash
docker build -t postgres:dlopez-dev ./postgres/.

docker build -t mongo:dlopez-dev ./mongo/.