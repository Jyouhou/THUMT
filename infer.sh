#!/usr/bin/env bash

export PYTHONPATH=/home/rjq/project/THUMT_ruan:$PYTHONPATH

DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/


python /home/rjq/project/THUMT_ruan/thumt/bin/translator.py \
       --model RNNsearch \
       --input ${VALID}nist06.cn \
       --output infer/nist06.en.trans \
       --checkpoints train/eval --vocabulary ${TRAIN}vocab.zh.32k.txt ${TRAIN}vocab.en.32k.txt \
       --parameters=device_list=[5],decode_alpha=1.0