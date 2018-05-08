#!/usr/bin/env bash

DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist02/

perl /home/rjq/bin/multi-bleu.perl ${TEST}nist02.en  < infer/nist02.en.trans
