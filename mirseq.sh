#!/bin/bash


samples_folder="/home/karen/data"
file="rnaSeq_samples.txt"
experiments="$samples_folder/$file"
echo $(date)-${sample}:  experiments >>test_Karen_SeqAlig_log.txt
COUNTER=0
date -u


echo $(date)-:  "STARTING RUN OF Download" >>test_Karen_SeqAlig_log.txt
echo pwd  
 ## Get the experiment name
while IFS= read -r experiment; do
  echo $(date)-${sample}:  "Extracting experiment $experiment" >>test_Karen_SeqAlig_log.txt
  experiment_samples="$samples_folder/$experiment.txt"
  mkdir -p $experiment
  
  while IFS= read -r sample_name; do
      echo $(date): "starting $sample_name"
      sudo  docker run -t --rm -v $PWD:/$experiment:rw -w /$experiment ncbi/sra-tools fasterq-dump -e 2 -p $sample_name
      echo $(date): "$sample_name"

  done < $experiment_samples
  
done < $experiments
date -u

