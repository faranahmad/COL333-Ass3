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
			s = "Grid_"+str(i)+"_"+str(j)
			ans.append(s)
	return ans

def MakeCarObjects(numcars):
	ans=[i+1 for i in xrange(numcars)]
	ans = map (lambda x: "Car_" + str(x),ans)
	return ans

dimx,dimy = map (int, raw_input().split())
ncars = int (raw_input())

allobjects = " ".join(makegridobjects(dimx,dimy) + [" - grid "] +MakeCarObjects(ncars) + [" - car"])
allobjects = "(:objects " + allobjects + ")"
thingstowrite.append(allobjects)


def makeisinbetweenstring(i,j,k,l):
	#Above lies
	return "( neighbourup Grid_"+str(i)+"_"+str(j) + " Grid_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring2(i,j,k,l):
	#Left lies
	return "( neighbourleft Grid_"+str(i)+"_"+str(j) + " Grid_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring3(i,j,k,l):
	#below lies
	return "( belowlies Grid_"+str(i)+"_"+str(j) + " Grid_" + str(k)+"_"+str(l) + " )\n"

def makeisinbetweenstring4(i,j,k,l):
	#right lies
	return "( rightlies Grid_"+str(i)+"_"+str(j) + " Grid_" + str(k)+"_"+str(l) + " )\n"


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
	walls.append("( wallb Grid_"+str(i)+"_"+str(dimx)+")\n")

for i in xrange(1,dimx+1):
	walls.append("( walll Grid_"+str(dimy)+"_"+str(i)+")\n")

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
		carstrings.append("( horizontal Car_"+elem[0] +")\n")
		carstrings.append("( position Car_"+elem[0]+" Grid_"+str(x1)+"_"+str(x2) + ")\n")
		leftsneeded.append(x2)
		for i in xrange(int(elem[1])):
			boolgrids[x1+i][x2]=elem[0]
	else:
		x1 = int(elem[2])
		x2 = int(elem[3])
		upsneeded.append(x1)
		fin = x2 + int(elem[1]) -1
		carstrings.append("( vertical Car_"+elem[0] + ")\n")
		carstrings.append("( position Car_"+elem[0]+" Grid_"+str(x1)+"_"+str(x2) + ")\n")
		for i in xrange(int(elem[1])):
			boolgrids[x1][x2+i]=elem[0]
# print allcars


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
			carstrings.append("( free Grid_"+str(i)+"_"+str(j)+" )\n")
		else:
			carstrings.append("( occupied Car_"+boolgrids[i][j]+" Grid_"+str(i)+"_"+str(j)+" )\n") 

print " ".join(carstrings)

goalstring = ("(:goal ( and ( " )
if allcars[0][4]=='H':
	goalstring += "horizontal Car_1 ) ( position Car_1 Grid_"+goalstate[0]+"_"+goalstate[1] + "))"
else:
	goalstring += "vertical Car_1 ) ( carfrom Car_1 Grid_"+goalstate[0]+"_"+goalstate[1] + "))"

print goalstate
print goalstring
thingstowrite.append("(:init ")
thingstowrite.append(" ".join(carstrings))
thingstowrite.append(" ".join(abovelise))
thingstowrite.append(" ".join(leftlise))
thingstowrite.append(" ".join(walls))
# thingstowrite.append(" ".join(rightlise))
# thingstowrite.append(" ".join(belowlise))
thingstowrite.append(")")
thingstowrite.append((goalstring+")"))


stringtowrite ="\n".join(thingstowrite) + ")"
a = open(filenametogen,'w')
a.write(stringtowrite)
a.close()