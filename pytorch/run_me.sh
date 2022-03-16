#!/bin/bash

NAME_NGC=pytorch:20.01-py3 # for Ampeere GPUs: NAME_NGC=pytorch:20.10-py3
DATA_PATH=~/deeplearning_benchmark_data/data/data
#GPU=2080L2
GPUS=(2080L2 2080L3 2080L3SYN)

for gpu in ${GPUS[*]}; do
     ./run_base_single_gpu.sh "${NAME_NGC}" "${DATA_PATH}" "${gpu}"
done
