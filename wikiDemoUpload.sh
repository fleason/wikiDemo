#!/bin/bash
# This script uploads necessary demo files to the demo server
#
#	-p <file>	name of .pem file to be used for scp and ssh
#	-l <loginID>	login of linux server.  Default "cloud"
#	-i <IP>   	public IP address of linux server
#
pem='fleason_me_com.pem'
loginID='cloud'
IP='209.251.181.162'

while getopts 'p:l:i:' flag; do
  case "${flag}" in
    p) pem="${OPTARG}" ;;
    l) loginID="${OPTARG}" ;;
    i) IP="${OPTARG}" ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

sed -e "s/1.1.1.1/$IP/g" diffconfig.patch.in > diffconfig.patch
sed -e "s/1.1.1.1/$IP/g" wikiDemoScript.sh.in > wikiDemoScript.sh
chmod +x wikiDemoScript.sh

# scp -i ${pem} wikiDemoScript.sh index.php diffconfig.patch ${loginID}@${IP}:~/

echo "Now open another Terminal session and log into the demo server with \n"
echo "ssh -i ${pem} ${loginID}@${IP}"

read
