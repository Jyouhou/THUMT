#!/usr/bin/env bash

DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/

python /home/rjq/project/THUMT_theano_ruan/scripts/trainer.py \
#       --config-file /home/rjq/project/THUMT_theano_ruan/config/THUMT.config \
       --config-file THUMT.config \
       --trn-src-file ${TRAIN}train.zh.shuf \
       --trn-trg-file ${TRAIN}train.en.shuf \
       --vld-src-file ${VALID}nist06.cn \
       --vld-trg-file ${VALID}nist06.en0 \
       --device gpu3,gpu4 \
       --debug 1