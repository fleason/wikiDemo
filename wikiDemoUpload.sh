#!/bin/bash
# This script uploads necessary demo files to the demo server
#
#	-s <file>	name of .pem file to be used for scp and ssh
#	-l <loginID>	login of linux server.  Default "cloud"
#	-i <IP>   	public IP address of linux server
#	-p <port>	http port.  Default "80"
#
pem='fleason_terremark_com.pem'
loginID='cloud'
IP='208.39.112.185'
port=''
portstr=''

while getopts 's:l:i:p:' flag; do
  case "${flag}" in
	s) pem="${OPTARG}" ;;
	l) loginID="${OPTARG}" ;;
	i) IP="${OPTARG}" ;;
	p) port="${OPTARG}" ;;
	*) error "Unexpected option ${flag}" ;;
  esac
done

echo $port

case $port in

	''|'80')	portstr='' port='80' ;;
	*)		portstr=":$port" ;;
	esac

echo $port $portstr

sed -e "s/1.1.1.1/$IP$portstr/g" diffconfig.patch.in > diffconfig.patch
sed -e "s/1.1.1.1/$IP$portstr/g" -e "s/PORT/$port/g" wikiDemoScript.sh.in > wikiDemoScript.sh

chmod +x wikiDemoScript.sh

scp -i ${pem} wikiDemoScript.sh index.php diffconfig.patch ${loginID}@${IP}:~/

echo "Now open another Terminal session and log into the demo server with "
echo "ssh -i ${pem} ${loginID}@${IP}"
echo ""
