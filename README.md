Steps for reproducing OONF (https://github.com/OLSR/OONF) build [1] in debian 11 docker container.


[1] commit 8397c64ee044ed87cb116b8cc213615aa085c177  # v0.15.1-96 (96 commits after tag 0.15.1)


# Commands

    sudo docker build -t build-oonf .
    DIR=/tmp/oonf-build-share/
    mkdir $DIR
    sudo docker run --detach=false --rm -v $DIR:/oonf/mount build-oonf

All .deb files are now in $DIR of the docker host.
