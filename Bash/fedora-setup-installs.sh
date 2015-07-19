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
	  ["vim"]="dnf install vim --assumeyes"
	  ["filezilla"]="dnf install filezilla --assumeyes"
	  ["openjdk"]="dnf install java --assumeyes"
	 )

echo "[ Performing Installs ]"

for k in "${!dnfinstalls[@]}"
do		
	echo "Installing : " $k
	${dnfinstalls[$k]}
done

echo "Getting Developer tools"
dnf groupinstall "Development tools" --assumeyes

echo "[ Updating ]"
dnf update --assumeyes








