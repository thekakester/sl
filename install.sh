#!/bin/bash

#Set where to install sl to
DIR="${HOME}/slinstallation"
echo "INSTALLING TO $DIR"

#Create a temporary folder to unzip contents to
mkdir sl
unzip sl.zip -d sl/

#Create our installation folder
mkdir ${DIR}

#Copy unzipped files to installation folder
cp sl/* ${DIR}

#Clean up the temporary folder we made ealier
rm -r -f sl

#CD into the installation directory and compile sl
cd ${DIR}
make

#Ensure startup scripts exist for bash and tcsh terminals
touch ~/.cshrc
touch ~/.bashrc

#Append a line to load path variables when terminal starts
echo "setenv PATH \${PATH}:${DIR}" >> ~/.cshrc
echo "export PATH=\${PATH}:${DIR}" >> ~/.bashrc

#Re-rerun the script to load path variables
~/.cshrc
~/.bashrc

#Test it!
sl

clear
echo "If you just saw a train, then everything works."
echo "If you did not, try closing this terminal and re-opening it"
echo "If that still didn't work, tell Mitch"
