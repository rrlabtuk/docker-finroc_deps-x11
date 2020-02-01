# docker-finroc_deps-x11
An extension to [https://github.com/finrocunoffical/docker-finroc_deps/blob/master/README.md](https://github.com/finrocunoffical/docker-finroc_deps/blob/master/README.md)

## Prerequisites
- `x11docker` [https://github.com/mviereck/x11docker](https://github.com/mviereck/x11docker)
  - [https://devhub.io/repos/mviereck-x11docker](https://devhub.io/repos/mviereck-x11docker)


## Running
- We suggest to switch to a different TTY ([CTRL]+[ALT]+[F0-F12]) to avoid graphical glitches or interference with your current Desktop
- `x11docker --user=RETAIN -- --volume=/<path>/finroc_user:/home/finroc_user finrocunoffical/finroc_deps-x11`
  - Adjust folder location for mounted volume
  - Add flag `-g` flag to passthrough the graphics card `x11docker -g --user=RETAIN -- --volume=/<path>/finroc_user:/home/finroc_user finrocunoffical/finroc_deps-x11`
    - usually no problems when you use an open source driver
    - for proprietary nvidia drivers you can follow this guide: [https://github.com/mviereck/x11docker/wiki/NVIDIA-driver-support-for-docker-container](https://github.com/mviereck/x11docker/wiki/NVIDIA-driver-support-for-docker-container)
    - BUT avoid putting `apt-get remove -y kmod xz-utils wget ca-certificates binutils ; \
    apt-get autoremove -y ; apt-get clean -y` into the new Dockerfile to avoid uninstalling finroc dependencies
- The image runs a minimal lxde by defaul. if you want a different Desktop environment you need to create a different image based on this.

