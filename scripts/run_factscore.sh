#!/bin/bash

INPUTS=(
  "alpaca-13B" "alpaca" "ChatGPT" "dolly-12b" "gpt4"
  "InstructGPT" "mpt-7b" "pythia-12b" "stablelm-alpha-7b" "vicuna-7b" "vicuna-13b"
)
# INPUTS=(
#   "vicuna-13b"
# )

DEVICES="0"
DIR_INPUTS="/home/kimvu/FActScore/data/labeled/en_instances"
FMT_JSON=".jsonl"
FMT_TXT=".txt"

# ##Bloomz-normal
# DIR_OUTPUTS_BLOOMZ="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_bloomz_"
# for input in "${INPUTS[@]}"; do
#     path_input="$DIR_INPUTS/$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"
#     python3 -m factscore.factscorer_test \
#         --input_path "$path_input" \
#         --model_name "retrieval+bloomz" \
#         --model_dir "/home/kimvu/projects/factscore" \
#         --data_dir "/home/kimvu/projects/factscore" \
#         --cache_dir "/home/kimvu/projects/factscore" \
#         --n_samples 150 \
#         --use_atomic_facts > "$path_output"
# done
##Bloomz-Mistral-generated
DIR_OUTPUTS_BLOOMZ="/home/kimvu/FActScore/data/output/en_mistral_generated_facts/all_reasoning_retrieval_bloomz_"
for input in "${INPUTS[@]}"; do
    path_input="$DIR_INPUTS/$input$FMT_JSON"
    path_output="$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"
    python3 -m factscore.factscorer_test \
        --input_path "$path_input" \
        --model_name "retrieval+bloomz" \
        --model_dir "/home/kimvu/projects/factscore" \
        --data_dir "/home/kimvu/projects/factscore" \
        --cache_dir "/home/kimvu/projects/factscore" \
        --n_samples 150 > "$path_output"
done
# INPUTS=(
#   "alpaca-7B" "alpaca-13B" "alpaca" "ChatGPT" "dolly-12b" "gpt4"
#   "InstructGPT" "mpt-7b" "pythia-12b" "stablelm-alpha-7b" "vicuna-7b" "vicuna-13b"
# )
# Mistral
# DIR_OUTPUTS_MISTRAL="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_mistral_npm_"
# for input in "${INPUTS[@]}"; do
#     path_input="$DIR_INPUTS/$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS_MISTRAL$input$FMT_TXT"
#     python3 -m factscore.factscorer \
#         --input_path "$path_input" \
#         --model_name "retrieval+mistral+npm" \
#         --model_dir "/home/kimvu/projects/factscore" \
#         --data_dir "/home/kimvu/projects/factscore" \
#         --cache_dir "/home/kimvu/projects/factscore" \
#         --n_samples 150 \
#         --use_atomic_facts > "$path_output"
# done

# DIR_INPUTS="/home/kimvu/FActScore/data/unlabeled_completed/vi_instances"
# FMT_JSON=".jsonl"
# FMT_TXT=".txt"

# # Bloomz
# DIR_OUTPUTS_BLOOMZ="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_bloomz_vi_"
# for input in "${INPUTS[@]}"; do
#     path_input="$DIR_INPUTS/vi_$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"
#     python3 -m factscore.factscorer_test \
#         --input_path "$path_input" \
#         --model_name "retrieval+bloomz" \
#         --model_dir "/home/kimvu/projects/factscore" \
#         --data_dir "/home/kimvu/projects/factscore" \
#         --cache_dir "/home/kimvu/projects/factscore" \
#         --n_samples 150 \
#         --knowledge_source "viwiki_150" \
#         --use_atomic_facts > "$path_output"
# done


# INPUTS=("alpaca-7B" "alpaca-13B" "alpaca" "ChatGPT" "dolly-12b" "gpt4"
#         "InstructGPT" "mpt-7b" "alpaca-7B" "pythia-12b" "stablelm-alpha-7b" "vicuna-7b" "vicuna-13b")
# # INPUTS=("alpaca-7B")
# # INPUTS=("alpaca-7B.jsonl" "alpaca-13B.jsonl" "alpaca.jsonl" "alpaca-7B.jsonl" "ChatGPT.jsonl" "dolly-12b.jsonl" "gpt4.jsonl"
# #         "InstructGPT.jsonl" "mpt-7b.jsonl" "alpaca-7B.jsonl" "pythia-12b.jsonl" "stablelm-alpha-7b.jsonl" "vicuna-7b.jsonl" "vicuna-13b.jsonl")
# DEVICES="0"
# DIR_INPUTS="/home/kimvu/FActScore/data/unlabeled_completed"
# DIR_OUTPUTS_BLOOMZ="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_bloomz_"
# FMT_JSON=".jsonl"
# FMT_TXT=".txt"

# for input in ${INPUTS[@]}; do
#     path_input="$DIR_INPUTS/$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"  "$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"
#     python3 -m factscore.factscorer_test --input_path "$path_input" --model_name "retrieval+bloomz" --model_dir "/home/kimvu/projects/factscore" --data_dir "/home/kimvu/projects/factscore" --cache_dir "/home/kimvu/projects/factscore" --n_samples 150 --use_atomic_facts > "$path_output"
# done

# DIR_OUTPUTS_MISTRAL="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_mistral_npm_"
# for input in ${INPUTS[@]}; do
#     path_input="$DIR_INPUTS/$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS_MISTRAL$input$FMT_TXT"
#     python3 -m factscore.factscorer --input_path "$path_input" --model_name "retrieval+mistral+npm" --model_dir "/home/kimvu/projects/factscore" --data_dir "/home/kimvu/projects/factscore" --cache_dir "/home/kimvu/projects/factscore" --n_samples 150 --use_atomic_facts > "$path_output"
# done
# INPUTS=("alpaca-7B")
# MODELS=("flan_t5_small" "flan_t5_base" "flan_t5_large" "flan_t5_xl")
# DEVICES="0"
# DIR_INPUTS="/home/kimvu/FActScore/data/unlabeled_completed"
# DIR_OUTPUTS="/home/kimvu/FActScore/data/output/all_reasoning_retrieval_bloomz_"
# FMT_JSON=".jsonl"
# FMT_TXT=".txt"

# for input in "${INPUTS[@]}"; do
#     path_input="$DIR_INPUTS/$input$FMT_JSON"
#     path_output="$DIR_OUTPUTS/$input$FMT_TXT"
#     python3 -m factscore.factscorer_test --input_path "$path_input" --model_name "retrieval+bloomz" --model_dir "/home/kimvu/projects/factscore" --data_dir "/home/kimvu/projects/factscore" --cache_dir "/home/kimvu/projects/factscore" --n_samples 100 --use_atomic_facts > "$path_output"
# done