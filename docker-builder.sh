
docker build --tag spark-base:3.3.0 ./spark-base
docker build --tag spark-jupyter:3.3.0 ./spark-jupyter


docker build --tag spark-master:3.3.0 ./master
docker build --tag spark-worker:3.3.0 ./worker
