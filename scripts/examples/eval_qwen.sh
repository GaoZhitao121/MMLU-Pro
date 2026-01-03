#!/bin/bash

save_dir="eval_results/"
global_record_file="eval_results/eval_record_collection.csv"
model="/root/codespace/hf_resources/Qwen2.5-7B-Instruct"
selected_subjects="all"
gpu_util=0.8

cd ../../
export CUDA_VISIBLE_DEVICES=3

python evaluate_from_local.py \
                 --selected_subjects $selected_subjects \
                 --save_dir $save_dir \
                 --model $model \
                 --global_record_file $global_record_file \
                 --gpu_util $gpu_util

