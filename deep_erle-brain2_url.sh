#!/bin/bash

# This script uses the ImageNet Classification with Deep Convolutional
#  Neural Networks (http://www.cs.toronto.edu/~hinton/absps/imagenet.pdf) implemented and trained at 
# https://github.com/jetpacapp/DeepBeliefSDK to classify objects using a multilayer deep neural network.
# Input images are fetched from the URL provided as the first parameter.

# Launched the script from: /root/deep-brain-2
export LD_LIBRARY_PATH="/root/deep-brain-2/DeepBeliefSDK/source":$LD_LIBRARY_PATH
URL=$1

#FLAGS="-w 640 -h 480 -n -q 5 "
#FLAGS+=" --nopreview "

wget $URL > image.jpg
# mv $(echo $URL |  grep -o "[a-z_\-]*[0-9_\-]*[a-z_\-]*[0-9_\-]*\.jpg") image.jpg
mv $(echo $URL |  sed 's/.*\/\([^\/]*\..*\)$/\1/g') image.jpg
DeepBeliefSDK/source/jpcnn -i image.jpg -n DeepBeliefSDK/networks/jetpac.ntwk -t -m s -d | grep ^0\. | sort -u | tail -3
rm image.jpg
