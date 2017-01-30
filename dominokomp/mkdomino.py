#!/usr/bin/python
used=[0]*0x100
domino=[]

# principle:
# search last value in domino
# get it's low nibble
# search for a possible hex number (16 possibilities) using used[]
# put the value into domino
# mark it off in used[]
# repeat

# create function: find level'th piece after last
def mkdomino(level,last):
  #print "level=",level
  for j in range(0,0x100):
    if(level>0xff):
      # this is the end condition. quit the program here (ugly)
      print "Domino table:"
      dtab=""
      kt=""
      j=0
      for de in domino:
        dtab+=kt+hex(de)[2:].zfill(2)
        j+=1
        if(j%16):
          kt=","
        else:
          dtab+="\n"
          kt=""
      print dtab
      quit()
    # print "last=",hex(last)
    # get it's low nibble
    nibble=last % 0x10
    # print "nibble=",nibble
    # search for a possible hex number (16 possibilities) using used[]
    for i in range(0x0,0x10):
      # print "i=",i
      nextval=nibble*0x10+i
      #print "nextval=",hex(nextval)
      if(used[nextval]==0):  # not yet used
        # put the value into domino
        #print "appending",hex(nextval)
        domino.append(nextval)
        # print hex(nextval)
        # mark it off in used[]
        used[nextval]=1    
        # repeat
        mkdomino(level+1,nextval)
        # we come back from recursion
        # if it did not find
        #print "removing",hex(nextval)
        used[nextval]=0
        del domino[-1]
      

mkdomino(0,0)
exit

