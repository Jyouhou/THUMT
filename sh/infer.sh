#!/bin/bash

export PYTHONPATH=/home/rjq/project/THUMT_ruan:$PYTHONPATH

#set -ex
TRAIN=~/project/nist_thulac/train/
VALID=~/project/nist_thulac/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist02/
BLEU=/home/rjq/bin/multi-bleu.perl
REF=/home/rjq/project/nist_thulac/dev_test/nist02//nist02.en
GPU=5

#mkdir infer
for ((i=5000;i<=300000;i++));
 do
   MODEL=train/eval/model.ckpt-${i}
   OUT=infer/nist02.en.trans.iter${i}
   EVAL=infer/nist02.en.trans.eval.iter${i}
   if [ -f ${MODEL}.index ];then
    echo good
    python /home/rjq/project/THUMT_ruan/thumt/bin/translator.py \
       --model RNNsearch \
       --input ${TEST}nist02.cn \
       --output ${OUT} \
       --checkpoints ${MODEL} --vocabulary ${TRAIN}vocab.zh.32k.txt ${TRAIN}vocab.en.32k.txt \
       --parameters=device_list=[${GPU}],decode_alpha=1.0
    perl $BLEU -lc $REF < $OUT > $EVAL
  fi
 done