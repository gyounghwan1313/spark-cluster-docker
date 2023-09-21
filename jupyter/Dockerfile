FROM jupyter/pyspark-notebook:spark-3.1.2

ENV PATH=${SPARK_HOME}/bin:$PATH

# RUN conda create --name py37 python=3.7 -y 
# RUN conda activate py37
# RUN pip3 install ipykernel
# RUN python3 -m ipykernel install --name py37 --display-name 'py37'
# RUN conda deactivate

COPY pyspark-3.1.2.tar.gz .
COPY delta_spark-1.0.0-py3-none-any.whl .
COPY py4j-0.10.9.7-py2.py3-none-any.whl . 
RUN pip3 install pyspark-3.1.2.tar.gz delta_spark-1.0.0-py3-none-any.whl py4j-0.10.9.7-py2.py3-none-any.whl


COPY *.jar /usr/local/spark/jars/