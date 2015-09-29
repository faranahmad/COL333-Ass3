import copy
import sys

n1 = str(sys.argv[1])

filenametogen = n1+".plan"

a= open(filenametogen,'r')

linesplan = a.read().split('\n')
# print linesplan

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
	direct = s[5]
	carno = (s.split()[1][2:])
	# print s
	distance = s.split()[0].split('_')[2]
	print int(carno), direct.upper() , distance

ans=[]
done= False
for elem in linesplan:
	if (elem=="Solution found!"):
		done=True
		pos1 = 2+ linesplan.index(elem)
		pos2 = findplanlength(linesplan)
		# print linesplan[pos1:pos2]
		if pos2==pos1:
			print 0
		else:	
			print len(compressnormal(linesplan[pos1:pos2]))
			map(makeform,linesplan[pos1:pos2])

if not(done):
	print -1
# print ans