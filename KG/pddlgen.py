filenamedomain = "problem-domain.pddl"

filenametogen = "problem.pddl"

thingstowrite=[]
thingstowrite.append("(define (problem test1)")
thingstowrite.append("	(:domain kartikeya-faran)")

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
	return "( isinbetween Grid_"+str(i)+"_"+str(j) + " Grid_" + str(k)+"_"+str(j) + " Grid_"+ str(l) + "_" + str(j) + " )"

def makeisinbetweenstring2(i,j,k,l):
	return "( isinbetween Grid_"+str(i)+"_"+str(j) + " Grid_" + str(i)+"_"+str(k) + " Grid_"+ str(i) + "_" + str(l) + " )"

def makesamelengthrow(p,length):
	ans =[]
	for i in xrange(1,dimy-length+2):
		for j in xrange (1,dimy-length+2):
			if not(i==j):
				ans.append("( samelength Grid_"+ str(i)+"_"+str(p)+ " Grid_"+str(i+length-1)+"_"+str(p)+ " Grid_"+str(j)+"_"+str(p)+ " Grid_"+str(j+length-1)+"_"+str(p) +" )")
	return ans

def makesamelengthcol(p,length):
	ans =[]
	for i in xrange(1,dimx-length+2):
		for j in xrange (1,dimx-length+2):
			if not(i==j):
				ans.append("( samelength Grid_"+ str(p)+"_"+str(i)+" Grid_"+ str(p)+ "_" + str(i+length-1)+ " Grid_"+str(p)+"_"+str(j)+" Grid_"+ str(p)+ "_" + str(j+length-1) +" )")
	return ans

allisinbitween = []
samelength = []
for i in xrange(1,dimy+1):
	for j in xrange(1,dimx+1):
		for k in xrange(i,dimy+1):
			for l in xrange(k, dimy+1):
				allisinbitween.append(makeisinbetweenstring(i,j,k,l))
				allisinbitween.append(makeisinbetweenstring(l,j,k,i))				
		for k in xrange(j,dimx+1):
			for l in xrange(k+1, dimx+1):
				allisinbitween.append(makeisinbetweenstring2(i,j,k,l))
				allisinbitween.append(makeisinbetweenstring2(i,l,k,j))

allcars=[]

for i in xrange(ncars):
	allcars.append(raw_input().split())

goalstate = raw_input().split()

carstrings =[]
for elem in allcars:
	if elem[4]=='H':
		x1 = int(elem[2])
		x2 = int(elem[3])
		fin = x1 + int(elem[1]) -1
		carstrings.append("(horizontal Car_"+elem[0] +")")
		carstrings.append("(carfrom Car_"+elem[0]+" Grid_"+str(x1)+"_"+str(x2)+" Grid_"+str(fin)+"_"+str(x2) +")" )
		samelength += makesamelengthrow(elem[3],int(elem[1]))
	else:
		x1 = int(elem[2])
		x2 = int(elem[3])
		fin = x2 + int(elem[1]) -1
		carstrings.append("( vertical Car_"+elem[0] + ")")
		carstrings.append("( carfrom Car_"+elem[0]+" Grid_"+str(x1)+"_"+str(x2)+" Grid_"+str(x1)+"_"+str(fin) + ")")
		samelength += makesamelengthcol(elem[2],int(elem[1]))
# print allcars
print " ".join(carstrings)

goalstring = ("(:goal ( and ( " )
if allcars[0][4]=='H':
	goalstring += "horizontal Car_1 ) ( carfrom Car_1 Grid_"+goalstate[0]+"_"+goalstate[1]+" Grid_"
	s2 = int(goalstate[0])+int(allcars[0][1]) -1
	goalstring+=str(s2) + "_" + goalstate[1] + "))"
else:
	goalstring += "vertical Car_1 ) ( carfrom Car_1 Grid_"+goalstate[0]+"_"+goalstate[1]+" Grid_" 
	s2 = int(goalstate[1])+int(allcars[0][1]) -1
	goalstring+=str(s2) + "_" + goalstate[1] + "))"

print goalstate
print goalstring
thingstowrite.append("(:init ")
thingstowrite.append(" ".join(allisinbitween))
thingstowrite.append(" ".join(carstrings))
thingstowrite.append(" ".join(samelength))
thingstowrite.append(")")
thingstowrite.append((goalstring+")"))


stringtowrite ="\n".join(thingstowrite) + ")"
a = open(filenametogen,'w')
a.write(stringtowrite)
a.close()