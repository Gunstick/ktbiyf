#!/usr/bin/python
used=[0]*256
domino=[None]*257

# recursive function doing stuff
founddomino=0
def mkdomino(last,level):
  global founddomino
  global used
  global domino
  print "Level:",level
  if(level<=0xff):
    # print "Enter..."
    domino[level]=hex(last)
    for i in range(last*0x10,last*0x10+0xf):
      # print "loop ",i
      if(used[i]==0):
        used[i]=1
        mkdomino(i % 0x10,level+1)
        used[i]=0
      if (founddomino==1):
        print "exiting on 1"
        return
    # next i
  else: 
    founddomino=1

used[0]=1
print "0",
domino[0]="0"
mkdomino(0,1)
print ""
domino[0x100]=domino[0]

for i in range(0,0xff):
  if((i % 16) == 0):
    print ""
    print " dc.w ",
  print domino[i],
  print ",",

