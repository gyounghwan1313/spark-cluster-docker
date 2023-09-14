FROM bde2020/spark-base:3.1.2-hadoop3.2

ENV SPARK_HOME=/spark
ENV PATH=${SPARK_HOME}/bin:$PATH


COPY pyspark-3.1.2.tar.gz .
COPY delta_spark-1.0.0-py3-none-any.whl .
COPY py4j-0.10.9.7-py2.py3-none-any.whl . 
RUN pip3 install pyspark-3.1.2.tar.gz delta_spark-1.0.0-py3-none-any.whl py4j-0.10.9.7-py2.py3-none-any.whl


COPY *.jar /spark/jars/





