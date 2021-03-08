FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04
ARG PYTHON_VERSION=3.8
ARG WITH_TORCHVISION=1
SHELL [ "/bin/bash", "--login", "-c" ]

# install essential tools
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*

# install conda
ENV CONDA_DIR $HOME/miniconda3
RUN curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p $CONDA_DIR && \
     rm ~/miniconda.sh

ENV PATH=$CONDA_DIR/bin:$PATH
# make conda activate command available from /bin/bash --login shells
RUN echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> ~/.profile
# make conda activate command available from /bin/bash --interative shells
RUN conda init bash

# create a project directory inside user home
ENV PROJECT_DIR $HOME/workspace
RUN mkdir $PROJECT_DIR

# install necessary libraries from conda
RUN conda activate
RUN conda install -y python=$PYTHON_VERSION numpy pandas ipython mkl mkl-include cython jupyter scikit-learn && \
    conda install -y pytorch torchvision cudatoolkit=10.2 -c pytorch && \
    conda install -y -c conda-forge matplotlib && \
    conda clean -ya

WORKDIR $PROJECT_DIR
RUN chmod -R a+w .
