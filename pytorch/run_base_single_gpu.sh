#!/bin/bash

# Examples values
# NAME_NGC=pytorch:20.01-py3
# DATA_PATH=~/deeplearning_benchmark_data/data/data
# GPU=2080

NAME_NGC=$1
DATA_PATH=$2
GPU=$3

CURRENTDATE=`date +"%Y-%m-%d %T"`
LOG_FILE=logs/log_bench_${GPU}.log

mkdir -p logs


printf "\n\n#########################################################################\n"
printf "Starting new AI Benchmark using GPU:${GPU} and NGC:${NAME_NGC}"


echo "############## NEW LOG ################" >> ${LOG_FILE}
echo "# ${CURRENTDATE}" >> ${LOG_FILE}
echo "#######################################" >> ${LOG_FILE}

sudo docker run --gpus '"device=0"' --rm --shm-size=64g \
-v ${DATA_PATH}:/data -v $(pwd)"/scripts":/scripts -v $(pwd)"/results":/results nvcr.io/nvidia/${NAME_NGC} \
/bin/bash -c "cp -r /scripts/* /workspace; ./run_benchmark.sh ${GPU} all" |& tee -a ${LOG_FILE}
