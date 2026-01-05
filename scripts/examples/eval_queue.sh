#!/bin/bash

# 1. 定义通用配置
save_dir="eval_results/"
global_record_file="eval_results/eval_record_collection.csv"
selected_subjects="all"
gpu_util=0.9

# 2. 定义待测评的模型路径列表（空格隔开）
models=(
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_32B_KTO_wo_staggered_0103/models/psp_round_1"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_32B_KTO_wo_staggered_0103/models/psp_round_2"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_32B_KTO_wo_staggered_0103/models/psp_round_3"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_32B_KTO_wo_staggered_0103/models/psp_round_4"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_32B_KTO_wo_staggered_0103/models/psp_round_5"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_a_0104/models/psp_round_1"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_a_0104/models/psp_round_2"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_a_0104/models/psp_round_3"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_a_0104/models/psp_round_4"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_a_0104/models/psp_round_5"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_c_0104/models/psp_round_1"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_c_0104/models/psp_round_2"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_c_0104/models/psp_round_3"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_c_0104/models/psp_round_4"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_c_0104/models/psp_round_5"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_q_0104/models/psp_round_1"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_q_0104/models/psp_round_2"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_q_0104/models/psp_round_3"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_q_0104/models/psp_round_4"
    "/root/codespace/gaozhitao/PSP/experiments/Qwen2.5_7B_KTO_staggered_wo_q_0104/models/psp_round_5"
)

# 3. 进入项目根目录执行测评
# 注意：假设此脚本放在 scripts/examples/ 目录下，所以需要 cd ../../
cd ../../
export CUDA_VISIBLE_DEVICES=1

# 4. 循环遍历模型并执行测评
for model_path in "${models[@]}"
do
    echo "------------------------------------------------"
    echo "开始测评模型: $model_path"
    echo "------------------------------------------------"

    python evaluate_from_local.py \
                     --selected_subjects $selected_subjects \
                     --save_dir $save_dir \
                     --model "$model_path" \
                     --global_record_file $global_record_file \
                     --gpu_util $gpu_util

    echo "模型 $model_path 测评完成！"
done

echo "所有模型测评任务已全部结束。"