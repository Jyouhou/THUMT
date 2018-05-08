#!/usr/bin/env bash

DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist06/

perl /home/rjq/bin/multi-bleu.perl ${TEST}nist06.en < infer/nist06.en.trans
