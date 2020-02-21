FROM finrocunofficial/finroc_deps-x11

USER root

RUN apt-get update && apt-get install --no-install-recommends -y kmod xz-utils wget ca-certificates binutils || exit 1 ;     wget https://http.download.nvidia.com/XFree86/Linux-x86_64/430.64/NVIDIA-Linux-x86_64-430.64.run -O /tmp/NVIDIA-installer.run || exit 1 ;     Nvidiaoptions='--accept-license --no-runlevel-check --no-questions --no-backup --ui=none --no-kernel-module --no-nouveau-check' ;     sh /tmp/NVIDIA-installer.run -A | grep -q -- '--install-libglvnd'        && Nvidiaoptions="$Nvidiaoptions --install-libglvnd" ;     sh /tmp/NVIDIA-installer.run -A | grep -q -- '--no-nvidia-modprobe'      && Nvidiaoptions="$Nvidiaoptions --no-nvidia-modprobe" ;     sh /tmp/NVIDIA-installer.run -A | grep -q -- '--no-kernel-module-source' && Nvidiaoptions="$Nvidiaoptions --no-kernel-module-source" ;     sh /tmp/NVIDIA-installer.run $Nvidiaoptions || { echo 'ERROR: Installation of NVIDIA driver failed.' >&2 ; exit 1 ; } ;     rm /tmp/NVIDIA-installer.run

USER finroc_user
