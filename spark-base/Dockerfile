FROM python:3.10-bullseye

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get update -y
RUN apt-get install vim wget unzip ssh openjdk-11-jre python3-pip -y

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64


COPY pyspark-3.3.0.tar.gz .
RUN pip3 --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org install pyspark-3.3.0.tar.gz 


WORKDIR /
ADD spark-3.3.0-bin-hadoop3.tgz .
# RUN tar -xzf spark-3.3.0-bin-hadoop3.tgz
# RUN mv /spark/spark-3.3.0-bin-hadoop3/* .
RUN mv spark-3.3.0-bin-hadoop3 spark
RUN rm -rf spark-3.3.0-bin-hadoop3.tgz spark-3.3.0-bin-hadoop3

RUN pip3 --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org install pandas numpy requests elasticsearch==7.14.1 minio sqlalchemy psycopg clickhouse-connect pyhdfs lxml delta-spark==2.3.0

# 환경변수 등록
ENV SPARK_HOME=/spark
ENV PATH=${SPARK_HOME}/bin:$PATH
ENV PYSPARK_PYTHON=/usr/local/bin/python3

EXPOSE 8080 7077 6066

WORKDIR /spark

COPY *.jar ${SPARK_HOME}/jars/


ENV SPARK_MASTER_PORT=7077 \
SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=${SPARK_HOME}/logs \
SPARK_MASTER_LOG=${SPARK_HOME}/logs/spark-master.out \
SPARK_WORKER_LOG=${SPARK_HOME}/logs/spark-worker.out \
SPARK_WORKER_WEBUI_PORT=8080 \
SPARK_WORKER_PORT=7000 \
SPARK_MASTER="spark://spark-master:7077" \
SPARK_WORKLOAD="master"


RUN mkdir -p $SPARK_LOG_DIR && \
touch $SPARK_MASTER_LOG && \
touch $SPARK_WORKER_LOG && \
ln -sf /dev/stdout $SPARK_MASTER_LOG && \
ln -sf /dev/stdout $SPARK_WORKER_LOG