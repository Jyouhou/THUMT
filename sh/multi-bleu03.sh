#!/usr/bin/env bash

DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist03/

perl /home/rjq/bin/multi-bleu.perl ${TEST}nist03.en < infer/nist03.en.trans
