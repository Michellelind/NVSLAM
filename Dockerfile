FROM nvidia/cuda:10.1-base

ARG LIB_PATH=/lib
ARG PYTHON_VERSION=3.8
ARG WITH_TORCHVISION=1
SHELL [ "/bin/bash", "--login", "-c" ]

#### Eigen
ARG EIGEN_PATH=$LIB_PATH/eigen


######################################
# SECTION 1: COMMON TOOLS            #
######################################

RUN apt update && apt install -y \
    wget \
    unzip \
    curl \
    bzip2 \
    git \
    g++ \
    make \
    cmake \
    vim \
    pkg-config \
    checkinstall \
    build-essential \
    ca-certificates \
    libjpeg-dev \
    libpng-dev && \
    software-properties-common

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

RUN conda install -y pytorch torchvision -c pytorch

# install requirements
COPY ./requirements.txt /
RUN pip install -r requirements.txt


### Keras
RUN conda activate
RUN conda install -y python=$PYTHON_VERSION numpy pandas ipython mkl mkl-include cython jupyter scikit-learn && \
    conda install -y pytorch torchvision cudatoolkit=10.2 -c pytorch && \
    conda install -y -c conda-forge matplotlib && \
    conda clean -ya
RUN conda install pydot
RUN conda install pydotplus
RUN conda install -c conda-forge xorg-libxrender xorg-libxpm
RUN pip install keras 
RUN pip install tensorflow
RUN pip install opencv-python-headless
RUN pip install git+https://www.github.com/keras-team/keras-contrib.git
RUN pip install imageio

#### CMAKE
RUN echo -e "Install CMake \n\n" && \
    wget https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5-Linux-x86_64.tar.gz && \
    tar -xzvf cmake-3.16.5-Linux-x86_64.tar.gz && \
    cp cmake-3.16.5-Linux-x86_64/bin/cmake /usr/bin/cmake && \
    cp -r cmake-3.16.5-Linux-x86_64/share/* /usr/share && \
    rm cmake-3.16.5-Linux-x86_64.tar.gz && \
    rm -rf cmake-3.16.5-Linux-x86_64

#### Eigen
RUN echo -e "Install Eigen \n\n" && \
    wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.bz2 && \
    bzip2 -d eigen-3.3.9.tar.bz2 && \
    tar -xvf eigen-3.3.9.tar && \
    rm eigen-3.3.9.tar && \
    mv eigen-*/ eigen && \
    mv eigen $EIGEN_PATH && \
    mkdir -p $EIGEN_PATH/build && \
    cd $EIGEN_PATH/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .. && \
    make install && \
    ln -s $EIGEN_PATH /usr/local/include/eigen



WORKDIR /nvslam





