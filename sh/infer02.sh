#!/bin/bash

export PYTHONPATH=/home/rjq/project/THUMT_ruan:$PYTHONPATH

#set -ex
DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist02/
BLEU=/home/rjq/bin/multi-bleu.perl
REF=$TEST/nist02.en
DEVICE=1

#mkdir infer
for ((i=0;i<=300000;i++));
 do
   MODEL=train/eval/model.ckpt-${i}
   OUT=infer/nist02.en.trans.iter${i}
   EVAL=infer/nist02.en.trans.eval.iter${i}
   #echo ${MODEL}.index
   if [ -f ${MODEL}.index ];then
    echo good
    python /home/rjq/project/THUMT_ruan/thumt/bin/translator.py \
       --model RNNsearch \
       --input ${TEST}nist02.cn \
       --output ${OUT} \
       --checkpoints ${MODEL} --vocabulary ${TRAIN}vocab.zh.32k.txt ${TRAIN}vocab.en.32k.txt \
       --parameters=device_list=[$DEVICE],decode_alpha=1.0
    echo finish
    perl $BLEU -lc $REF < $OUT > $EVAL
    sed 's/^/on step ${i} :&/g' $EVAL
  fi
 done
