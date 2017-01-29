#!/usr/bin/python
used=[]
domino=[]

used[0]=1
print "0",
domino[0]="0"
mkdomino(0,1)
print ""
domino[0x100]=domino[0]

for i in range(0,0xff):
  if((i % 16) == 0):
    print " dc.w ",
  print hex(i),
  print ",",

# recursive function doing stuff
def mkdomino(last,level):
  if(level<=0xff):
    domino[level]=hex(last)
    for i in range(last*0x10,last*0x10+0xf):
      if(used[i]==0):
        used[i]=1
        mkdomino(i % 0x10,level+1)
        used[i]=0
      if (founddomino==1):
        return
    # next i
    else: 
      founddomino=1

