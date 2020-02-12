FROM finrocunofficial/finroc_deps

USER root

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  -o=Dpkg::Use-Pty=0 \
    dbus-x11 procps psmisc \
#    apt-utils \
    x11-utils x11-xserver-utils \
#    kmod xz-utils \
    xdg-utils xdg-user-dirs \
#    mesa-utils mesa-utils-extra libxv1 \
#    menu menu-xdg mime-support desktop-file-utils \
    && rm -rf /var/lib/apt/lists/* 
    
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  -o=Dpkg::Use-Pty=0 \
    tilix

CMD ["/usr/bin/tilix"]

USER finroc_user
