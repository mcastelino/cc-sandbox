# cc-sandbox

A containerized environment for Clear Containers 2.0 cc-oci-runtime.  This allows you to try docker with the [cc-oci-runtime] (https://github.com/01org/cc-oci-runtime) within a privileged docker container 

# Building this container

```
git clone https://github.com/mcastelino/cc-sandbox
cd cc-sandbox
sudo docker build --build-arg HTTP_PROXY="your proxy if needed" --build-arg HTTPS_PROXY="your proxy if needed" -t mcastelino/cc-sandbox .
```

## Running this container
```
sudo docker run -it -e HTTP_PROXY="xxx" -e HTTPS_PROXY="yyy" --privileged mcastelino/cc-sandbox
```

The container needs to run as privileged in order to launch docker clear containers. Also the proxy settings, if any; need to be propagated into the container as the docker daemon which runs within the container will need to reach out to the image repositories.

## To launch containers within this container

1. Launch the docker daemon
```
./run_dockerd
```
2. Launch a clear container
```
 docker run -it debian
```
