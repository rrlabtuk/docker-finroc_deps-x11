FROM nkay08/finroc_deps

USER root

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  -o=Dpkg::Use-Pty=0 \
    dbus-x11 procps psmisc \
#    apt-utils x11-utils x11-xserver-utils kmod xz-utils \
#    xdg-utils xdg-user-dirs \
#    mesa-utils mesa-utils-extra libxv1 \
#    menu menu-xdg mime-support desktop-file-utils \
    && rm -rf /var/lib/apt/lists/* 
    
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  -o=Dpkg::Use-Pty=0 \
#    lubuntu-desktop \
    lxde \
    lxlauncher lxmenu-data lxtask \
    policykit-1-gnome \
    && rm -rf /var/lib/apt/lists/* 
    
# OpenGL / MESA
# adds 68 MB to image, disabled
#RUN apt-get install -y mesa-utils mesa-utils-extra libxv1 
    
# GTK 2 and 3 settings for icons and style, wallpaper
RUN echo '\n\
gtk-theme-name="Raleigh"\n\
gtk-icon-theme-name="nuoveXT2"\n\
' > /etc/skel/.gtkrc-2.0 && \
\
mkdir -p /etc/skel/.config/gtk-3.0 && \
echo '\n\
[Settings]\n\
gtk-theme-name="Raleigh"\n\
gtk-icon-theme-name="nuoveXT2"\n\
' > /etc/skel/.config/gtk-3.0/settings.ini && \
\
mkdir -p /etc/skel/.config/pcmanfm/LXDE && \
echo '\n\
[*]\n\
wallpaper_mode=stretch\n\
wallpaper_common=1\n\
wallpaper=/usr/share/lxde/wallpapers/lxde_blue.jpg\n\
' > /etc/skel/.config/pcmanfm/LXDE/desktop-items-0.conf && \
\
mkdir -p /etc/skel/.config/libfm && \
echo '\n\
[config]\n\
quick_exec=1\n\
terminal=lxterminal\n\
' > /etc/skel/.config/libfm/libfm.conf && \
\
mkdir -p /etc/skel/.config/openbox/ && \
echo '<?xml version="1.0" encoding="UTF-8"?>\n\
<theme>\n\
  <name>Clearlooks</name>\n\
</theme>\n\
' > /etc/skel/.config/openbox/lxde-rc.xml && \
\
mkdir -p /etc/skel/.config/ && \
echo '[Added Associations]\n\
text/plain=mousepad.desktop;\n\
' > /etc/skel/.config/mimeapps.list

RUN echo "#! /bin/bash\n\
echo 'x11docker/lxde: If the panel does not show an appropriate menu\n\
  and you encounter high CPU usage (seen with kata-runtime),\n\
  please run with option --init=systemd.\n\
'\n\
startlxde\n\
" >/usr/local/bin/start && chmod +x /usr/local/bin/start

CMD ["/usr/local/bin/start"]

USER finroc_user
