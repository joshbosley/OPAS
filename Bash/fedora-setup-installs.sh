#! /bin/bash
#
#	Requires dnf 
#

declare -A dnfinstalls

dnfinstalls=(
	  ["mc"]="dnf install mc --assumeyes"
	  ["htop"]="dnf install htop --assumeyes" 
	  ["iptraf"]="dnf install iptraf --assumeyes" 
	  ["w3m"]="dnf install w3m --assumeyes"
	  ["nano"]="dnf install nano --assumeyes"
	 )

echo "[ Performing Installs ]"

for k in "${!dnfinstalls[@]}"
do		
	echo "Installing : " $k
	${dnfinstalls[$k]}
done

echo "[ Updating ]"

dnf update --assumeyes


