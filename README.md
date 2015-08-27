wikiDemo
========

Enterprise Cloud Demo:  Linux, build a wiki server

Download wikiDemo and open in a directory.
mv or cp your .pem file into the directory.

run wikiDemoUpload.sh with the following flags:

#	-s <file>	name of .pem file to be used for scp and ssh
#	-l <loginID>	login of linux server.  Default "cloud"
#	-i <IP>   	public IP address of linux server
#	-p <port>	http port.  Default "80"

This will create wikiDemoScript.sh and diffconfig.patch file in the local directory and upload those plus index.php into your linux server using scp.

There will be a prompt at the end of wikiDemoUpload.sh similar to this:

ssh -i fleason_me_com.pem cloud@209.251.181.162

To make the demo more clear, I recommend opening a separate terminal window (with a different color profile) and use the command above to log into your linux server.  Then execute the wikiDemoScript.sh script (which should be in your home directory.)  

The wikiDemoScript.sh does the following:

	Update apt-get
	Install apache2
	change the default http port if other than 80 and restart apache2
	Install php5 and some tools

Pauses at this point to show that your IP address shows that apache is installed.

Promps to see if you need to update VMware tools.  You may want to do this, even though the tools are up to date.

	Download the wiki software package

Pay attention and enter the full URL.  The package installs some files when it is first opened.

	Patches and moves some files.

Then just opening your IP will get into the wiki.  Text can then be added to the fully functional wiki.
