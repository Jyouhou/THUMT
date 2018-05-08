#!/usr/bin/env bash

DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist08/

perl /home/rjq/bin/multi-bleu.perl ${TEST}nist08.en < infer/nist08.en.trans
