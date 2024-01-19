#!/bin/bash
# add "--knowledge_source {db_name} \" when use factscore in non-English (e.g. "--knowledge_source "viwiki_150" \" for Vietnamese) 
# add --use_atomic_facts and replace "$lang\_mistral_generated_facts" with "$lang\_provided_facts" in DIR_OUTPUTS_BLOOMZ 
# when using author provided or translated facts.
INPUTS=(
  "alpaca-7B" "alpaca-13B" "alpaca" "ChatGPT" "dolly-12b" "gpt4"
  "InstructGPT" "mpt-7b" "pythia-12b" "stablelm-alpha-7b" "vicuna-7b" "vicuna-13b"
)

prj=/home/viet_lai/projects/FActScore

lang="ru"
DIR_INPUTS=$prj/data/labeled/${lang}_instances
FMT_JSON=".jsonl"
FMT_TXT=".txt"

# ##Bloomz
DIR_OUTPUTS_BLOOMZ=$prj/data/output/${lang}_mistral_generated_facts/all_reasoning_retrieval_bloomz_

for input in "${INPUTS[@]}"; do
    path_input="$DIR_INPUTS/$input$FMT_JSON"
    path_output="$DIR_OUTPUTS_BLOOMZ$input$FMT_TXT"
    mkdir -p "$DIR_OUTPUTS_BLOOMZ$input"
    python3 -m factscore.factscorer_bloomz \
        --input_path "$path_input" \
        --model_name "retrieval+bloomz" \
        --model_dir $prj/.cache/factscore \
        --data_dir $prj/.cache/factscore \
        --cache_dir $prj/.cache/factscore \
        --lang "$lang" \
	--knowledge_source "${lang}wiki_150" \
        --n_samples 150 > "$path_output"
done

# ## Mistral
## for non_English input, npm is not available, replace "retrieval+mistral+npm" with "retrieval+mistral" 
## and all_reasoning_retrieval_mistral_npm_ with all_reasoning_retrieval_mistral_ in DIR_OUTPUTS_MISTRAL

DIR_OUTPUTS_MISTRAL="$prj/data/output/${lang}_mistral_generated_facts/all_reasoning_retrieval_mistral"
for input in "${INPUTS[@]}"; do
    path_input="$DIR_INPUTS/$input$FMT_JSON"
    path_output="$DIR_OUTPUTS_MISTRAL$input$FMT_TXT"
    mkdir -p $DIR_OUTPUTS_MISTRAL$input
    python3 -m factscore.factscorer \
        --input_path "$path_input" \
        --model_name "retrieval+mistral" \
        --model_dir "$prj/.cache/factscore" \
        --data_dir "$prj/.cache/factscore" \
        --cache_dir "$prj/.cache/factscore" \
        --lang "$lang" \
	--knowledge_source "${lang}wiki_150" \
        --n_samples 150 > "$path_output"
done
