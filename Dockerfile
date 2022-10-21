FROM continuumio/anaconda3:latest
COPY install_root.sh .
RUN /bin/bash install_root.sh
USER jup
COPY install_user.sh /home/jup/
RUN /bin/bash /home/jup/install_user.sh
COPY jupyter_notebook_config.json /home/jup/
EXPOSE 8888
#CMD [ "sh", "-c", "/opt/conda/bin/jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=~/notebooks --config=~/jupyter_notebook_config.json" ]
CMD [ "sh", "-c", "/opt/conda/bin/jupyter notebook --ip='*' --port=8888 --no-browser --notebook-dir=~/notebooks  --NotebookApp.password=${PWHASH}" ]
