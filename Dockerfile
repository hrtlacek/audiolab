FROM continuumio/miniconda
MAINTAINER Patrik Lechner <ptrk.lechner@gmail.com>

RUN /opt/conda/bin/conda install -c conda-forge jupyterlab -y --quiet

RUN git clone https://github.com/grame-cncm/faust.git

# RUN mkdir /faust
# WORKDIR /faust
# COPY . /faust

# From FAUST: https://github.com/grame-cncm/faust/blob/master-dev/Dockerfile
RUN apt-get update

#
RUN /opt/conda/bin/conda install -c conda-forge nodejs -y --quiet
RUN /opt/conda/bin/conda install -c conda-forge ipywidgets -y --quiet


RUN \
  apt-get install -y build-essential llvm libncurses5-dev libncurses5 libmicrohttpd-dev git cmake pkg-config && \
  rm -rf /var/lib/apt/lists/*

WORKDIR faust

RUN \
  make && make install && \
  make clean && \
  apt-get purge -y build-essential llvm libncurses5-dev && apt-get autoremove -y

# ENTRYPOINT ["/usr/local/bin/faust"]

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--notebook-dir=/root/audiolab/notebooks"]