#Property of Not Real Engineering 
#Copyright 2021 Not Real Engineering - All Rights Reserved You may not use, 
#           distribute and modify this code without the written permission 
#           from Not Real Engineering.
############################################################################
##             MOOSE Installation                                         ##
############################################################################

# Start Ubuntu app for windows
$ cd /mnt/c
$ mkdir For_MOOSE
$ cd For_MOOSE

# Install Miniconda
$ curl -L -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
$ export PATH=$HOME/miniconda3/bin:$PATH
$ conda config --add channels conda-forge
$ conda config --add channels idaholab

# Install MOOSE conda packages
$ conda create --name moose moose-libmesh moose-tools
$ conda activate moose

#Error will pop up, then do:
$ conda init bash

#RESTART ubuntu app
$ cd /mnt/c
$ cd For_MOOSE
$ conda activate moose
#(You will have successfully activated the moose environment when you see (moose) prefixed within your prompt)

# Cloning MOOSE from GitHub
$ mkdir projects
$ cd projects
$ git clone https://github.com/idaholab/moose.git
$ cd moose
$ git checkout master

# Compile and test MOOSE
$ cd test
$ make -j 4
$ ./run_tests -j 4

# MOOSE is installed

# Create your application
$ cd ~/projects
$ ./moose/scripts/stork.sh cat

# Compile and test your application
$ cd cat
$ make -j4
$ ./run_tests -j4

# If you want to add modules: Make changes in Makefile in same folder
# And compile again !

# ALL SET TO GO !!!

# Run first example
$ cd /mnt/c
$ cd For_MOOSE
$ mkdir First_example
# copypaste files to this folder
$ conda activate moose
$ ../projects/cat/cat-opt -i ex01.i

#analyze results in paraview 
