docker run -i -t \
 --name audiolab \
 -v `pwd`/notebooks:/root/audiolab/notebooks \
 -v `pwd`/user-settings:/root/.jupyter/lab/user-settings \
 -p 8888:8888 \
  audiolab:1.0

# docker run -i -t -p 8888:8888 audiolab /bin/bash
# -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir
# /opt/notebooks && /opt/conda/bin/jupyter notebook
# --notebook-dir=/opt/notebooks --ip='*' --port=8888
# --no-browser"