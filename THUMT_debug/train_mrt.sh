#!/usr/bin/env bash
export PYTHONPATH=/home/rjq/project/THUMT_ruan:$PYTHONPATH

DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/


python /home/rjq/project/THUMT_ruan/thumt/bin/trainer.py \
       --input ${TRAIN}train.zh.shuf ${TRAIN}train.en.shuf \
       --vocabulary ${TRAIN}vocab.zh.32k.txt ${TRAIN}vocab.en.32k.txt \
       --model RNNsearch \
       --validation ${VALID}nist06.cn --references ${VALID}nist06.en0 ${VALID}nist06.en1 ${VALID}nist06.en2 ${VALID}nist06.en3 \
       --parameters device_list=[1],train_steps=300000,MRT=True,batch_size=1