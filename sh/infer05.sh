#!/usr/bin/env bash
export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH

DATA=~/project/nist_thulac
TRAIN=$DATA/train/
VALID=$DATA/dev_test/nist06/
TEST=$DATA/dev_test/nist05/

python /home/rjq/project/THUMT_theano_ruan/scripts/test.py \
          --model-file models/model_best.npz \
          --test-src-file ${TEST}nist05.cn \
          --test-trg-file infer/nist05.en.trans \
          --device gpu5
