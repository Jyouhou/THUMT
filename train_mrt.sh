#!/usr/bin/env bash
export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH

DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/

python /home/rjq/project/THUMT_theano_ruan/scripts/trainer.py \
       --config-file /home/rjq/project/THUMT_theano_ruan/config/THUMT.config \
       --config-file THUMT.config \
       --trn-src-file ${TRAIN}train.zh.shuf \
       --trn-trg-file ${TRAIN}train.en.shuf \
       --vld-src-file ${VALID}nist06.cn \
       --vld-trg-file ${VALID}nist06.en0,${VALID}nist06.en1,${VALID}nist06.en2,${VALID}nist06.en3 \
       --debug 1 \
       --training-criterion 1 \
       --init-model-file model_mle_best.npz \
       --device gpu3 \
