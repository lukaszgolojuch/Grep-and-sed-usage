#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

onPingOperations(){

echo "Please give me url: "
read strona

echo "Connecting..."
ping -c1 $strona > /dev/null 2>&1

  if [ $? -eq 0 ]
  then 
	echo "${GREEN}Succesful connection ${RESET}"
	echo_ping=$(ping -c1 $strona | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
	echo "Ip adress for $strona: $echo_ping"
  else
	echo "${RED}Ip cannot be found... try again later ${RESET}"
  fi
}

XServer(){
echo "Here is the most important info about your Xserver:"
echo ""
echo $(grep 'Build Operating System' /var/log/Xorg.0.log)
echo $(grep 'Current Operating System' /var/log/Xorg.0.log)
echo $(grep 'Kernel command line' /var/log/Xorg.0.log)
echo $(grep 'Current Operating System' /var/log/Xorg.0.log)
echo $(grep 'Build Date' /var/log/Xorg.0.log)
}

eth0Info(){
echo "Here is the most important info about your eth0:"
echo ""
echo_ifconfig=$(ifconfig | grep 'broadcast')
echo $echo_ifconfig
}

processorInfo(){
echo "Here is the most important info about your processor:"
echo ""
lscpu | grep 'Model name' | head -n1
lscpu | grep 'CPU op-mode' | head -n1
lscpu | grep 'Architecture' | head -n1
lscpu | grep 'CPU MHz' | head -n1
lscpu | grep 'Hypervisor vendor' | head -n1
lscpu | grep 'L1d cache' | head -n1
lscpu | grep 'L1i cache' | head -n1
lscpu | grep 'L2 cache' | head -n1
lscpu | grep 'L3 cache' | head -n1
}

systemInfo(){
echo "Here is the most important info about your operating system:"
echo ""
sysinfo=$(sudo lshw -short | grep 'system')
echo $sysinfo
}

motherboardInfo(){
echo "Here is the most important info about your motherboard:"
echo ""
mtboardinfo=$(sudo lshw -short | grep 'bus')
echo $mtboardinfo
}

compInfo(){
echo "Here is the most important info about your computer:"
echo ""
sudo dmidecode -t system | grep 'Manufacturer' 
sudo dmidecode -t system | grep 'Product Name' 
sudo dmidecode -t system | grep 'Version' 
sudo dmidecode -t system | grep 'Serial Number' 
}

echo "=================================================="
echo "Author: Lukasz Golojuch"
echo "Operating system: Linux"
echo "Version of system: Knoppix 9.1"
echo "Language: bash"
echo "=================================================="
echo "Program description: grep functionality usage"
echo "=================================================="
echo "Hello $USER"
echo ""
echo "Menu"
echo "1. Return IP adress from URL adress"
echo "2. Info about X server"
echo "3. Info about eth0"
echo "4. Info about processor"
echo "5. Info about system"
echo "6. Info about motherboard"
echo "7. Info about computer (serial number, manufacturer etc.)"
echo ""
echo "Twoj wybor:"
read answ

 if [ $answ -eq 1 ]
 then 
	onPingOperations
 elif [ $answ -eq 2 ]
 then
	XServer
 elif [ $answ -eq 3 ]
 then
	eth0Info
 elif [ $answ -eq 4 ]
 then
	processorInfo
 elif [ $answ -eq 5 ]
 then
	systemInfo
 elif [ $answ -eq 6 ]
 then
	motherboardInfo
 elif [ $answ -eq 7 ]
 then
	compInfo
 fi
