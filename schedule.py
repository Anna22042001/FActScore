from itertools import product
import os

all_subjects = [
    "alpaca-7B","alpaca-13B","alpaca",
    "ChatGPT","dolly-12b","gpt4",
    "InstructGPT", "mpt-7b", "pythia-12b", "stablelm-alpha-7b", "vicuna-7b", "vicuna-13b"

]

all_evaluators = [
    'bloomz',
    'mistral'
]


def schedule(lang):

    input_dir=f"data/labeled/{lang}_instances"

    for evaluator, subject in product(all_evaluators, all_subjects):
        output_dir=f"data/output/{lang}_mistral_generated_facts/all_reasoning_retrieval_{evaluator}"
        os.makedirs(output_dir, exist_ok=True)

        path_input=f"{input_dir}/{subject}.jsonl"
        path_output=f"{output_dir}/{subject}.txt"

        assert os.path.exists(path_input), "File not exists "+ path_input

        cmd = "python3 -m factscore.factscorer " + \
            f" --input_path {path_input} " + \
            f" --model_name retrieval+{evaluator}" + \
            f" --model_dir .cache/factscore" + \
            f" --data_dir .cache/factscore" + \
            f" --cache_dir .cache/factscore" + \
            f" --lang {lang}" + \
            f" --knowledge_source {lang}wiki_150" \
            f" --n_samples 150 > {path_output}\n"
        
        with open('jobs.txt','a') as f:
            f.write(cmd)


if __name__ == "__main__":
    schedule('ar')
    # schedule('es')
    schedule('fr')
    schedule('ru')
    # schedule('hi')
    # schedule('vi')
    
    schedule('vi')

    