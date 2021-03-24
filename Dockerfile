FROM continuumio/miniconda3
MAINTAINER Patrik Lechner <ptrk.lechner@gmail.com>

RUN /opt/conda/bin/conda install -c conda-forge jupyterlab -y --quiet

WORKDIR /root/audiolab
RUN git clone https://github.com/grame-cncm/faust.git

# RUN mkdir /faust
# WORKDIR /faust
# COPY . /faust

# From FAUST: https://github.com/grame-cncm/faust/blob/master-dev/Dockerfile
RUN apt-get update

#
RUN /opt/conda/bin/conda install -c conda-forge nodejs -y --quiet
RUN /opt/conda/bin/conda install -c conda-forge ipywidgets -y --quiet
RUN /opt/conda/bin/conda install cffi numpy scipy matplotlib pandas -y --quiet



RUN \
  apt-get install -y build-essential vim sox llvm libncurses5-dev libncurses5 libmicrohttpd-dev git cmake pkg-config && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/audiolab/faust

RUN \
  make && make install && \
  make clean && \
  apt-get purge -y build-essential llvm libncurses5-dev && apt-get autoremove -y

RUN curl -sLf https://spacevim.org/install.sh | bash

# ENTRYPOINT ["/usr/local/bin/faust"]

# RUN /opt/conda/bin/conda create -n audio python=3.9 -y --quiet
# RUN /opt/conda/bin/conda activate audio
# RUN /opt/conda/bin/conda install ipykernel -y --quiet
# RUN python -m ipykernel install --user --name audio --display-name "Audio"
RUN /opt/conda/bin/conda install -c conda-forge librosa -y --quiet
# RUN RUN /opt/conda/bin/conda install -c conda-forge jupyterlab -y --quiet


WORKDIR /root/audiolab 

RUN git clone https://github.com/hrtlacek/faust_python.git
WORKDIR /root/audiolab/faust_python

RUN python setup.py develop

WORKDIR /root/audiolab/

RUN git clone https://github.com/hrtlacek/faustWidgets.git
ENV PYTHONPATH "${PYTHONPATH}:/root/audiolab/faustWidgets"

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--notebook-dir=/root/audiolab/notebooks"]