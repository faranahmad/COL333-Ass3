filenamedomain = "problem-domain.pddl"

filenametogen = "problem.pddl"

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

distances=[]
for i in xrange(1,ncars+1):
	for j in xrange(1,ncars+1):
		strreq = "(= (distance C_"+str(i) + " C_"+str(j)+" ) "
		if i==j:
			strreq+=" 0 )\n"
		else:
			strreq+=" 1 )\n"
		distances.append(strreq)

def makeisinbetweenstring(i,j,k,l):
	#Above lies
	return "( neighbourup G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring2(i,j,k,l):
	#Left lies
	return "( neighbourleft G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring3(i,j,k,l):
	#below lies
	return "( belowlies G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring4(i,j,k,l):
	#right lies
	return "( rightlies G_"+str(i)+"_"+str(j) + " G_" + str(k)+"_"+str(l) + " )\n"


belowlise=[]
for i in xrange(1,dimy+1):
	for j in xrange(1,dimx):
		belowlise.append(makeisinbetweenstring3(i,j,i,j+1))

rightlise=[]
for i in xrange(1,dimy):
	for j in xrange(1,dimx+1):
		rightlise.append(makeisinbetweenstring4(i,j,i+1,j))

walls=[]

for i in xrange(1,dimy+1):
	walls.append("( wallb G_"+str(i)+"_"+str(dimx)+")\n")

for i in xrange(1,dimx+1):
	walls.append("( walll G_"+str(dimy)+"_"+str(i)+")\n")

boolgrids = [[0 for i in xrange(1+dimy)] for j in xrange(1+dimx)] 

allcars=[]

for i in xrange(ncars):
	allcars.append(raw_input().split())

goalstate = raw_input().split()

upsneeded = []
leftsneeded = []

carstrings =[]
for elem in allcars:
	if elem[4]=='H':
		x1 = int(elem[2])
		x2 = int(elem[3])
		fin = x1 + int(elem[1]) -1
		carstrings.append("( horizontal C_"+elem[0] +")\n")
		carstrings.append("( position C_"+elem[0]+" G_"+str(x1)+"_"+str(x2) +" G_"+str(fin) +"_" + str(x2) + " )\n")
		leftsneeded.append(x2)
		for i in xrange(int(elem[1])):
			boolgrids[x1+i][x2]=elem[0]
	else:
		x1 = int(elem[2])
		x2 = int(elem[3])
		upsneeded.append(x1)
		fin = x2 + int(elem[1]) -1
		carstrings.append("( vertical C_"+elem[0] + ")\n")
		carstrings.append("( position C_"+elem[0]+" G_"+str(x1)+"_"+str(x2) +" G_"+str(x1)+"_"+str(fin) + " )\n")
		for i in xrange(int(elem[1])):
			boolgrids[x1][x2+i]=elem[0]
# print allcars


leftsneeded=list(set(leftsneeded))
upsneeded = list(set(upsneeded))
abovelise=[]
for i in upsneeded:
	for j in xrange(2,dimx+1):
		abovelise.append(makeisinbetweenstring(i,j,i,j-1))

leftlise=[]
for i in xrange(2,dimy+1):
	for j in leftsneeded:
		leftlise.append(makeisinbetweenstring2(i,j,i-1,j))



for i in xrange(1,1+dimy):
	for j in xrange(1,1+dimx):
		if boolgrids[i][j]==0:
			carstrings.append("( free G_"+str(i)+"_"+str(j)+" )\n")
		# else:
			# carstrings.append("( occupied C_"+boolgrids[i][j]+" G_"+str(i)+"_"+str(j)+" )\n") 

# print " ".join(carstrings)

goalstring = ("(:goal ( and ( " )
if allcars[0][4]=='H':
	goalstring += "horizontal C_1 ) ( position C_1 G_"+goalstate[0]+"_"+goalstate[1] +" G_"+str(int(goalstate[0]) + int(allcars[0][1])-1) +"_"+goalstate[1]+ "))"
else:
	goalstring += "vertical C_1 ) ( carfrom C_1 G_"+goalstate[0]+"_"+goalstate[1] +" G_" +goalstate[0]+"_"+str(int(goalstate[1]) + int(allcars[0][1])-1 ) + "))"

# print goalstate
# print goalstring
thingstowrite.append("(:init (= (total-cost) 0) (prevcar C_1) ")
thingstowrite.append(" ".join(carstrings))
thingstowrite.append(" ".join(abovelise))
thingstowrite.append(" ".join(distances))
thingstowrite.append(" ".join(leftlise))
# thingstowrite.append(" ".join(walls))
# thingstowrite.append(" ".join(rightlise))
# thingstowrite.append(" ".join(belowlise))
thingstowrite.append(")")
thingstowrite.append((goalstring+")"))


stringtowrite ="\n".join(thingstowrite) + "\n(:metric minimize (total-cost)))"
a = open(filenametogen,'w')
a.write(stringtowrite)
a.close()