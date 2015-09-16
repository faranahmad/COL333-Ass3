import sys
import os

if not(os.path.isfile(sys.argv[1])):
	print "ERROR: Input File does not exist"
	sys.exit(1)
if not(os.path.isfile(sys.argv[2])):
	print "ERROR: Output File does not exist"
	sys.exit(1)


fp = open(sys.argv[1],"r")
lines = fp.readlines()
fp.close()


car = {}
x = lines[0].strip().split(' ')
m = int(x[0])
n = int(x[1])
occupied = [[0 for x in range(n)] for x in range(m)]
num_cars = int(lines[1].strip())
del lines[0]
del lines[0]
for i in range(num_cars):
    x = lines[i].strip().split(' ')
    car_id = int(x[0])
    car[car_id] = ['','','','']
    car[car_id][0] = int(x[1])
    car[car_id][1] = int(x[2])-1
    car[car_id][2] = int(x[3])-1
    if x[4] is 'V':
        car[car_id][3] = 1
    else:
        car[car_id][3] = 0
    if car[car_id][3]:
        for j in range(car[car_id][0]):
            occupied[car[car_id][1]][car[car_id][2]+j] = 1
    else:
        for j in range(car[car_id][0]):
            occupied[car[car_id][1]+j][car[car_id][2]] = 1
x = lines[num_cars].strip().split(' ')
goal_x = int(x[0])-1
goal_y = int(x[1])-1


fp = open(sys.argv[2],"r")
lines = fp.readlines()
fp.close()

try:
  steps = int(lines[0].strip())
  if(steps == 0):
      if(car[1][1]==goal_x and car[1][2]==goal_y):
          print('Solution is CORRECT')
      else:
          print('ERROR: Wrong Solution')
          sys.exit(1)
  elif(steps == -1):
      print('CORRECT format')
      sys.exit(1)
  for step in range(1,steps+1):
      t = lines[step].strip().split(' ')
      if(len(t)!= 3):
         print('ERROR at step %d: Wrong format'%step)
         sys.exit(1)
      car_id = int(t[0])
      action = t[1]
      moves = int(t[2])
      for i in range(1,moves+1):
          x = car[car_id][1]
          y = car[car_id][2]
          l = car[car_id][0]
          if(car[car_id][3]):
              if(action is 'U'):
                  if(y == 0):
                     print('ERROR at step %d: Car#%d already at the top, cannot move up further'%(step,car_id))
                     sys.exit(1)
                  else:
                     if(occupied[x][y-1]):
                         print('ERROR at step %d: Car#%d cannot move up further'%(step,car_id))
                         sys.exit(1)
                     else:
                         car[car_id][2] = y-1
                         occupied[x][y-1] = 1
                         occupied[x][y+l-1] = 0
              elif (action is 'D'):
                  if(y+l == m):
                     print('ERROR at step %d: Car#%d already at bottom, cannot move down further'%(step,car_id))
                     sys.exit(1)
                  else:
                     if(occupied[x][y+l]):
                         print('ERROR at step %d: Car#%d cannot move down further'%(step,car_id))
                         sys.exit(1)
                     else:
                         car[car_id][2] = y+1
                         occupied[x][y] = 0
                         occupied[x][y+l] = 1
              else:
                  print('ERROR at step %d: Invaild Action- Car#%d is vertical'%(step,car_id))
          else:
              if(action is 'L'):
                  if(x == 0):
                     print('ERROR at step %d: Car#%d already at leftmost end, cannot move left further'%(step,car_id))
                     sys.exit(1)
                  else:
                     if(occupied[x-1][y]):
                         print('ERROR at step %d: Car#%d cannot move left further'%(step,car_id))
                         sys.exit(1)
                     else:
                         car[car_id][1] = x-1
                         occupied[x-1][y] = 1
                         occupied[x+l-1][y] = 0
              elif (action is 'R'):
                  if(x+l == n):
                     print('ERROR at step %d: Car#%d already at rightmost end, cannot move right further'%(step,car_id))
                     sys.exit(1)
                  else:
                     if(occupied[x+l][y]):
                         print('ERROR at step %d: Car#%d cannot move right further'%(step,car_id))
                         sys.exit(1)
                     else:
                         car[car_id][1] = x+1
                         occupied[x][y] = 0
                         occupied[x+l][y] = 1
              else:
                  print('ERROR at step %d: Invaild Action- Car#%d is horizontal'%(step,car_id))
  if(car[1][1]==goal_x and car[1][2]==goal_y):
      print('Solution is CORRECT')
  else:
      print('ERROR: Car did not reach goal')
except:
  print "Please correct format of the output file"
