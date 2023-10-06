FROM spark-base:3.3.0


ENV SPARK_MASTER_PORT=7077 \
SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=/opt/spark/logs 


RUN mkdir -p $SPARK_LOG_DIR 


RUN pip3 install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org jupyter
EXPOSE 8888 8080

WORKDIR /home/jovyan

CMD ["jupyter","lab","--allow-root","--port=8888","--ip=0.0.0.0","--autoreload"]





