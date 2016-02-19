#!/bin/bash

# This script uses the ImageNet Classification with Deep Convolutional
#  Neural Networks (http://www.cs.toronto.edu/~hinton/absps/imagenet.pdf) implemented and trained at 
# https://github.com/jetpacapp/DeepBeliefSDK to classify objects using a multilayer deep neural network.
# Input images are fetched from the camera included in Erle-Brain 2.

# Launched the script from: /root/deep-brain-2
export LD_LIBRARY_PATH="/root/deep-brain-2/DeepBeliefSDK/source":$LD_LIBRARY_PATH

#FLAGS="-w 640 -h 480 -n -q 5 "
#FLAGS+=" --nopreview "

sudo  raspistill $FLAGS -o cam.jpg
DeepBeliefSDK/source/jpcnn -i cam.jpg -n DeepBeliefSDK/networks/jetpac.ntwk -t -m s -d | grep ^0\. | sort -u | tail -3
sudo rm cam.jpg
