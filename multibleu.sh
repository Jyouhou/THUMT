#!/usr/bin/env bash

#!/usr/bin/env bash
DATA=~/project/nist_thulac
VALID=$DATA/dev_test/nist06/

perl /home/rjq/bin/multi-bleu.perl ${VALID}nist06.en0 ${VALID}nist06.en1 ${VALID}nist06.en2 ${VALID}nist06.en3 < validation/iter_18000.trans