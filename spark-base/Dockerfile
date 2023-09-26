FROM python:3.10.6-alpine


ENV ENABLE_INIT_DAEMON false
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV BASE_URL=https://archive.apache.org/dist/spark/
ENV SPARK_VERSION=3.3.0
ENV HADOOP_VERSION=3

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /


RUN apk add --no-cache curl bash openjdk-17-jre nss libc6-compat coreutils procps \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      && chmod +x *.sh \
      && wget ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && cd /

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1


ENV SPARK_HOME=/spark
ENV PATH=${SPARK_HOME}/bin:$PATH


COPY pyspark-3.3.0.tar.gz .
COPY delta_spark-2.3.0-py3-none-any.whl .
COPY py4j-0.10.9.5-py2.py3-none-any.whl . 
RUN pip3 install pyspark-3.3.0.tar.gz py4j-0.10.9.5-py2.py3-none-any.whl delta_spark-2.3.0-py3-none-any.whl 


COPY *.jar /spark/jars/





