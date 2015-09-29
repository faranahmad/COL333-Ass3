import sys

n1 = str(sys.argv[1])

# domread= open("kgdomain.txt",'r')
# strdom = domread.read()
# domread.close()

filenamedomain = n1+"-domain.pddl"
thingstowritedom =[]
thingstowritedom.append("(define (domain Far)")
thingstowritedom.append("(:requirements :typing :adl)")
thingstowritedom.append("(:types car grid )")
thingstowritedom.append("(:predicates (free ?x - grid)")
thingstowritedom.append(" (position ?x - car ?y - grid ?z - grid)")
thingstowritedom.append(" (horizontal ?x - car)")
thingstowritedom.append(" (vertical ?x - car)")
thingstowritedom.append(" (neighbourup ?x - grid ?y - grid)")
thingstowritedom.append(" (neighbourleft ?x - grid ?y - grid))")


# domwr = open(filenamedomain,'w')
# domwr.write(strdom)
# domwr.close()

filenametogen = n1+".pddl"

thingstowrite=[]
thingstowrite.append("(define (problem test1)")
thingstowrite.append("	(:domain Far)")

def makegridobjects(m,n):
	# m rows, n columns
	ans=[]
	for i in xrange(1,n+1):
		for j in xrange(1,m+1):
			s = "G_"+str(i)+"_"+str(j)
			ans.append(s)
	return ans

def MakeCarObjects(numcars):
	ans=[i+1 for i in xrange(numcars)]
	ans = map (lambda x: "C_" + str(x),ans)
	return ans

dimx,dimy = map (int, raw_input().split())
ncars = int (raw_input())

allobjects = " ".join(makegridobjects(dimx,dimy) + [" - grid "] +MakeCarObjects(ncars) + [" - car"])
allobjects = "(:objects " + allobjects + ")"
thingstowrite.append(allobjects)

def makeisinbetweenstring(i,j,k,l):
	#Above lies
	return "( neighbourup G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring2(i,j,k,l):
	#Left lies
	return "( neighbourleft G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"


boolgrids = [[0 for i in xrange(1+dimy)] for j in xrange(1+dimx)]

allcars=[]

for i in xrange(ncars):
	allcars.append(raw_input().split())

goalstate = raw_input().split()

upsneeded = []
leftsneeded = []
vcarlengths=[]
hcarlengths=[]

carstrings =[]
for elem in allcars:
	if elem[4]=='H':
		x1 = int(elem[2])
		x2 = int(elem[3])
		fin = x1 + int(elem[1]) -1
		carstrings.append("( horizontal C_"+elem[0] +")\n")
		carstrings.append("( position C_"+elem[0]+" G_"+str(x1)+"_"+str(x2) +" G_"+str(fin) +"_" + str(x2) + " )\n")
		leftsneeded.append(x2)
		hcarlengths.append(int(elem[1]))
		for i in xrange(int(elem[1])):
			#print elem, x1,x2, len(boolgrids), len(boolgrids[0])
			boolgrids[x2][x1+i]=elem[0]
	else:
		x1 = int(elem[2])
		x2 = int(elem[3])
		upsneeded.append(x1)
		fin = x2 + int(elem[1]) -1
		vcarlengths.append(int(elem[1]))
		carstrings.append("( vertical C_"+elem[0] + ")\n")
		carstrings.append("( position C_"+elem[0]+" G_"+str(x1)+"_"+str(x2) +" G_"+str(x1)+"_"+str(fin) + " )\n")
		for i in xrange(int(elem[1])):
			boolgrids[x2+i][x1]=elem[0]
# print allcars


leftsneeded=list(set(leftsneeded))
upsneeded = list(set(upsneeded))

hcarlengths = list(set(hcarlengths))
vcarlengths = list(set(vcarlengths))

def makemovestringvu(dimension,lenmove):
	ans="(:action move_up"+str(dimension)+"_"+str(lenmove)+"\n"
	ans+= ":parameters (?x - car "
	for elem in xrange(0,dimension):
		ans+= "?internal"+str(elem)+" - grid "
	for elem in xrange(0,lenmove):
		ans+= "?external"+str(elem)+" - grid "
	ans+=")\n"
	ans+=":precondition (and \n (vertical ?x) \n"
	ans+=" (position ?x ?internal0 ?internal" + str(dimension-1) +")"
	ans+="\n (neighbourup ?internal0 ?external0)"
	for i in xrange(0,lenmove-1):
		ans+="\n (neighbourup ?external"+ str(i) + " ?external" +str(i+1) + ")"
	for i in xrange(0,dimension-1):
		ans+="\n (neighbourup ?internal"+ str(i+1) + " ?internal" +str(i) + ")"	
	for i in xrange(0,lenmove):
		ans+= "\n (free ?external" +str(i) + ")"
	ans+=")\n"
	ans+=":effect (and "
	for i in xrange(max(0,dimension-lenmove),dimension):
		ans+= "\n (free ?internal" + str(i) +" )"
	for i in xrange(lenmove-1,max(lenmove-dimension-1,-1),-1):
		ans+= "\n (not(free ?external" + str(i) + "))"		
	ans += "\n (not(position ?x ?internal0 ?internal" + str(dimension-1)+ "))"
	ans += "\n (position ?x ?external" + str(lenmove-1)
	ans += " "
	if (lenmove>=dimension):
		ans += "?external"+str(lenmove-dimension) + ")"
	else:
		ans += "?internal"+str(dimension-lenmove-1) + ")"
		
	 # (position ?x ?finals ?finale)"
	ans+=")\n)"
	return ans


def makemovestringvd(dimension,lenmove):
	ans="(:action move_down"+str(dimension)+"_"+str(lenmove)+"\n"
	ans+= ":parameters (?x - car "
	for elem in xrange(0,dimension):
		ans+= "?internal"+str(elem)+" - grid "
	for elem in xrange(0,lenmove):
		ans+= "?external"+str(elem)+" - grid "
	ans+=")\n"
	ans+=":precondition (and \n (vertical ?x) \n"
	ans+=" (position ?x ?internal" + str(dimension-1) +" ?internal0 )"
	ans+="\n (neighbourup ?external0 ?internal0)"
	for i in xrange(0,lenmove-1):
		ans+="\n (neighbourup ?external"+ str(i+1) + " ?external" +str(i) + ")"
	for i in xrange(0,dimension-1):
		ans+="\n (neighbourup ?internal"+ str(i) + " ?internal" +str(i+1) + ")"	
	for i in xrange(0,lenmove):
		ans+= "\n (free ?external" +str(i) + ")"
	ans+=")\n"
	ans+=":effect (and "
	
	for i in xrange(max(0,dimension-lenmove),dimension):
		ans+= "\n (free ?internal" + str(i) +" )"
	for i in xrange(lenmove-1,max(lenmove-dimension-1,-1),-1):
		ans+= "\n (not(free ?external" + str(i) + "))"		
	
	ans += "\n (not(position ?x ?internal" + str(dimension-1)+ " ?internal0 ))"
	ans += "\n (position ?x "
	ans += " "
	if (lenmove>=dimension):
		ans += "?external"+str(lenmove-dimension)
	else:
		ans += "?internal"+str(dimension-lenmove-1)
	ans += " ?external" + str(lenmove-1) + ")"
	 # (position ?x ?finals ?finale)"
	ans+=")\n)"
	return ans


def makemovestringhl(dimension,lenmove):
	ans="(:action move_left"+str(dimension)+"_"+str(lenmove)+"\n"
	ans+= ":parameters (?x - car "
	for elem in xrange(0,dimension):
		ans+= "?internal"+str(elem)+" - grid "
	for elem in xrange(0,lenmove):
		ans+= "?external"+str(elem)+" - grid "
	ans+=")\n"
	ans+=":precondition (and \n (horizontal ?x) \n"
	ans+=" (position ?x ?internal0 ?internal" + str(dimension-1) +")"
	ans+="\n (neighbourleft ?internal0 ?external0)"
	for i in xrange(0,lenmove-1):
		ans+="\n (neighbourleft ?external"+ str(i) + " ?external" +str(i+1) + ")"
	for i in xrange(0,dimension-1):
		ans+="\n (neighbourleft ?internal"+ str(i+1) + " ?internal" +str(i) + ")"	
	for i in xrange(0,lenmove):
		ans+= "\n (free ?external" +str(i) + ")"
	ans+=")\n"
	ans+=":effect (and "
	for i in xrange(max(0,dimension-lenmove),dimension):
		ans+= "\n (free ?internal" + str(i) +" )"
	for i in xrange(lenmove-1,max(lenmove-dimension-1,-1),-1):
		ans+= "\n (not(free ?external" + str(i) + "))"		
	ans += "\n (not(position ?x ?internal0 ?internal" + str(dimension-1)+ "))"
	ans += "\n (position ?x ?external" + str(lenmove-1)
	ans += " "
	if (lenmove>=dimension):
		ans += "?external"+str(lenmove-dimension) + ")"
	else:
		ans += "?internal"+str(dimension-lenmove-1) + ")"
		
	 # (position ?x ?finals ?finale)"
	ans+=")\n)"
	return ans
def makemovestringhr(dimension,lenmove):
	ans="(:action move_right"+str(dimension)+"_"+str(lenmove)+"\n"
	ans+= ":parameters (?x - car "
	for elem in xrange(0,dimension):
		ans+= "?internal"+str(elem)+" - grid "
	for elem in xrange(0,lenmove):
		ans+= "?external"+str(elem)+" - grid "
	ans+=")\n"
	ans+=":precondition (and \n (horizontal ?x) \n"
	ans+=" (position ?x ?internal" + str(dimension-1) +" ?internal0 )"
	ans+="\n (neighbourleft ?external0 ?internal0)"
	for i in xrange(0,lenmove-1):
		ans+="\n (neighbourleft ?external"+ str(i+1) + " ?external" +str(i) + ")"
	for i in xrange(0,dimension-1):
		ans+="\n (neighbourleft ?internal"+ str(i) + " ?internal" +str(i+1) + ")"	
	for i in xrange(0,lenmove):
		ans+= "\n (free ?external" +str(i) + ")"
	ans+=")\n"
	ans+=":effect (and "
	
	for i in xrange(max(0,dimension-lenmove),dimension):
		ans+= "\n (free ?internal" + str(i) +" )"
	for i in xrange(lenmove-1,max(lenmove-dimension-1,-1),-1):
		ans+= "\n (not(free ?external" + str(i) + "))"		
	
	ans += "\n (not(position ?x ?internal" + str(dimension-1)+ " ?internal0 ))"
	ans += "\n (position ?x "
	ans += " "
	if (lenmove>=dimension):
		ans += "?external"+str(lenmove-dimension)
	else:
		ans += "?internal"+str(dimension-lenmove-1)
	ans += " ?external" + str(lenmove-1) + ")"
	 # (position ?x ?finals ?finale)"
	ans+=")\n)"
	return ans

actionu=[]
actiond=[]
actionl=[]
actionr=[]

for elem in vcarlengths:
	for j in xrange(1,1+dimx-elem):
		actionu.append(makemovestringvu(elem,j))
		actiond.append(makemovestringvd(elem,j))

for elem in hcarlengths:
	for j in xrange(1,1+dimy-elem):
		actionl.append(makemovestringhl(elem,j))
		actionr.append(makemovestringhr(elem,j))


abovelise=[]
for i in upsneeded:
	for j in xrange(2,dimx+1):
		abovelise.append(makeisinbetweenstring(i,j,i,j-1))

leftlise=[]
for i in xrange(2,dimy+1):
	for j in leftsneeded:
		leftlise.append(makeisinbetweenstring2(i,j,i-1,j))



for i in xrange(1,1+dimx):
	for j in xrange(1,1+dimy):
		if boolgrids[i][j]==0:
			carstrings.append("( free G_"+str(j)+"_"+str(i)+" )\n")
		# else:
			# carstrings.append("( occupied C_"+boolgrids[i][j]+" G_"+str(i)+"_"+str(j)+" )\n")

# print " ".join(carstrings)

goalstring = ("(:goal ( and ( " )
if allcars[0][4]=='H':
	goalstring += "horizontal C_1 ) ( position C_1 G_"+goalstate[0]+"_"+goalstate[1] +" G_"+str(int(goalstate[0]) + int(allcars[0][1])-1) +"_"+goalstate[1]+ "))"
else:
	goalstring += "vertical C_1 ) ( position C_1 G_"+goalstate[0]+"_"+goalstate[1] +" G_" +goalstate[0]+"_"+str(int(goalstate[1]) + int(allcars[0][1])-1 ) + "))"

# print goalstate
# print goalstring
thingstowrite.append("(:init ")
thingstowrite.append(" ".join(carstrings))
thingstowrite.append(" ".join(abovelise))
# thingstowrite.append(" ".join(distances))
thingstowrite.append(" ".join(leftlise))
# thingstowrite.append(" ".join(walls))
# thingstowrite.append(" ".join(rightlise))
# thingstowrite.append(" ".join(belowlise))
thingstowrite.append(")")
thingstowrite.append((goalstring+")"))


stringtowrite ="\n".join(thingstowrite) + "\n)"
a = open(filenametogen,'w')
a.write(stringtowrite)
a.close()

thingstowritedom.append("\n".join(actionu))
thingstowritedom.append("\n".join(actiond))
thingstowritedom.append("\n".join(actionl))
thingstowritedom.append("\n".join(actionr))

a= open(filenamedomain,'w')
strtowritedome="\n".join(thingstowritedom) +"\n)"
a.write(strtowritedome)
a.close()