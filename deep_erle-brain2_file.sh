#!/bin/bash

# This script uses the ImageNet Classification with Deep Convolutional
#  Neural Networks (http://www.cs.toronto.edu/~hinton/absps/imagenet.pdf) implemented and trained at 
# https://github.com/jetpacapp/DeepBeliefSDK to classify objects using a multilayer deep neural network.
# Input images are fetched from the file provided as the first parameter.

# Launched the script from: /root/deep-brain-2
export LD_LIBRARY_PATH="/root/deep-brain-2/DeepBeliefSDK/source":$LD_LIBRARY_PATH
FILE=$1

#FLAGS="-w 640 -h 480 -n -q 5 "
#FLAGS+=" --nopreview "

DeepBeliefSDK/source/jpcnn -i $FILE -n DeepBeliefSDK/networks/jetpac.ntwk -t -m s -d | grep ^0\. | sort -u | tail -3
