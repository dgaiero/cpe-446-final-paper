#!/bin/bash

mkdir -p noise-identification
mkdir -p noisy-image
mkdir -p post-nr
mkdir -p reference

FRAME_RATE=10

ffmpeg -i "noiseIdentification.m4v" -vf fps=$FRAME_RATE "noise-identification\noiseIdentification-%04d.png"
ffmpeg -i "noisyImage.m4v" -vf fps=$FRAME_RATE "noisy-image\noisyImage-%04d.png"
ffmpeg -i "postNR.m4v" -vf fps=$FRAME_RATE "post-nr\PostNR-%04d.png"
ffmpeg -i "reference.m4v" -vf fps=$FRAME_RATE "reference\reference-%04d.png"