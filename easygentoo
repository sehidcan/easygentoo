#!/bin/bash

create_swap(){
    swap_file="/swapfile"
    
    if [ -n "$(grep swap /etc/fstab)" ]; then
        echo
        echo "Looks like you already have a swap file/partition."
        echo "Skipping swap creation."
        echo
        sleep 3
    else
        fallocate -l 2G ${swap_file} || error "Create Swap - fallocate"
        chmod 600 ${swap_file}
        mkswap ${swap_file} || error "Create Swap - mkswap"
        swapon ${swap_file} || error "Create Swap - swapon"
        
        echo "${swap_file} none swap sw 0 0" | tee -a /etc/fstab
    fi
}

install_egem_node(){
    cd ${HOME}

    add_repos
    update_system
    essentials
    fw_conf
    livenet_data
    go_egem_install
    start_go_egem
    net_intel_install
    start_net_intel

    echo
    echo "-------------------------------------------------------------------"
    echo "Setup comlete."
    echo "Your node should be listed on https://network.egem.io"
    echo "-------------------------------------------------------------------"
    echo
}

update_egem_node(){
    echo
    pkill screen
    cd ${dir_go_egem}
    make clean || error "Update Node - make clean"
    git pull || error "Update Node - git pull"
    make all || error "Update Node - make all"
    screen -dmS go-egem ${dir_go_egem}/build/bin/egem --datadir ${dir_live_net}/ --maxpeers 100 --rpc || error "Update Node - Go-EGEM start"
}

add_repos(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Adding necessary repositories"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    add-apt-repository main
    add-apt-repository universe
    add-apt-repository restricted
    add-apt-repository multiverse
}

update_system(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Updating current system packages"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    echo "If you see a prompt about 'Grub Configuration', select keeping the currently installed version"
    echo
    echo
    sleep 5
    
    up_sys || error "Install Node - system update"
}

up_sys(){
    apt-get update && apt-get upgrade -y && apt-get -f install
}

essentials(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Installing necessary packages"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    up_ess
    
    echo
    npm install -g pm2 || error "Install Node - pm2"
    echo
    
    echo 'export GOPATH=${HOME}/go' >> ${HOME}/.bashrc
    echo 'export PATH=${PATH}:${GOPATH}/bin' >> ${HOME}/.bashrc
    source ${HOME}/.bashrc
}

up_ess() {
    if [ -n "$(lsb_release -r | grep 18)" ]; then
        apt-get install -y build-essential screen git fail2ban ufw golang nodejs npm || error "Install Node - necessary packages"
    else
        if [ -n "$(which go)" ]; then
            apt-get -y remove golang
            apt-get -y autoremove
        fi
        
        apt-get install -y build-essential screen git fail2ban ufw golang-1.10 nodejs npm || error "Install Node - necessary packages"
        ln -f -S /usr/lib/go-1.10/bin/go /usr/bin/go
    fi
}

fw_conf(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Configuring Firewall"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    ufw default allow outgoing
    ufw default deny incoming
    ufw allow ssh/tcp
    ufw limit ssh/tcp
    ufw allow 8545/tcp
    ufw allow 30666/tcp
    ufw allow 30661/tcp
    ufw logging on
    ufw --force enable
}

livenet_data(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Downloading live network data"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    cd ${HOME}
    rm -rf ${dir_live_net}
    mkdir -p ${dir_live_net}

    cd ${dir_live_net}
    wget --no-check-certificate https://raw.githubusercontent.com/TeamEGEM/EGEM-Bootnodes/master/static-nodes.json || error "Install Node - live network data download"
}

go_egem_install(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Installing Go-Egem"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    cd ${HOME}
    rm -rf ${dir_go_egem}
    git clone https://github.com/TeamEGEM/go-egem.git || error "Install Node - Go-EGEM download"
    cd ${dir_go_egem} && make egem || error "Install Node - Go-EGEM make"
    cd ${HOME}
}

start_go_egem(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Starting Go-Egem"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    screen -dmS go-egem ${dir_go_egem}/build/bin/egem --datadir ${dir_live_net}/ --maxpeers 100 --rpc || error "Install Node - Go-EGEM start"
    
    echo
    echo "Your node is syncronizing with network now. This may take some time."
    echo
    sleep 3
}

net_intel_install(){
    echo
    echo "Installing EGEM Net-Intelligence"
    echo "(necessary for sending statistics to network.egem.io)"
    echo
    sleep 3
    
    rm -rf ${dir_net_intel}
    git clone https://github.com/TeamEGEM/egem-net-intelligence-api.git || error "Install Node - net-intel download"
    
    echo
    echo "What woud you like to name your instance? (Example: TeamEGEM Node East Coast USA):"
    read nodename
    
    echo
    echo "What is your node's contact details? (Example: Twitter:@TeamEGEM):"
    read contactdetails
    
    sed -i '17s/.*/      "INSTANCE_NAME"   : '"'$nodename'"',/' ${dir_net_intel}/app.json
    sed -i '18s/.*/      "CONTACT_DETAILS" : '"'$contactdetails'"',/' ${dir_net_intel}/app.json
    sed "s/'/\"/g" ${dir_net_intel}/app.json
    
    cd ${dir_net_intel} && npm install || error "Install Node - net-intel install"
}

start_net_intel(){
    echo
    echo "-------------------------------------------------------------------"
    echo "Starting EGEM Net-Intelligence"
    echo "-------------------------------------------------------------------"
    echo
    sleep 3
    
    cd ${dir_net_intel}
    pm2 start app.json || error "Install Node - net-intel start"
}

error(){
    echo
    echo "Error. Install failed at this step ->  ${1}"
    echo
    exit 1    
}

dir_net_intel="${HOME}/egem-net-intelligence-api"
dir_live_net="${HOME}/live-net"
dir_go_egem="${HOME}/go-egem"

cd ${HOME}

while true
do
    clear
    echo "===================================================="
    echo "Egem Node Installer v2 (based on BuzzkillB's script)"
    echo "===================================================="
    echo
    echo "1 - Install Egem Node with Swap File (2G size)"
    echo "2 - Install Egem Node without Swap File"
    echo "3 - Update Egem Node"
    echo "q - exit this script"
    echo -e "\n"
    echo -e "Enter your selection: \c"
    read answer
    
    case ${answer} in
    1)
        create_swap && install_egem_node
    ;;
    2)
        install_egem_node
    ;;
    3)
        update_egem_node
    ;;
    q)
        exit
    ;;
    esac
    echo -e "Enter return to continue \c"
    read input
done
