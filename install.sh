#!/bin/bash

set -e

clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[92m'
YELLOW='\e[33m'
ORANGE='\e[93m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
purpal='\033[35m'
echo -e "${ORANGE} "
echo "                         .....'',;;;:::;'.                        ";                                
echo "                          ..,,;::::ldkkdl.                        ";                            
echo "                    ....'',''''',;coxxkkk;                        ";                           
echo "                           .;;::c:;'.....ol;,'.....               ";                             
echo "                       ..',,.          .oOkdodddxxoc,.            ";                             
echo "                      ..              .0d.       .cdOO,           ";                             
echo "                                      c0.           .ldc'         ";                             
echo "                                      ;X;              ..         ";                             
echo "                                       lKd,.                      ";                            
echo "                                        .:xxdoodddxdc;.           ";                             
echo "                                                 .':lxkc:;.       ";                             
echo "                                                      .c;.;.      ";                             
echo "                                                        ;: .      ";                             
echo "                                                         :.       ";                             
echo "                                                          .       ";

echo -e "${BLUE}                                    https://github.com/azhr95/python-antivirus-trojan ${NC}"
echo -e "${RED}                                     [!] This Tool Must Run As ROOT [!]${NC}\n"
echo -e ${CYAN}                "Select Best Option : \n"
echo -e "${WHITE}              [1] Kali Linux / Parrot-Os (apt)"
echo -e "${WHITE}              [2] Arch Linux (pacman)" # added arch linux support because of feature request #231
echo -e "${WHITE}              [0] Exit "
echo -n -e "azhr95 >> "
INSTALL_DIR="/usr/share/doc/pythonantivirus"
BIN_DIR="/usr/bin/"
if [ $choice == 1 ] || [ $choice == 2 ]; then
	echo "[*] Checking Internet Connection .."
    wget -q --tries=10 --timeout=20 --spider https://google.com
	if [[ $? == 0 ]]; then
        echo -e ${BLUE}"[✔] Loading ... "
        if [ $choice == 1 ]; then
        sudo apt-get update -y && apt-get upgrade -y
        sudo apt-get install python3-pip -y
    elif [ $choice == 2 ]; then # added arch linux support because of feature request #231
        sudo pacman -Suy
        sudo pacman -S python-pip yay
        fi

        echo "[+] Checking directories..."
	    if [ -d "$INSTALL_DIR" ]; then
            echo "[!] A Directory pythonantivirus Was Found.. Do You Want To Replace It ? [y/n]:" ;
	        read input
	        if [ "$input" = "y" ]; then
                sudo rm -R "$INSTALL_DIR"
            else
                exit
            fi
        fi

        echo "[+] Installing ...\n";
        sudo git clone https://github.com/azhr95/python-antivirus-trojan "$INSTALL_DIR";
        echo "#!/bin/bash
        python3 $INSTALL_DIR/main.py" '${1+"$@"}' > pythonantivirus;
        sudo chmod +x pythonantivirus;
        sudo cp pythonantivirus /usr/bin/ && rm pythonantivirus;

        echo "\n[+] Trying to installing Requirements .../n"
        if [ $choice == 1 ]; then
            sudo pip3 install lolcat boxes flask requests
            sudo apt-get install -y figlet
        elif [ $choice == 2 ]; then # added arch linux support because of feature request #231
            sudo pip3 install lolcat boxes flask requests
            yay -S boxes --noconfirm
            sudo pacman -S figlet
        fi

    else
		echo -e $RED "Please Check Your Internet Connection ..!!"
	fi

    if [ -d "$INSTALL_DIR" ]; then
        echo "";
        echo "[✔] Successfuly Installed !!! \n\n";
    else
        echo "[✘] Installation Failed !!! [✘]";
        exit