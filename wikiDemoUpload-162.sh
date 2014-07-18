#!/bin/bash
# This script uploads necessary demo files to the demo server

scp -i fleason_me_com.pem wikiDemoScript-162.sh index.php diffconfig-162.patch cloud@209.251.181.162:~/

echo "Now open another Terminal session and log into the demo server with \n"
echo "ssh -i fleason_me_com.pem cloud@209.251.181.162"

read
