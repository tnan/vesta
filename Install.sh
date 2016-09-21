#!/bin/bash
# Made by Steven Sullivan
# Copyright Steven Sullivan Ltd
# Version: 1.0

if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

echo "Let's start..."

# Let's install CSF!
function InstallCSF()
{
	echo "Install CSF..."
	
	cd /usr/src
	rm -fv csf.tgz
	wget https://download.configserver.com/csf.tgz
	tar -xzf csf.tgz
	cd csf
	sh install.sh
}

# Let's install the Vesta / CSF script
function InstallVestaCPBashScript()
{
	echo "Install VestaCP Script..."
	
	cd /tmp
	wget -O /usr/local/vesta/bin/v-csf http://vestacp.ss88.uk/Install_CSF_on_VestaCP/v-csf.txt
	chmod 770 /usr/local/vesta/bin/v-csf
}

# Let's install the CSF Vesta UI!
function InstallVestaCPFrontEnd()
{
	echo "Install VestaCP Front..."
	
	cd /tmp
	mkdir /usr/local/vesta/web/list/csf
	wget http://vestacp.ss88.uk/Install_CSF_on_VestaCP/csf.zip
	unzip /tmp/csf.zip -d /usr/local/vesta/web/list/
	rm -f /tmp/csf.zip
	
	# Update the panel.html file
	wget -O /usr/local/vesta/web/templates/admin/panel.html http://vestacp.ss88.uk/Install_CSF_on_VestaCP/panel.html
}

InstallCSF
InstallVestaCPBashScript
InstallVestaCPFrontEnd
