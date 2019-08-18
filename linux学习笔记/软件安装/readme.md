# 安装anbox

    wget https://launchpadlibrarian.net/386450337/anbox-modules-dkms_13_all.deb
    sudo dpkg -i anbox-modules-dkms
    sudo dpkg -i anbox-modules-dkms_13_all.deb
    sudo modprobe ashmem_linux
    sudo modprobe binder_linux
    snap install --devmode --beta anbox
