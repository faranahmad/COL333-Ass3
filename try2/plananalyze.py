import copy

a= open('problem.plan','r')
linesplan = a.read().split('\n')
# print linesplan

b= open('problem.pddl','r')
linesprob= b.read().split('\n')

def makestateinit():
	t = linesprob[2].split()
	g = t[t.index('-')-1].split('_')
	dimx = int(g[1])
	dimy = int(g[2])
	arr = [[0 for i in xrange(dimy)] for j in xrange(dimx)]
	poscars=[]
	for elem in linesprob:
		if elem[0:11]==" ( position":
			poscars.append(elem.split())
	for elem in poscars:
		elem[2]=int(elem[2].split('_')[1])
		elem[3]=map(int,elem[3].split('_')[1:])
		elem[4]=map(int,elem[4].split('_')[1:])
		if elem[4][1]==elem[3][1]:
			# horizontal car
			for i in xrange(elem[3][0],1+elem[4][0]):
				arr[elem[3][1]-1][i-1]=elem[2]
		else:
			#vertical car
			for i in xrange(elem[3][1],1+elem[4][1]):
				arr[i-1][elem[3][0]-1]=elem[2]
	return arr
	# print poscars
	# for elem in arr:
		# print elem
	# print (dimx,dimy)

def ShowBoard(arr):
	for elem in arr:
		print elem

initstate=makestateinit()
ShowBoard(initstate)

def DoMove(m,gstate):
	#  m is [carid dir len]
	stpos=-1
	endpos=0
	for i in xrange(len(gstate)):
		for j in xrange(len(gstate[i])):
			if m[0] == gstate[i][j]:
				if stpos==-1:
					stpos = [i,j]
				endpos = [i,j]
	if (m[1]=='R' or m[1]=='L'):
		for elem in xrange(stpos[1],endpos[1]+1):
			gstate[stpos[0]][elem]=0
		if (m[1]=='L'):
			stpos[1]-=m[2]
			endpos[1] -=m[2]
		else:
			stpos[1]  +=m[2]
			endpos[1] +=m[2]	
		for elem in xrange(stpos[1],endpos[1]+1):
			gstate[stpos[0]][elem]=m[0]
	else:
		for elem in xrange(stpos[0],endpos[0]+1):
			gstate[elem][stpos[1]]=0
		if(m[1]=='U'):
			stpos[0]  -=m[2]
			endpos[0] -=m[2]
		else:
			stpos[0]  +=m[2]
			endpos[0] +=m[2]	
		for elem in xrange(stpos[0],endpos[0]+1):
			gstate[elem][stpos[1]]=m[0]
	return gstate


def UndoMove(m,gstate):
	#  m is [carid dir len]
	stpos=-1
	endpos=0
	for i in xrange(len(gstate)):
		for j in xrange(len(gstate[i])):
			if m[0] == gstate[i][j]:
				if stpos==-1:
					stpos = [i,j]
				endpos = [i,j]
	if (m[1]=='R' or m[1]=='L'):
		for elem in xrange(stpos[1],endpos[1]+1):
			gstate[stpos[0]][elem]=0
		if (m[1]=='R'):
			stpos[1]-=m[2]
			endpos[1] -=m[2]
		else:
			stpos[1]  +=m[2]
			endpos[1] +=m[2]	
		for elem in xrange(stpos[1],endpos[1]+1):
			gstate[stpos[0]][elem]=m[0]
	else:
		for elem in xrange(stpos[0],endpos[0]+1):
			gstate[elem][stpos[1]]=0
		if(m[1]=='D'):
			stpos[0]  -=m[2]
			endpos[0] -=m[2]
		else:
			stpos[0]  +=m[2]
			endpos[0] +=m[2]	
		for elem in xrange(stpos[0],endpos[0]+1):
			gstate[elem][stpos[1]]=m[0]
	return gstate

def findplanlength(arr):
	for i in xrange(len(arr)):
		if arr[i][0:11]=="Plan length":
			return i
	return -1

def getcarmove(s):
	return s.split()[0:2]

def compressnormal(arr):
	ans=[[arr[0],1]]
	for elem in arr[1:]:
		if getcarmove(elem)==getcarmove(ans[-1][0]):
			ans[-1][1]+=1
		else:
			ans.append([elem,1])
	return ans

def makeform(s):
	direct = s[0][5]
	carno = (s[0].split()[1][2:])
	return  [int(carno), direct.upper() , s[1]] 

ans=[]
for elem in linesplan:
	if (elem=="Solution found!"):
		pos1 = 2+ linesplan.index(elem)
		pos2 = findplanlength(linesplan)
		# print linesplan[pos1:pos2]
		print len(compressnormal(linesplan[pos1:pos2]))
		ans = map(makeform,compressnormal(linesplan[pos1:pos2]))
print ans

def CheckValidMove(M1,gstate):
	stpos=-1
	endpos=0
	for i in xrange(len(gstate)):
		for j in xrange(len(gstate[i])):
			if m[0] == gstate[i][j]:
				if stpos==-1:
					stpos = [i,j]
				endpos = [i,j]
	if (m[1]=='R' or m[1]=='L'):
		if (m[1]=='L'):
			e1 = stpos[1] - m[2]
			for elem in xrange(e1,stpos[1]):
				if (gstate[stpos[0]][elem]>0):
					return False
		else:
			e1 = endpos[1] + m[2]
			for elem in xrange(endpos[1]+1,e1+1):
				if (gstate[stpos[0]][elem]>0):
					return False
	else:
		if(m[1]=='U'):
			e1 = stpos[0] - m[2]
			for elem in xrange(e1,stpos[0]):
				if (gstate[elem][stpos[1]]>0):
					return False
		else:
			e1 = endpos[0] + m[2]
			for elem in xrange(endpos[0]+1,e1+1):
				if (gstate[elem][stpos[1]]>0):
					return False
	return True

def CompressMoves(MoveArr):
	ans=[MoveArr[0]]
	for elem in MoveArr[1:]:
		if elem[0]==ans[-1][0]:
			if elem[1]==ans[-1][1]:
				ans[-1][2]+=1
			# else:
				# ans=ans[:-1]
		else:
			ans.append(elem)
	return ans

def CheckCompressable(Moves):
	l1 = CompressMoves(Moves)
	if len(l1)<len(Moves):
		return [True, l1]
	return [False, Moves]

def SwapMove(i,movearr,gs):
	#gs is till i-1 moves
	m1 = movearr[i]
	m2 = movearr[i+1]
	if CheckValidMove(m2,gs):
		gs = DoMove(m2,gs)
		if CheckValidMove(m1,gs):
			return gs

def SwapReduce(carid,moves,gs):
	movesc = copy.deepcopy(moves)
	grids = copy.deepcopy(gs)
	initpos = -1 
	finpos = -1
	for i in xrange(len(moves)):
		if moves[i][0]==carid:
			if initpos==-1:
				initpos=i
			else:
				finpos = i
				 	


ShowBoard(initstate)
for elem in ans:
	initstate = DoMove(elem,initstate)
	print elem
	# ShowBoard(initstate)