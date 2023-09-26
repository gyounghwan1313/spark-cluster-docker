FROM python:3.10-bullseye

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get update -y
RUN apt-get install vim wget unzip ssh openjdk-11-jre python3-pip -y

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64


COPY pyspark-3.3.0.tar.gz .
RUN pip3 install pyspark-3.3.0.tar.gz 

# RUN mkdir /opt/hadoop
# WORKDIR /opt/hadoop
# RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz
# COPY hadoop-3.3.3.tar.gz /opt/hadoop/hadoop-3.3.3.tar.gz


WORKDIR /opt/spark
# RUN wget https://archive.apache.org/dist/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.tgz
COPY spark-3.3.0-bin-hadoop3.tgz .

# ADD pyspark-3.3.0.tar.gz .
# RUN pip3 install pyspark-3.3.0.tar.gz


# 폴더 생성 및 하둡 바이너리 파일 다운로드 / 압축 해제
# RUN mkdir /opt/hadoop 
# WORKDIR /opt/hadoop
# RUN tar -xzf hadoop-3.3.3.tar.gz
# RUN rm hadoop-3.3.3.tar.gz

# 환경변수 등록

# ENV HADOOP_HOME=/opt/hadoop/hadoop-3.3.3
# ENV PATH=${HADOOP_HOME}/bin:$PATH

# 폴더 생성 및 하둡 바이너리 파일 다운로드 / 압축 해제
# RUN mkdir /opt/spark 
WORKDIR /opt/spark
RUN tar -xzf spark-3.3.0-bin-hadoop3.tgz

RUN mv /opt/spark/spark-3.3.0-bin-hadoop3/* .
RUN rm -rf spark-3.3.0-bin-hadoop3.tgz spark-3.3.0-bin-hadoop3


# 환경변수 등록
ENV SPARK_HOME=/opt/spark
ENV PATH=${SPARK_HOME}/bin:$PATH
ENV PYSPARK_PYTHON=/usr/bin/python3

ENV SPARK_MASTER_PORT=7077 \
SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=/opt/spark/logs \
SPARK_MASTER_LOG=/opt/spark/logs/spark-master.out \
SPARK_WORKER_LOG=/opt/spark/logs/spark-worker.out \
SPARK_WORKER_WEBUI_PORT=8080 \
SPARK_WORKER_PORT=7000 \
SPARK_MASTER="spark://spark-master:7077" \
SPARK_WORKLOAD="master"


RUN mkdir -p $SPARK_LOG_DIR && \
touch $SPARK_MASTER_LOG && \
touch $SPARK_WORKER_LOG && \
ln -sf /dev/stdout $SPARK_MASTER_LOG && \
ln -sf /dev/stdout $SPARK_WORKER_LOG


EXPOSE 8080 7077 6066

WORKDIR /opt/spark

# -------

# COPY *.jar /spark/jars/





