all: st1 st2 st3
	#src/translate/translate.py domain.pddl problem.pddl
	#src/preprocess/preprocess < output.sas
	#src/fast-downward.py output --search "astar(lmcut())" > problem.plan

st1: 
	src/translate/translate.py problem-domain.pddl problem.pddl

st2:
	src/preprocess/preprocess < output.sas

st3:
	src/fast-downward.py output --search "astar(lmcut())" > problem.plan

clean:
	rm -rf output output.sas problem.plan sas_plan problem.out
