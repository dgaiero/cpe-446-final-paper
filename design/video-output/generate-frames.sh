#!/bin/bash

mkdir -p noise-identification
mkdir -p noisy-image
mkdir -p post-nr
mkdir -p reference

FRAME_RATE=30

ffmpeg -i "noiseIdentification.avi" -vf fps=$FRAME_RATE "noise-identification\noiseIdentification-%04d.png"
ffmpeg -i "noisyImage.avi" -vf fps=$FRAME_RATE "noisy-image\noisyImage-%04d.png"
ffmpeg -i "postNR.avi" -vf fps=$FRAME_RATE "post-nr\PostNR-%04d.png"
ffmpeg -i "reference.avi" -vf fps=$FRAME_RATE "reference\reference-%04d.png"