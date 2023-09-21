FROM jupyter/pyspark-notebook:spark-3.3.0

ENV PATH=${SPARK_HOME}/bin:$PATH

# RUN conda create --name py37 python=3.7 -y 
# RUN conda activate py37
# RUN pip3 install ipykernel
# RUN python3 -m ipykernel install --name py37 --display-name 'py37'
# RUN conda deactivate


COPY pyspark-3.3.0.tar.gz .
COPY delta_spark-2.3.0-py3-none-any.whl .
COPY py4j-0.10.9.5-py2.py3-none-any.whl . 
RUN pip3 install pyspark-3.3.0.tar.gz py4j-0.10.9.5-py2.py3-none-any.whl delta_spark-2.3.0-py3-none-any.whl 


COPY *.jar /usr/local/spark/jars/


# commons-httpclient-3.1.jar
# httpclient-4.5.6.jar
# httpcore-4.4.12.jar
# okhttp-2.7.5.jar
# okhttp-3.12.12.jar