FROM condaforge/mambaforge:latest
ARG MAMBA_USER=jup
ENV MAMBA_USER ${MAMBA_USER}

RUN useradd -m ${MAMBA_USER}
USER ${MAMBA_USER}
WORKDIR /home/${MAMBA_USER}
# Make RUN commands use `bash --login`, so conda init/conda ctivate env will work
SHELL ["/bin/bash", "--login", "-c"]

COPY install_user.sh /tmp/
RUN /tmp/install_user.sh

# Make RUN commands use the new environment:
#SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

COPY jupyter_notebook_config.json .
EXPOSE 8888
#CMD [ "sh", "-c", "/opt/conda/bin/jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=~/notebooks --config=~/jupyter_notebook_config.json" ]
#CMD [ "sh", "-c", "/opt/conda/bin/jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=~/notebooks  --NotebookApp.password=${PWHASH}" ]

#ENTRYPOINT ["mamba", "run", "--no-capture-output", "-p", "./env", "/bin/bash", "-c"]
CMD ["mamba", "run", "--no-capture-output", "-p", "./env", "jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=~/notebooks  --NotebookApp.password=${PWHASH}" ]
#CMD [ "/bin/bash", "-it", "--login"]