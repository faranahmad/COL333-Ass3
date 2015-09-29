#!/bin/bash
src/translate/translate.py $1-domain.pddl $1.pddl
src/preprocess/preprocess < output.sas
src/fast-downward.py output --search "astar(lmcut())" > $1.plan