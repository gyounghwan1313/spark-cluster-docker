FROM bde2020/spark-base:3.3.0-hadoop3.3

ENV SPARK_HOME=/spark
ENV PATH=${SPARK_HOME}/bin:$PATH


COPY pyspark-3.3.0.tar.gz .
COPY delta_spark-2.3.0-py3-none-any.whl .
COPY py4j-0.10.9.5-py2.py3-none-any.whl . 
RUN pip3 install pyspark-3.3.0.tar.gz py4j-0.10.9.5-py2.py3-none-any.whl delta_spark-2.3.0-py3-none-any.whl 


COPY *.jar /spark/jars/





