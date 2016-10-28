#
# Clear Linux Sandbox for Clear Containers
#
#
# Running this container
# sudo docker run --privileged -it mcastelino/cc-sandbox
#
# The container needs to run as privileged in order to launch docker clear containers
#
# To run this container
#
# sudo docker run -it -e HTTP_PROXY="xxx" -e HTTPS_PROXY="xxx" --privileged mcastelino/cc-sandbox
#
# To launch containers within this container
#
# 1. Launch the docker daemon
# ./run_dockerd
# 2. Launch a clear container
#  docker run -it debian

FROM clearlinux:latest

MAINTAINER Manohar Castelino "manohar.r.castelino@intel.com"

RUN swupd update -s && \
    swupd update && \
    swupd bundle-add containers-basic

#Run swupd multiple time for now so that we upgrade across format bumps    
RUN swupd update -s && \
    swupd update
    
RUN swupd update -s && \
    swupd update

RUN swupd update -s && \
    swupd update

RUN swupd update -s && \
    swupd update

RUN mkdir -p /var/run/ && \
    mkdir -p /etc/docker/ && \
    mkdir -p /run/opencontainer/containers/

RUN echo "dockerd --add-runtime cor=/usr/bin/cc-oci-runtime --default-runtime=cor --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=vfs &> /tmp/docker.log &" > /run_dockerd && chmod +x /run_dockerd

CMD ["/bin/bash"]
