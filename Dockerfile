FROM debian:buster
RUN apt-get update && apt-get install -y \
	python3 \
	python3-pip \
	&& rm -rf /var/lib/apt/lists/*
RUN pip3 install jupyterlab
RUN pip3 install -U scikit-learn
RUN pip3 install pandas
RUN pip3 install tensorflow
EXPOSE 8888
WORKDIR /app
RUN mkdir -p /root/.jupyter
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
CMD ["jupyter", "notebook", "--allow-root"]