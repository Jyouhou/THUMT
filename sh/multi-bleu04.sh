#!/usr/bin/env bash

DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/
TEST=/home/rjq/project/nist_thulac/dev_test/nist04/

perl /home/rjq/bin/multi-bleu.perl ${TEST}nist04.en < infer/nist04.en.trans
