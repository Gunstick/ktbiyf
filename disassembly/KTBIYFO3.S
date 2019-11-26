l00d7 equ zuend+0 
 text 
begin:
      pea       l0000(pc) 
      move.w    #$26,-(a7) 	;supexec
      trap      #$e 
      addq.l    #6,a7 
      clr.w     -(a7) 	;pterm0
      trap      #1
l0000:lea       l001e(pc),a0
      move.l    a7,(a0)+
      lea       l00d4,a7
      move      sr,(a0)+
      move      #$2700,sr 
      move      usp,a1
      move.l    a1,(a0)+
      moveq     #$12,d0 
      bsr       l0010 
      moveq     #$1a,d0 
      bsr       l0010 
      move.l    $408.w,l0019
      move.l    #l001a,$408.w 
      bsr       l0015 
      bsr       l0012 
      bsr.s     l0002 
      bsr       l0006 
      bsr       l000c 
      bsr       l0009 
      bra       l0027 
l0001:lea       l00d4,a7
      bsr       l0009 
      bsr       l0008 
      bsr       l0004 
      moveq     #$14,d0 
      bsr       l0010 
      moveq     #8,d0 
      bsr       l0010 
      lea       l001e(pc),a0
      movea.l   (a0)+,a7
      move      (a0)+,sr
      movea.l   (a0)+,a1
      move      a1,usp
      move.l    l0019(pc),$408.w
      rts 
l0002:lea       l001f(pc),a0
      move.b    $ffff8260.w,(a0)+ 
      move.b    $ffff820a.w,(a0)+ 
      move.l    $ffff8200.w,(a0)+ 
      tst.w     l0023 
      beq.s     l0003 
      move.b    $ffff8209.w,(a0)+ 
      move.b    $ffff820d.w,(a0)+ 
      move.b    $ffff820f.w,(a0)+ 
      move.b    $ffff8265.w,(a0)+ 
l0003:movem.l   $ffff8240.w,d0-d7 
      movem.l   d0-d7,(a0)
      lea       l0020(pc),a0
      move.l    $68.w,(a0)+ 
      move.l    $70.w,(a0)+ 
      move.l    $114.w,(a0)+
      move.l    $118.w,(a0)+
      move.l    $120.w,(a0)+
      move.l    $134.w,(a0)+
      lea       l0021(pc),a0
      move.b    $fffffa07.w,(a0)+ 
      move.b    $fffffa09.w,(a0)+ 
      move.b    $fffffa13.w,(a0)+ 
      move.b    $fffffa15.w,(a0)+ 
      move.b    $fffffa17.w,(a0)+ 
      move.b    $fffffa19.w,(a0)+ 
      move.b    $fffffa1b.w,(a0)+ 
      move.b    $fffffa1d.w,(a0)+ 
      rts 
l0004:lea       l0021(pc),a0
      move.b    (a0)+,$fffffa07.w 
      move.b    (a0)+,$fffffa09.w 
      move.b    (a0)+,$fffffa13.w 
      move.b    (a0)+,$fffffa15.w 
      move.b    (a0)+,$fffffa17.w 
      move.b    (a0)+,$fffffa19.w 
      move.b    (a0)+,$fffffa1b.w 
      move.b    (a0)+,$fffffa1d.w 
      lea       l0020(pc),a0
      move.l    (a0)+,$68.w 
      move.l    (a0)+,$70.w 
      move.l    (a0)+,$114.w
      move.l    (a0)+,$118.w
      move.l    (a0)+,$120.w
      move.l    (a0)+,$134.w
      lea       l001f(pc),a0
      move.b    (a0)+,$ffff8260.w 
      move.b    (a0)+,$ffff820a.w 
      move.l    (a0)+,$ffff8200.w 
      tst.w     l0023 
      beq.s     l0005 
      move.b    (a0)+,$ffff8209.w 
      move.b    (a0)+,$ffff820d.w 
      move.b    (a0)+,$ffff820f.w 
      move.b    (a0)+,$ffff8265.w 
l0005:movem.l   (a0),d0-d7
      movem.l   d0-d7,$ffff8240.w 
      rts 
l0006:movem.l   l0024(pc),d0-d7 
      movem.l   d0-d7,$ffff8240.w 
      bsr       l000d 
      move.b    #0,$ffff8260.w
      move.b    #2,$ffff820a.w
      tst.w     l0023 
      beq.s     l0007 
      clr.b     $ffff8209.w 
      clr.b     $ffff820d.w 
      clr.b     $ffff820f.w 
      clr.b     $ffff8265.w 
l0007:rts 
l0008:move.b    #2,$ffff820a.w
      bsr       l000d 
      move.b    #0,$ffff820a.w
      bsr       l000d 
      move.b    #2,$ffff820a.w
      bsr       l000d 
      rts 
l0009:moveq     #$a,d0
      lea       $ffff8800.w,a0
l000a:move.b    d0,(a0) 
      move.b    #0,2(a0)
      dbf       d0,l000a
      move.b    #7,(a0) 
      move.b    #$7f,2(a0)
      move.b    #$e,(a0)
      move.b    #$26,2(a0)
      tst.w     l0023 
      beq.s     l000b 
      clr.w     $ffff8900.w 
      move.w    #$7ff,$ffff8924.w 
      move.w    #$4e8,$ffff8922.w 
      move.w    #$554,$ffff8922.w 
      move.w    #$514,$ffff8922.w 
      move.w    #$486,$ffff8922.w 
      move.w    #$446,$ffff8922.w 
      move.w    #$401,$ffff8922.w 
l000b:rts 
l000c:move.l    #l001d,$68.w
      move.l    #l001d,$70.w
      move.l    #l001d,$114.w 
      move.l    #l001d,$118.w 
      move.l    #l001d,$120.w 
      move.l    #l001d,$134.w 
      bclr      #3,$fffffa17.w
      clr.b     $fffffa07.w 
      clr.b     $fffffa09.w 
      rts 
l000d:movem.l   a0/d0-d1,-(a7)
      lea       $ffff8209.w,a0
      movep.w   -8(a0),d0 
l000e:tst.b     (a0)
      beq.s     l000e 
l000f:tst.b     (a0)
      bne.s     l000f 
      movep.w   -4(a0),d1 
      cmp.w     d0,d1 
      bne.s     l000f 
      movem.l   (a7)+,a0/d0-d1
      rts 
l0010:lea       $fffffc00.w,a0
l0011:move.b    (a0),d1 
      btst      #1,d1 
      beq.s     l0011 
      move.b    d0,2(a0)
      rts 
l0012:move.b    #0,$fffffa19.w
      move.b    #$ff,$fffffa1f.w
      move.b    #1,$fffffa19.w
      moveq     #$ff,d0 
l0013:dbf       d0,l0013
      moveq     #0,d0 
      move.b    $fffffa1f.w,d0
      move.b    #0,$fffffa19.w
      cmp.w     #$9b,d0 
      ble.s     l0014 
      move.w    #$ffff,l0022
l0014:rts 
l0015:clr.w     l0023 
      rts 
      move.l    a7,l0017
      move.l    8.w,l0018 
      move.l    #l0016,8.w
      tst.w     $ffff8900.l 
      move.w    #$ffff,l0023
l0016:lea       0.l,a7
l0017 equ       *-4 
      move.l    #0,8.w
l0018 equ       *-6 
      rts 
      dc.b      'xbratfsy'
l0019:dcb.w     2,0 
l001a:bsr.s     l001b 
      movea.l   l0019(pc),a0
      jmp       (a0)
l001b:move      #$2700,sr 
      movem.l   l0024(pc),d0-d7 
      movem.l   d0-d7,$ffff8240.w 
      bra       l0001 
l001c:move      sr,-(a7)
      move      #$2700,sr 
      lea       $fffffa00.w,a1
      movep.w   7(a1),d0
      move.w    d0,-(a7)
      movep.l   19(a1),d0 
      move.l    d0,-(a7)
      movep.w   27(a1),d0 
      move.w    d0,-(a7)
      move.l    $68.w,-(a7) 
      move.l    $70.w,-(a7) 
      move.l    $114.w,-(a7)
      move.l    $118.w,-(a7)
      move.l    $120.w,-(a7)
      move.l    $134.w,-(a7)
      lea       l0021(pc),a0
      move.b    (a0)+,$fffffa07.w 
      move.b    (a0)+,$fffffa09.w 
      move.b    (a0)+,$fffffa13.w 
      move.b    (a0)+,$fffffa15.w 
      move.b    (a0)+,$fffffa17.w 
      move.b    (a0)+,$fffffa19.w 
      move.b    (a0)+,$fffffa1b.w 
      move.b    (a0)+,$fffffa1d.w 
      lea       l0020(pc),a0
      move.l    (a0)+,$68.w 
      move.l    (a0)+,$70.w 
      move.l    (a0)+,$114.w
      move.l    (a0)+,$118.w
      move.l    (a0)+,$120.w
      move.l    (a0)+,$134.w
      move      #$2300,sr 
      clr.w     -(a7) 
      pea       (a5)
      move.w    #$3d,-(a7) 	;fopen
      trap      #1
      addq.l    #8,a7 
      tst.w     d0
      bmi       l001b 
      move.w    d0,d7 
      pea       (a6)
      move.l    #$7a120,-(a7) 
      move.w    d7,-(a7)
      move.w    #$3f,-(a7) 	;fread
      trap      #1
      lea       12(a7),a7 
      move.w    d7,-(a7)
      move.w    #$3e,-(a7) 	;fclose 
      trap      #1
      addq.l    #4,a7 
      move      #$2700,sr 
      move.l    (a7)+,$134.w
      move.l    (a7)+,$120.w
      move.l    (a7)+,$118.w
      move.l    (a7)+,$114.w
      move.l    (a7)+,$70.w 
      move.l    (a7)+,$68.w 
      lea       $fffffa00.w,a1
      move.w    (a7)+,d0
      movep.w   d0,27(a1) 
      move.l    (a7)+,d0
      movep.l   d0,19(a1) 
      move.w    (a7)+,d0
      movep.w   d0,7(a1)
      move      (a7)+,sr
      rts 
l001d:dc.b      'ns'
l001e:dcb.w     4,0 
l001f:dcb.w     21,0
l0020:dcb.w     12,0
l0021:dcb.w     5,0 
l0022:dc.b      $00,$00 
l0023:dc.b      $00,$00 
l0024:dcb.w     32,0
l0025:dc.b      '*.xsd',$00 
l0026:dc.b      '*.xmd',$00 
l0027:lea       l00ca,a0
      lea       l00d7,a1
      movem.l   l0024(pc),a2-a6/d1-d7 
l0028:movem.l   a2-a6/d1-d7,(a0)
      movem.l   a2-a6/d1-d7,48(a0)
      movem.l   a2-a6/d1-d7,96(a0)
      lea       144(a0),a0
      cmpa.l    a0,a1 
      bpl.s     l0028 
      move.l    #l00d3,d0 
      add.l     #$ff,d0 
      and.l     #$ffff00,d0 
      move.l    d0,l00d2
      movea.l   d0,a1 
      ror.l     #8,d0 
      lea       $ffff8201.w,a0
      movep.w   d0,0(a0)
      lea       12870(a1),a1
      move.l    a1,l0038
      lea       7360(a1),a1 
      move.l    a1,l0056
      lea       15458(a1),a1
      move.l    a1,l0057
      lea       56(a1),a1 
      move.l    a1,l005d
      movem.l   l00c7,d1-d2 
      movea.l   l0057(pc),a0
      lea       202(a0),a0
      moveq     #7,d0 
l0029:movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      movem.l   d1-d2,-(a0) 
      lea       438(a0),a0
      dbf       d0,l0029
      bsr       l0040 
      jsr       l00c8 
      lea       l00d4,a7
      bsr       l000d 
      lea       l0025(pc),a5
      lea       l00d6,a6
      bsr       l001c 
      lea       l0026(pc),a5
      lea       l00d4,a6
      bsr       l001c 
      lea       l00c0,a0
      movea.l   l00d2,a1
      moveq     #$21,d0 
l002a:movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,80(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,120(a1) 
      lea       160(a1),a1
      dbf       d0,l002a
      pea       (a1)
      lea       l00c1,a0
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,d1-d6 
      movem.l   d1-d6,80(a1)
      lea       204(a1),a1
      moveq     #$13,d0 
l002b:movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,80(a1)
      lea       8(a0),a0
      lea       230(a1),a1
      dbf       d0,l002b
      lea       l00c2,a0
      movea.l   (a7)+,a1
      lea       96(a1),a1 
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,d1-d6 
      movem.l   d1-d6,80(a1)
      lea       228(a1),a1
      moveq     #$13,d0 
l002c:movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,d1-d6 
      movem.l   d1-d6,80(a1)
      lea       230(a1),a1
      dbf       d0,l002c
      lea       -120(a1),a1 
      lea       l00c3,a0
      moveq     #5,d0 
l002d:movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,40(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,80(a1)
      movem.l   (a0)+,a2-a5/d1-d6 
      movem.l   a2-a5/d1-d6,120(a1) 
      lea       160(a1),a1
      dbf       d0,l002d
      move.l    #l00d4,l0069
      move.l    #l00d6,l006a
      move.l    #l00d5,l006b
      move.l    #l00cf,l006c
      move.l    #l00d0,l006d
      move.w    l0023(pc),l006e 
      bsr       l0064 
      move.l    #l0052,$70.w
      tst.w     l0023 
      bne.s     l002e 
      move.l    l0068(pc),$68.w 
      lea       $ffff8800.w,a5
      movea.l   l006c(pc),a6
l002e:move.b    #1,$fffffa07.w
      move.b    #1,$fffffa13.w
      movem.l   l00bf,d0-d7 
      movem.l   d0-d7,$ffff8240.w 
      move      #$2300,sr 
l002f:tst.b     l00d1 
      beq.s     l002f 
      sf        l00d1 
      move.l    l004d(pc),l0058 
      move.l    #l0050,l0059
l0030 equ       *-8 
      move      #$2500,sr 
      bsr       l0066 
      move      #$2100,sr 
      movem.l   l00bf,a0/d0-d6
      movem.l   a0/d0-d6,$ffff8240.w
      bsr.s     l0031 
      bsr       l0065 
      bsr       l0040 
      cmpi.b    #$39,$fffffc02.w
      beq       l001b 
      bra.s     l002f 
l0031:lea       l00cd,a0
      movea.l   a0,a4 
      movea.l   a0,a1 
      moveq     #0,d1 
      moveq     #$16,d0 
l0032:subq.w    #4,(a1)+
      bge.s     l0033 
      move.w    d1,-2(a1) 
l0033:dbf       d0,l0032
      movea.l   l006f(pc),a1
      lea       l003f(pc),a2
      moveq     #0,d2 
      tst.b     21(a1)
      beq.s     l0034 
      sf        21(a1)
      move.w    10(a1),d1 
      move.w    0(a2,d1.w),d1 
      move.b    22(a1),41(a0,d1.w)
l0034:tst.b     45(a1)
      beq.s     l0035 
      sf        45(a1)
      move.w    34(a1),d1 
      move.w    0(a2,d1.w),d1 
      move.b    46(a1),41(a0,d1.w)
l0035:tst.b     69(a1)
      beq.s     l0036 
      sf        69(a1)
      move.w    58(a1),d1 
      move.w    0(a2,d1.w),d1 
      move.b    70(a1),41(a0,d1.w)
l0036:tst.b     93(a1)
      beq.s     l0037 
      sf        93(a1)
      move.w    82(a1),d1 
      move.w    0(a2,d1.w),d1 
      move.b    94(a1),41(a0,d1.w)
l0037:lea       0.l,a0
l0038 equ       *-4 
      moveq     #0,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      move.w    (a4)+,d1
      bsr       l0039 
      move.w    d1,d0 
      rts 
l0039:move      a0,usp
      lea       l003e(pc),a1
      move.w    d0,d2 
      move.w    d1,d3 
      cmp.w     d1,d2 
      bge.s     l003a 
      exg       d3,d2 
l003a:moveq     #0,d5 
      move.w    #$3e,d4 
      sub.w     d2,d4 
      adda.w    0(a1,d4.w),a0 
      add.w     d4,d4 
      neg.w     d4
      lea       -328(a1),a2 
      jmp       0(a2,d4.w)
      move.w    d5,-7360(a0)
      move.w    d5,-7130(a0)
      move.w    d5,-6900(a0)
      move.w    d5,-6670(a0)
      move.w    d5,-6440(a0)
      move.w    d5,-6210(a0)
      move.w    d5,-5980(a0)
      move.w    d5,-5750(a0)
      move.w    d5,-5520(a0)
      move.w    d5,-5290(a0)
      move.w    d5,-5060(a0)
      move.w    d5,-4830(a0)
      move.w    d5,-4600(a0)
      move.w    d5,-4370(a0)
      move.w    d5,-4140(a0)
      move.w    d5,-3910(a0)
      move.w    d5,-3680(a0)
      move.w    d5,-3450(a0)
      move.w    d5,-3220(a0)
      move.w    d5,-2990(a0)
      move.w    d5,-2760(a0)
      move.w    d5,-2530(a0)
      move.w    d5,-2300(a0)
      move.w    d5,-2070(a0)
      move.w    d5,-1840(a0)
      move.w    d5,-1610(a0)
      move.w    d5,-1380(a0)
      move.w    d5,-1150(a0)
      move.w    d5,-920(a0) 
      move.w    d5,-690(a0) 
      move.w    d5,-460(a0) 
      move.w    d5,-230(a0) 
      sub.w     d3,d2 
      move.w    d0,d4 
      sub.w     d1,d4 
      add.w     #$40,d4 
      lea       l00ce,a2
      lsl.w     #5,d4 
      adda.w    d4,a2 
      adda.w    0(a1,d2.w),a0 
      add.w     d2,d2 
      neg.w     d2
      lea       l003b(pc),a3
      jmp       0(a3,d2.w)
      move.w    (a2)+,-7360(a0) 
      move.w    (a2)+,-7130(a0) 
      move.w    (a2)+,-6900(a0) 
      move.w    (a2)+,-6670(a0) 
      move.w    (a2)+,-6440(a0) 
      move.w    (a2)+,-6210(a0) 
      move.w    (a2)+,-5980(a0) 
      move.w    (a2)+,-5750(a0) 
      move.w    (a2)+,-5520(a0) 
      move.w    (a2)+,-5290(a0) 
      move.w    (a2)+,-5060(a0) 
      move.w    (a2)+,-4830(a0) 
      move.w    (a2)+,-4600(a0) 
      move.w    (a2)+,-4370(a0) 
      move.w    (a2)+,-4140(a0) 
      move.w    (a2)+,-3910(a0) 
      move.w    (a2)+,-3680(a0) 
      move.w    (a2)+,-3450(a0) 
      move.w    (a2)+,-3220(a0) 
      move.w    (a2)+,-2990(a0) 
      move.w    (a2)+,-2760(a0) 
      move.w    (a2)+,-2530(a0) 
      move.w    (a2)+,-2300(a0) 
      move.w    (a2)+,-2070(a0) 
      move.w    (a2)+,-1840(a0) 
      move.w    (a2)+,-1610(a0) 
      move.w    (a2)+,-1380(a0) 
      move.w    (a2)+,-1150(a0) 
      move.w    (a2)+,-920(a0)
      move.w    (a2)+,-690(a0)
      move.w    (a2)+,-460(a0)
      move.w    (a2)+,-230(a0)
l003b:moveq     #$ff,d5 
      adda.w    0(a1,d3.w),a0 
      add.w     d3,d3 
      neg.w     d3
      lea       l003c(pc),a2
      jmp       0(a2,d3.w)
      move.w    d5,-7360(a0)
      move.w    d5,-7130(a0)
      move.w    d5,-6900(a0)
      move.w    d5,-6670(a0)
      move.w    d5,-6440(a0)
      move.w    d5,-6210(a0)
      move.w    d5,-5980(a0)
      move.w    d5,-5750(a0)
      move.w    d5,-5520(a0)
      move.w    d5,-5290(a0)
      move.w    d5,-5060(a0)
      move.w    d5,-4830(a0)
      move.w    d5,-4600(a0)
      move.w    d5,-4370(a0)
      move.w    d5,-4140(a0)
      move.w    d5,-3910(a0)
      move.w    d5,-3680(a0)
      move.w    d5,-3450(a0)
      move.w    d5,-3220(a0)
      move.w    d5,-2990(a0)
      move.w    d5,-2760(a0)
      move.w    d5,-2530(a0)
      move.w    d5,-2300(a0)
      move.w    d5,-2070(a0)
      move.w    d5,-1840(a0)
      move.w    d5,-1610(a0)
      move.w    d5,-1380(a0)
      move.w    d5,-1150(a0)
      move.w    d5,-920(a0) 
      move.w    d5,-690(a0) 
      move.w    d5,-460(a0) 
      move.w    d5,-230(a0) 
l003c:move      usp,a0
      adda.w    #2,a0 
l003d equ       *-2 
      moveq     #$10,d0 
      sub.w     l003d(pc),d0
      move.w    d0,-14(a1)
      rts 
l003e:dc.b      $00,$00,$00,$e6,$01,$cc,$02,$b2 
      dc.b      $03,$98,$04,'~',$05,'d',$06,'j' 
      dc.b      $07,'0',$08,$16,$08,$fc,$09,$e2 
      dc.b      $0a,$c8,$0b,$ae,$0c,$94,$0d,'z' 
      dc.b      $0e,'`',$0f,'f',$10,',',$11,$12 
      dc.b      $11,$f8,$12,$de,$13,$c4,$14,$aa 
      dc.b      $15,$90,$16,'v',$17,'\',$18,'b' 
      dc.b      $19,'(',$1a,$0e,$1a,$f4,$1b,$da 
      dcb.w     20,0
l003f:dcb.w     16,0
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe 
      dc.b      $ff,$fe,$ff,$fe,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc 
      dc.b      $ff,$fc,$ff,$fc,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8 
      dc.b      $ff,$f8,$ff,$f8,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6 
      dc.b      $ff,$f6,$ff,$f6,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4 
      dc.b      $ff,$f4,$ff,$f4,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2 
      dc.b      $ff,$f2,$ff,$f2,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee 
      dc.b      $ff,$ee,$ff,$ee,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$de,$ff,$de,$ff,$de,$ff,$de 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc 
      dc.b      $ff,$dc,$ff,$dc,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$da,$ff,$da,$ff,$da,$ff,$da 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
      dc.b      $ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8 
l0040:addi.l    #$1a0,l004d 
      subq.w    #1,l00ca
      bpl.s     l0046 
      moveq     #0,d0 
l0041 equ       *-1 
      beq.s     l0042 
      move.w    #1,l00ca
      sf        l0041 
      move.l    #$49,d0 
      bra.s     l0045 
l0042:st        l0041 
      move.w    #7,l00ca
      lea       l00c4,a0
l0043 equ       *-4 
      moveq     #0,d0 
      move.b    (a0)+,d0
      cmp.b     #$ff,d0 
      bne.s     l0044 
      lea       l00c4,a0
      move.b    (a0)+,d0
l0044:move.l    a0,l0043
l0045:lsl.w     #3,d0 
      subq.l    #1,d0 
      move.l    #l00c5,l0049
      add.l     d0,l0049
l0046:subq.w    #1,l00cb
      bcc.s     l004c 
      move.w    #0,d0 
l0047 equ       *-2 
      move.w    d0,l004a
      add.w     #$10,d0 
      cmp.w     #$1a0,d0
      bne.s     l0048 
      moveq     #0,d0 
l0048:move.w    d0,l0047
      move.w    #$f,l00cb 
      lea       l00cc,a1
      move.l    a1,l004d
      lea       l00c5,a0
l0049 equ       *-4 
      movea.l   a1,a2 
      lea       0(a1,d0.w),a1 
      adda.w    #0,a2 
l004a equ       *-2 
      move.b    (a0)+,d0
      moveq     #7,d2 
l004b:move.w    6240(a2),d1 
      add.b     d0,d0 
      addx.w    d1,d1 
      move.w    d1,(a1)+
      addq.w    #2,a2 
      dbf       d2,l004b
      bra.s     l004f 
l004c:movea.l   l0049(pc),a0
      lea       l00c9,a1
l004d equ       *-4 
      adda.w    l0047(pc),a1
      move.b    (a0)+,d0
      move.w    #7,d2 
l004e:move.w    -416(a1),d1 
      add.b     d0,d0 
      addx.w    d1,d1 
      move.w    d1,(a1)+
      dbf       d2,l004e
l004f:move.l    a0,l0049
      lea       l0050(pc),a2
      move.w    l0047(pc),d0
      lsr.w     #3,d0 
      lea       2(a2,d0.w),a2 
      move.l    a2,l0030
      rts 
l0050:dc.b      $00,$00,$00,$10,$00,' ',$00,'0' 
      dc.b      $00,'@',$00,'p',$00,'`',$00,'p' 
      dc.b      $00,$80,$00,$90,$00,$a0,$00,$b0 
      dc.b      $00,$c0,$00,$d0,$00,$e0,$00,$f0 
      dc.b      $01,$00,$01,$10,$01,' ',$01,'0' 
      dc.b      $01,'@',$01,'p',$01,'`',$01,'p' 
      dc.b      $01,$80,$01,$90,$00,$00,$00,$10 
      dc.b      $00,' ',$00,'0',$00,'@',$00,'p' 
      dc.b      $00,'`',$00,'p',$00,$80,$00,$90 
      dc.b      $00,$a0,$00,$b0,$00,$c0,$00,$d0 
      dc.b      $00,$e0,$00,$f0,$01,$00,$01,$10 
      dc.b      $01,' ',$01,'0',$01,'@',$01,'p' 
      dc.b      $01,'`',$01,'p',$01,$80,$01,$90 
      dc.b      $00,$00 
l0051:clr.b     $fffffa1b.w 
      move.l    #l0053,$120.w 
      move.b    #$21,$fffffa21.w
      move.b    #8,$fffffa1b.w
      rte 
l0052:move.l    #l0051,$70.w
      rte 
l0053:move      #$2700,sr 
      movem.l   a0-a4/d0,-(a7)
      movea.l   l0067(pc),a4
      clr.b     $fffffa1b.w 
      move.l    #l005a,$120.w 
      move.b    #$f,$fffffa21.w 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      lea       $ffff8209.w,a0
l0054:move.b    (a0),d0 
      cmp.b     (a0),d0 
      bne.s     l0054 
      move.b    (a0),d0 
l0055:cmp.b     (a0),d0 
      beq.s     l0055 
      move.b    (a0),d0 
      neg.w     d0
      lsl.w     d0,d0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      lea       0.l,a0
l0056 equ       *-4 
      movea.l   a0,a1 
      lea       -460(a0),a0 
      lea       230(a1),a1
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    (a0),(a1) 
      lea       -460(a0),a0 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       230(a1),a1
      move.l    476(a0),-214(a1)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    492(a0),-198(a1)
      move.l    508(a0),-182(a1)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      move.l    524(a0),-166(a1)
      move.l    540(a0),-150(a1)
      move.l    556(a0),-134(a1)
      move.l    572(a0),-118(a1)
      move.l    588(a0),-102(a1)
      move.l    604(a0),-86(a1) 
      move.l    620(a0),-70(a1) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      lea       0.l,a0
l0057 equ       *-4 
      lea       l00cc,a1
l0058 equ       *-4 
      movea.l   a1,a3 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      lea       l0050,a2
l0059 equ       *-4 
      nop 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   a1,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.l    a1,l005e
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.b    #8,$fffffa1b.w
      move.l    a2,l005f
      movem.l   (a7)+,a0-a4/d0
      rte 
l005a:move      #$2700,sr 
      movem.l   a0-a4/d0,-(a7)
      movea.l   l0067(pc),a4
      clr.b     $fffffa1b.w 
      move.l    #l0062,$120.w 
      move.b    #$48,$fffffa21.w
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    l0060(pc),d0
      move.w    d0,$ffff8242.w
      move.w    d0,$ffff8250.w
      st        l00d1 
      move.l    #$60006,d0
      move.l    d0,$ffff8248.w
      move.l    d0,$ffff824c.w
      lea       $ffff8209.w,a0
l005b:move.b    (a0),d0 
      cmp.b     (a0),d0 
      bne.s     l005b 
      move.b    (a0),d0 
l005c:cmp.b     (a0),d0 
      beq.s     l005c 
      move.b    (a0),d0 
      neg.w     d0
      lsl.w     d0,d0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      lea       l0061(pc),a1
      lea       0.l,a0
l005d equ       *-4 
      move.l    #l00cc,d0 
l005e equ       *-4 
      lea       l0050,a2
l005f equ       *-4 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      addq.w    #8,a0 
      movea.l   d0,a3 
      adda.w    (a2)+,a3
      move.w    (a3)+,(a0)
      move.w    (a3)+,230(a0) 
      move.w    (a3)+,460(a0) 
      move.w    (a3)+,690(a0) 
      move.w    (a3)+,920(a0) 
      move.w    (a3)+,1150(a0)
      move.w    (a3)+,1380(a0)
      move.w    (a3)+,1610(a0)
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.w    (a1),$ffff8242.w
      move.w    (a1)+,$ffff8250.w 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.w    120(a1),$ffff8240.w 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      move.b    #8,$fffffa1b.w
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   (a7)+,a0-a4/d0
      rte 
      dc.b      $07,'w',$06,'v',$05,'u',$04,'t' 
      dc.b      $03,'s' 
l0060:dc.b      $02,'r' 
l0061:dc.b      $01,'q',$00,'p',$00,'q',$00,'r' 
      dc.b      $00,'s',$00,'t',$00,'u',$00,'v' 
      dc.b      $00,'w',$00,'g',$00,'w',$00,'g' 
      dc.b      $00,'7',$00,$27,$00,$17,$00,$07 
      dc.b      $01,$07,$02,$07,$03,$07,$04,$07 
      dc.b      $05,$07,$06,$07,$07,$07,$07,$06 
      dc.b      $07,$05,$07,$04,$07,$03,$07,$02 
      dc.b      $07,$01,$07,$00,$07,$10,$07,' ' 
      dc.b      $07,'0',$07,'@',$07,'p',$07,'`' 
      dc.b      $07,'p',$06,'p',$05,'p',$04,'p' 
      dc.b      $03,'p',$02,'p',$01,'p',$00,'p' 
      dc.b      $01,'q',$02,'r',$03,'s',$04,'t' 
      dc.b      $05,'u',$06,'v',$07,'w',$06,'f' 
      dc.b      $05,'u',$04,'d',$03,'3',$02,'"' 
      dc.b      $01,$11,$00,$00,$ff,$ff,$00,$00 
      dcb.w     65,0
l0062:dc.b      'h',$e7,$f8,$88,'(z',$06,$c2
      dc.b      'b8',$fa,$1b,' <',$00,$06 
      dc.b      $00,$06,'!',$c0,$82,'@!',$c0
      dc.b      $82,'d0<' 
l0063:dc.b      $00,$00 
      addq.w    #2,d0 
      and.w     #$e,d0
      move.w    d0,l0063
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.b    $ffff8209.w,d1
      neg.w     d1
      lsl.w     d1,d1 
      lea       l00c6,a0
      lea       0(a0,d0.w),a0 
      movem.l   (a0),d1-d4
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      move.b    #2,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      movem.l   d1-d3,$ffff8250.w 
      move.b    #2,$ffff8260.w
      move.b    #0,$ffff8260.w
      move.l    d4,$ffff825c.w
      movem.l   (a0),d1-d4
      lea       32(a0),a0 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #0,$ffff820a.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #1,$ffff8260.w
      move.b    #0,$ffff8260.w
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.b    #2,$ffff820a.w
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      movem.l   (a7)+,a4/a0/d0-d4 
      rte 
 data 
l0064:dc.b      '`',$00,$00,'4`',$00,$01,$f4
l0065:dc.b      '`',$00,$01,$f8 
l0066:dc.b      '`',$00,$07,$aa 
l0067:dc.b      $00,$00,$17,'~' 
l0068:dc.b      $00,$00,$17,'n' 
l0069:dcb.w     2,0 
l006a:dcb.w     2,0 
l006b:dcb.w     2,0 
l006c:dcb.w     2,0 
l006d:dcb.w     2,0 
l006e:dc.b      $00,$00 
l006f:dc.b      $00,$00,$06,'f',$00,$00,$17,'~' 
      movem.l   a0-a6/d0-d7,-(a7) 
      lea       l0064(pc),a3
      movea.l   28(a3),a5 
      movea.l   32(a3),a6 
      movea.l   24(a3),a4 
      move.w    (a5)+,d6
      moveq     #$1e,d7 
l0070:move.w    4(a4),d0
      tst.w     d0
      beq.s     l0075 
      neg.w     d0
      bsr       l007e 
      move.l    a6,(a4) 
      tst.w     6(a4) 
      beq.s     l0073 
      move.w    #$18f,d0
      move.w    6(a4),d1
      move.w    d1,d2 
      lea       0(a6,d1.w),a0 
      movea.l   a0,a1 
l0071:move.w    (a1)+,(a6)+ 
      addq.w    #2,d2 
      bne.s     l0072 
      movea.l   a0,a1 
      move.w    d1,d2 
l0072:dbf       d0,l0071
      bra.s     l0075 
l0073:move.w    #$18f,d0
      move.b    -(a6),d1
      lsl.w     #8,d1 
      move.b    (a6)+,d1
l0074:move.w    d1,(a6)+
      dbf       d0,l0074
l0075:lea       10(a4),a4 
      dbf       d7,l0070
      movea.l   l006c(pc),a0
      move.w    #$1f8,d0
      move.l    #$10001000,d1 
l0076:move.l    d1,(a0)+
      dbf       d0,l0076
      tst.w     44(a3)
      beq.s     l0077 
      clr.w     $ffff8900.w 
      move.w    #2,$ffff8920.w
      move.w    #$6b8,14(a3)
      move.w    #$14e,1428(a3)
      move.w    #$13e,1466(a3)
      move.w    #$16e,1504(a3)
      move.w    #$15e,1542(a3)
      move.w    #$4e73,5998(a3) 
      move.l    #$30d4,296(a3)
      move.l    #$3f2,544(a3) 
l0077:move.l    a3,d0 
      add.l     d0,16(a3) 
      add.l     d0,20(a3) 
      add.l     d0,50(a3) 
      add.l     d0,46(a3) 
      tst.w     44(a3)
      beq.s     l0079 
      lea       l00be(pc),a0
      move.w    #$1fff,d0 
l0078:move.w    (a0),d1 
      lsr.w     #4,d1 
      sub.w     #$40,d1 
      move.w    d1,(a0)+
      dbf       d0,l0078
l0079:move.w    #$2fb,d0
      move.l    #$1e78,d1 
      lea       l00bb(pc),a0
l007a:move.l    (a0),d2 
      moveq     #0,d3 
      swap      d2
      move.w    d2,d3 
      divu      d1,d3 
      swap      d3
      move.w    d3,d2 
      swap      d2
      swap      d3
      divu      d1,d2 
      move.w    d2,(a0)+
      move.w    d3,(a0)+
      dbf       d0,l007a
      move.l    #$6000005e,244(a3)
l007b:lea       l00a7(pc),a0
      moveq     #3,d0 
      moveq     #0,d1 
      lea       l00b7(pc),a1
l007c:move.l    a1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.l    d1,(a0)+
      dbf       d0,l007c
      lea       l00ab(pc),a0
      moveq     #3,d0 
      moveq     #0,d1 
      lea       l00b7(pc),a1
l007d:move.l    a1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.l    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      move.w    d1,(a0)+
      dbf       d0,l007d
      move.b    #6,657(a3)
      move.w    #$3f0,668(a3) 
      movea.l   24(a3),a1 
      move.w    310(a1),696(a3) 
      move.w    312(a1),690(a3) 
      lea       314(a1),a2
      move.l    a2,704(a3)
      lea       442(a1),a2
      move.l    a2,718(a3)
      movem.l   (a7)+,a0-a6/d0-d7 
      rts 
l007e:lea       l0080(pc),a0
      lsr.w     #1,d0 
      subq.w    #1,d0 
l007f:moveq     #0,d1 
      move.b    (a5)+,d1
      move.w    d1,d2 
      asr.w     #4,d1 
      and.w     #$f,d2
      add.b     0(a0,d1.w),d6 
      move.b    d6,(a6)+
      add.b     0(a0,d2.w),d6 
      move.b    d6,(a6)+
      dbf       d0,l007f
      rts 
l0080:dc.b      $00,$01,$02,$04,$08,$10,' @'
      dc.b      $80,$c0,$e0,$f0,$f8,$fc,$fe,$ff 
      movem.l   a0-a6/d0-d7,-(a7) 
      bra       l007b 
      movem.l   a0-a4/d0-d6,-(a7) 
      lea       l0064(pc),a4
      lea       l006c(pc),a0
      move.l    4(a0),d0
      move.l    (a0)+,(a0)
      move.l    d0,-(a0)
      tst.w     44(a4)
      beq.s     l0081 
      move.l    d0,d1 
      add.l     #$27a,d1
      move.b    d0,$ffff8907.w
      lsr.l     #8,d0 
      move.b    d0,$ffff8905.w
      lsr.l     #8,d0 
      move.b    d0,$ffff8903.w
      clr.w     $ffff8900.w 
      move.w    #1,$ffff8900.w
      move.b    d1,$ffff8913.w
      lsr.l     #8,d1 
      move.b    d1,$ffff8911.w
      lsr.l     #8,d1 
      move.b    d1,$ffff8909.w
      bra.s     l0082 
l0081:movea.l   d0,a6 
l0082:moveq     #1,d0 
l0083 equ       *-1 
      subq.w    #1,d0 
      ble.s     l0084 
      move.b    d0,595(a4)
      lea       l00a7(pc),a0
      lea       l00ab(pc),a1
      bsr       l0092 
      lea       l00a8(pc),a0
      lea       l00ac(pc),a1
      bsr       l0092 
      lea       l00a9(pc),a0
      lea       l00ad(pc),a1
      bsr       l0092 
      lea       l00aa(pc),a0
      lea       l00ae(pc),a1
      bsr       l0092 
      bra.s     l0089 
l0084:move.b    #0,595(a4)
l0085 equ       *-3 
      tst.b     1580(a4)
      bne.s     l0086 
      move.w    #0,d0 
      add.w     #$10,d0 
      cmp.w     #$400,d0
      bne.s     l0088 
l0086:clr.b     1580(a4)
      moveq     #$ff,d0 
      addq.l    #1,d0 
      cmp.w     #0,d0 
      bne.s     l0087 
      move.w    #0,d0 
l0087:move.b    d0,685(a4)
      lea       0.l,a0
      move.b    0(a0,d0.w),d0 
      swap      d0
      lsr.l     #6,d0 
      add.l     #0,d0 
      move.l    d0,734(a4)
      moveq     #0,d0 
l0088:move.w    d0,668(a4)
      add.l     #0,d0 
      movea.l   d0,a3 
      lea       l00a9(pc),a0
      lea       l00ad(pc),a1
      bsr.s     l008a 
      lea       l00a7(pc),a0
      lea       l00ab(pc),a1
      bsr.s     l008a 
      lea       l00aa(pc),a0
      lea       l00ae(pc),a1
      bsr.s     l008a 
      lea       l00a8(pc),a0
      lea       l00ac(pc),a1
      bsr.s     l008a 
l0089:bsr       l009e 
      movem.l   (a7)+,a0-a4/d0-d6 
      rts 
l008a:move.l    (a3)+,12(a1)
      moveq     #0,d0 
      move.b    13(a1),d0 
      beq.s     l008b 
      add.w     d0,d0 
      movea.l   l0069(pc),a2
      lea       -10(a2,d0.w),a2 
      move.l    (a2)+,(a1)+ 
      move.l    (a2)+,(a1)+ 
      move.w    (a2),d0 
      move.w    d0,(a1) 
      and.w     #$3e00,d0 
      subq.l    #8,a1 
      move.w    d0,22(a1) 
l008b:moveq     #0,d0 
      move.b    12(a1),d0 
      beq.s     l008c 
      lea       l00b8(pc),a2
      cmpi.b    #6,14(a1) 
      beq       l008f 
      move.w    -2(a2,d0.w),d0
      move.w    d0,10(a1) 
      move.l    (a1)+,(a0)+ 
      move.l    (a1)+,(a0)+ 
      move.w    (a1),(a0) 
      subq.l    #8,a0 
      subq.l    #8,a1 
      st        21(a1)
l008c:moveq     #0,d0 
      move.b    14(a1),d0 
      move.w    l008d(pc,d0.w),d0 
      jmp       l008d(pc,d0.w)
l008d:ori.b     #$20,-(a0)
      ori.b     #$20,-(a0)
      ori.b     #$20,-(a0)
      ori.b     #$20,-(a0)
      ori.b     #$20,-(a0)
      ori.b     #$30,-(a0)
      ori.b     #$54,ccr
      ori.b     #$5a,-(a0)
l008e:move.w    10(a1),d0 
      lea       l00bc(pc),a2
      move.l    0(a2,d0.w),10(a0) 
      rts 
      move.b    15(a1),685(a4)
      not.b     1580(a4)
      bra.s     l008e 
      movep.w   15(a1),d0 
      clr.b     d0
      move.w    d0,8(a1)
      move.w    d0,8(a0)
      and.w     #$3e00,d0 
      move.w    d0,22(a1) 
      bra.s     l008e 
      not.b     1580(a4)
      bra.s     l008e 
      move.b    15(a1),d0 
      move.b    d0,595(a4)
      move.b    d0,657(a4)
      bra.s     l008e 
l008f:move.w    -2(a2,d0.w),d0
      move.w    d0,16(a1) 
      moveq     #0,d1 
      move.b    15(a1),d1 
      cmp.w     10(a1),d0 
      beq.s     l0091 
      bgt.s     l0090 
      neg.w     d1
l0090:move.w    d1,18(a1) 
      bra       l008c 
l0091:clr.w     18(a1)
      bra       l008c 
l0092:moveq     #0,d0 
      move.b    14(a1),d0 
      move.w    l0093(pc,d0.w),d0 
      jmp       l0093(pc,d0.w)
l0093:ori.b     #$90,-(a0)
      ori.l     #$c60102,-126(a0) 
      dc.w      $ff82 
      dc.w      $ff82 
      dc.w      $ff82 
      dc.w      $ff82 
      bchg      d0,(a0) 
      dc.w      $ff82 
      dc.w      $ff82 
      dc.w      $ff82 
      dc.w      $ff82 
      dc.w      $ff82 
      tst.b     15(a1)
      beq       l008e 
      moveq     #0,d0 
      move.b    l0085(pc),d0
      sub.b     l0083(pc),d0
      add.w     d0,d0 
      move.w    l0094(pc,d0.w),d0 
      jmp       l0095(pc,d0.w)
l0094 equ       *-2 
l0095:ori.b     #$28,(a6)+
      dc.w      $ff46 
      ori.b     #$28,(a6)+
      dc.w      $ff46 
      ori.b     #$28,(a6)+
      dc.w      $ff46 
      ori.b     #$28,(a6)+
      dc.w      $ff46 
      ori.b     #$28,(a6)+
      dc.w      $ff46 
      moveq     #0,d0 
      move.b    15(a1),d0 
      lsr.b     #4,d0 
      bra.s     l0096 
      moveq     #0,d0 
      move.b    15(a1),d0 
      and.w     #$f,d0
l0096:add.w     d0,d0 
      move.w    10(a1),d1 
      lea       l00b9(pc),a2
      moveq     #$23,d2 
l0097:cmp.w     -(a2),d1
      dble      d2,l0097
      move.w    0(a2,d0.w),d0 
      lea       l00bc(pc),a2
      move.l    0(a2,d0.w),10(a0) 
      rts 
      moveq     #0,d0 
      move.b    15(a1),d0 
      move.w    10(a1),d1 
      sub.w     d0,d1 
      bge.s     l0098 
      moveq     #0,d1 
l0098:move.w    d1,10(a1) 
      bra       l008e 
      moveq     #0,d0 
      move.b    15(a1),d0 
      move.w    10(a1),d1 
      add.w     d0,d1 
      cmp.w     #$b9c,d1
      ble.s     l0099 
      move.w    #$b9c,d1
l0099:move.w    d1,10(a1) 
      bra       l008e 
      move.w    18(a1),d0 
      beq       l008e 
      blt.s     l009a 
      add.w     10(a1),d0 
      cmp.w     16(a1),d0 
      bgt.s     l009b 
      move.w    d0,10(a1) 
      bra       l008e 
l009a:add.w     10(a1),d0 
      cmp.w     16(a1),d0 
      blt.s     l009b 
      move.w    d0,10(a1) 
      bra       l008e 
l009b:move.w    16(a1),10(a1) 
      clr.w     18(a1)
      bra       l008e 
      lea       l00ba(pc),a2
      move.b    20(a1),d0 
      lsr.w     #2,d0 
      and.w     #$1f,d0 
      moveq     #0,d1 
      move.b    0(a2,d0.w),d1 
      move.b    15(a1),d0 
      and.w     #$f,d0
      mulu      d0,d1 
      lsr.w     #4,d1 
      and.w     #$fffc,d1 
      move.w    10(a1),d0 
      tst.b     20(a1)
      bmi.s     l009c 
      add.w     d1,d0 
      bra.s     l009d 
l009c:sub.w     d1,d0 
l009d:lea       l00bc(pc),a2
      move.l    0(a2,d0.w),10(a0) 
      move.b    15(a1),d1 
      lsr.w     #2,d1 
      and.w     #$3c,d1 
      add.b     d1,20(a1) 
      rts 
      move.b    15(a1),d0 
      ext.w     d0
      add.w     8(a1),d0
      cmpi.w    #$40,d0 
      bge       l008e 
      tst.w     d0
      bmi       l008e 
      move.w    d0,8(a1)
      move.w    d0,8(a0)
      and.w     #$3e00,d0 
      move.w    d0,22(a1) 
      bra       l008e 
l009e:lea       l00b1(pc),a0
      move.w    #$4e71,(a0) 
      lea       l00a7(pc),a1
      move.w    4(a1),d0
      bmi.s     l00a0 
      move.w    6(a1),d1
      bmi.s     l009f 
      move.w    #$7400,(a0) 
      bra.s     l00a0 
l009f:add.w     d1,d0 
      bpl.s     l009f 
      move.w    d0,4(a1)
l00a0:lea       l00b2(pc),a0
      move.w    #$4e71,(a0) 
      lea       l00a8(pc),a1
      move.w    4(a1),d0
      bmi.s     l00a2 
      move.w    6(a1),d1
      bmi.s     l00a1 
      move.w    #$7a00,(a0) 
      bra.s     l00a2 
l00a1:add.w     d1,d0 
      bpl.s     l00a1 
      move.w    d0,4(a1)
l00a2:lea       l00b4(pc),a0
      move.w    #$4e71,(a0) 
      lea       l00a9(pc),a1
      move.w    4(a1),d0
      bmi.s     l00a4 
      move.w    6(a1),d1
      bmi.s     l00a3 
      move.w    #$7400,(a0) 
      bra.s     l00a4 
l00a3:add.w     d1,d0 
      bpl.s     l00a3 
      move.w    d0,4(a1)
l00a4:lea       l00b5(pc),a0
      move.w    #$4e71,(a0) 
      lea       l00aa(pc),a1
      move.w    4(a1),d0
      bmi.s     l00a6 
      move.w    6(a1),d1
      bmi.s     l00a5 
      move.w    #$7a00,(a0) 
      bra.s     l00a6 
l00a5:add.w     d1,d0 
      bpl.s     l00a5 
      move.w    d0,4(a1)
l00a6:rts 
      dc.b      $00,$00 
l00a7:dcb.w     7,0 
l00a8:dcb.w     7,0 
l00a9:dcb.w     7,0 
l00aa:dcb.w     7,0 
l00ab:dcb.w     12,0
l00ac:dcb.w     12,0
l00ad:dcb.w     12,0
l00ae:dcb.w     12,0
      movem.l   a0-a4/d0-d6,-(a7) 
      movea.l   l006d(pc),a3
      lea       l00a7(pc),a4
      movea.l   (a4),a0 
      moveq     #0,d0 
      move.w    4(a4),d0
      move.w    8(a4),d1
      move.l    10(a4),d2 
      moveq     #0,d2 
      lea       l00a8(pc),a4
      movea.l   (a4),a1 
      moveq     #0,d3 
      move.w    4(a4),d3
      move.w    8(a4),d4
      move.l    10(a4),d5 
      moveq     #0,d5 
      lea       l00be(pc),a2
      move.w    #$1f4,d6
l00af:swap      d6
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      swap      d6
      dbf       d6,l00af
      lea       l00a7(pc),a4
      move.w    d0,4(a4)
      lea       14(a4),a4 
      move.w    d3,4(a4)
      movea.l   l006d(pc),a3
      lea       l00a9(pc),a4
      movea.l   (a4),a0 
      moveq     #0,d0 
      move.w    4(a4),d0
      move.w    8(a4),d1
      move.l    10(a4),d2 
      moveq     #0,d2 
      lea       l00aa(pc),a4
      movea.l   (a4),a1 
      moveq     #0,d3 
      move.w    4(a4),d3
      move.w    8(a4),d4
      move.l    10(a4),d5 
      moveq     #0,d5 
      lea       l00be(pc),a2
      move.w    #$1f4,d6
l00b0:swap      d6
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.b    d6,(a3)+
      addq.w    #1,a3 
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      swap      d6
      dbf       d6,l00b0
      lea       l00a9(pc),a4
      move.w    d0,4(a4)
      lea       14(a4),a4 
      move.w    d3,4(a4)
      move.w    -2(a3),d0 
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      movem.l   (a7)+,a0-a4/d0-d6 
      rts 
      movem.l   a0-a4/d0-d6,-(a7) 
      movea.l   l006d(pc),a3
      lea       l00a7(pc),a4
      movea.l   (a4),a0 
      moveq     #0,d0 
      move.w    4(a4),d0
      move.w    8(a4),d1
      move.l    10(a4),d2 
l00b1:moveq     #0,d2 
      lea       l00a8(pc),a4
      movea.l   (a4),a1 
      moveq     #0,d3 
      move.w    4(a4),d3
      move.w    8(a4),d4
      move.l    10(a4),d5 
l00b2:moveq     #0,d5 
      lea       l00be(pc),a2
      lea       l00bd(pc),a4
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      moveq     #$4d,d6 
l00b3:swap      d6
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      swap      d6
      dbf       d6,l00b3
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      move.w    d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      lea       l00a7(pc),a4
      move.w    d0,4(a4)
      lea       14(a4),a4 
      move.w    d3,4(a4)
      movea.l   l006d(pc),a3
      lea       l00a9(pc),a4
      movea.l   (a4),a0 
      moveq     #0,d0 
      move.w    4(a4),d0
      move.w    8(a4),d1
      move.l    10(a4),d2 
l00b4:moveq     #0,d2 
      lea       l00aa(pc),a4
      movea.l   (a4),a1 
      moveq     #0,d3 
      move.w    4(a4),d3
      move.w    8(a4),d4
      move.l    10(a4),d5 
l00b5:moveq     #0,d5 
      lea       l00be(pc),a2
      lea       l00bd(pc),a4
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      nop 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.w    #$19,d6 
l00b6:swap      d6
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      nop 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      move.w    (a6)+,d7
      move.l    4(a4,d7.w),(a5) 
      move.l    0(a4,d7.w),d7 
      movep.l   d7,0(a5)
      swap      d6
      dbf       d6,l00b6
      move.b    0(a0,d0.w),d1 
      move.w    0(a2,d1.w),d6 
      move.b    0(a1,d3.w),d4 
      add.w     0(a2,d4.w),d6 
      add.w     d6,(a3)+
      clr.w     d6
      add.l     d2,d0 
      addx.w    d6,d0 
      add.l     d5,d3 
      addx.w    d6,d3 
      lea       l00a9(pc),a4
      move.w    d0,4(a4)
      lea       14(a4),a4 
      move.w    d3,4(a4)
      move.w    -2(a3),d0 
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      move.w    d0,(a3)+
      movem.l   (a7)+,a0-a4/d0-d6 
      rts 
l00b7:dc.b      $80,$80 
l00b8:dc.b      $0b,$9c,$0a,$dc,$0a,'$',$09,'|' 
      dc.b      $08,$d4,$08,'<',$07,$ac,$07,'$' 
      dc.b      $06,$a4,$06,',',$05,$bc,$05,'p' 
      dc.b      $04,$ec,$04,$8c,$04,'0',$03,$dc 
      dc.b      $03,$88,$03,'<',$02,$f4,$02,$b0 
      dc.b      $02,'p',$02,'4',$01,$fc,$01,$c4 
      dc.b      $01,$94,$01,'d',$01,'4',$01,$0c 
      dc.b      $00,$e4,$00,$bc,$00,$98,$00,'x' 
      dc.b      $00,'x',$00,'8',$00,$1c,$00,$00 
l00b9:dcb.w     16,0
l00ba:dc.b      $00,$18,'1jax',$8d,$a1
      dc.b      $b4,$c5,$d4,$e0,$eb,$f4,$fa,$fd 
      dc.b      $ff,$fd,$fa,$f4,$eb,$e0,$d4,$c5 
      dc.b      $b4,$a1,$8d,'xaj1',$18
l00bb:dc.b      'c',$e0,'pnc9[',$a8 
      dc.b      'b',$95,'uša',$f4,$a7,'5' 
      dc.b      'av',$da,'h@',$bb,$f9,'r' 
      dc.b      '@#',$f0,$1c,'?',$8e,$aa,'p'
      dc.b      '>',$fc,$15,'l>l',$1e,'@' 
l00bc:dc.b      '=',$de,$b3,$81,'=s',$c3,$e5
      dc.b      '<',$cb,'>',$da,'<e',$14,'a'
      dc.b      ';',$c1,'5',$07,';?',$91,$de
      dc.b      ':',$c0,$1c,'y:b',$c6,$e7 
      dc.b      '9',$c7,$83,$ac,'9ne',$bd 
      dc.b      '8',$d7,$00,'}8a',$a7,$b6 
      dc.b      '7',$ee,'/',$96,'7|',$8c,$ab
      dc.b      '7',$0c,$b3,$e0,'6',$9e,'šx'
      dc.b      '626',$0c,'5',$c7,'|',$86 
      dc.b      '5^d',$1f,'4',$f6,$e3,']' 
      dc.b      '4',$90,$f1,$0e,'4,„e'
      dc.b      '3',$c9,$94,'[3h',$18,$ea 
      dc.b      '3',$08,$09,$c8,'2',$a9,'_',$0b 
      dc.b      '2l',$11,$02,'1',$f0,$18,'3'
      dc.b      '1',$95,'m]1<',$09,'p'
      dc.b      '0',$e3,$e5,$91,'0',$8c,$fb,$15 
      dc.b      '07c/',$e2,$b8,$85 
      dc.b      '/',$8f,'t',$00,'/=',$0f,$f9
      dc.b      '.',$eb,$e6,$a2,'.',$9b,$d2,'r' 
      dc.b      '.l',$cd,$89,'-',$fe,$d2,$ec
      dc.b      '-',$b1,$dd,'a-e',$e7,'t' 
      dc.b      '-',$1a,$ec,$91,',',$d0,$e7,$c5 
      dc.b      ',',$87,$d4,'[,?',$ad,$bf 
      dc.b      '+',$f8,'oy+',$b2,$15,'-' 
      dc.b      '+l',$9a,$9c,'+',$27,$fb,$a1
      dc.b      '*',$e4,'42*',$a1,'@^'
      dc.b      '*_',$1c,'k*',$1d,$c4,'8' 
      dc.b      ')',$dd,'4{)',$9d,'i',$80 
      dc.b      ')^_',$c9,') ',$13,$ee
      dc.b      '(',$e2,$82,$99,'(',$a5,$a8,$89 
      dc.b      '(i',$82,$91,'(.',$0d,$96 
      dc.b      $27,$f3,'f',$8f,$27,$b9,'*',$86 
      dc.b      $27,$7f,$b6,$94,$27,'f',$e7,$e3 
      dc.b      $27,$0e,$bb,$b0,'&',$d7,'/d'
      dc.b      '&',$a0,'?',$fa,'&i',$eb,';'
      dc.b      '&4.~%',$ff,$07,'h' 
      dc.b      '%',$ca,'s.%',$96,'o',$ce 
      dc.b      '%b',$fa,$d8,'%0',$12,$05 
      dc.b      '$',$fd,$b3,$1c,'$',$cb,$db,$f0 
      dc.b      '$',$9a,$8a,'^$i',$bc,'p' 
      dc.b      '$9o',$bb,'$',$09,$a2,$9e 
      dc.b      '#',$da,'s',$04,'#',$ab,$7f,$00 
      dc.b      '#}$',$b1,'#ob>'
      dc.b      '#!',$d5,$d9,'"',$f4,$dd,$bd
      dc.b      '"',$c8,'x."',$9c,'cw'
      dc.b      '"p',$9d,$ee,'"ee',$f1
      dc.b      '"',$1a,$99,$e4,'!',$f0,'87'
      dc.b      '!',$c6,'?]!',$9c,$ad,$d4 
      dc.b      '!s',$82,' !j',$ba,$cd
      dc.b      '!"vm ',$fa,'sš'
      dc.b      ' ',$d2,$b0,$f5,' ',$ab,'m$'
      dc.b      ' ',$84,$86,$d4,' ]',$fc,$b9
      dc.b      ' 7',$cd,$8c,' ',$11,$f8,$0e
      dc.b      $1f,$ec,'{',$03,$1f,$c7,'u8'
      dc.b      $1f,$a2,$85,'|',$1f,'~',$0a,$a6 
      dc.b      $1f,'y',$e3,$92,$1f,'6',$0f,' ' 
      dc.b      $1f,$12,$8c,'7',$1e,$ef,'y',$c0 
      dc.b      $1e,$cc,'v',$ae,$1e,$a9,$e1,$f2 
      dc.b      $1e,$87,$9a,$88,$1e,'e',$9f,'m' 
      dc.b      $1e,'c',$ef,$a3,$1e,'"',$8a,'0' 
      dc.b      $1e,$01,'n!',$1d,$e0,$9a,$83
      dc.b      $1d,$c0,$0e,'k',$1d,$9f,$c8,$ef 
      dc.b      $1d,$7f,$c9,'*',$1d,'`',$0e,'<' 
      dc.b      $1d,'@',$97,'h',$1d,'!cs' 
      dc.b      $1d,$02,'q',$e8,$1c,$e3,$c1,$d6 
      dc.b      $1c,$c5,'rk',$1c,$a7,'"',$de
      dc.b      $1c,$89,'2f',$1c,'k',$80,'>'
      dc.b      $1c,'n',$0b,$a5,$1c,'0',$d3,$db 
      dc.b      $1c,$13,$d8,'%',$1b,$f7,$17,$cb 
      dc.b      $1b,$da,$92,$16,$1b,$be,'fu'
      dc.b      $1b,$a2,'3',$d7,$1b,$86,'y',$f0 
      dc.b      $1b,'j',$b7,$f4,$1b,'om<' 
      dc.b      $1b,'4',$19,'#',$1b,$19,$1b,$06 
      dc.b      $1a,$fe,'re',$1a,$e3,$be,'c'
      dc.b      $1a,$c9,'^d',$1a,$af,'2',$0f
      dc.b      $1a,$95,'8',$af,$1a,'{q',$ae
      dc.b      $1a,'a',$dc,'{',$1a,'hx',$87
      dc.b      $1a,'/eb',$1a,$16,'b"'
      dc.b      $19,$fd,'n',$9e,$19,$e4,$ca,'-' 
      dc.b      $19,$cc,'tk',$19,$b4,$0c,'u'
      dc.b      $19,$9b,$f2,$27,$19,$84,$04,$e4 
      dc.b      $19,'ld-',$19,'t',$af,$85 
      dc.b      $19,'=ft',$19,'&',$08,$81 
      dc.b      $19,$0e,$f5,'4',$18,$f8,$0c,$19 
      dc.b      $18,$e1,'l',$bd,$18,$ca,$b6,$ae 
      dc.b      $18,$b4,'i|',$18,$9e,$04,$b8
      dc.b      $18,$87,$e7,$f5,$18,'q',$f2,$c8 
      dc.b      $18,'\$',$c8,$18,'f}',$8a 
      dc.b      $18,'0',$fc,$aa,$18,$1b,$a1,$c0 
      dc.b      $18,$06,'li',$17,$f1,'\b' 
      dc.b      $17,$dc,'p',$ea,$17,$c7,$aa,$00 
      dc.b      $17,$b3,$07,'%',$17,$9e,$87,$fc 
      dc.b      $17,$8a,',)',$17,'u',$f3,'q'
      dc.b      $17,'a',$dd,$19,$17,'m',$e9,')' 
      dc.b      $17,':',$17,')',$17,'&f',$c4
      dc.b      $17,$12,$d7,$a5,$16,$ff,'iv'
      dc.b      $16,$ec,$1b,$e5,$16,$d8,$ee,$a0 
      dc.b      $16,$c5,$e1,'w',$16,$b2,$f3,$ba 
      dc.b      $16,$a0,'%z',$16,$8d,'vh' 
      dc.b      $16,'z',$e5,$da,$16,'hs',$e2
      dc.b      $16,'v ',$17,$16,'c',$ea,'-'
      dc.b      $16,'1',$d1,$de,$16,$1f,$d6,$df 
      dc.b      $16,$0d,$f8,$ec,$15,$fc,'7',$bc 
      dc.b      $15,$ea,$93,$0c,$15,$d9,$0a,$96 
      dc.b      $15,$c7,$9e,$18,$15,$b6,'mn'
      dc.b      $15,$a5,$17,$f6,$15,$93,$fd,$d0 
      dc.b      $15,$82,$fe,$9c,$15,'r',$1a,$19 
      dc.b      $15,'ap',$09,$15,'p',$a0,'/'
      dc.b      $15,'@',$0a,'l',$15,'/Ž%' 
      dc.b      $15,$1f,'+~',$15,$0e,$e2,$1c
      dc.b      $14,$fe,$b1,$c4,$14,$ee,'š='
      dc.b      $14,$de,$9b,'n',$14,$ce,$b4,$c0 
      dc.b      $14,$be,$e6,'y',$14,$af,'/',$e4 
      dc.b      $14,$9f,$91,'+',$14,$90,$09,$f7 
      dc.b      $14,$80,$9a,$13,$14,'qal' 
      dc.b      $14,'a',$ff,'m',$14,'r',$d4,'d' 
      dc.b      $14,'c',$bf,$9e,$14,'4',$c1,'h' 
      dc.b      $14,'%',$d9,$12,$14,$17,$06,$cb 
      dc.b      $14,$08,'jb',$13,$f9,$a3,'g'
      dc.b      $13,$eb,$11,$ad,$13,$dc,$95,'c' 
      dc.b      $13,$ce,'-',$db,$13,$bf,$db,'j' 
      dc.b      $13,$b1,$9d,'`',$13,$a3,'s',$f1 
      dc.b      $13,$95,'^',$d3,$13,$87,']',$d8 
      dc.b      $13,'yp',$d6,$13,'k',$97,$a2
      dc.b      $13,']',$d2,$12,$13,'p',$1f,$fd 
      dc.b      $13,'b9',$13,'4',$f5,$9d 
      dc.b      $13,$27,'}',$02,$13,$1a,$17,'?' 
      dc.b      $13,$0c,$c4,',',$12,$ff,$83,$a4 
      dc.b      $12,$f2,'u',$7f,$12,$e5,'9',$97 
      dc.b      $12,$d8,'/',$c6,$12,$cb,'7',$e7 
      dc.b      $12,$be,'q',$d5,$12,$b1,'}l'
      dc.b      $12,$a4,$ba,$87,$12,$98,$09,$02 
      dc.b      $12,$8b,'h',$bb,$12,'~',$d9,$8e 
      dc.b      $12,'r[x',$12,'e',$ed,$f8 
      dc.b      $12,'y',$91,'j',$12,'me/' 
      dc.b      $12,'a',$09,$83,$12,'4',$de,'(' 
      dc.b      $12,'(',$c2,$fb,$12,$1c,$b7,$dd 
      dc.b      $12,$10,$bc,$ae,$12,$04,$d1,'o' 
      dc.b      $11,$f8,$f5,$a0,$11,$ed,')',$82 
      dc.b      $11,$e1,'l',$d6,$11,$d5,$bf,$80 
      dc.b      $11,$ca,'!_',$11,$be,$92,'x'
      dc.b      $11,$b3,$12,'l',$11,$a7,$a1,$1f 
      dc.b      $11,$9c,'>',$b3,$11,$90,$ea,$ec 
      dc.b      $11,$85,$a5,$af,$11,'zn',$de
      dc.b      $11,'of_',$11,'d,',$17
      dc.b      $11,'y',$1f,$e9,$11,'n!',$bb
      dc.b      $11,'c1s',$11,'8n',$f7
      dc.b      $11,'-z,',$11,'"',$b2,$f8 
      dc.b      $11,$17,$f9,'c',$11,$0d,'l',$f2 
      dc.b      $11,$02,$ad,$ed,$10,$f8,$1c,$1b 
      dc.b      $10,$ed,$97,'d',$10,$e3,$1f,$ae 
      dc.b      $10,$d8,$b4,$e3,$10,$ce,'v',$ea 
      dc.b      $10,$c4,$05,$ab,$10,$b9,$c1,$10 
      dc.b      $10,$af,$89,$00,$10,$a5,']f'
      dc.b      $10,$9b,'>*',$10,$91,'+6' 
      dc.b      $10,$87,'$t',$10,'})',$cd 
      dc.b      $10,'s;,',$10,'ixz' 
      dc.b      $10,'_',$81,$a3,$10,'u',$b6,$92 
      dc.b      $10,'k',$f7,'0',$10,'bcj' 
      dc.b      $10,'8',$9b,'*',$10,'.',$fe,'\' 
      dc.b      $10,'%l',$ec,$10,$1b,$e6,$c6
      dc.b      $10,$12,'k',$d5,$10,$08,$fc,$07 
      dc.b      $0f,$ff,$97,'g',$0f,$f6,'=',$81 
      dc.b      $0f,$ec,$ee,$a4,$0f,$e3,$aa,$9c 
      dc.b      $0f,$da,'qu',$0f,$d1,'b',$be
      dc.b      $0f,$c8,$1e,$c3,$0f,$bf,$05,'s' 
      dc.b      $0f,$b5,$f6,'[',$0f,$ac,$f1,$c9 
      dc.b      $0f,$a3,$f7,$8b,$0f,$9b,$07,$90 
      dc.b      $0f,$92,'!',$c6,$0f,$89,'f',$1b 
      dc.b      $0f,$80,'t',$7f,$0f,'w',$ac,$e0 
      dc.b      $0f,'n',$ef,'-',$0f,'f;w' 
      dc.b      $0f,']',$91,'k',$0f,'t',$f0,$f9 
      dc.b      $0f,'lzq',$0f,'c',$cd,'d' 
      dc.b      $0f,';i',$c0,$0f,'2',$cf,$b6
      dc.b      $0f,'*_',$16,$0f,'!',$f7,$d1
      dc.b      $0f,$19,$99,$d7,$0f,$11,'e',$18 
      dc.b      $0f,$08,$f9,$85,$0f,$00,$b7,$10 
      dc.b      $0e,$f8,'}',$a9,$0e,$f0,'ma'
      dc.b      $0e,$e8,'%',$ca,$0e,$e0,$07,'5' 
      dc.b      $0e,$d7,$f1,'s',$0e,$cf,$e4,'w' 
      dc.b      $0e,$c7,$e0,'1',$0e,$bf,$e4,$95 
      dc.b      $0e,$b7,$f1,$93,$0e,$b0,$07,$1e 
      dc.b      $0e,$a8,'%(',$0e,$a0,'k',$a4
      dc.b      $0e,$98,'z',$83,$0e,$90,$b1,$b9 
      dc.b      $0e,$88,$f1,'9',$0e,$81,'8',$f4 
      dc.b      $0e,'y',$88,$de,$0e,'q',$e0,$eb 
      dc.b      $0e,'ja',$0c,$0e,'b',$a9,'5'
      dc.b      $0e,'[',$19,'[',$0e,'s',$91,'o' 
      dc.b      $0e,'l',$11,'f',$0e,'d™3' 
      dc.b      $0e,'=(',$ca,$0e,'5',$c0,$1f
      dc.b      $0e,'._&',$0e,$27,$05,$d2 
      dc.b      $0e,$1f,$b4,$19,$0e,$18,'i',$ed 
      dc.b      $0e,$11,$27,'d',$0e,$09,$ec,$12 
      dc.b      $0e,$02,$b8,'l',$0d,$fb,$8b,$e5 
      dc.b      $0d,$f4,'f',$d3,$0d,$ed,'i',$0b 
      dc.b      $0d,$e6,'2',$81,$0d,$df,'#*'
      dc.b      $0d,$d8,$1a,$fc,$0d,$d1,$19,$eb 
      dc.b      $0d,$ca,$1f,$ed,$0d,$c3,',',$f8 
      dc.b      $0d,$bc,'@',$ff,$0d,$b5,'[',$fa 
      dc.b      $0d,$ae,'}',$dd,$0d,$a7,$a6,$9e 
      dc.b      $0d,$a0,$d6,'3',$0d,$9a,$0c,$91 
      dc.b      $0d,$93,'i',$af,$0d,$8c,$8d,$83 
      dc.b      $0d,$85,$d8,$02,$0d,$7f,')"'
      dc.b      $0d,'x',$80,$db,$0d,'q',$df,'!' 
      dc.b      $0d,'kc',$ec,$0d,'d',$af,'2'
      dc.b      $0d,'^ ',$e9,$0d,'w',$99,$07
      dc.b      $0d,'q',$17,$85,$0d,'j',$9c,'w' 
      dc.b      $0d,'d',$27,'v',$0d,'=',$b8,$d7 
      dc.b      $0d,'7pr',$0d,'0',$ee,'=' 
      dc.b      $0d,'*',$92,'1',$0d,'$<c' 
      dc.b      $0d,$1d,$ec,'k',$0d,$17,$a2,$a1 
      dc.b      $0d,$11,'^',$db,$0d,$0b,'!',$11 
      dc.b      $0d,$04,$e9,':',$0c,$fe,$b7,'o' 
      dc.b      $0c,$f8,$8b,'e',$0c,$f2,'e',$16 
      dc.b      $0c,$ec,'d',$b9,$0c,$e6,'*%'
      dc.b      $0c,$e0,$15,'s',$0c,$da,$06,':' 
      dc.b      $0c,$d3,$fc,$d2,$0c,$cd,$f9,$13 
      dc.b      $0c,$c7,$fa,$f6,$0c,$c2,$02,'r' 
      dc.b      $0c,$bc,$0f,$7f,$0c,$b6,'"',$16 
      dc.b      $0c,$b0,':/',$0c,$aa,'w',$c2
      dc.b      $0c,$a4,'z',$c9,$0c,$9e,$a3,':' 
      dc.b      $0c,$98,$d1,$0f,$0c,$93,$04,'@' 
      dc.b      $0c,$8d,'<',$c6,$0c,$87,'z',$9a 
      dc.b      $0c,$81,$bd,$b4,$0c,'|',$06,$0c 
      dc.b      $0c,'vs',$9d,$0c,'p',$a6,'^'
      dc.b      $0c,'j',$fe,'i',$0c,'e[w' 
      dc.b      $0c,'_',$bd,$80,$0c,'z$',$be
      dc.b      $0c,'t',$91,$09,$0c,'o',$02,'\' 
      dc.b      $0c,'ix',$ae,$0c,'c',$f3,$fa
      dc.b      $0c,'>t9',$0c,'8',$f9,'d' 
      dc.b      $0c,'3',$83,'t',$0c,'.',$12,'d' 
      dc.b      $0c,'(',$a6,'+',$0c,'#>',$c5
      dc.b      $0c,$1d,$dc,'*',$0c,$18,'~u'
      dc.b      $0c,$13,'%>',$0c,$0d,$d0,$e0
      dc.b      $0c,$08,$81,'4',$0c,$03,'64'
      dc.b      $0b,$fd,$ef,$db,$0b,$f8,$ae,'!' 
      dc.b      $0b,$f3,'q',$01,$0b,$ee,'8u'
      dc.b      $0b,$e9,$04,'v',$0b,$e3,$d5,$00 
      dc.b      $0b,$de,$aa,$0b,$0b,$d9,$83,$92 
      dc.b      $0b,$d4,'a',$90,$0b,$cf,'c',$fe 
      dc.b      $0b,$ca,'*',$d7,$0b,$c5,$16,$14 
      dc.b      $0b,$c0,$05,$b1,$0b,$ba,$f9,$a8 
      dc.b      $0b,$b5,$f1,$f3,$0b,$b0,$ee,$8c 
      dc.b      $0b,$ab,$ef,'n',$0b,$a6,$f4,$94 
      dc.b      $0b,$a1,$fd,$f8,$0b,$9d,$0b,$94 
      dc.b      $0b,$98,$1d,'d',$0b,$93,'3b'
      dc.b      $0b,'Žm',$88,$0b,$89,'k',$d2
      dc.b      $0b,$84,'Ž:',$0b,$7f,$b4,$bb
      dc.b      $0b,'z',$df,'o',$0b,'v',$0d,$f2 
      dc.b      $0b,'q@',$9f,$0b,'lwp'
      dc.b      $0b,'g',$b2,$00,$0b,'b',$f0,$ab 
      dc.b      $0b,'^3l',$0b,'yy',$dd
      dc.b      $0b,'t',$c4,'y',$0b,'p',$12,$bd 
      dc.b      $0b,'ke',$02,$0b,'f',$bb,'$'
      dc.b      $0b,'b',$15,$1f,$0b,'=r',$ed
      dc.b      $0b,'8',$d4,$8a,$0b,'49',$f1
      dc.b      $0b,'/',$a3,$1e,$0b,'+',$10,$0b 
      dc.b      $0b,'&',$80,$b5,$0b,'!',$f5,$16 
      dc.b      $0b,$1d,'m+',$0b,$18,$e8,$ef
      dc.b      $0b,$14,'h\',$0b,$0f,$eb,'o'
      dc.b      $0b,$0b,'r$',$0b,$06,$fc,'v'
      dc.b      $0b,$02,$8a,'`',$0a,$fe,$1b,$de 
      dc.b      $0a,$f9,$b0,$ec,$0a,$f5,'i',$86 
      dc.b      $0a,$f0,$e5,$a7,$0a,$ec,$85,'k' 
      dc.b      $0a,$e8,'(n',$0a,$e3,$cf,$0c
      dc.b      $0a,$df,'y ',$0a,$db,'&',$a7
      dc.b      $0a,$d6,$d7,$9c,$0a,$d2,$8b,$fb 
      dc.b      $0a,$ce,'c',$c0,$0a,$c9,$fe,$e8 
      dc.b      $0a,$c5,$bd,'n',$0a,$c1,$7f,'n' 
      dc.b      $0a,$bd,'d',$84,$0a,$b9,$0d,$0c 
      dc.b      $0a,$b4,$d8,$e3,$0a,$b0,$a8,$04 
      dc.b      $0a,$ac,'zl',$0a,$a8,'p',$17
      dc.b      $0a,$a4,')',$01,$0a,$a0,$05,'&' 
      dc.b      $0a,$9b,$e4,$82,$0a,$97,$c7,$12 
      dc.b      $0a,$93,$ac,$d2,$0a,$8f,$95,$bf 
      dc.b      $0a,$8b,$81,$d4,$0a,$87,'q',$0e 
      dc.b      $0a,$83,'ci',$0a,$7f,'x',$e2
      dc.b      $0a,'{qu',$0a,'wm',$1e
      dc.b      $0a,'sk',$db,$0a,'om',$a7 
      dc.b      $0a,'kr',$7f,$0a,'gz`'
      dc.b      $0a,'cee',$0a,'_s,' 
      dc.b      $0a,'[',$84,$12,$0a,'w',$97,$f2 
      dc.b      $0a,'s',$ae,$ca,$0a,'o',$c8,$95 
      dc.b      $0a,'k',$e5,'q',$0a,'h',$04,$fb 
      dc.b      $0a,'d',$27,$8f,$0a,'@m',$09
      dc.b      $0a,'<ug',$0a,'8',$a0,$a6 
      dc.b      $0a,'4',$ce,$c1,$0a,'0',$ff,$b6 
      dc.b      $0a,'-3',$82,$0a,')j"'
      dc.b      $0a,'%',$a3,$92,$0a,'!',$df,$cf 
      dc.b      $0a,$1e,$1e,$d6,$0a,$1a,'`',$a4 
      dc.b      $0a,$16,$a5,'6',$0a,$12,$ec,$89 
      dc.b      $0a,$0f,'6',$9a,$0a,$0b,$83,'e' 
      dc.b      $0a,$07,$d2,$e8,$0a,$04,'%!'
      dc.b      $0a,$00,'z',$0b,$09,$fc,$d1,$a3 
      dc.b      $09,$f9,'+',$e8,$09,$f5,$88,$d6 
      dc.b      $09,$f1,$e8,'j',$09,$ee,'j',$a1 
      dc.b      $09,$ea,$af,'y',$09,$e7,$16,$ed 
      dc.b      $09,$e3,$80,$fd,$09,$df,$ed,$a5 
      dc.b      $09,$dc,'\',$e1,$09,$d8,$ce,$b0 
      dc.b      $09,$d5,'c',$0e,$09,$d1,$b9,$f8 
      dc.b      $09,$ce,'3m',$09,$ca,$af,'i'
      dc.b      $09,$c7,'-',$e9,$09,$c3,$ae,$ec 
      dc.b      $09,$c0,'2m',$09,$bc,$b8,'k'
      dc.b      $09,$b9,'@',$e2,$09,$b5,$cb,$d1 
      dc.b      $09,$b2,'y4',$09,$ae,$e9,$09
      dc.b      $09,$ab,'{m',$09,$a8,$0f,$fe
      dc.b      $09,$a4,$a7,$19,$09,$a1,'@',$9c 
      dc.b      $09,$9d,$dc,$84,$09,'šz',$ce
      dc.b      $09,$97,$1b,'y',$09,$93,$be,$81 
      dc.b      $09,$90,'c',$e4,$09,$8d,$0b,$9f 
      dc.b      $09,$89,$b5,$b1,$09,$86,'b',$16 
      dc.b      $09,$83,$10,$cc,$09,$7f,$c1,$d2 
      dc.b      $09,'|u#',$09,'y*',$bf
      dc.b      $09,'u',$e2,$a2,$09,'r',$9c,$cb 
      dc.b      $09,'oy7',$09,'l',$17,$e3 
      dc.b      $09,'h',$d8,$cd,$09,'e',$9b,$f3 
      dc.b      $09,'bas',$09,'_(',$ea
      dc.b      $09,'[',$f2,$b7,$09,'x',$be,$b6 
      dc.b      $09,'u',$8c,$e5,$09,'r]c' 
      dc.b      $09,'o/',$cd,$09,'l',$04,$81
      dc.b      $09,'h',$db,'\',$09,'e',$b4,']' 
      dc.b      $09,'b',$8f,$81,$09,'?l',$c7
      dc.b      $09,'<l+',$09,'9-',$ac
      dc.b      $09,'6',$11,'g',$09,'2',$f6,$fc 
      dc.b      $09,'/',$de,$c6,$09,',',$c8,$a5 
      dc.b      $09,')',$b4,$96,$09,'&',$a2,$97 
      dc.b      $09,'#',$92,$a6,$09,' ',$84,$c1 
      dc.b      $09,$1d,'x',$e7,$09,$1a,'o',$14 
      dc.b      $09,$17,'gg',$09,$14,'a}' 
      dc.b      $09,$11,']',$b6,$09,$0e,'[',$ee 
      dc.b      $09,$0b,'\%',$09,$08,'^w' 
      dc.b      $09,$05,'b',$83,$09,$02,'h',$a7 
      dc.b      $08,$ff,'p',$c1,$08,$fc,'z',$d0 
      dc.b      $08,$f9,$86,$d0,$08,$f6,$94,$c1 
      dc.b      $08,$f3,$a4,$a0,$08,$f0,$b6,'k' 
      dc.b      $08,$ed,$ca,'!',$08,$ea,$df,$c0 
      dc.b      $08,$e7,$f7,'e',$08,$e5,$10,$af 
      dc.b      $08,$e2,'+',$fd,$08,$df,'i,'
      dc.b      $08,$dc,'h:',$08,$d9,$89,'&'
      dc.b      $08,$d6,$ab,$ed,$08,$d3,$d0,$8f 
      dc.b      $08,$d0,$f7,$09,$08,$ce,$1f,'y' 
      dc.b      $08,$cb,'i~',$08,$c8,'uv' 
      dc.b      $08,$c5,$a3,'?',$08,$c2,$d2,$d7 
      dc.b      $08,$c0,$04,'=',$08,$bd,'7o'
      dc.b      $08,$ba,'lk',$08,$b7,$a3,'/'
      dc.b      $08,$b4,$db,$bb,$08,$b2,$16,$0b 
      dc.b      $08,$af,'r',$1f,$08,$ac,$8f,$f4 
      dc.b      $08,$a9,$cf,$8a,$08,$a7,$10,$dd 
      dc.b      $08,$a4,'s',$ee,$08,$a1,$98,$b9 
      dc.b      $08,$9e,$df,'>',$08,$9c,$27,'{' 
      dc.b      $08,$99,'qn',$08,$96,$bd,$16
      dc.b      $08,$94,$0a,'p',$08,$91,'y|'
      dc.b      $08,$8e,$aa,'7',$08,$8b,$fc,$a1 
      dc.b      $08,$89,'p',$b7,$08,$86,$a6,'y' 
      dc.b      $08,$83,$fd,$e4,$08,$81,'v',$f6 
      dc.b      $08,'~',$b1,$af,$08,'|',$0e,$0d 
      dc.b      $08,'yl',$0f,$08,'v',$cb,$b2
      dc.b      $08,'t,',$f5,$08,'q',$8f,$d7
      dc.b      $08,'n',$f4,'v',$08,'lzq' 
      dc.b      $08,'i',$c2,'&',$08,'g+u' 
      dc.b      $08,'d',$96,'z',$08,'b',$02,$d5 
      dc.b      $08,'_p',$e5,$08,'\',$e0,$88
      dc.b      $08,'zq',$bc,$08,'w',$c4,$80
      dc.b      $08,'u8',$d3,$08,'r',$ae,$b3
      dc.b      $08,'p&',$1f,$08,'m',$9f,$15
      dc.b      $08,'k',$19,$94,$08,'h',$95,$9b 
      dc.b      $08,'f',$13,'(',$08,'c',$92,':' 
      dc.b      $08,'a',$12,$cf,$08,'>',$94,$e6 
      dc.b      $08,'<',$18,'~',$08,'9',$9d,$96 
      dc.b      $08,'7$+',$08,'4',$ac,'=' 
      dc.b      $08,'25',$ca,$08,'/',$c0,$d1
      dc.b      $08,'-mq',$08,'*',$db,'i' 
      dc.b      $08,'(j',$b6,$08,'%',$fb,$98
      dc.b      $08,'#',$8d,$ed,$08,'!!',$b5
      dc.b      $08,$1e,$b6,$ed,$08,$1c,'m',$95 
      dc.b      $08,$19,$e5,$ab,$08,$17,$7f,'.' 
      dc.b      $08,$15,$1a,$1d,$08,$12,$b6,'v' 
      dc.b      '>',$1e,'*',$bb,'p',$10,'.;'
      dc.b      'p',$08,$0f,$cd,$00,$00,'ns'
l00bd:dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$00,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$02,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$02,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$03,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$04,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$05,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$06,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$06,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$06,$09,$03,$0a,$00,$00,$00 
      dc.b      $08,$07,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$07,$09,$02,$0a,$00,$00,$00 
      dc.b      $08,$07,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$07,$09,$04,$0a,$00,$01,$00 
      dc.b      $08,$08,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$08,$09,$02,$0a,$00,$00,$00 
      dc.b      $08,$08,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$08,$09,$04,$0a,$00,$01,$00 
      dc.b      $08,$09,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$09,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$09,$09,$03,$0a,$00,$00,$00 
      dc.b      $08,$09,$09,$04,$0a,$00,$00,$00 
      dc.b      $08,$09,$09,$05,$0a,$00,$00,$00 
      dc.b      $08,$09,$09,$05,$0a,$00,$01,$00 
      dc.b      $08,$09,$09,$05,$0a,$00,$03,$00 
      dc.b      $08,$09,$09,$06,$0a,$00,$02,$00 
      dc.b      $08,$09,$09,$06,$0a,$00,$03,$00 
      dc.b      $08,$0a,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$0a,$09,$03,$0a,$00,$00,$00 
      dc.b      $08,$0a,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$0a,$09,$05,$0a,$00,$00,$00 
      dc.b      $08,$0a,$09,$05,$0a,$00,$02,$00 
      dc.b      $08,$0a,$09,$05,$0a,$00,$03,$00 
      dc.b      $08,$0a,$09,$06,$0a,$00,$02,$00 
      dc.b      $08,$0a,$09,$07,$0a,$00,$00,$00 
      dc.b      $08,$0a,$09,$07,$0a,$00,$02,$00 
      dc.b      $08,$0b,$09,$01,$0a,$00,$00,$00 
      dc.b      $08,$0b,$09,$03,$0a,$00,$00,$00 
      dc.b      $08,$0b,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$0b,$09,$04,$0a,$00,$01,$00 
      dc.b      $08,$0b,$09,$05,$0a,$00,$01,$00 
      dc.b      $08,$0b,$09,$05,$0a,$00,$03,$00 
      dc.b      $08,$0b,$09,$06,$0a,$00,$02,$00 
      dc.b      $08,$0b,$09,$06,$0a,$00,$03,$00 
      dc.b      $08,$0b,$09,$07,$0a,$00,$02,$00 
      dc.b      $08,$0b,$09,$07,$0a,$00,$04,$00 
      dc.b      $08,$0b,$09,$08,$0a,$00,$00,$00 
      dc.b      $08,$0b,$09,$08,$0a,$00,$01,$00 
      dc.b      $08,$0b,$09,$08,$0a,$00,$03,$00 
      dc.b      $08,$0b,$09,$08,$0a,$00,$04,$00 
      dc.b      $08,$0b,$09,$08,$0a,$00,$05,$00 
      dc.b      $08,$0b,$09,$09,$0a,$00,$01,$00 
      dc.b      $08,$0b,$09,$09,$0a,$00,$03,$00 
      dc.b      $08,$0b,$09,$09,$0a,$00,$04,$00 
      dc.b      $08,$0c,$09,$02,$0a,$00,$00,$00 
      dc.b      $08,$0c,$09,$02,$0a,$00,$01,$00 
      dc.b      $08,$0c,$09,$04,$0a,$00,$01,$00 
      dc.b      $08,$0c,$09,$05,$0a,$00,$01,$00 
      dc.b      $08,$0c,$09,$05,$0a,$00,$03,$00 
      dc.b      $08,$0c,$09,$06,$0a,$00,$02,$00 
      dc.b      $08,$0c,$09,$07,$0a,$00,$00,$00 
      dc.b      $08,$0c,$09,$07,$0a,$00,$02,$00 
      dc.b      $08,$0c,$09,$07,$0a,$00,$04,$00 
      dc.b      $08,$0c,$09,$07,$0a,$00,$05,$00 
      dc.b      $08,$0c,$09,$08,$0a,$00,$02,$00 
      dc.b      $08,$0c,$09,$08,$0a,$00,$04,$00 
      dc.b      $08,$0c,$09,$08,$0a,$00,$05,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$02,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$04,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$05,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$06,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$07,$00 
      dc.b      $08,$0c,$09,$09,$0a,$00,$07,$00 
      dc.b      $08,$0c,$09,$0a,$0a,$00,$00,$00 
      dc.b      $08,$0c,$09,$0a,$0a,$00,$03,$00 
      dc.b      $08,$0d,$09,$02,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$0d,$09,$05,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$05,$0a,$00,$02,$00 
      dc.b      $08,$0d,$09,$06,$0a,$00,$01,$00 
      dc.b      $08,$0d,$09,$07,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$07,$0a,$00,$02,$00 
      dc.b      $08,$0d,$09,$07,$0a,$00,$04,$00 
      dc.b      $08,$0d,$09,$07,$0a,$00,$05,$00 
      dc.b      $08,$0d,$09,$08,$0a,$00,$02,$00 
      dc.b      $08,$0d,$09,$08,$0a,$00,$04,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$01,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$04,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$05,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$06,$00 
      dc.b      $08,$0d,$09,$09,$0a,$00,$07,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$00,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$03,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$05,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$06,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$07,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$08,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$08,$00 
      dc.b      $08,$0d,$09,$0a,$0a,$00,$08,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$01,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$04,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$06,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$07,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$07,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$08,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$08,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$09,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$09,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$09,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0d,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0d,$09,$0c,$0a,$00,$02,$00 
      dc.b      $08,$0d,$09,$0c,$0a,$00,$05,$00 
      dc.b      $08,$0d,$09,$0c,$0a,$00,$06,$00 
      dc.b      $08,$0e,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$03,$0a,$00,$01,$00 
      dc.b      $08,$0e,$09,$05,$0a,$00,$02,$00 
      dc.b      $08,$0e,$09,$06,$0a,$00,$02,$00 
      dc.b      $08,$0e,$09,$07,$0a,$00,$02,$00 
      dc.b      $08,$0e,$09,$07,$0a,$00,$05,$00 
      dc.b      $08,$0e,$09,$08,$0a,$00,$01,$00 
      dc.b      $08,$0e,$09,$08,$0a,$00,$05,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$03,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$06,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$09,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$02,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$06,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0a,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$03,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$08,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0e,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$07,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$09,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0a,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0e,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$00,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$07,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$07,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$09,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0a,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0a,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0a,$0a,$00,$09,$00 
      dc.b      $08,$0f,$09,$0b,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0b,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0b,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0f,$09,$0b,$0a,$00,$0a,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$09,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$09,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0a,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0c,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0b,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0d,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$00,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0c,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
      dc.b      $08,$0f,$09,$0e,$0a,$00,$0d,$00 
l00be:dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$08,$04,$10,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$18 
      dc.b      $04,$18,$04,$18,$04,$18,$04,$18 
      dc.b      $04,$18,$04,$18,$04,$18,$04,$18 
      dc.b      $04,$18,$04,' ',$04,' ',$04,' ' 
      dc.b      $04,' ',$04,' ',$04,' ',$04,' ' 
      dc.b      $04,' ',$04,' ',$04,' ',$04,'(' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'0',$04,'0',$04,'0' 
      dc.b      $03,$c8,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d0,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$e8 
      dc.b      $03,$f0,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f8,$03,$f8 
      dc.b      $03,$f8,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $03,$f8,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,$18,$04,$18,$04,$18,$04,$18 
      dc.b      $04,$18,$04,' ',$04,' ',$04,' ' 
      dc.b      $04,' ',$04,' ',$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'0' 
      dc.b      $04,'0',$04,'0',$04,'0',$04,'0' 
      dc.b      $04,'0',$04,'0',$04,'0',$04,'8' 
      dc.b      $04,'8',$04,'8',$04,'8',$04,'8' 
      dc.b      $04,'8',$04,'8',$04,'@',$04,'@' 
      dc.b      $04,'@',$04,'@',$04,'@',$04,'@' 
      dc.b      $03,$b8,$03,$b8,$03,$b8,$03,$b8 
      dc.b      $03,$b8,$03,$b8,$03,$b8,$03,$c0 
      dc.b      $03,$c0,$03,$c0,$03,$c0,$03,$c0 
      dc.b      $03,$c0,$03,$c0,$03,$c8,$03,$c8 
      dc.b      $03,$c8,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$c8,$03,$c8,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $03,$f8,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$18,$04,$18,$04,$18 
      dc.b      $04,$18,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,' ',$04,' ',$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'(',$04,'0',$04,'0' 
      dc.b      $04,'0',$04,'0',$04,'0',$04,'8' 
      dc.b      $04,'8',$04,'8',$04,'8',$04,'8' 
      dc.b      $04,'8',$04,'@',$04,'@',$04,'@' 
      dc.b      $04,'@',$04,'@',$04,'@',$04,'h' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $03,$a0,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$a8,$03,$a8,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b0 
      dc.b      $03,$b0,$03,$b0,$03,$b8,$03,$b8 
      dc.b      $03,$b8,$03,$b8,$03,$b8,$03,$b8 
      dc.b      $03,$c0,$03,$c0,$03,$c0,$03,$c0 
      dc.b      $03,$c0,$03,$c0,$03,$c8,$03,$c8 
      dc.b      $03,$c8,$03,$c8,$03,$c8,$03,$d0 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e0 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $03,$f8,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$00,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,$18,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,' ',$04,' ',$04,' ',$04,'(' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'8',$04,'8' 
      dc.b      $04,'8',$04,'@',$04,'@',$04,'@' 
      dc.b      $04,'@',$04,'@',$04,'h',$04,'h' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,'`' 
      dc.b      $04,'`',$04,'`',$04,'`',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'h' 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$98,$03,$98 
      dc.b      $03,$98,$03,$98,$03,$a0,$03,$a0 
      dc.b      $03,$a0,$03,$a0,$03,$a8,$03,$a8 
      dc.b      $03,$a8,$03,$a8,$03,$a8,$03,$b0 
      dc.b      $03,$b0,$03,$b0,$03,$b0,$03,$b8 
      dc.b      $03,$b8,$03,$b8,$03,$b8,$03,$b8 
      dc.b      $03,$c0,$03,$c0,$03,$c0,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d0,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f8,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$10 
      dc.b      $04,$18,$04,$18,$04,$18,$04,$18 
      dc.b      $04,' ',$04,' ',$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'8',$04,'8' 
      dc.b      $04,'@',$04,'@',$04,'@',$04,'@' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,'x' 
      dc.b      $04,'`',$04,'`',$04,'`',$04,'h' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,$80 
      dc.b      $03,'x',$03,'x',$03,$80,$03,$80 
      dc.b      $03,$80,$03,$80,$03,$88,$03,$88 
      dc.b      $03,$88,$03,$88,$03,$90,$03,$90 
      dc.b      $03,$90,$03,$90,$03,$98,$03,$98 
      dc.b      $03,$98,$03,$a0,$03,$a0,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$a8,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b0 
      dc.b      $03,$b0,$03,$b8,$03,$b8,$03,$b8 
      dc.b      $03,$b8,$03,$c0,$03,$c0,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$d8,$03,$e0,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e8,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$10,$04,$18 
      dc.b      $04,$18,$04,$18,$04,' ',$04,' ' 
      dc.b      $04,' ',$04,' ',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'0',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'8',$04,'8' 
      dc.b      $04,'@',$04,'@',$04,'@',$04,'h' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'x',$04,'`',$04,'`',$04,'`' 
      dc.b      $04,'`',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,$80 
      dc.b      $04,$80,$04,$80,$04,$88,$04,$88 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$90 
      dc.b      $03,'h',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,'x',$03,$80,$03,$80 
      dc.b      $03,$80,$03,$88,$03,$88,$03,$88 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$90 
      dc.b      $03,$98,$03,$98,$03,$98,$03,$98 
      dc.b      $03,$a0,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$a8,$03,$b0,$03,$b0 
      dc.b      $03,$b0,$03,$b0,$03,$b8,$03,$b8 
      dc.b      $03,$b8,$03,$c0,$03,$c0,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$d8,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e8,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$00 
      dc.b      $04,$08,$04,$08,$04,$08,$04,$10 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,$18,$04,' ',$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'(',$04,'0' 
      dc.b      $04,'0',$04,'0',$04,'8',$04,'8' 
      dc.b      $04,'8',$04,'@',$04,'@',$04,'@' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'x',$04,'`',$04,'`',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'x',$04,$80,$04,$80,$04,$80 
      dc.b      $04,$88,$04,$88,$04,$88,$04,$90 
      dc.b      $04,$90,$04,$90,$04,$90,$04,$98 
      dc.b      $04,$98,$04,$98,$04,$a0,$04,$a0 
      dc.b      $03,'x',$03,'x',$03,'x',$03,'`' 
      dc.b      $03,'`',$03,'`',$03,'h',$03,'h' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'x',$03,'x' 
      dc.b      $03,$80,$03,$80,$03,$80,$03,$88 
      dc.b      $03,$88,$03,$88,$03,$90,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$98,$03,$98 
      dc.b      $03,$a0,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$a8,$03,$b0,$03,$b0 
      dc.b      $03,$b0,$03,$b8,$03,$b8,$03,$b8 
      dc.b      $03,$c0,$03,$c0,$03,$c0,$03,$c8 
      dc.b      $03,$c8,$03,$c8,$03,$d0,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$d8 
      dc.b      $03,$e0,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$e8,$03,$f0,$03,$f0 
      dc.b      $03,$f0,$03,$f8,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$10,$04,$10 
      dc.b      $04,$10,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,' ',$04,' ',$04,'(',$04,'(' 
      dc.b      $04,'(',$04,'0',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'@',$04,'@' 
      dc.b      $04,'@',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,'`',$04,'`',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,$80,$04,$80,$04,$80,$04,$88 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$90,$04,$98,$04,$98,$04,$a0 
      dc.b      $04,$a0,$04,$a0,$04,$a8,$04,$a8 
      dc.b      $04,$a8,$04,$b0,$04,$b0,$04,$b8 
      dc.b      $03,'@',$03,'@',$03,'h',$03,'h' 
      dc.b      $03,'p',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,'x',$03,'`',$03,'`' 
      dc.b      $03,'h',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'p',$03,'x',$03,'x' 
      dc.b      $03,'x',$03,$80,$03,$80,$03,$88 
      dc.b      $03,$88,$03,$88,$03,$90,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$98,$03,$98 
      dc.b      $03,$a0,$03,$a0,$03,$a8,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b0 
      dc.b      $03,$b8,$03,$b8,$03,$b8,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$c8 
      dc.b      $03,$d0,$03,$d0,$03,$d0,$03,$d8 
      dc.b      $03,$d8,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e8,$03,$e8,$03,$e8,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$08 
      dc.b      $04,$08,$04,$08,$04,$10,$04,$10 
      dc.b      $04,$18,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,' ',$04,'(',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'8',$04,'8' 
      dc.b      $04,'8',$04,'@',$04,'@',$04,'h' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,'`' 
      dc.b      $04,'`',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'x',$04,$80,$04,$80,$04,$88 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$98,$04,$98,$04,$a0 
      dc.b      $04,$a0,$04,$a8,$04,$a8,$04,$a8 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$b8 
      dc.b      $04,$b8,$04,$c0,$04,$c0,$04,$c8 
      dc.b      $03,'0',$03,'0',$03,'8',$03,'8' 
      dc.b      $03,'@',$03,'@',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,'`',$03,'`' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'p',$03,'x',$03,'x' 
      dc.b      $03,$80,$03,$80,$03,$80,$03,$88 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$90 
      dc.b      $03,$98,$03,$98,$03,$a0,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$a8,$03,$b0 
      dc.b      $03,$b0,$03,$b0,$03,$b8,$03,$b8 
      dc.b      $03,$c0,$03,$c0,$03,$c0,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d0 
      dc.b      $03,$d8,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e0,$03,$e8,$03,$e8,$03,$f0 
      dc.b      $03,$f0,$03,$f0,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$08 
      dc.b      $04,$08,$04,$10,$04,$10,$04,$18 
      dc.b      $04,$18,$04,$18,$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'0',$04,'0' 
      dc.b      $04,'0',$04,'8',$04,'8',$04,'@' 
      dc.b      $04,'@',$04,'h',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'`',$04,'`',$04,'`',$04,'h' 
      dc.b      $04,'h',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,$80,$04,$80,$04,$80 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$98,$04,$98,$04,$a0 
      dc.b      $04,$a0,$04,$a8,$04,$a8,$04,$b0 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$b8 
      dc.b      $04,$c0,$04,$c0,$04,$c8,$04,$c8 
      dc.b      $04,$c8,$04,$d0,$04,$d0,$04,$d8 
      dc.b      $03,' ',$03,' ',$03,'(',$03,'(' 
      dc.b      $03,'0',$03,'0',$03,'0',$03,'8' 
      dc.b      $03,'8',$03,'@',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,'`',$03,'`' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'x',$03,'x' 
      dc.b      $03,$80,$03,$80,$03,$88,$03,$88 
      dc.b      $03,$90,$03,$90,$03,$98,$03,$98 
      dc.b      $03,$98,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b0 
      dc.b      $03,$b8,$03,$b8,$03,$c0,$03,$c0 
      dc.b      $03,$c8,$03,$c8,$03,$c8,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$e0 
      dc.b      $03,$e0,$03,$e0,$03,$e8,$03,$e8 
      dc.b      $03,$f0,$03,$f0,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$00,$04,$08 
      dc.b      $04,$08,$04,$10,$04,$10,$04,$18 
      dc.b      $04,$18,$04,' ',$04,' ',$04,'(' 
      dc.b      $04,'(',$04,'0',$04,'0',$04,'8' 
      dc.b      $04,'8',$04,'8',$04,'@',$04,'@' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'`',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'x',$04,$80 
      dc.b      $04,$80,$04,$88,$04,$88,$04,$90 
      dc.b      $04,$90,$04,$98,$04,$98,$04,$a0 
      dc.b      $04,$a0,$04,$a8,$04,$a8,$04,$b0 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$b8 
      dc.b      $04,$c0,$04,$c0,$04,$c8,$04,$c8 
      dc.b      $04,$d0,$04,$d0,$04,$d8,$04,$d8 
      dc.b      $04,$e0,$04,$e0,$04,$e8,$04,$e8 
      dc.b      $03,$08,$03,$10,$03,$10,$03,$18 
      dc.b      $03,$18,$03,' ',$03,' ',$03,'(' 
      dc.b      $03,'(',$03,'0',$03,'0',$03,'8' 
      dc.b      $03,'8',$03,'@',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,'`',$03,'`' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,$80,$03,$80 
      dc.b      $03,$80,$03,$88,$03,$88,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$98,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$a8,$03,$b0 
      dc.b      $03,$b0,$03,$b8,$03,$b8,$03,$c0 
      dc.b      $03,$c0,$03,$c0,$03,$c8,$03,$c8 
      dc.b      $03,$d0,$03,$d0,$03,$d8,$03,$d8 
      dc.b      $03,$e0,$03,$e0,$03,$e8,$03,$e8 
      dc.b      $03,$f0,$03,$f0,$03,$f8,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,' ',$04,' ',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'8',$04,'8' 
      dc.b      $04,'@',$04,'@',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'`',$04,'`',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,$80,$04,$80,$04,$88,$04,$88 
      dc.b      $04,$90,$04,$90,$04,$98,$04,$98 
      dc.b      $04,$a0,$04,$a0,$04,$a8,$04,$a8 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$b8 
      dc.b      $04,$c0,$04,$c0,$04,$c8,$04,$c8 
      dc.b      $04,$d0,$04,$d0,$04,$d8,$04,$d8 
      dc.b      $04,$e0,$04,$e0,$04,$e8,$04,$e8 
      dc.b      $04,$f0,$04,$f0,$04,$f8,$04,$f8 
      dc.b      $02,$f8,$03,$00,$03,$00,$03,$08 
      dc.b      $03,$08,$03,$10,$03,$10,$03,$18 
      dc.b      $03,$18,$03,' ',$03,' ',$03,'(' 
      dc.b      $03,'(',$03,'0',$03,'0',$03,'8' 
      dc.b      $03,'8',$03,'@',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,'`',$03,'`',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,$80,$03,$80,$03,$88 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$98 
      dc.b      $03,$98,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b8 
      dc.b      $03,$b8,$03,$c0,$03,$c0,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d8 
      dc.b      $03,$d8,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,' ',$04,' ',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'@',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'x',$04,'x',$04,'`' 
      dc.b      $04,'`',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'p',$04,'x',$04,$80,$04,$80 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$98,$04,$a0,$04,$a0 
      dc.b      $04,$a8,$04,$a8,$04,$b0,$04,$b0 
      dc.b      $04,$b8,$04,$c0,$04,$c0,$04,$c8 
      dc.b      $04,$c8,$04,$d0,$04,$d0,$04,$d8 
      dc.b      $04,$d8,$04,$e0,$04,$e0,$04,$e8 
      dc.b      $04,$e8,$04,$f0,$04,$f0,$04,$f8 
      dc.b      $05,$00,$05,$00,$05,$08,$05,$08 
      dc.b      $02,$e8,$02,$f0,$02,$f0,$02,$f8 
      dc.b      $02,$f8,$03,$00,$03,$08,$03,$08 
      dc.b      $03,$10,$03,$10,$03,$18,$03,$18 
      dc.b      $03,' ',$03,' ',$03,'(',$03,'(' 
      dc.b      $03,'0',$03,'0',$03,'8',$03,'8' 
      dc.b      $03,'@',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'x',$03,'`' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'x',$03,$80 
      dc.b      $03,$88,$03,$88,$03,$90,$03,$90 
      dc.b      $03,$98,$03,$98,$03,$a0,$03,$a0 
      dc.b      $03,$a8,$03,$a8,$03,$b0,$03,$b0 
      dc.b      $03,$b8,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d8 
      dc.b      $03,$d8,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$10,$04,$18,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'(',$04,'0' 
      dc.b      $04,'0',$04,'8',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'`',$04,'h' 
      dc.b      $04,'h',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$88 
      dc.b      $04,$90,$04,$90,$04,$98,$04,$98 
      dc.b      $04,$a0,$04,$a0,$04,$a8,$04,$b0 
      dc.b      $04,$b0,$04,$b8,$04,$b8,$04,$c0 
      dc.b      $04,$c0,$04,$c8,$04,$d0,$04,$d0 
      dc.b      $04,$d8,$04,$d8,$04,$e0,$04,$e0 
      dc.b      $04,$e8,$04,$f0,$04,$f0,$04,$f8 
      dc.b      $04,$f8,$05,$00,$05,$00,$05,$08 
      dc.b      $05,$10,$05,$10,$05,$18,$05,$18 
      dc.b      $02,$d8,$02,$e0,$02,$e0,$02,$e8 
      dc.b      $02,$e8,$02,$f0,$02,$f8,$02,$f8 
      dc.b      $03,$00,$03,$00,$03,$08,$03,$08 
      dc.b      $03,$10,$03,$18,$03,$18,$03,' ' 
      dc.b      $03,' ',$03,'(',$03,'(',$03,'0' 
      dc.b      $03,'8',$03,'8',$03,'@',$03,'@' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,'`',$03,'`',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$80,$03,$88,$03,$88 
      dc.b      $03,$90,$03,$90,$03,$98,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$a8,$03,$b0 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$c0 
      dc.b      $03,$c8,$03,$c8,$03,$d0,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e0,$03,$e8 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'@',$04,'h' 
      dc.b      $04,'h',$04,'p',$04,'p',$04,'x' 
      dc.b      $04,'`',$04,'`',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'x',$04,$80 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$a8,$04,$b0,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c0,$04,$c8,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$d8,$04,$e0 
      dc.b      $04,$e0,$04,$e8,$04,$f0,$04,$f0 
      dc.b      $04,$f8,$04,$f8,$05,$00,$05,$08 
      dc.b      $05,$08,$05,$10,$05,$10,$05,$18 
      dc.b      $05,' ',$05,' ',$05,'(',$05,'(' 
      dc.b      $02,$c8,$02,$d0,$02,$d0,$02,$d8 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$e8 
      dc.b      $02,$f0,$02,$f0,$02,$f8,$03,$00 
      dc.b      $03,$00,$03,$08,$03,$08,$03,$10 
      dc.b      $03,$18,$03,$18,$03,' ',$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'0',$03,'8' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'h' 
      dc.b      $03,'p',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,$80,$03,$80 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$98 
      dc.b      $03,$98,$03,$a0,$03,$a8,$03,$a8 
      dc.b      $03,$b0,$03,$b0,$03,$b8,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'0',$04,'0' 
      dc.b      $04,'8',$04,'@',$04,'@',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,'`' 
      dc.b      $04,'`',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,$80,$04,$88 
      dc.b      $04,$88,$04,$90,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$a0,$04,$a8,$04,$b0 
      dc.b      $04,$b0,$04,$b8,$04,$c0,$04,$c0 
      dc.b      $04,$c8,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$d8,$04,$e0,$04,$e8,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$04,$f8,$05,$00 
      dc.b      $05,$00,$05,$08,$05,$10,$05,$10 
      dc.b      $05,$18,$05,' ',$05,' ',$05,'(' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'8' 
      dc.b      $02,$b8,$02,$c0,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d0,$02,$d8,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$e8,$02,$f0 
      dc.b      $02,$f8,$02,$f8,$03,$00,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$10,$03,$18 
      dc.b      $03,' ',$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'0',$03,'8',$03,'8',$03,'@' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'h' 
      dc.b      $03,'p',$03,'p',$03,'x',$03,$80 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$90 
      dc.b      $03,$98,$03,$98,$03,$a0,$03,$a8 
      dc.b      $03,$a8,$03,$b0,$03,$b8,$03,$b8 
      dc.b      $03,$c0,$03,$c8,$03,$c8,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$08 
      dc.b      $04,$10,$04,$18,$04,$18,$04,' ' 
      dc.b      $04,'(',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'8',$04,'@',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'x',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$88 
      dc.b      $04,$90,$04,$98,$04,$98,$04,$a0 
      dc.b      $04,$a8,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$b8,$04,$c0,$04,$c8,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$e8,$04,$f0,$04,$f8 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$08 
      dc.b      $05,$10,$05,$18,$05,$18,$05,' ' 
      dc.b      $05,'(',$05,'(',$05,'0',$05,'8' 
      dc.b      $05,'8',$05,'@',$05,'h',$05,'h' 
      dc.b      $02,$a8,$02,$b0,$02,$b0,$02,$b8 
      dc.b      $02,$c0,$02,$c0,$02,$c8,$02,$d0 
      dc.b      $02,$d0,$02,$d8,$02,$e0,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$00,$03,$08,$03,$10 
      dc.b      $03,$10,$03,$18,$03,' ',$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'0',$03,'8' 
      dc.b      $03,'@',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'`',$03,'`' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$80,$03,$88,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$a0,$03,$a0 
      dc.b      $03,$a8,$03,$b0,$03,$b0,$03,$b8 
      dc.b      $03,$c0,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d0,$03,$d8,$03,$e0,$03,$e0 
      dc.b      $03,$e8,$03,$f0,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$10,$04,$18,$04,' ',$04,' ' 
      dc.b      $04,'(',$04,'0',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'h',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'`',$04,'h' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,$80 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$a0,$04,$a0,$04,$a8 
      dc.b      $04,$b0,$04,$b8,$04,$b8,$04,$c0 
      dc.b      $04,$c8,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$d8,$04,$e0,$04,$e8,$04,$f0 
      dc.b      $04,$f0,$04,$f8,$05,$00,$05,$00 
      dc.b      $05,$08,$05,$10,$05,$10,$05,$18 
      dc.b      $05,' ',$05,'(',$05,'(',$05,'0' 
      dc.b      $05,'8',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,'`' 
      dc.b      $02,$98,$02,$98,$02,$a0,$02,$a8 
      dc.b      $02,$b0,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$c0,$02,$c8,$02,$d0,$02,$d0 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$e8 
      dc.b      $02,$f0,$02,$f8,$02,$f8,$03,$00 
      dc.b      $03,$08,$03,$08,$03,$10,$03,$18 
      dc.b      $03,' ',$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'0',$03,'8',$03,'@',$03,'@' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,'x' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'x',$03,$80,$03,$88 
      dc.b      $03,$90,$03,$90,$03,$98,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$b0,$03,$b0 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$c8 
      dc.b      $03,$d0,$03,$d8,$03,$d8,$03,$e0 
      dc.b      $03,$e8,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$10,$04,$18,$04,' ',$04,'(' 
      dc.b      $04,'(',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'@',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,'`',$04,'h',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,$80,$04,$80 
      dc.b      $04,$88,$04,$90,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$a8,$04,$a8,$04,$b0 
      dc.b      $04,$b8,$04,$c0,$04,$c0,$04,$c8 
      dc.b      $04,$d0,$04,$d0,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$e8,$04,$f0,$04,$f8 
      dc.b      $05,$00,$05,$00,$05,$08,$05,$10 
      dc.b      $05,$10,$05,$18,$05,' ',$05,'(' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'@',$05,'h',$05,'p',$05,'p' 
      dc.b      $05,'x',$05,'`',$05,'h',$05,'h' 
      dc.b      $02,$88,$02,$90,$02,$90,$02,$98 
      dc.b      $02,$a0,$02,$a8,$02,$a8,$02,$b0 
      dc.b      $02,$b8,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d0,$02,$d8,$02,$e0 
      dc.b      $02,$e8,$02,$e8,$02,$f0,$02,$f8 
      dc.b      $02,$f8,$03,$00,$03,$08,$03,$10 
      dc.b      $03,$10,$03,$18,$03,' ',$03,'(' 
      dc.b      $03,'(',$03,'0',$03,'8',$03,'8' 
      dc.b      $03,'@',$03,'h',$03,'p',$03,'p' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'h' 
      dc.b      $03,'p',$03,'x',$03,'x',$03,$80 
      dc.b      $03,$88,$03,$90,$03,$90,$03,$98 
      dc.b      $03,$a0,$03,$a8,$03,$a8,$03,$b0 
      dc.b      $03,$b8,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$d0,$03,$d0,$03,$d8,$03,$e0 
      dc.b      $03,$e8,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,$18,$04,' ',$04,'(' 
      dc.b      $04,'0',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,'`',$04,'`',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,$80,$04,$88 
      dc.b      $04,$90,$04,$90,$04,$98,$04,$a0 
      dc.b      $04,$a8,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$c8,$04,$d0 
      dc.b      $04,$d8,$04,$e0,$04,$e0,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$04,$f8,$05,$00 
      dc.b      $05,$08,$05,$10,$05,$10,$05,$18 
      dc.b      $05,' ',$05,'(',$05,'(',$05,'0' 
      dc.b      $05,'8',$05,'@',$05,'@',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'x',$05,'`' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,'x' 
      dc.b      $02,'x',$02,$80,$02,$80,$02,$88 
      dc.b      $02,$90,$02,$98,$02,$a0,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b8,$02,$b8 
      dc.b      $02,$c0,$02,$c8,$02,$d0,$02,$d0 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$e8 
      dc.b      $02,$f0,$02,$f8,$03,$00,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$18,$03,$18 
      dc.b      $03,' ',$03,'(',$03,'0',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,'`',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,$80 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$98 
      dc.b      $03,$98,$03,$a0,$03,$a8,$03,$b0 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$c8,$03,$d0,$03,$d8,$03,$e0 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,$18,$04,' ',$04,'(' 
      dc.b      $04,'0',$04,'8',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,'x' 
      dc.b      $04,'`',$04,'h',$04,'p',$04,'p' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$90 
      dc.b      $04,$90,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$c0 
      dc.b      $04,$c8,$04,$d0,$04,$d0,$04,$d8 
      dc.b      $04,$e0,$04,$e8,$04,$e8,$04,$f0 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$08 
      dc.b      $05,$10,$05,$18,$05,' ',$05,'(' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'`',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,$80,$05,$80,$05,$88 
      dc.b      $02,'h',$02,'p',$02,'x',$02,'x' 
      dc.b      $02,$80,$02,$88,$02,$90,$02,$98 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b0 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d0,$02,$d8,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$08,$03,$10,$03,$10 
      dc.b      $03,$18,$03,' ',$03,'(',$03,'(' 
      dc.b      $03,'0',$03,'8',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$88,$03,$88,$03,$90 
      dc.b      $03,$98,$03,$a0,$03,$a0,$03,$a8 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$c0 
      dc.b      $03,$c8,$03,$d0,$03,$d8,$03,$e0 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,' ',$04,'(' 
      dc.b      $04,'0',$04,'8',$04,'@',$04,'h' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,'`' 
      dc.b      $04,'h',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$90 
      dc.b      $04,$98,$04,$a0,$04,$a8,$04,$b0 
      dc.b      $04,$b0,$04,$b8,$04,$c0,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$f0,$04,$f8,$05,$00 
      dc.b      $05,$00,$05,$08,$05,$10,$05,$18 
      dc.b      $05,' ',$05,' ',$05,'(',$05,'0' 
      dc.b      $05,'8',$05,'@',$05,'h',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'`',$05,'h' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$90,$05,$98 
      dc.b      $02,'x',$02,'`',$02,'h',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$88 
      dc.b      $02,$90,$02,$90,$02,$98,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b0,$02,$b8 
      dc.b      $02,$c0,$02,$c8,$02,$d0,$02,$d8 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$f0 
      dc.b      $02,$f8,$02,$f8,$03,$00,$03,$08 
      dc.b      $03,$10,$03,$18,$03,' ',$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'8',$03,'@' 
      dc.b      $03,'h',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,'`',$03,'h',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,$80,$03,$88,$03,$90 
      dc.b      $03,$90,$03,$98,$03,$a0,$03,$a8 
      dc.b      $03,$b0,$03,$b0,$03,$b8,$03,$c0 
      dc.b      $03,$c8,$03,$d0,$03,$d8,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,'(',$04,'(' 
      dc.b      $04,'0',$04,'8',$04,'@',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'x',$04,'`' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,$80 
      dc.b      $04,$88,$04,$88,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$b8,$04,$c0,$04,$c8,$04,$d0 
      dc.b      $04,$d8,$04,$e0,$04,$e8,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$05,$00,$05,$08 
      dc.b      $05,$10,$05,$18,$05,$18,$05,' ' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'x',$05,$80,$05,$88,$05,$90 
      dc.b      $05,$98,$05,$a0,$05,$a0,$05,$a8 
      dc.b      $02,'h',$02,'p',$02,'x',$02,'x' 
      dc.b      $02,'`',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,$80,$02,$80,$02,$88,$02,$90 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b0 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d8,$02,$e0,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$02,$f8,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$10,$03,$18 
      dc.b      $03,' ',$03,'(',$03,'0',$03,'8' 
      dc.b      $03,'@',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'p' 
      dc.b      $03,'p',$03,'x',$03,$80,$03,$88 
      dc.b      $03,$90,$03,$98,$03,$a0,$03,$a0 
      dc.b      $03,$a8,$03,$b0,$03,$b8,$03,$c0 
      dc.b      $03,$c8,$03,$d0,$03,$d0,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,'(',$04,'0' 
      dc.b      $04,'8',$04,'8',$04,'@',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'`',$04,'h' 
      dc.b      $04,'p',$04,'p',$04,'x',$04,$80 
      dc.b      $04,$88,$04,$90,$04,$98,$04,$a0 
      dc.b      $04,$a8,$04,$b0,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$e0,$04,$e8,$04,$e8,$04,$f0 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$10 
      dc.b      $05,$18,$05,' ',$05,' ',$05,'(' 
      dc.b      $05,'0',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'`',$05,'`' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$98,$05,$98 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $02,'8',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'`',$02,'`',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$88 
      dc.b      $02,$90,$02,$98,$02,$98,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$c8,$02,$d0,$02,$d8,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$08,$03,$10,$03,$10 
      dc.b      $03,$18,$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'h' 
      dc.b      $03,'p',$03,'x',$03,'`',$03,'h' 
      dc.b      $03,'p',$03,'x',$03,$80,$03,$88 
      dc.b      $03,$88,$03,$90,$03,$98,$03,$a0 
      dc.b      $03,$a8,$03,$b0,$03,$b8,$03,$c0 
      dc.b      $03,$c0,$03,$c8,$03,$d0,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,'(',$04,'0' 
      dc.b      $04,'8',$04,'@',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'x',$04,'`',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,$80,$04,$88 
      dc.b      $04,$90,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$b0,$04,$b0,$04,$b8,$04,$c0 
      dc.b      $04,$c8,$04,$d0,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$f0,$04,$f8,$05,$00 
      dc.b      $05,$08,$05,$08,$05,$10,$05,$18 
      dc.b      $05,' ',$05,'(',$05,'0',$05,'8' 
      dc.b      $05,'@',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'`',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,$80,$05,$88,$05,$90 
      dc.b      $05,$98,$05,$a0,$05,$a8,$05,$b0 
      dc.b      $05,$b8,$05,$b8,$05,$c0,$05,$c8 
      dc.b      $02,'(',$02,'0',$02,'8',$02,'@' 
      dc.b      $02,'@',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,'`',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,$80,$02,$88,$02,$90,$02,$98 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b0 
      dc.b      $02,$b8,$02,$c0,$02,$c8,$02,$d0 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$f0 
      dc.b      $02,$f0,$02,$f8,$03,$00,$03,$08 
      dc.b      $03,$10,$03,$18,$03,' ',$03,'(' 
      dc.b      $03,'0',$03,'8',$03,'@',$03,'h' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,$80 
      dc.b      $03,$88,$03,$90,$03,$98,$03,$a0 
      dc.b      $03,$a0,$03,$a8,$03,$b0,$03,$b8 
      dc.b      $03,$c0,$03,$c8,$03,$d0,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,'(',$04,'0' 
      dc.b      $04,'8',$04,'@',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'`',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$88 
      dc.b      $04,$90,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$b0,$04,$b8,$04,$c0,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$e0,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$05,$00,$05,$08 
      dc.b      $05,$10,$05,$10,$05,$18,$05,' ' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,'`' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$98,$05,$98 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $05,$c0,$05,$c8,$05,$d0,$05,$d8 
      dc.b      $02,$18,$02,' ',$02,'(',$02,'0' 
      dc.b      $02,'8',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'`',$02,'`',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$88 
      dc.b      $02,$90,$02,$98,$02,$a0,$02,$a8 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d8,$02,$e0,$02,$e8 
      dc.b      $02,$e8,$02,$f0,$02,$f8,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$18,$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'8',$03,'@' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'h',$03,'p',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$98 
      dc.b      $03,$a0,$03,$a8,$03,$b0,$03,$b8 
      dc.b      $03,$c0,$03,$c8,$03,$d0,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$00,$04,$08,$04,$10 
      dc.b      $04,$18,$04,' ',$04,'(',$04,'0' 
      dc.b      $04,'8',$04,'@',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,'`',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$90 
      dc.b      $04,$98,$04,$a0,$04,$a8,$04,$b0 
      dc.b      $04,$b8,$04,$c0,$04,$c8,$04,$d0 
      dc.b      $04,$d8,$04,$e0,$04,$e8,$04,$f0 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$10 
      dc.b      $05,$18,$05,' ',$05,' ',$05,'(' 
      dc.b      $05,'0',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'`',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,$80,$05,$88 
      dc.b      $05,$90,$05,$98,$05,$a0,$05,$a8 
      dc.b      $05,$b0,$05,$b8,$05,$c0,$05,$c8 
      dc.b      $05,$d0,$05,$d8,$05,$e0,$05,$e8 
      dc.b      $02,$08,$02,$10,$02,$18,$02,' ' 
      dc.b      $02,'(',$02,'0',$02,'8',$02,'@' 
      dc.b      $02,'h',$02,'p',$02,'x',$02,'`' 
      dc.b      $02,'h',$02,'p',$02,'x',$02,$80 
      dc.b      $02,$88,$02,$90,$02,$98,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$c8,$02,$d0,$02,$d8,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$08,$03,$10,$03,$18 
      dc.b      $03,' ',$03,'(',$03,'0',$03,'8' 
      dc.b      $03,'@',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,'`',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$98 
      dc.b      $03,$a0,$03,$a8,$03,$b0,$03,$b8 
      dc.b      $03,$c0,$03,$c8,$03,$d0,$03,$d8 
      dc.b      $03,$e0,$03,$e8,$03,$f0,$03,$f8 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,'`',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$e0,$04,$e8,$04,$f0,$04,$f8 
      dc.b      $05,$00,$05,$08,$05,$10,$05,$18 
      dc.b      $05,' ',$05,'(',$05,'0',$05,'8' 
      dc.b      $05,'@',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,$80,$05,$88,$05,$90,$05,$98 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $05,$c0,$05,$c8,$05,$d0,$05,$d8 
      dc.b      $05,$e0,$05,$e8,$05,$f0,$05,$f8 
      dc.b      $01,$f8,$02,$00,$02,$08,$02,$10 
      dc.b      $02,$18,$02,' ',$02,'(',$02,'0' 
      dc.b      $02,'8',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'`',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,$80,$02,$88,$02,$90 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b0 
      dc.b      $02,$b8,$02,$c0,$02,$c8,$02,$d0 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$f0 
      dc.b      $02,$f8,$03,$00,$03,$08,$03,$10 
      dc.b      $03,$18,$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,$80,$03,$88,$03,$90 
      dc.b      $03,$98,$03,$a0,$03,$a8,$03,$b0 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,'`',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$e0,$04,$e8,$04,$f8,$05,$00 
      dc.b      $05,$08,$05,$10,$05,$18,$05,' ' 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,'`' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$98,$05,$a0 
      dc.b      $05,$a8,$05,$b0,$05,$b8,$05,$c0 
      dc.b      $05,$c8,$05,$d0,$05,$d8,$05,$e0 
      dc.b      $05,$f0,$05,$f8,$06,$00,$06,$08 
      dc.b      $01,$e8,$01,$f0,$01,$f8,$02,$00 
      dc.b      $02,$08,$02,$18,$02,' ',$02,'(' 
      dc.b      $02,'0',$02,'8',$02,'@',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,'`',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$88 
      dc.b      $02,$90,$02,$98,$02,$a0,$02,$a8 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$d8,$02,$e0,$02,$e8 
      dc.b      $02,$f0,$02,$f8,$03,$00,$03,$10 
      dc.b      $03,$18,$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,$80,$03,$88,$03,$90 
      dc.b      $03,$98,$03,$a0,$03,$a8,$03,$b0 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,'`',$04,'h',$04,'p',$04,'x' 
      dc.b      $04,$88,$04,$90,$04,$98,$04,$a0 
      dc.b      $04,$a8,$04,$b0,$04,$b8,$04,$c0 
      dc.b      $04,$c8,$04,$d0,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$f0,$04,$f8,$05,$08 
      dc.b      $05,$10,$05,$18,$05,' ',$05,'(' 
      dc.b      $05,'0',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'`',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,$80,$05,$90 
      dc.b      $05,$98,$05,$a0,$05,$a8,$05,$b0 
      dc.b      $05,$b8,$05,$c0,$05,$c8,$05,$d0 
      dc.b      $05,$d8,$05,$e0,$05,$e8,$05,$f0 
      dc.b      $05,$f8,$06,$00,$06,$10,$06,$18 
      dc.b      $01,$d8,$01,$e0,$01,$e8,$01,$f8 
      dc.b      $02,$00,$02,$08,$02,$10,$02,$18 
      dc.b      $02,' ',$02,'(',$02,'0',$02,'8' 
      dc.b      $02,'@',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,'`',$02,'h',$02,'x',$02,$80 
      dc.b      $02,$88,$02,$90,$02,$98,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$c8,$02,$d0,$02,$d8,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$03,$00,$03,$08 
      dc.b      $03,$10,$03,$18,$03,' ',$03,'(' 
      dc.b      $03,'0',$03,'8',$03,'@',$03,'h' 
      dc.b      $03,'p',$03,'x',$03,'`',$03,'h' 
      dc.b      $03,'p',$03,$80,$03,$88,$03,$90 
      dc.b      $03,$98,$03,$a0,$03,$a8,$03,$b0 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'h',$04,'p',$04,'`' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,$80 
      dc.b      $04,$88,$04,$90,$04,$98,$04,$a0 
      dc.b      $04,$a8,$04,$b8,$04,$c0,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$e0,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$05,$00,$05,$10 
      dc.b      $05,$18,$05,' ',$05,'(',$05,'0' 
      dc.b      $05,'8',$05,'@',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,$80,$05,$88,$05,$90,$05,$98 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $05,$c8,$05,$d0,$05,$d8,$05,$e0 
      dc.b      $05,$e8,$05,$f0,$05,$f8,$06,$00 
      dc.b      $06,$08,$06,$10,$06,' ',$06,'(' 
      dc.b      $01,$c8,$01,$d0,$01,$d8,$01,$e8 
      dc.b      $01,$f0,$01,$f8,$02,$00,$02,$08 
      dc.b      $02,$10,$02,$18,$02,' ',$02,'(' 
      dc.b      $02,'0',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'`',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,$80,$02,$88,$02,$90 
      dc.b      $02,$a0,$02,$a8,$02,$b0,$02,$b8 
      dc.b      $02,$c0,$02,$c8,$02,$d0,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$f8,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$18,$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'8',$03,'@' 
      dc.b      $03,'p',$03,'x',$03,'`',$03,'h' 
      dc.b      $03,'p',$03,'x',$03,$80,$03,$88 
      dc.b      $03,$90,$03,$98,$03,$a8,$03,$b0 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'8' 
      dc.b      $04,'@',$04,'p',$04,'x',$04,'`' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,$80 
      dc.b      $04,$88,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$b0,$04,$b8,$04,$c0,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$e8,$04,$f0 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$10 
      dc.b      $05,$18,$05,' ',$05,'0',$05,'8' 
      dc.b      $05,'@',$05,'h',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'h',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$98,$05,$a0 
      dc.b      $05,$a8,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d0,$05,$d8,$05,$e0,$05,$e8 
      dc.b      $05,$f0,$05,$f8,$06,$00,$06,$10 
      dc.b      $06,$18,$06,' ',$06,'(',$06,'0' 
      dc.b      $01,$c0,$01,$c8,$01,$d0,$01,$d8 
      dc.b      $01,$e0,$01,$e8,$01,$f8,$02,$00 
      dc.b      $02,$08,$02,$10,$02,$18,$02,' ' 
      dc.b      $02,'(',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,'`',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$90 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b0 
      dc.b      $02,$b8,$02,$c0,$02,$c8,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$08,$03,$10,$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'8',$03,'@' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'p',$03,'x',$03,$80,$03,$88 
      dc.b      $03,$90,$03,$98,$03,$a0,$03,$a8 
      dc.b      $03,$b8,$03,$c0,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'0',$04,'@' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,'`' 
      dc.b      $04,'h',$04,'x',$04,$80,$04,$88 
      dc.b      $04,$90,$04,$98,$04,$a0,$04,$a8 
      dc.b      $04,$b8,$04,$c0,$04,$c8,$04,$d0 
      dc.b      $04,$d8,$04,$e0,$04,$f0,$04,$f8 
      dc.b      $05,$00,$05,$08,$05,$10,$05,$18 
      dc.b      $05,' ',$05,'0',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,$80,$05,$88 
      dc.b      $05,$90,$05,$98,$05,$a8,$05,$b0 
      dc.b      $05,$b8,$05,$c0,$05,$c8,$05,$d0 
      dc.b      $05,$e0,$05,$e8,$05,$f0,$05,$f8 
      dc.b      $06,$00,$06,$08,$06,$10,$06,' ' 
      dc.b      $06,'(',$06,'0',$06,'8',$06,'@' 
      dc.b      $01,$b0,$01,$b8,$01,$c0,$01,$c8 
      dc.b      $01,$d0,$01,$d8,$01,$e8,$01,$f0 
      dc.b      $01,$f8,$02,$00,$02,$08,$02,$10 
      dc.b      $02,$18,$02,'(',$02,'0',$02,'8' 
      dc.b      $02,'@',$02,'h',$02,'p',$02,'`' 
      dc.b      $02,'h',$02,'p',$02,'x',$02,$80 
      dc.b      $02,$88,$02,$90,$02,$a0,$02,$a8 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$c8 
      dc.b      $02,$d8,$02,$e0,$02,$e8,$02,$f0 
      dc.b      $02,$f8,$03,$00,$03,$08,$03,$18 
      dc.b      $03,' ',$03,'(',$03,'0',$03,'8' 
      dc.b      $03,'@',$03,'p',$03,'x',$03,'`' 
      dc.b      $03,'h',$03,'p',$03,'x',$03,$80 
      dc.b      $03,$90,$03,$98,$03,$a0,$03,$a8 
      dc.b      $03,$b0,$03,$b8,$03,$c8,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'(',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'p',$04,'x',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,$80,$04,$88 
      dc.b      $04,$98,$04,$a0,$04,$a8,$04,$b0 
      dc.b      $04,$b8,$04,$c0,$04,$d0,$04,$d8 
      dc.b      $04,$e0,$04,$e8,$04,$f0,$05,$00 
      dc.b      $05,$08,$05,$10,$05,$18,$05,' ' 
      dc.b      $05,'0',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,$80,$05,$88,$05,$98 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $05,$c8,$05,$d0,$05,$d8,$05,$e0 
      dc.b      $05,$e8,$05,$f8,$06,$00,$06,$08 
      dc.b      $06,$10,$06,$18,$06,' ',$06,'0' 
      dc.b      $06,'8',$06,'@',$06,'h',$06,'p' 
      dc.b      $01,$98,$01,$a8,$01,$b0,$01,$b8 
      dc.b      $01,$c0,$01,$c8,$01,$d8,$01,$e0 
      dc.b      $01,$e8,$01,$f0,$01,$f8,$02,$00 
      dc.b      $02,$10,$02,$18,$02,' ',$02,'(' 
      dc.b      $02,'0',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'`',$02,'p',$02,'x' 
      dc.b      $02,$80,$02,$88,$02,$90,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$c8,$02,$d8,$02,$e0,$02,$e8 
      dc.b      $02,$f0,$02,$f8,$03,$08,$03,$10 
      dc.b      $03,$18,$03,' ',$03,'(',$03,'8' 
      dc.b      $03,'@',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,'`',$03,'p',$03,'x',$03,$80 
      dc.b      $03,$88,$03,$90,$03,$a0,$03,$a8 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$d0 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'p',$04,'`',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,$80,$04,$90 
      dc.b      $04,$98,$04,$a0,$04,$a8,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$d0,$04,$d8 
      dc.b      $04,$e8,$04,$f0,$04,$f8,$05,$00 
      dc.b      $05,$08,$05,$18,$05,' ',$05,'(' 
      dc.b      $05,'0',$05,'@',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,'`',$05,'p',$05,'x' 
      dc.b      $05,$80,$05,$88,$05,$90,$05,$a0 
      dc.b      $05,$a8,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d0,$05,$d8,$05,$e0,$05,$e8 
      dc.b      $05,$f8,$06,$00,$06,$08,$06,$10 
      dc.b      $06,$18,$06,'(',$06,'0',$06,'8' 
      dc.b      $06,'@',$06,'h',$06,'x',$06,'`' 
      dc.b      $01,$90,$01,$98,$01,$a0,$01,$b0 
      dc.b      $01,$b8,$01,$c0,$01,$c8,$01,$d0 
      dc.b      $01,$e0,$01,$e8,$01,$f0,$01,$f8 
      dc.b      $02,$00,$02,$10,$02,$18,$02,' ' 
      dc.b      $02,'(',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,$80,$02,$88,$02,$98 
      dc.b      $02,$a0,$02,$a8,$02,$b0,$02,$b8 
      dc.b      $02,$c8,$02,$d0,$02,$d8,$02,$e0 
      dc.b      $02,$f0,$02,$f8,$03,$00,$03,$08 
      dc.b      $03,$10,$03,' ',$03,'(',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'p',$03,'x' 
      dc.b      $03,'`',$03,'h',$03,'x',$03,$80 
      dc.b      $03,$88,$03,$90,$03,$98,$03,$a8 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,' ',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'h',$04,'x',$04,'`',$04,'h' 
      dc.b      $04,'p',$04,$80,$04,$88,$04,$90 
      dc.b      $04,$98,$04,$a8,$04,$b0,$04,$b8 
      dc.b      $04,$c0,$04,$c8,$04,$d8,$04,$e0 
      dc.b      $04,$e8,$04,$f0,$05,$00,$05,$08 
      dc.b      $05,$10,$05,$18,$05,'(',$05,'0' 
      dc.b      $05,'8',$05,'@',$05,'p',$05,'x' 
      dc.b      $05,'`',$05,'h',$05,'x',$05,$80 
      dc.b      $05,$88,$05,$90,$05,$98,$05,$a8 
      dc.b      $05,$b0,$05,$b8,$05,$c0,$05,$d0 
      dc.b      $05,$d8,$05,$e0,$05,$e8,$05,$f8 
      dc.b      $06,$00,$06,$08,$06,$10,$06,' ' 
      dc.b      $06,'(',$06,'0',$06,'8',$06,'h' 
      dc.b      $06,'p',$06,'x',$06,'`',$06,'h' 
      dc.b      $01,$80,$01,$90,$01,$98,$01,$a0 
      dc.b      $01,$a8,$01,$b0,$01,$c0,$01,$c8 
      dc.b      $01,$d0,$01,$d8,$01,$e8,$01,$f0 
      dc.b      $01,$f8,$02,$00,$02,$10,$02,$18 
      dc.b      $02,' ',$02,'(',$02,'8',$02,'@' 
      dc.b      $02,'h',$02,'p',$02,'`',$02,'h' 
      dc.b      $02,'p',$02,'x',$02,$80,$02,$90 
      dc.b      $02,$98,$02,$a0,$02,$a8,$02,$b8 
      dc.b      $02,$c0,$02,$c8,$02,$d0,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$02,$f8,$03,$08 
      dc.b      $03,$10,$03,$18,$03,' ',$03,'0' 
      dc.b      $03,'8',$03,'@',$03,'h',$03,'p' 
      dc.b      $03,'`',$03,'h',$03,'p',$03,'x' 
      dc.b      $03,$88,$03,$90,$03,$98,$03,$a0 
      dc.b      $03,$b0,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$d8,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,'(',$04,'0',$04,'8',$04,'@' 
      dc.b      $04,'p',$04,'x',$04,'`',$04,'p' 
      dc.b      $04,'x',$04,$80,$04,$88,$04,$98 
      dc.b      $04,$a0,$04,$a8,$04,$b0,$04,$c0 
      dc.b      $04,$c8,$04,$d0,$04,$e0,$04,$e8 
      dc.b      $04,$f0,$04,$f8,$05,$08,$05,$10 
      dc.b      $05,$18,$05,' ',$05,'0',$05,'8' 
      dc.b      $05,'@',$05,'p',$05,'x',$05,'`' 
      dc.b      $05,'h',$05,'x',$05,$80,$05,$88 
      dc.b      $05,$98,$05,$a0,$05,$a8,$05,$b0 
      dc.b      $05,$c0,$05,$c8,$05,$d0,$05,$d8 
      dc.b      $05,$e8,$05,$f0,$05,$f8,$06,$08 
      dc.b      $06,$10,$06,$18,$06,' ',$06,'0' 
      dc.b      $06,'8',$06,'@',$06,'h',$06,'x' 
      dc.b      $06,'`',$06,'h',$06,'x',$06,$80 
      dc.b      $01,'p',$01,'x',$01,$80,$01,$90 
      dc.b      $01,$98,$01,$a0,$01,$b0,$01,$b8 
      dc.b      $01,$c0,$01,$c8,$01,$d8,$01,$e0 
      dc.b      $01,$e8,$01,$f0,$02,$00,$02,$08 
      dc.b      $02,$10,$02,' ',$02,'(',$02,'0' 
      dc.b      $02,'8',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,'`',$02,'p',$02,'x',$02,$80 
      dc.b      $02,$90,$02,$98,$02,$a0,$02,$a8 
      dc.b      $02,$b8,$02,$c0,$02,$c8,$02,$d8 
      dc.b      $02,$e0,$02,$e8,$02,$f0,$03,$00 
      dc.b      $03,$08,$03,$10,$03,$18,$03,'(' 
      dc.b      $03,'0',$03,'8',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,'`',$03,'p',$03,'x' 
      dc.b      $03,$80,$03,$88,$03,$98,$03,$a0 
      dc.b      $03,$a8,$03,$b8,$03,$c0,$03,$c8 
      dc.b      $03,$d0,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,'(',$04,'0',$04,'8',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,$80,$04,$90,$04,$98 
      dc.b      $04,$a0,$04,$b0,$04,$b8,$04,$c0 
      dc.b      $04,$d0,$04,$d8,$04,$e0,$04,$e8 
      dc.b      $04,$f8,$05,$00,$05,$08,$05,$18 
      dc.b      $05,' ',$05,'(',$05,'8',$05,'@' 
      dc.b      $05,'h',$05,'p',$05,'`',$05,'h' 
      dc.b      $05,'p',$05,$80,$05,$88,$05,$90 
      dc.b      $05,$a0,$05,$a8,$05,$b0,$05,$b8 
      dc.b      $05,$c8,$05,$d0,$05,$d8,$05,$e8 
      dc.b      $05,$f0,$05,$f8,$06,$08,$06,$10 
      dc.b      $06,$18,$06,' ',$06,'0',$06,'8' 
      dc.b      $06,'@',$06,'p',$06,'x',$06,'`' 
      dc.b      $06,'p',$06,'x',$06,$80,$06,$88 
      dc.b      $01,'`',$01,'p',$01,'x',$01,$80 
      dc.b      $01,$88,$01,$98,$01,$a0,$01,$a8 
      dc.b      $01,$b8,$01,$c0,$01,$c8,$01,$d8 
      dc.b      $01,$e0,$01,$e8,$01,$f0,$02,$00 
      dc.b      $02,$08,$02,$10,$02,' ',$02,'(' 
      dc.b      $02,'0',$02,'@',$02,'h',$02,'p' 
      dc.b      $02,'x',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,$88,$02,$90,$02,$98,$02,$a8 
      dc.b      $02,$b0,$02,$b8,$02,$c0,$02,$d0 
      dc.b      $02,$d8,$02,$e0,$02,$f0,$02,$f8 
      dc.b      $03,$00,$03,$10,$03,$18,$03,' ' 
      dc.b      $03,'(',$03,'8',$03,'@',$03,'h' 
      dc.b      $03,'x',$03,'`',$03,'h',$03,'x' 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$a0 
      dc.b      $03,$a8,$03,$b0,$03,$c0,$03,$c8 
      dc.b      $03,$d0,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,$18 
      dc.b      $04,'(',$04,'0',$04,'8',$04,'h' 
      dc.b      $04,'p',$04,'x',$04,'h',$04,'p' 
      dc.b      $04,'x',$04,$88,$04,$90,$04,$98 
      dc.b      $04,$a8,$04,$b0,$04,$b8,$04,$c8 
      dc.b      $04,$d0,$04,$d8,$04,$e8,$04,$f0 
      dc.b      $04,$f8,$05,$08,$05,$10,$05,$18 
      dc.b      $05,'(',$05,'0',$05,'8',$05,'h' 
      dc.b      $05,'p',$05,'x',$05,'h',$05,'p' 
      dc.b      $05,'x',$05,$88,$05,$90,$05,$98 
      dc.b      $05,$a8,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d0,$05,$d8,$05,$e8,$05,$f0 
      dc.b      $05,$f8,$06,$08,$06,$10,$06,$18 
      dc.b      $06,'(',$06,'0',$06,'8',$06,'h' 
      dc.b      $06,'p',$06,'x',$06,'`',$06,'p' 
      dc.b      $06,'x',$06,$80,$06,$90,$06,$98 
      dc.b      $01,'x',$01,'`',$01,'h',$01,'x' 
      dc.b      $01,$80,$01,$88,$01,$98,$01,$a0 
      dc.b      $01,$a8,$01,$b0,$01,$c0,$01,$c8 
      dc.b      $01,$d0,$01,$e0,$01,$e8,$01,$f0 
      dc.b      $02,$00,$02,$08,$02,$10,$02,' ' 
      dc.b      $02,'(',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'p',$02,'`',$02,'h',$02,'p' 
      dc.b      $02,$80,$02,$88,$02,$90,$02,$a0 
      dc.b      $02,$a8,$02,$b0,$02,$c0,$02,$c8 
      dc.b      $02,$d0,$02,$e0,$02,$e8,$02,$f0 
      dc.b      $03,$00,$03,$08,$03,$10,$03,' ' 
      dc.b      $03,'(',$03,'0',$03,'@',$03,'h' 
      dc.b      $03,'p',$03,'`',$03,'h',$03,'p' 
      dc.b      $03,$80,$03,$88,$03,$90,$03,$a0 
      dc.b      $03,$a8,$03,$b0,$03,$c0,$03,$c8 
      dc.b      $03,$d0,$03,$e0,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'0',$04,'@',$04,'h' 
      dc.b      $04,'p',$04,'`',$04,'h',$04,'p' 
      dc.b      $04,$80,$04,$88,$04,$90,$04,$a0 
      dc.b      $04,$a8,$04,$b8,$04,$c0,$04,$c8 
      dc.b      $04,$d8,$04,$e0,$04,$e8,$04,$f8 
      dc.b      $05,$00,$05,$08,$05,$18,$05,' ' 
      dc.b      $05,'(',$05,'8',$05,'@',$05,'h' 
      dc.b      $05,'x',$05,'`',$05,'p',$05,'x' 
      dc.b      $05,$80,$05,$90,$05,$98,$05,$a0 
      dc.b      $05,$b0,$05,$b8,$05,$c0,$05,$d0 
      dc.b      $05,$d8,$05,$e0,$05,$f0,$05,$f8 
      dc.b      $06,$00,$06,$10,$06,$18,$06,'(' 
      dc.b      $06,'0',$06,'8',$06,'h',$06,'p' 
      dc.b      $06,'x',$06,'h',$06,'p',$06,'x' 
      dc.b      $06,$88,$06,$90,$06,$98,$06,$a8 
      dc.b      $01,'h',$01,'p',$01,'`',$01,'h' 
      dc.b      $01,'p',$01,$80,$01,$88,$01,$90 
      dc.b      $01,$a0,$01,$a8,$01,$b0,$01,$c0 
      dc.b      $01,$c8,$01,$d0,$01,$e0,$01,$e8 
      dc.b      $01,$f8,$02,$00,$02,$08,$02,$18 
      dc.b      $02,' ',$02,'(',$02,'8',$02,'@' 
      dc.b      $02,'h',$02,'x',$02,'`',$02,'h' 
      dc.b      $02,'x',$02,$80,$02,$88,$02,$98 
      dc.b      $02,$a0,$02,$b0,$02,$b8,$02,$c0 
      dc.b      $02,$d0,$02,$d8,$02,$e0,$02,$f0 
      dc.b      $02,$f8,$03,$00,$03,$10,$03,$18 
      dc.b      $03,' ',$03,'0',$03,'8',$03,'@' 
      dc.b      $03,'p',$03,'x',$03,'h',$03,'p' 
      dc.b      $03,'x',$03,$88,$03,$90,$03,$98 
      dc.b      $03,$a8,$03,$b0,$03,$b8,$03,$c8 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'0',$04,'@',$04,'h' 
      dc.b      $04,'x',$04,'`',$04,'h',$04,'x' 
      dc.b      $04,$80,$04,$88,$04,$98,$04,$a0 
      dc.b      $04,$b0,$04,$b8,$04,$c0,$04,$d0 
      dc.b      $04,$d8,$04,$e8,$04,$f0,$04,$f8 
      dc.b      $05,$08,$05,$10,$05,$18,$05,'(' 
      dc.b      $05,'0',$05,'@',$05,'h',$05,'p' 
      dc.b      $05,'`',$05,'h',$05,'p',$05,$80 
      dc.b      $05,$88,$05,$98,$05,$a0,$05,$a8 
      dc.b      $05,$b8,$05,$c0,$05,$d0,$05,$d8 
      dc.b      $05,$e0,$05,$f0,$05,$f8,$06,$00 
      dc.b      $06,$10,$06,$18,$06,'(',$06,'0' 
      dc.b      $06,'8',$06,'h',$06,'p',$06,'x' 
      dc.b      $06,'h',$06,'p',$06,$80,$06,$88 
      dc.b      $06,$90,$06,$a0,$06,$a8,$06,$b8 
      dc.b      $01,'8',$01,'@',$01,'p',$01,'x' 
      dc.b      $01,'h',$01,'p',$01,'x',$01,$88 
      dc.b      $01,$90,$01,$a0,$01,$a8,$01,$b0 
      dc.b      $01,$c0,$01,$c8,$01,$d0,$01,$e0 
      dc.b      $01,$e8,$01,$f8,$02,$00,$02,$08 
      dc.b      $02,$18,$02,' ',$02,'(',$02,'8' 
      dc.b      $02,'@',$02,'p',$02,'x',$02,'`' 
      dc.b      $02,'p',$02,'x',$02,$88,$02,$90 
      dc.b      $02,$98,$02,$a8,$02,$b0,$02,$b8 
      dc.b      $02,$c8,$02,$d0,$02,$e0,$02,$e8 
      dc.b      $02,$f0,$03,$00,$03,$08,$03,$10 
      dc.b      $03,' ',$03,'(',$03,'8',$03,'@' 
      dc.b      $03,'h',$03,'x',$03,'`',$03,'p' 
      dc.b      $03,'x',$03,$80,$03,$90,$03,$98 
      dc.b      $03,$a0,$03,$b0,$03,$b8,$03,$c8 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'8',$04,'@',$04,'h' 
      dc.b      $04,'x',$04,'`',$04,'p',$04,'x' 
      dc.b      $04,$80,$04,$90,$04,$98,$04,$a8 
      dc.b      $04,$b0,$04,$b8,$04,$c8,$04,$d0 
      dc.b      $04,$e0,$04,$e8,$04,$f8,$05,$00 
      dc.b      $05,$08,$05,$18,$05,' ',$05,'0' 
      dc.b      $05,'8',$05,'@',$05,'p',$05,'x' 
      dc.b      $05,'h',$05,'p',$05,'x',$05,$88 
      dc.b      $05,$90,$05,$a0,$05,$a8,$05,$b0 
      dc.b      $05,$c0,$05,$c8,$05,$d8,$05,$e0 
      dc.b      $05,$f0,$05,$f8,$06,$00,$06,$10 
      dc.b      $06,$18,$06,'(',$06,'0',$06,'8' 
      dc.b      $06,'h',$06,'p',$06,'`',$06,'h' 
      dc.b      $06,'p',$06,$80,$06,$88,$06,$98 
      dc.b      $06,$a0,$06,$a8,$06,$b8,$06,$c0 
      dc.b      $01,'(',$01,'8',$01,'@',$01,'p' 
      dc.b      $01,'x',$01,'`',$01,'p',$01,'x' 
      dc.b      $01,$88,$01,$90,$01,$98,$01,$a8 
      dc.b      $01,$b0,$01,$c0,$01,$c8,$01,$d0 
      dc.b      $01,$e0,$01,$e8,$01,$f8,$02,$00 
      dc.b      $02,$08,$02,$18,$02,' ',$02,'0' 
      dc.b      $02,'8',$02,'h',$02,'p',$02,'x' 
      dc.b      $02,'h',$02,'p',$02,$80,$02,$88 
      dc.b      $02,$90,$02,$a0,$02,$a8,$02,$b8 
      dc.b      $02,$c0,$02,$c8,$02,$d8,$02,$e0 
      dc.b      $02,$f0,$02,$f8,$03,$00,$03,$10 
      dc.b      $03,$18,$03,'(',$03,'0',$03,'@' 
      dc.b      $03,'h',$03,'p',$03,'`',$03,'h' 
      dc.b      $03,'x',$03,$80,$03,$88,$03,$98 
      dc.b      $03,$a0,$03,$b0,$03,$b8,$03,$c0 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'8',$04,'@',$04,'p' 
      dc.b      $04,'x',$04,'`',$04,'p',$04,'x' 
      dc.b      $04,$88,$04,$90,$04,$a0,$04,$a8 
      dc.b      $04,$b8,$04,$c0,$04,$c8,$04,$d8 
      dc.b      $04,$e0,$04,$f0,$04,$f8,$05,$08 
      dc.b      $05,$10,$05,$18,$05,'(',$05,'0' 
      dc.b      $05,'@',$05,'h',$05,'x',$05,'`' 
      dc.b      $05,'p',$05,'x',$05,$80,$05,$90 
      dc.b      $05,$98,$05,$a8,$05,$b0,$05,$c0 
      dc.b      $05,$c8,$05,$d0,$05,$e0,$05,$e8 
      dc.b      $05,$f8,$06,$00,$06,$10,$06,$18 
      dc.b      $06,'(',$06,'0',$06,'8',$06,'h' 
      dc.b      $06,'p',$06,'`',$06,'h',$06,'x' 
      dc.b      $06,$80,$06,$88,$06,$98,$06,$a0 
      dc.b      $06,$b0,$06,$b8,$06,$c8,$06,$d0 
      dc.b      $01,$18,$01,'(',$01,'0',$01,'@' 
      dc.b      $01,'h',$01,'x',$01,'`',$01,'p' 
      dc.b      $01,'x',$01,$80,$01,$90,$01,$98 
      dc.b      $01,$a8,$01,$b0,$01,$c0,$01,$c8 
      dc.b      $01,$d0,$01,$e0,$01,$e8,$01,$f8 
      dc.b      $02,$00,$02,$10,$02,$18,$02,'(' 
      dc.b      $02,'0',$02,'8',$02,'h',$02,'p' 
      dc.b      $02,'`',$02,'h',$02,'x',$02,$80 
      dc.b      $02,$88,$02,$98,$02,$a0,$02,$b0 
      dc.b      $02,$b8,$02,$c8,$02,$d0,$02,$e0 
      dc.b      $02,$e8,$02,$f0,$03,$00,$03,$08 
      dc.b      $03,$18,$03,' ',$03,'0',$03,'8' 
      dc.b      $03,'@',$03,'p',$03,'x',$03,'h' 
      dc.b      $03,'p',$03,$80,$03,$88,$03,$98 
      dc.b      $03,$a0,$03,$a8,$03,$b8,$03,$c0 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'8',$04,'@',$04,'p' 
      dc.b      $04,'x',$04,'h',$04,'p',$04,$80 
      dc.b      $04,$88,$04,$98,$04,$a0,$04,$b0 
      dc.b      $04,$b8,$04,$c0,$04,$d0,$04,$d8 
      dc.b      $04,$e8,$04,$f0,$05,$00,$05,$08 
      dc.b      $05,$18,$05,' ',$05,'0',$05,'8' 
      dc.b      $05,'h',$05,'p',$05,'`',$05,'h' 
      dc.b      $05,'p',$05,$80,$05,$88,$05,$98 
      dc.b      $05,$a0,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d0,$05,$e0,$05,$e8,$05,$f8 
      dc.b      $06,$00,$06,$10,$06,$18,$06,' ' 
      dc.b      $06,'0',$06,'8',$06,'h',$06,'p' 
      dc.b      $06,'`',$06,'h',$06,'x',$06,$80 
      dc.b      $06,$90,$06,$98,$06,$a8,$06,$b0 
      dc.b      $06,$c0,$06,$c8,$06,$d0,$06,$e0 
      dc.b      $01,$10,$01,$18,$01,'(',$01,'0' 
      dc.b      $01,'8',$01,'h',$01,'p',$01,'`' 
      dc.b      $01,'h',$01,'x',$01,$80,$01,$90 
      dc.b      $01,$98,$01,$a8,$01,$b0,$01,$c0 
      dc.b      $01,$c8,$01,$d8,$01,$e0,$01,$e8 
      dc.b      $01,$f8,$02,$00,$02,$10,$02,$18 
      dc.b      $02,'(',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'x',$02,'`',$02,'p',$02,'x' 
      dc.b      $02,$88,$02,$90,$02,$98,$02,$a8 
      dc.b      $02,$b0,$02,$c0,$02,$c8,$02,$d8 
      dc.b      $02,$e0,$02,$f0,$02,$f8,$03,$08 
      dc.b      $03,$10,$03,' ',$03,'(',$03,'8' 
      dc.b      $03,'@',$03,'h',$03,'x',$03,'`' 
      dc.b      $03,'p',$03,'x',$03,$88,$03,$90 
      dc.b      $03,$a0,$03,$a8,$03,$b8,$03,$c0 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$10,$04,' ' 
      dc.b      $04,'(',$04,'8',$04,'@',$04,'p' 
      dc.b      $04,'x',$04,'h',$04,'p',$04,$80 
      dc.b      $04,$88,$04,$98,$04,$a0,$04,$b0 
      dc.b      $04,$b8,$04,$c8,$04,$d0,$04,$e0 
      dc.b      $04,$e8,$04,$f8,$05,$00,$05,$10 
      dc.b      $05,$18,$05,'(',$05,'0',$05,'@' 
      dc.b      $05,'h',$05,'x',$05,'`',$05,'p' 
      dc.b      $05,'x',$05,$88,$05,$90,$05,$a0 
      dc.b      $05,$a8,$05,$b8,$05,$c0,$05,$d0 
      dc.b      $05,$d8,$05,$e8,$05,$f0,$06,$00 
      dc.b      $06,$08,$06,$18,$06,' ',$06,'0' 
      dc.b      $06,'8',$06,'h',$06,'p',$06,'`' 
      dc.b      $06,'h',$06,'x',$06,$80,$06,$90 
      dc.b      $06,$98,$06,$a8,$06,$b0,$06,$c0 
      dc.b      $06,$c8,$06,$d8,$06,$e0,$06,$f0 
      dc.b      $01,$00,$01,$08,$01,$18,$01,' ' 
      dc.b      $01,'0',$01,'8',$01,'h',$01,'p' 
      dc.b      $01,'`',$01,'h',$01,'x',$01,$80 
      dc.b      $01,$90,$01,$98,$01,$a8,$01,$b0 
      dc.b      $01,$c0,$01,$c8,$01,$d8,$01,$e0 
      dc.b      $01,$f0,$01,$f8,$02,$08,$02,$10 
      dc.b      $02,' ',$02,'(',$02,'8',$02,'@' 
      dc.b      $02,'p',$02,'x',$02,'h',$02,'p' 
      dc.b      $02,$80,$02,$88,$02,$98,$02,$a0 
      dc.b      $02,$b0,$02,$b8,$02,$c8,$02,$d0 
      dc.b      $02,$e0,$02,$e8,$02,$f8,$03,$00 
      dc.b      $03,$10,$03,$18,$03,'(',$03,'0' 
      dc.b      $03,'@',$03,'h',$03,'x',$03,'`' 
      dc.b      $03,'p',$03,'x',$03,$88,$03,$90 
      dc.b      $03,$a0,$03,$a8,$03,$b8,$03,$c0 
      dc.b      $03,$d0,$03,$d8,$03,$e8,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,' ' 
      dc.b      $04,'0',$04,'8',$04,'h',$04,'p' 
      dc.b      $04,'`',$04,'h',$04,'x',$04,$80 
      dc.b      $04,$90,$04,$98,$04,$a8,$04,$b0 
      dc.b      $04,$c0,$04,$c8,$04,$d8,$04,$e8 
      dc.b      $04,$f0,$05,$00,$05,$08,$05,$18 
      dc.b      $05,' ',$05,'0',$05,'8',$05,'h' 
      dc.b      $05,'p',$05,'`',$05,'h',$05,'x' 
      dc.b      $05,$80,$05,$90,$05,$98,$05,$a8 
      dc.b      $05,$b0,$05,$c0,$05,$d0,$05,$d8 
      dc.b      $05,$e8,$05,$f0,$06,$00,$06,$08 
      dc.b      $06,$18,$06,' ',$06,'0',$06,'8' 
      dc.b      $06,'h',$06,'p',$06,'`',$06,'h' 
      dc.b      $06,'x',$06,$80,$06,$90,$06,$98 
      dc.b      $06,$a8,$06,$b8,$06,$c0,$06,$d0 
      dc.b      $06,$d8,$06,$e8,$06,$f0,$07,$00 
      dc.b      $00,$f0,$00,$f8,$01,$08,$01,$10 
      dc.b      $01,' ',$01,'(',$01,'8',$01,'@' 
      dc.b      $01,'p',$01,'`',$01,'h',$01,'x' 
      dc.b      $01,$80,$01,$90,$01,$98,$01,$a8 
      dc.b      $01,$b0,$01,$c0,$01,$c8,$01,$d8 
      dc.b      $01,$e0,$01,$f0,$01,$f8,$02,$08 
      dc.b      $02,$10,$02,' ',$02,'(',$02,'8' 
      dc.b      $02,'h',$02,'p',$02,'`',$02,'h' 
      dc.b      $02,'x',$02,$80,$02,$90,$02,$98 
      dc.b      $02,$a8,$02,$b0,$02,$c0,$02,$c8 
      dc.b      $02,$d8,$02,$e0,$02,$f0,$02,$f8 
      dc.b      $03,$08,$03,$10,$03,' ',$03,'0' 
      dc.b      $03,'8',$03,'h',$03,'p',$03,'`' 
      dc.b      $03,'h',$03,'x',$03,$80,$03,$90 
      dc.b      $03,$98,$03,$a8,$03,$b0,$03,$c0 
      dc.b      $03,$c8,$03,$d8,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,' ' 
      dc.b      $04,'0',$04,'8',$04,'h',$04,'p' 
      dc.b      $04,'`',$04,'p',$04,'x',$04,$88 
      dc.b      $04,$90,$04,$a0,$04,$a8,$04,$b8 
      dc.b      $04,$c0,$04,$d0,$04,$e0,$04,$e8 
      dc.b      $04,$f8,$05,$00,$05,$10,$05,$18 
      dc.b      $05,'(',$05,'0',$05,'@',$05,'p' 
      dc.b      $05,'x',$05,'h',$05,'p',$05,$80 
      dc.b      $05,$88,$05,$98,$05,$a0,$05,$b0 
      dc.b      $05,$c0,$05,$c8,$05,$d8,$05,$e0 
      dc.b      $05,$f0,$05,$f8,$06,$08,$06,$10 
      dc.b      $06,' ',$06,'0',$06,'8',$06,'h' 
      dc.b      $06,'p',$06,'`',$06,'h',$06,'x' 
      dc.b      $06,$80,$06,$90,$06,$a0,$06,$a8 
      dc.b      $06,$b8,$06,$c0,$06,$d0,$06,$d8 
      dc.b      $06,$e8,$06,$f8,$07,$00,$07,$10 
      dc.b      $00,$e0,$00,$e8,$00,$f8,$01,$00 
      dc.b      $01,$10,$01,' ',$01,'(',$01,'8' 
      dc.b      $01,'@',$01,'p',$01,'x',$01,'h' 
      dc.b      $01,'x',$01,$80,$01,$90,$01,$98 
      dc.b      $01,$a8,$01,$b0,$01,$c0,$01,$c8 
      dc.b      $01,$d8,$01,$e8,$01,$f0,$02,$00 
      dc.b      $02,$08,$02,$18,$02,' ',$02,'0' 
      dc.b      $02,'8',$02,'h',$02,'x',$02,'`' 
      dc.b      $02,'p',$02,'x',$02,$88,$02,$90 
      dc.b      $02,$a0,$02,$a8,$02,$b8,$02,$c8 
      dc.b      $02,$d0,$02,$e0,$02,$e8,$02,$f8 
      dc.b      $03,$00,$03,$10,$03,$18,$03,'(' 
      dc.b      $03,'8',$03,'@',$03,'p',$03,'x' 
      dc.b      $03,'h',$03,'p',$03,$80,$03,$88 
      dc.b      $03,$98,$03,$a8,$03,$b0,$03,$c0 
      dc.b      $03,$c8,$03,$d8,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,' ' 
      dc.b      $04,'0',$04,'8',$04,'h',$04,'x' 
      dc.b      $04,'`',$04,'p',$04,'x',$04,$88 
      dc.b      $04,$98,$04,$a0,$04,$b0,$04,$b8 
      dc.b      $04,$c8,$04,$d8,$04,$e0,$04,$f0 
      dc.b      $04,$f8,$05,$08,$05,$10,$05,' ' 
      dc.b      $05,'0',$05,'8',$05,'h',$05,'p' 
      dc.b      $05,'`',$05,'p',$05,'x',$05,$88 
      dc.b      $05,$90,$05,$a0,$05,$b0,$05,$b8 
      dc.b      $05,$c8,$05,$d0,$05,$e0,$05,$e8 
      dc.b      $05,$f8,$06,$08,$06,$10,$06,' ' 
      dc.b      $06,'(',$06,'8',$06,'h',$06,'p' 
      dc.b      $06,'`',$06,'h',$06,'x',$06,$88 
      dc.b      $06,$90,$06,$a0,$06,$a8,$06,$b8 
      dc.b      $06,$c0,$06,$d0,$06,$e0,$06,$e8 
      dc.b      $06,$f8,$07,$00,$07,$10,$07,' ' 
      dc.b      $00,$d0,$00,$d8,$00,$e8,$00,$f8 
      dc.b      $01,$00,$01,$10,$01,$18,$01,'(' 
      dc.b      $01,'8',$01,'@',$01,'p',$01,'x' 
      dc.b      $01,'h',$01,'p',$01,$80,$01,$90 
      dc.b      $01,$98,$01,$a8,$01,$b0,$01,$c0 
      dc.b      $01,$d0,$01,$d8,$01,$e8,$01,$f0 
      dc.b      $02,$00,$02,$10,$02,$18,$02,'(' 
      dc.b      $02,'0',$02,'@',$02,'h',$02,'x' 
      dc.b      $02,'h',$02,'p',$02,$80,$02,$88 
      dc.b      $02,$98,$02,$a8,$02,$b0,$02,$c0 
      dc.b      $02,$c8,$02,$d8,$02,$e8,$02,$f0 
      dc.b      $03,$00,$03,$08,$03,$18,$03,' ' 
      dc.b      $03,'0',$03,'@',$03,'h',$03,'x' 
      dc.b      $03,'`',$03,'p',$03,$80,$03,$88 
      dc.b      $03,$98,$03,$a0,$03,$b0,$03,$c0 
      dc.b      $03,$c8,$03,$d8,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,' ' 
      dc.b      $04,'0',$04,'@',$04,'h',$04,'x' 
      dc.b      $04,'`',$04,'p',$04,$80,$04,$88 
      dc.b      $04,$98,$04,$a8,$04,$b0,$04,$c0 
      dc.b      $04,$c8,$04,$d8,$04,$e8,$04,$f0 
      dc.b      $05,$00,$05,$10,$05,$18,$05,'(' 
      dc.b      $05,'0',$05,'@',$05,'p',$05,'x' 
      dc.b      $05,'h',$05,'x',$05,$80,$05,$90 
      dc.b      $05,$98,$05,$a8,$05,$b8,$05,$c0 
      dc.b      $05,$d0,$05,$d8,$05,$e8,$05,$f8 
      dc.b      $06,$00,$06,$10,$06,' ',$06,'(' 
      dc.b      $06,'8',$06,'@',$06,'p',$06,'`' 
      dc.b      $06,'h',$06,'x',$06,$88,$06,$90 
      dc.b      $06,$a0,$06,$a8,$06,$b8,$06,$c8 
      dc.b      $06,$d0,$06,$e0,$06,$f0,$06,$f8 
      dc.b      $07,$08,$07,$10,$07,' ',$07,'0' 
      dc.b      $00,$c0,$00,$c8,$00,$d8,$00,$e8 
      dc.b      $00,$f0,$01,$00,$01,$08,$01,$18 
      dc.b      $01,'(',$01,'0',$01,'@',$01,'p' 
      dc.b      $01,'x',$01,'h',$01,'p',$01,$80 
      dc.b      $01,$90,$01,$98,$01,$a8,$01,$b8 
      dc.b      $01,$c0,$01,$d0,$01,$d8,$01,$e8 
      dc.b      $01,$f8,$02,$00,$02,$10,$02,' ' 
      dc.b      $02,'(',$02,'8',$02,'@',$02,'p' 
      dc.b      $02,'`',$02,'h',$02,'x',$02,$80 
      dc.b      $02,$90,$02,$a0,$02,$a8,$02,$b8 
      dc.b      $02,$c8,$02,$d0,$02,$e0,$02,$e8 
      dc.b      $02,$f8,$03,$08,$03,$10,$03,' ' 
      dc.b      $03,'0',$03,'8',$03,'h',$03,'p' 
      dc.b      $03,'`',$03,'p',$03,'x',$03,$88 
      dc.b      $03,$98,$03,$a0,$03,$b0,$03,$b8 
      dc.b      $03,$c8,$03,$d8,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,' ' 
      dc.b      $04,'0',$04,'@',$04,'h',$04,'x' 
      dc.b      $04,'h',$04,'p',$04,$80,$04,$90 
      dc.b      $04,$98,$04,$a8,$04,$b0,$04,$c0 
      dc.b      $04,$d0,$04,$d8,$04,$e8,$04,$f8 
      dc.b      $05,$00,$05,$10,$05,' ',$05,'(' 
      dc.b      $05,'8',$05,'@',$05,'p',$05,'`' 
      dc.b      $05,'h',$05,'x',$05,$88,$05,$90 
      dc.b      $05,$a0,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d0,$05,$e0,$05,$f0,$05,$f8 
      dc.b      $06,$08,$06,$18,$06,' ',$06,'0' 
      dc.b      $06,'@',$06,'h',$06,'x',$06,'`' 
      dc.b      $06,'p',$06,$80,$06,$88,$06,$98 
      dc.b      $06,$a8,$06,$b0,$06,$c0,$06,$d0 
      dc.b      $06,$d8,$06,$e8,$06,$f0,$07,$00 
      dc.b      $07,$10,$07,$18,$07,'(',$07,'8' 
      dc.b      $00,$b8,$00,$c0,$00,$d0,$00,$e0 
      dc.b      $00,$e8,$00,$f8,$01,$08,$01,$10 
      dc.b      $01,' ',$01,'(',$01,'8',$01,'h' 
      dc.b      $01,'p',$01,'`',$01,'p',$01,'x' 
      dc.b      $01,$88,$01,$98,$01,$a0,$01,$b0 
      dc.b      $01,$b8,$01,$c8,$01,$d8,$01,$e0 
      dc.b      $01,$f0,$02,$00,$02,$08,$02,$18 
      dc.b      $02,'(',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'x',$02,'h',$02,'p',$02,$80 
      dc.b      $02,$90,$02,$98,$02,$a8,$02,$b8 
      dc.b      $02,$c0,$02,$d0,$02,$d8,$02,$e8 
      dc.b      $02,$f8,$03,$00,$03,$10,$03,' ' 
      dc.b      $03,'(',$03,'8',$03,'h',$03,'p' 
      dc.b      $03,'`',$03,'h',$03,'x',$03,$88 
      dc.b      $03,$90,$03,$a0,$03,$b0,$03,$b8 
      dc.b      $03,$c8,$03,$d8,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'0',$04,'@',$04,'p',$04,'x' 
      dc.b      $04,'h',$04,'x',$04,$80,$04,$90 
      dc.b      $04,$a0,$04,$a8,$04,$b8,$04,$c8 
      dc.b      $04,$d0,$04,$e0,$04,$f0,$04,$f8 
      dc.b      $05,$08,$05,$18,$05,' ',$05,'0' 
      dc.b      $05,'@',$05,'h',$05,'x',$05,'h' 
      dc.b      $05,'p',$05,$80,$05,$90,$05,$98 
      dc.b      $05,$a8,$05,$b8,$05,$c0,$05,$d0 
      dc.b      $05,$e0,$05,$e8,$05,$f8,$06,$08 
      dc.b      $06,$10,$06,' ',$06,'0',$06,'8' 
      dc.b      $06,'h',$06,'x',$06,'`',$06,'p' 
      dc.b      $06,$80,$06,$88,$06,$98,$06,$a8 
      dc.b      $06,$b0,$06,$c0,$06,$d0,$06,$d8 
      dc.b      $06,$e8,$06,$f8,$07,$00,$07,$10 
      dc.b      $07,' ',$07,'(',$07,'8',$07,'h' 
      dc.b      $00,$a8,$00,$b0,$00,$c0,$00,$d0 
      dc.b      $00,$d8,$00,$e8,$00,$f8,$01,$00 
      dc.b      $01,$10,$01,' ',$01,'(',$01,'8' 
      dc.b      $01,'h',$01,'p',$01,'`',$01,'p' 
      dc.b      $01,'x',$01,$88,$01,$98,$01,$a0 
      dc.b      $01,$b0,$01,$c0,$01,$c8,$01,$d8 
      dc.b      $01,$e8,$01,$f0,$02,$00,$02,$10 
      dc.b      $02,$18,$02,'(',$02,'8',$02,'@' 
      dc.b      $02,'p',$02,'`',$02,'h',$02,'x' 
      dc.b      $02,$88,$02,$90,$02,$a0,$02,$b0 
      dc.b      $02,$b8,$02,$c8,$02,$d8,$02,$e0 
      dc.b      $02,$f0,$03,$00,$03,$08,$03,$18 
      dc.b      $03,'(',$03,'0',$03,'@',$03,'p' 
      dc.b      $03,'x',$03,'h',$03,'x',$03,$80 
      dc.b      $03,$90,$03,$a0,$03,$a8,$03,$b8 
      dc.b      $03,$c8,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'0',$04,'@',$04,'p',$04,'x' 
      dc.b      $04,'h',$04,'x',$04,$88,$04,$90 
      dc.b      $04,$a0,$04,$b0,$04,$b8,$04,$c8 
      dc.b      $04,$d8,$04,$e0,$04,$f0,$05,$00 
      dc.b      $05,$10,$05,$18,$05,'(',$05,'8' 
      dc.b      $05,'@',$05,'p',$05,'`',$05,'p' 
      dc.b      $05,'x',$05,$88,$05,$98,$05,$a0 
      dc.b      $05,$b0,$05,$c0,$05,$c8,$05,$d8 
      dc.b      $05,$e8,$05,$f8,$06,$00,$06,$10 
      dc.b      $06,' ',$06,'(',$06,'8',$06,'h' 
      dc.b      $06,'p',$06,'`',$06,'p',$06,$80 
      dc.b      $06,$88,$06,$98,$06,$a8,$06,$b0 
      dc.b      $06,$c0,$06,$d0,$06,$e0,$06,$e8 
      dc.b      $06,$f8,$07,$08,$07,$10,$07,' ' 
      dc.b      $07,'0',$07,'8',$07,'h',$07,'x' 
      dc.b      $00,$90,$00,$a0,$00,$b0,$00,$c0 
      dc.b      $00,$c8,$00,$d8,$00,$e8,$00,$f0 
      dc.b      $01,$00,$01,$10,$01,$18,$01,'(' 
      dc.b      $01,'8',$01,'h',$01,'p',$01,'`' 
      dc.b      $01,'p',$01,'x',$01,$88,$01,$98 
      dc.b      $01,$a8,$01,$b0,$01,$c0,$01,$d0 
      dc.b      $01,$d8,$01,$e8,$01,$f8,$02,$00 
      dc.b      $02,$10,$02,' ',$02,'0',$02,'8' 
      dc.b      $02,'h',$02,'x',$02,'`',$02,'p' 
      dc.b      $02,$80,$02,$88,$02,$98,$02,$a8 
      dc.b      $02,$b8,$02,$c0,$02,$d0,$02,$e0 
      dc.b      $02,$e8,$02,$f8,$03,$08,$03,$18 
      dc.b      $03,' ',$03,'0',$03,'@',$03,'h' 
      dc.b      $03,'x',$03,'h',$03,'p',$03,$80 
      dc.b      $03,$90,$03,$a0,$03,$a8,$03,$b8 
      dc.b      $03,$c8,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'0',$04,'@',$04,'p',$04,'`' 
      dc.b      $04,'h',$04,'x',$04,$88,$04,$90 
      dc.b      $04,$a0,$04,$b0,$04,$c0,$04,$c8 
      dc.b      $04,$d8,$04,$e8,$04,$f0,$05,$00 
      dc.b      $05,$10,$05,' ',$05,'(',$05,'8' 
      dc.b      $05,'h',$05,'x',$05,'`',$05,'p' 
      dc.b      $05,$80,$05,$88,$05,$98,$05,$a8 
      dc.b      $05,$b8,$05,$c0,$05,$d0,$05,$e0 
      dc.b      $05,$e8,$05,$f8,$06,$08,$06,$18 
      dc.b      $06,' ',$06,'0',$06,'@',$06,'p' 
      dc.b      $06,'x',$06,'h',$06,'x',$06,$80 
      dc.b      $06,$90,$06,$a0,$06,$b0,$06,$b8 
      dc.b      $06,$c8,$06,$d8,$06,$e0,$06,$f0 
      dc.b      $07,$00,$07,$10,$07,$18,$07,'(' 
      dc.b      $07,'8',$07,'h',$07,'p',$07,'`' 
      dc.b      $00,$88,$00,$98,$00,$a8,$00,$b0 
      dc.b      $00,$c0,$00,$d0,$00,$e0,$00,$e8 
      dc.b      $00,$f8,$01,$08,$01,$18,$01,' ' 
      dc.b      $01,'0',$01,'@',$01,'h',$01,'x' 
      dc.b      $01,'h',$01,'x',$01,$80,$01,$90 
      dc.b      $01,$a0,$01,$a8,$01,$b8,$01,$c8 
      dc.b      $01,$d8,$01,$e0,$01,$f0,$02,$00 
      dc.b      $02,$10,$02,$18,$02,'(',$02,'8' 
      dc.b      $02,'@',$02,'p',$02,'`',$02,'p' 
      dc.b      $02,'x',$02,$88,$02,$98,$02,$a0 
      dc.b      $02,$b0,$02,$c0,$02,$d0,$02,$d8 
      dc.b      $02,$e8,$02,$f8,$03,$08,$03,$10 
      dc.b      $03,' ',$03,'0',$03,'8',$03,'h' 
      dc.b      $03,'x',$03,'h',$03,'p',$03,$80 
      dc.b      $03,$90,$03,$98,$03,$a8,$03,$b8 
      dc.b      $03,$c8,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'@',$04,'p',$04,'`' 
      dc.b      $04,'p',$04,'x',$04,$88,$04,$98 
      dc.b      $04,$a8,$04,$b0,$04,$c0,$04,$d0 
      dc.b      $04,$e0,$04,$e8,$04,$f8,$05,$08 
      dc.b      $05,$18,$05,' ',$05,'0',$05,'@' 
      dc.b      $05,'p',$05,'x',$05,'h',$05,'x' 
      dc.b      $05,$88,$05,$90,$05,$a0,$05,$b0 
      dc.b      $05,$c0,$05,$c8,$05,$d8,$05,$e8 
      dc.b      $05,$f8,$06,$00,$06,$10,$06,' ' 
      dc.b      $06,'0',$06,'@',$06,'h',$06,'x' 
      dc.b      $06,'h',$06,'x',$06,$80,$06,$90 
      dc.b      $06,$a0,$06,$b0,$06,$b8,$06,$c8 
      dc.b      $06,$d8,$06,$e8,$06,$f0,$07,$00 
      dc.b      $07,$10,$07,' ',$07,'(',$07,'8' 
      dc.b      $07,'h',$07,'x',$07,'`',$07,'p' 
      dc.b      $00,'x',$00,$88,$00,$98,$00,$a0 
      dc.b      $00,$b0,$00,$c0,$00,$d0,$00,$d8 
      dc.b      $00,$e8,$00,$f8,$01,$08,$01,$10 
      dc.b      $01,' ',$01,'0',$01,'@',$01,'h' 
      dc.b      $01,'x',$01,'h',$01,'x',$01,$80 
      dc.b      $01,$90,$01,$a0,$01,$b0,$01,$b8 
      dc.b      $01,$c8,$01,$d8,$01,$e8,$01,$f8 
      dc.b      $02,$00,$02,$10,$02,' ',$02,'0' 
      dc.b      $02,'8',$02,'h',$02,'x',$02,'h' 
      dc.b      $02,'p',$02,$80,$02,$90,$02,$a0 
      dc.b      $02,$a8,$02,$b8,$02,$c8,$02,$d8 
      dc.b      $02,$e0,$02,$f0,$03,$00,$03,$10 
      dc.b      $03,$18,$03,'(',$03,'8',$03,'h' 
      dc.b      $03,'p',$03,'`',$03,'p',$03,$80 
      dc.b      $03,$88,$03,$98,$03,$a8,$03,$b8 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'@',$04,'p',$04,'`' 
      dc.b      $04,'p',$04,'x',$04,$88,$04,$98 
      dc.b      $04,$a8,$04,$b8,$04,$c0,$04,$d0 
      dc.b      $04,$e0,$04,$f0,$04,$f8,$05,$08 
      dc.b      $05,$18,$05,'(',$05,'8',$05,'@' 
      dc.b      $05,'p',$05,'`',$05,'p',$05,'x' 
      dc.b      $05,$88,$05,$98,$05,$a8,$05,$b0 
      dc.b      $05,$c0,$05,$d0,$05,$e0,$05,$f0 
      dc.b      $05,$f8,$06,$08,$06,$18,$06,'(' 
      dc.b      $06,'0',$06,'@',$06,'p',$06,'`' 
      dc.b      $06,'p',$06,'x',$06,$88,$06,$98 
      dc.b      $06,$a8,$06,$b0,$06,$c0,$06,$d0 
      dc.b      $06,$e0,$06,$f0,$06,$f8,$07,$08 
      dc.b      $07,$18,$07,'(',$07,'0',$07,'@' 
      dc.b      $07,'p',$07,'`',$07,'h',$07,'x' 
      dc.b      $00,'p',$00,$80,$00,$90,$00,$98 
      dc.b      $00,$a8,$00,$b8,$00,$c8,$00,$d0 
      dc.b      $00,$e0,$00,$f0,$01,$00,$01,$08 
      dc.b      $01,$18,$01,'(',$01,'8',$01,'h' 
      dc.b      $01,'p',$01,'`',$01,'p',$01,$80 
      dc.b      $01,$88,$01,$98,$01,$a8,$01,$b8 
      dc.b      $01,$c8,$01,$d0,$01,$e0,$01,$f0 
      dc.b      $02,$00,$02,$08,$02,$18,$02,'(' 
      dc.b      $02,'8',$02,'h',$02,'p',$02,'`' 
      dc.b      $02,'p',$02,$80,$02,$88,$02,$98 
      dc.b      $02,$a8,$02,$b8,$02,$c0,$02,$d0 
      dc.b      $02,$e0,$02,$f0,$03,$00,$03,$08 
      dc.b      $03,$18,$03,'(',$03,'8',$03,'@' 
      dc.b      $03,'p',$03,'`',$03,'p',$03,$80 
      dc.b      $03,$88,$03,$98,$03,$a8,$03,$b8 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'p',$04,'`' 
      dc.b      $04,'p',$04,$80,$04,$90,$04,$98 
      dc.b      $04,$a8,$04,$b8,$04,$c8,$04,$d8 
      dc.b      $04,$e0,$04,$f0,$05,$00,$05,$10 
      dc.b      $05,' ',$05,'0',$05,'8',$05,'h' 
      dc.b      $05,'x',$05,'h',$05,'x',$05,$80 
      dc.b      $05,$90,$05,$a0,$05,$b0,$05,$c0 
      dc.b      $05,$c8,$05,$d8,$05,$e8,$05,$f8 
      dc.b      $06,$08,$06,$10,$06,' ',$06,'0' 
      dc.b      $06,'@',$06,'p',$06,'`',$06,'h' 
      dc.b      $06,'x',$06,$88,$06,$98,$06,$a8 
      dc.b      $06,$b0,$06,$c0,$06,$d0,$06,$e0 
      dc.b      $06,$f0,$06,$f8,$07,$08,$07,$18 
      dc.b      $07,'(',$07,'8',$07,'@',$07,'p' 
      dc.b      $07,'`',$07,'p',$07,$80,$07,$90 
      dc.b      $00,'`',$00,'h',$00,'x',$00,$88 
      dc.b      $00,$98,$00,$a8,$00,$b8,$00,$c0 
      dc.b      $00,$d0,$00,$e0,$00,$f0,$01,$00 
      dc.b      $01,$08,$01,$18,$01,'(',$01,'8' 
      dc.b      $01,'h',$01,'p',$01,'`',$01,'p' 
      dc.b      $01,$80,$01,$90,$01,$98,$01,$a8 
      dc.b      $01,$b8,$01,$c8,$01,$d8,$01,$e8 
      dc.b      $01,$f0,$02,$00,$02,$10,$02,' ' 
      dc.b      $02,'0',$02,'8',$02,'h',$02,'x' 
      dc.b      $02,'h',$02,'x',$02,$80,$02,$90 
      dc.b      $02,$a0,$02,$b0,$02,$c0,$02,$c8 
      dc.b      $02,$d8,$02,$e8,$02,$f8,$03,$08 
      dc.b      $03,$18,$03,' ',$03,'0',$03,'@' 
      dc.b      $03,'p',$03,'`',$03,'h',$03,'x' 
      dc.b      $03,$88,$03,$98,$03,$a8,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'p',$04,'`' 
      dc.b      $04,'p',$04,$80,$04,$90,$04,$a0 
      dc.b      $04,$a8,$04,$b8,$04,$c8,$04,$d8 
      dc.b      $04,$e8,$04,$f8,$05,$00,$05,$10 
      dc.b      $05,' ',$05,'0',$05,'@',$05,'p' 
      dc.b      $05,'x',$05,'h',$05,'x',$05,$88 
      dc.b      $05,$98,$05,$a8,$05,$b0,$05,$c0 
      dc.b      $05,$d0,$05,$e0,$05,$f0,$05,$f8 
      dc.b      $06,$08,$06,$18,$06,'(',$06,'8' 
      dc.b      $06,'h',$06,'p',$06,'`',$06,'p' 
      dc.b      $06,$80,$06,$90,$06,$a0,$06,$a8 
      dc.b      $06,$b8,$06,$c8,$06,$d8,$06,$e8 
      dc.b      $06,$f8,$07,$00,$07,$10,$07,' ' 
      dc.b      $07,'0',$07,'@',$07,'p',$07,'x' 
      dc.b      $07,'h',$07,'x',$07,$88,$07,$98 
      dc.b      $00,'x',$00,'`',$00,'p',$00,$80 
      dc.b      $00,$90,$00,$a0,$00,$a8,$00,$b8 
      dc.b      $00,$c8,$00,$d8,$00,$e8,$00,$f8 
      dc.b      $01,$00,$01,$10,$01,' ',$01,'0' 
      dc.b      $01,'@',$01,'p',$01,'x',$01,'h' 
      dc.b      $01,'x',$01,$88,$01,$98,$01,$a8 
      dc.b      $01,$b0,$01,$c0,$01,$d0,$01,$e0 
      dc.b      $01,$f0,$02,$00,$02,$08,$02,$18 
      dc.b      $02,'(',$02,'8',$02,'h',$02,'p' 
      dc.b      $02,'`',$02,'p',$02,$80,$02,$90 
      dc.b      $02,$a0,$02,$a8,$02,$b8,$02,$c8 
      dc.b      $02,$d8,$02,$e8,$02,$f8,$03,$00 
      dc.b      $03,$10,$03,' ',$03,'0',$03,'@' 
      dc.b      $03,'p',$03,'x',$03,'h',$03,'x' 
      dc.b      $03,$88,$03,$98,$03,$a8,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'x',$04,'h' 
      dc.b      $04,'p',$04,$80,$04,$90,$04,$a0 
      dc.b      $04,$b0,$04,$c0,$04,$d0,$04,$d8 
      dc.b      $04,$e8,$04,$f8,$05,$08,$05,$18 
      dc.b      $05,'(',$05,'8',$05,'h',$05,'p' 
      dc.b      $05,'`',$05,'p',$05,$80,$05,$90 
      dc.b      $05,$a0,$05,$b0,$05,$b8,$05,$c8 
      dc.b      $05,$d8,$05,$e8,$05,$f8,$06,$08 
      dc.b      $06,$18,$06,' ',$06,'0',$06,'@' 
      dc.b      $06,'p',$06,'`',$06,'p',$06,$80 
      dc.b      $06,$90,$06,$98,$06,$a8,$06,$b8 
      dc.b      $06,$c8,$06,$d8,$06,$e8,$06,$f8 
      dc.b      $07,$00,$07,$10,$07,' ',$07,'0' 
      dc.b      $07,'@',$07,'p',$07,'`',$07,'p' 
      dc.b      $07,'x',$07,$88,$07,$98,$07,$a8 
      dc.b      $00,'@',$00,'p',$00,'`',$00,'p' 
      dc.b      $00,$80,$00,$88,$00,$98,$00,$a8 
      dc.b      $00,$b8,$00,$c8,$00,$d8,$00,$e8 
      dc.b      $00,$f8,$01,$00,$01,$10,$01,' ' 
      dc.b      $01,'0',$01,'@',$01,'p',$01,'`' 
      dc.b      $01,'h',$01,'x',$01,$88,$01,$98 
      dc.b      $01,$a8,$01,$b8,$01,$c8,$01,$d8 
      dc.b      $01,$e0,$01,$f0,$02,$00,$02,$10 
      dc.b      $02,' ',$02,'0',$02,'@',$02,'h' 
      dc.b      $02,'x',$02,'h',$02,'x',$02,$88 
      dc.b      $02,$98,$02,$a8,$02,$b0,$02,$c0 
      dc.b      $02,$d0,$02,$e0,$02,$f0,$03,$00 
      dc.b      $03,$10,$03,' ',$03,'(',$03,'8' 
      dc.b      $03,'h',$03,'x',$03,'h',$03,'x' 
      dc.b      $03,$88,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'x',$04,'h' 
      dc.b      $04,'x',$04,$80,$04,$90,$04,$a0 
      dc.b      $04,$b0,$04,$c0,$04,$d0,$04,$e0 
      dc.b      $04,$f0,$05,$00,$05,$08,$05,$18 
      dc.b      $05,'(',$05,'8',$05,'h',$05,'x' 
      dc.b      $05,'h',$05,'x',$05,$80,$05,$90 
      dc.b      $05,$a0,$05,$b0,$05,$c0,$05,$d0 
      dc.b      $05,$e0,$05,$f0,$06,$00,$06,$08 
      dc.b      $06,$18,$06,'(',$06,'8',$06,'h' 
      dc.b      $06,'x',$06,'h',$06,'x',$06,$80 
      dc.b      $06,$90,$06,$a0,$06,$b0,$06,$c0 
      dc.b      $06,$d0,$06,$e0,$06,$f0,$07,$00 
      dc.b      $07,$08,$07,$18,$07,'(',$07,'8' 
      dc.b      $07,'h',$07,'x',$07,'h',$07,'x' 
      dc.b      $07,$88,$07,$90,$07,$a0,$07,$b0 
      dc.b      $00,'8',$00,'h',$00,'x',$00,'h' 
      dc.b      $00,'p',$00,$80,$00,$90,$00,$a0 
      dc.b      $00,$b0,$00,$c0,$00,$d0,$00,$e0 
      dc.b      $00,$f0,$00,$f8,$01,$08,$01,$18 
      dc.b      $01,'(',$01,'8',$01,'h',$01,'x' 
      dc.b      $01,'h',$01,'x',$01,$80,$01,$90 
      dc.b      $01,$a0,$01,$b0,$01,$c0,$01,$d0 
      dc.b      $01,$e0,$01,$f0,$01,$f8,$02,$08 
      dc.b      $02,$18,$02,'(',$02,'8',$02,'h' 
      dc.b      $02,'x',$02,'h',$02,'x',$02,$80 
      dc.b      $02,$90,$02,$a0,$02,$b0,$02,$c0 
      dc.b      $02,$d0,$02,$e0,$02,$f0,$02,$f8 
      dc.b      $03,$08,$03,$18,$03,'(',$03,'8' 
      dc.b      $03,'h',$03,'x',$03,'h',$03,'x' 
      dc.b      $03,$80,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'x',$04,'h' 
      dc.b      $04,'x',$04,$88,$04,$98,$04,$a8 
      dc.b      $04,$b8,$04,$c0,$04,$d0,$04,$e0 
      dc.b      $04,$f0,$05,$00,$05,$10,$05,' ' 
      dc.b      $05,'0',$05,'@',$05,'p',$05,'`' 
      dc.b      $05,'p',$05,$80,$05,$88,$05,$98 
      dc.b      $05,$a8,$05,$b8,$05,$c8,$05,$d8 
      dc.b      $05,$e8,$05,$f8,$06,$08,$06,$18 
      dc.b      $06,'(',$06,'8',$06,'h',$06,'p' 
      dc.b      $06,'`',$06,'p',$06,$80,$06,$90 
      dc.b      $06,$a0,$06,$b0,$06,$c0,$06,$d0 
      dc.b      $06,$e0,$06,$f0,$07,$00,$07,$10 
      dc.b      $07,$18,$07,'(',$07,'8',$07,'h' 
      dc.b      $07,'x',$07,'h',$07,'x',$07,$88 
      dc.b      $07,$98,$07,$a8,$07,$b8,$07,$c8 
      dc.b      $00,'(',$00,'0',$00,'@',$00,'p' 
      dc.b      $00,'`',$00,'p',$00,$80,$00,$90 
      dc.b      $00,$a0,$00,$b0,$00,$c0,$00,$d0 
      dc.b      $00,$e0,$00,$e8,$00,$f8,$01,$08 
      dc.b      $01,$18,$01,'(',$01,'8',$01,'h' 
      dc.b      $01,'x',$01,'h',$01,'x',$01,$88 
      dc.b      $01,$98,$01,$a8,$01,$b0,$01,$c0 
      dc.b      $01,$d0,$01,$e0,$01,$f0,$02,$00 
      dc.b      $02,$10,$02,' ',$02,'0',$02,'@' 
      dc.b      $02,'p',$02,'`',$02,'p',$02,'x' 
      dc.b      $02,$88,$02,$98,$02,$a8,$02,$b8 
      dc.b      $02,$c8,$02,$d8,$02,$e8,$02,$f8 
      dc.b      $03,$08,$03,$18,$03,'(',$03,'8' 
      dc.b      $03,'@',$03,'p',$03,'`',$03,'p' 
      dc.b      $03,$80,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'x',$04,'h' 
      dc.b      $04,'x',$04,$88,$04,$98,$04,$a8 
      dc.b      $04,$b8,$04,$c8,$04,$d8,$04,$e8 
      dc.b      $04,$f8,$05,$00,$05,$10,$05,' ' 
      dc.b      $05,'0',$05,'@',$05,'p',$05,'`' 
      dc.b      $05,'p',$05,$80,$05,$90,$05,$a0 
      dc.b      $05,$b0,$05,$c0,$05,$d0,$05,$e0 
      dc.b      $05,$f0,$06,$00,$06,$08,$06,$18 
      dc.b      $06,'(',$06,'8',$06,'h',$06,'x' 
      dc.b      $06,'h',$06,'x',$06,$88,$06,$98 
      dc.b      $06,$a8,$06,$b8,$06,$c8,$06,$d8 
      dc.b      $06,$e8,$06,$f8,$07,$08,$07,$10 
      dc.b      $07,' ',$07,'0',$07,'@',$07,'p' 
      dc.b      $07,'`',$07,'p',$07,$80,$07,$90 
      dc.b      $07,$a0,$07,$b0,$07,$c0,$07,$d0 
      dc.b      $00,$18,$00,'(',$00,'8',$00,'h' 
      dc.b      $00,'x',$00,'h',$00,'x',$00,$88 
      dc.b      $00,$98,$00,$a8,$00,$b8,$00,$c8 
      dc.b      $00,$d8,$00,$e8,$00,$f0,$01,$00 
      dc.b      $01,$10,$01,' ',$01,'0',$01,'@' 
      dc.b      $01,'p',$01,'`',$01,'p',$01,$80 
      dc.b      $01,$90,$01,$a0,$01,$b0,$01,$c0 
      dc.b      $01,$d0,$01,$e0,$01,$f0,$01,$f8 
      dc.b      $02,$08,$02,$18,$02,'(',$02,'8' 
      dc.b      $02,'h',$02,'x',$02,'h',$02,'x' 
      dc.b      $02,$88,$02,$98,$02,$a8,$02,$b8 
      dc.b      $02,$c8,$02,$d8,$02,$e8,$02,$f8 
      dc.b      $03,$00,$03,$10,$03,' ',$03,'0' 
      dc.b      $03,'@',$03,'p',$03,'`',$03,'p' 
      dc.b      $03,$80,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$08,$04,$18,$04,'(' 
      dc.b      $04,'8',$04,'h',$04,'x',$04,'h' 
      dc.b      $04,'x',$04,$88,$04,$98,$04,$a8 
      dc.b      $04,$b8,$04,$c8,$04,$d8,$04,$e8 
      dc.b      $04,$f8,$05,$08,$05,$18,$05,'(' 
      dc.b      $05,'8',$05,'h',$05,'x',$05,'h' 
      dc.b      $05,'x',$05,$88,$05,$98,$05,$a8 
      dc.b      $05,$b8,$05,$c8,$05,$d8,$05,$e8 
      dc.b      $05,$f8,$06,$08,$06,$18,$06,'(' 
      dc.b      $06,'8',$06,'h',$06,'x',$06,'h' 
      dc.b      $06,'x',$06,$88,$06,$98,$06,$a8 
      dc.b      $06,$b8,$06,$c8,$06,$d8,$06,$e8 
      dc.b      $06,$f8,$07,$08,$07,$18,$07,' ' 
      dc.b      $07,'0',$07,'@',$07,'p',$07,'`' 
      dc.b      $07,'p',$07,$80,$07,$90,$07,$a0 
      dc.b      $07,$b0,$07,$c0,$07,$d0,$07,$e0 
      dc.b      $00,$08,$00,$18,$00,'(',$00,'8' 
      dc.b      $00,'h',$00,'x',$00,'h',$00,'x' 
      dc.b      $00,$88,$00,$98,$00,$a8,$00,$b8 
      dc.b      $00,$c8,$00,$d8,$00,$e0,$00,$f0 
      dc.b      $01,$00,$01,$10,$01,' ',$01,'0' 
      dc.b      $01,'@',$01,'p',$01,'`',$01,'p' 
      dc.b      $01,$80,$01,$90,$01,$a0,$01,$b0 
      dc.b      $01,$c0,$01,$d0,$01,$e0,$01,$f0 
      dc.b      $02,$00,$02,$10,$02,' ',$02,'0' 
      dc.b      $02,'@',$02,'p',$02,'`',$02,'p' 
      dc.b      $02,$80,$02,$90,$02,$a0,$02,$b0 
      dc.b      $02,$c0,$02,$d0,$02,$e0,$02,$f0 
      dc.b      $03,$00,$03,$10,$03,' ',$03,'0' 
      dc.b      $03,'@',$03,'p',$03,'`',$03,'p' 
      dc.b      $03,$80,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
      dc.b      $04,$00,$04,$10,$04,' ',$04,'0' 
      dc.b      $04,'@',$04,'p',$04,'`',$04,'p' 
      dc.b      $04,$80,$04,$90,$04,$a0,$04,$b0 
      dc.b      $04,$c0,$04,$d0,$04,$e0,$04,$f0 
      dc.b      $05,$00,$05,$10,$05,' ',$05,'0' 
      dc.b      $05,'@',$05,'p',$05,'`',$05,'p' 
      dc.b      $05,$80,$05,$90,$05,$a0,$05,$b0 
      dc.b      $05,$c0,$05,$d0,$05,$e0,$05,$f0 
      dc.b      $06,$00,$06,$10,$06,' ',$06,'0' 
      dc.b      $06,'@',$06,'p',$06,'`',$06,'p' 
      dc.b      $06,$80,$06,$90,$06,$a0,$06,$b0 
      dc.b      $06,$c0,$06,$d0,$06,$e0,$06,$f0 
      dc.b      $07,$00,$07,$10,$07,' ',$07,'0' 
      dc.b      $07,'@',$07,'p',$07,'`',$07,'p' 
      dc.b      $07,$80,$07,$90,$07,$a0,$07,$b0 
      dc.b      $07,$c0,$07,$d0,$07,$e0,$07,$f0 
      dc.b      $00,$00,$00,$10,$00,' ',$00,'0' 
      dc.b      $00,'@',$00,'p',$00,'`',$00,'p' 
      dc.b      $00,$80,$00,$90,$00,$a0,$00,$b0 
      dc.b      $00,$c0,$00,$d0,$00,$e0,$00,$f0 
      dc.b      $01,$00,$01,$10,$01,' ',$01,'0' 
      dc.b      $01,'@',$01,'p',$01,'`',$01,'p' 
      dc.b      $01,$80,$01,$90,$01,$a0,$01,$b0 
      dc.b      $01,$c0,$01,$d0,$01,$e0,$01,$f0 
      dc.b      $02,$00,$02,$10,$02,' ',$02,'0' 
      dc.b      $02,'@',$02,'p',$02,'`',$02,'p' 
      dc.b      $02,$80,$02,$90,$02,$a0,$02,$b0 
      dc.b      $02,$c0,$02,$d0,$02,$e0,$02,$f0 
      dc.b      $03,$00,$03,$10,$03,' ',$03,'0' 
      dc.b      $03,'@',$03,'p',$03,'`',$03,'p' 
      dc.b      $03,$80,$03,$90,$03,$a0,$03,$b0 
      dc.b      $03,$c0,$03,$d0,$03,$e0,$03,$f0 
l00bf:dc.b      $00,$00,$03,$02,$04,$13,$05,'$' 
      dc.b      $06,'5',$00,'f',$00,'u',$00,'d' 
      dc.b      $00,'3',$00,'"',$02,'4',$03,'e' 
      dc.b      $04,'v',$07,'f',$05,'g',$01,'#' 
l00c0:dc.b      $01,'y',$00,$c0,$00,'?',$00,$19 
      dc.b      'ql`',$e0,$80,$1f,$00,$0c 
      dc.b      $cf,')',$00,'0',$ff,$c0,$cf,$00 
      dc.b      'nd',$e0,$00,$1f,$ff,$0e,'d'
      dc.b      $f3,'(',$00,'0',$ff,$c0,$f3,$00 
      dc.b      $b3,'9p',$00,$0f,$ff,$03,'9'
      dc.b      $8c,$c7,$00,$00,$ff,$ff,$8c,$c7 
      dc.b      'u',$01,$16,$00,$e8,$00,'@',$00 
      dc.b      'd',$e6,$e0,$00,$1f,$ff,$04,$e6 
      dc.b      $a2,$9b,$c1,$80,$00,$7f,$00,$1b 
      dc.b      't',$19,$10,$00,$ef,$ff,'d',$19 
      dc.b      'b',$d3,$03,'0',$fc,$0f,'@',$03 
      dc.b      $14,$a4,$18,'`',$e0,$1f,$00,$04 
      dc.b      'tq',$00,'`',$ff,$80,'t',$00
      dc.b      'm',$b8,$e0,$00,$1f,$ff,$0d,$b8 
      dc.b      $a0,'(',$c0,$18,$00,$07,$00,$00 
      dc.b      $b1,'@',$01,$80,$fe,$00,$b0,$00 
      dc.b      'q',$b8,'0',$00,$0f,$ff,$01,$b8 
      dc.b      ')m0',$c0,$c0,'?',$00,$0d 
      dc.b      $96,$a0,$00,$c0,$ff,$00,$96,$00 
      dc.b      $00,'@',$01,$80,$00,$00,$00,$00 
      dc.b      'b@0',$80,$01,$00,$00,$00 
      dc.b      $00,'%',$00,$1b,$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $00,'!',$00,$18,$00,$00,$00,$00 
      dc.b      ' ',$00,$c0,$00,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $05,'e',$03,$83,$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $80,$80,'c',$00,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $02,$90,$01,$a0,$00,'@',$00,$00 
      dc.b      $12,$a0,$0d,$c0,$00,$00,$00,$00 
      dc.b      $00,'@',$00,'1',$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $a8,$a8,'pp',$00,$00,$00,$00
      dc.b      $01,'q',$00,$e0,$00,$00,$00,$00 
      dc.b      $10,$00,$a0,$00,'@',$00,$00,$00 
      dc.b      '%@',$1b,$80,$00,$00,$00,$00
      dc.b      $00,$80,$00,'`',$00,$00,$00,$00 
      dc.b      $00,$df,$00,$7f,$01,'@',$00,$7f 
      dc.b      't',$be,$d3,$7f,'@',$00,$c0,$7f 
      dc.b      $af,$bd,$bf,$ee,$a0,' ',$bf,$e0 
      dc.b      $bf,$fe,$ff,$ff,$80,$00,$ff,$ff 
      dc.b      $af,$ba,$bf,$e9,$a0,' ',$bf,$e0 
      dc.b      '_w',$bf,$df,$00,'p?',$df 
      dc.b      $d5,$ff,$f7,$ff,$14,$00,$f7,$ff 
      dc.b      $fb,'m',$fe,$c6,$02,$00,$fe,$00 
      dc.b      $bf,$fe,$ff,$ff,$80,$00,$ff,$ff 
      dc.b      $e1,$bf,$a0,$ff,$82,$80,$80,$ff 
      dc.b      $ff,$ea,$ff,$fb,$00,$0a,$ff,$fb 
      dc.b      $fb,'7',$fe,$df,$02,$10,$fe,$1f 
      dc.b      $de,$df,$f7,$7f,$10,'@',$f0,$7f 
      dc.b      $ff,'p',$ff,$d0,$00,'a',$ff,$c0 
      dc.b      $df,$ff,$7f,$ff,'@',$00,$7f,$ff 
      dc.b      'm',$b7,$d8,$df,'@',$10,$c0,$1f 
      dc.b      $fe,$da,$ff,$b0,$00,$81,$ff,$80 
      dc.b      'o',$ff,$bf,$ff,' ',$00,'?',$ff 
      dc.b      $bd,$bf,$ee,$ff,' ',$80,$e0,$ff 
      dc.b      $fe,$e0,$ff,$a0,$00,$80,$ff,$80 
      dc.b      $01,$00,$01,'v',$00,'?',$00,$7f 
      dc.b      $83,'u',$96,$c9,$00,'>',$c0,$eb 
      dc.b      $00,'j+m',$1f,$80,$bf,$e1 
      dc.b      $80,$01,$99,$19,$7f,$fe,$ff,$ff 
      dc.b      $00,'a',$ab,'k',$1f,$80,$bf,$e0 
      dc.b      $aa,$80,'d',$95,$1f,$0f,'u',$df 
      dc.b      ' ',$00,$a5,$99,$c3,$ff,$f7,$ff 
      dc.b      $06,$ba,'gm',$f8,$00,$ff,$01
      dc.b      $80,$01,$99,$19,$7f,$fe,$ff,$ff 
      dc.b      $02,$00,$a2,$a9,$00,$7f,$80,$ff 
      dc.b      $00,$10,$96,$d2,$ff,$e1,$ff,$fb 
      dc.b      $04,$00,$b4,$15,$f8,$0f,$fe,$1f 
      dc.b      '%@6',$cc,$c0,'?',$f0,$ff 
      dc.b      $00,$90,$8c,$d0,$ff,$01,$ff,$c0 
      dc.b      $00,$00,'y',$dc,'?',$ff,$7f,$ff 
      dc.b      $d7,'p',$ed,$b3,$00,$0f,$e0,'?' 
      dc.b      $01,$ac,'y',$d9,$fe,$02,$ff,$c0 
      dc.b      $a0,$00,'ff',$1f,$ff,$7f,$ff
      dc.b      'j',$80,'m',$99,$80,$7f,$e1,$ff 
      dc.b      $01,$00,$19,$a0,$fe,$00,$ff,$80 
      dc.b      $00,'o',$00,'o',$01,'0',$00,$7f 
      dc.b      'i',$ad,$d3,$8f,'eq',$81,$de
      dc.b      $27,$a5,'7',$eb,$18,' ',$bf,$c3 
      dc.b      $1f,$fe,'_',$ff,$e0,$00,$ff,$ff 
      dc.b      $a7,$a4,$b7,$e9,$98,'"?',$c0
      dc.b      $d6,$93,$c7,$9b,$b8,$8c,$ef,'_' 
      dc.b      $d4,$ff,$f6,$ff,$13,$00,$e7,$ff 
      dc.b      $f9,'u',$f9,$bb,$06,$00,$ff,$83 
      dc.b      $1f,$fe,'_',$ff,$e0,$00,$ff,$ff 
      dc.b      $a0,$9f,$a0,$df,$82,'`',$00,$ff 
      dc.b      $ff,$ea,$ff,$fb,$00,$09,$ff,$f3 
      dc.b      'z',$13,'~',$1b,$82,$0c,$fc,$1f 
      dc.b      $d2,$8f,$f5,$af,$10,'p',$e1,$ff 
      dc.b      $ff,'@',$ff,$d0,$00,'a',$ff,$80 
      dc.b      'o',$ff,'o',$ff,'0',$00,$7f,$ff 
      dc.b      '*',$a3,'7k',$c0,$1c,$f0,$7f
      dc.b      $fe,'u',$fe,'n',$01,$80,$ff,$e0 
      dc.b      'g',$ff,$d7,$ff,'8',$00,$ff,$ff 
      dc.b      $a5,$1f,$eb,'_ ',$e0,$c3,$ff
      dc.b      $fe,$a0,$ff,$a0,$00,$80,$ff,$00 
      dc.b      $01,'o',$00,'o',$01,'0',$01,$7f 
      dc.b      $d2,'[',$dd,$1f,$c0,$e3,$81,$bc 
      dc.b      $a4,$ea,$a6,$e7,$99,'a',$bf,$c7 
      dc.b      '|f',$7f,'w',$80,$88,$ff,$ff
      dc.b      $a7,$e9,$a7,$ee,$98,'`?',$c0
      dc.b      '-',$d2,$8f,$d3,'q',$cc,$de,'_' 
      dc.b      'u',$fe,'w',$ff,$b2,$00,$e7,$ff 
      dc.b      '>',$aa,$be,$d7,'a',$81,$ff,'g' 
      dc.b      '|f',$7f,'w',$80,$88,$ff,$ff
      dc.b      $82,$97,$a0,$9f,$82,'`',$02,$ff 
      dc.b      '?:',$bf,$ba,'@y',$ff,$f3 
      dc.b      '~',$17,'~',$17,$86,$08,$fc,$1f 
      dc.b      $c5,'>',$f3,$bf,$10,$c0,$e3,$ff 
      dc.b      '3q',$bb,$d0,'da',$ff,$81 
      dc.b      'x',$f3,'^',$fb,'!',$04,$7f,$ff 
      dc.b      $d5,'o',$da,$ef,'00',$e8,$ff
      dc.b      $8f,$aa,$ef,$b5,$10,'`',$ff,$d1 
      dc.b      $9f,$19,$df,$dd,'`"',$ff,$ff
      dc.b      $aa,'|',$e7,$7f,'!',$80,$c7,$ff 
      dc.b      'f',$80,'w',$a0,$88,$80,$ff,$00 
      dc.b      $00,'_',$00,'_',$01,' ',$00,$7f 
      dc.b      'ox',$db,':b',$c2,$83,$bd 
      dc.b      ',',$cc,'<',$ec,$13,'k?',$cf
      dc.b      $fc,'g',$fc,'g',$03,$99,$ff,$ff 
      dc.b      '/',$a7,$af,$ed,$90,'!?',$c1
      dc.b      $bc,$16,$9d,$1e,'a',$09,$de,$9f 
      dc.b      'e',$ce,'u',$ee,$b2,$11,$e7,$ff 
      dc.b      $7f,$fc,$7f,$ec,$80,'k',$ff,$af 
      dc.b      $fc,'g',$fc,'g',$03,$99,$ff,$ff 
      dc.b      ' ',$b7,$80,$f7,$82,'h',$00,$ff 
      dc.b      '#2',$bb,':d',$d9,$ff,$f3 
      dc.b      $fa,$14,$fe,$1f,$02,$08,$fc,$1f 
      dc.b      'v~v~',$b5,$81,$e7,$ff
      dc.b      '33',$d0,$cc,$c1,$ff,$81 
      dc.b      'x',$f3,'x',$f3,$27,$0c,$7f,$ff 
      dc.b      $ff,$9f,$fd,$9f,$1d,'`',$e5,$ff 
      dc.b      $9f,$ff,$9f,$fb,'`',$1a,$ff,$eb 
      dc.b      '?',$19,'?',$19,$c0,$e6,$ff,$ff 
      dc.b      $cc,$fc,$ec,$fc,'k',$03,$cf,$ff 
      dc.b      'g g',$80,$99,$80,$ff,$00 
      dc.b      $01,'s',$00,'{',$01,'$',$01,$7f 
      dc.b      $80,$87,$da,'/',$c1,$d7,$83,'y' 
      dc.b      '/!/',$eb,$10,'&?',$cf
      dc.b      $ff,$fd,$ff,$ff,$00,$01,$ff,$ff 
      dc.b      $a9,$c2,$bd,$ed,$92,'`?',$c1
      dc.b      'c',$97,$17,$97,$eb,$88,$bc,$9f 
      dc.b      $95,$cf,$f5,$cf,$12,'0',$e7,$ff 
      dc.b      $f9,'a',$fd,$eb,$02,'f',$ff,$af 
      dc.b      $ff,$fd,$ff,$ff,$00,$01,$ff,$ff 
      dc.b      $a2,$bf,$80,$bf,$82,'@',$02,$ff 
      dc.b      '#',$ca,'#',$fb,$dc,$09,$ff,$f3 
      dc.b      $9c,$14,$de,$1c,'&',$0b,$fc,$1f 
      dc.b      '@',$ff,'u',$ff,$93,$00,$e7,$ff 
      dc.b      $fe,$d0,$ff,$c0,$00,$c1,$ff,$80 
      dc.b      '_',$ff,'_',$ff,' ',$00,$7f,$ff 
      dc.b      $f0,'?',$f9,$7f,$08,$c0,$f5,$ff 
      dc.b      $fe,'p',$ff,'z',$00,$91,$ff,$eb 
      dc.b      $7f,$ff,$ff,$ff,$80,$00,$ff,$ff 
      dc.b      'a',$ff,$eb,$ff,'f',$00,$cf,$ff 
      dc.b      $fd,$80,$ff,$a0,$01,$80,$ff,$00 
      dc.b      $01,'s',$00,'s',$01,',',$01,$7f 
      dc.b      $9e,$c0,$d6,'d',$c5,$b4,$87,'z' 
      dc.b      $16,'i?',$c9,$06,'f?',$af 
      dc.b      '-',$b5,$bf,$fd,'m',$b5,$ff,$fe 
      dc.b      ')',$cf,'9',$eb,$16,'b',$bf,$c3 
      dc.b      '`',$0b,'"',$1f,$da,$03,$bd,$1f 
      dc.b      '%',$f2,$e7,$ff,'"',$02,$d7,$ff 
      dc.b      $99,$e9,$fd,$e9,$82,'&',$ff,$cf 
      dc.b      '-',$b5,$bf,$fd,'m',$b5,$ff,$fe 
      dc.b      $00,'[ ',$ff,$02,$18,$80,$ff
      dc.b      $fc,$92,$ff,$f3,$00,$91,$ff,$eb 
      dc.b      $9c,$17,$9e,$1f,'f',$08,$fc,$1f 
      dc.b      $e4,$96,$f4,$df,'3&',$e7,$ff
      dc.b      $da,$80,$fe,$90,$da,$81,$ff,'@' 
      dc.b      '6g',$7f,$ff,$16,'`o',$ff 
      dc.b      '5%',$bd,'7d',$c9,$f9,$ff 
      dc.b      $a6,'z',$ff,'z',$a0,$89,$ff,$f3 
      dc.b      'kmo',$ff,$93,'m',$ff,$ff 
      dc.b      'i-i',$bf,'fm',$af,$ff
      dc.b      $b5,$00,$fd,' ',$b5,$00,$fe,$80 
      dc.b      $00,'w',$00,'w',$01,'(',$00,$7f 
      dc.b      'an”~c',$8e,$86,$f2 
      dc.b      '*',$ab,'-',$af,'/',$a4,'0o'
      dc.b      '6',$96,'?n',$d7,$fe,$f8,$01
      dc.b      $ab,$a4,$bb,$ca,$94,'!',$bf,$c3 
      dc.b      $b7,$15,'?',$16,$c7,$17,'y',$18 
      dc.b      'u',$f3,$d7,$fb,$d2,$03,'7',$fc 
      dc.b      'y',$ab,$f9,$ef,$e6,'$',$1f,$cf 
      dc.b      '6',$96,'?n',$d7,$fe,$f8,$01
      dc.b      $a3,$ae,$a2,$b6,$80,$bf,$80,$c1 
      dc.b      $ba,$aa,$bf,'kc',$e9,$fc,$1b
      dc.b      $ba,$17,$bc,$17,'b',$08,$fc,$1f 
      dc.b      $d5,$9b,$e7,$9f,$12,'k',$e7,$fc 
      dc.b      'kp',$b7,'p',$ff,'a',$00,$c0
      dc.b      'z',$9f,'}',$7f,'_',$fa,'`',$05 
      dc.b      '5f',$bd,$e7,'d',$9a,$f9,$ff
      dc.b      $de,'j',$fe,'z',$f9,$89,$07,$f3 
      dc.b      $cd,$a5,$cf,$db,'5',$ff,$fe,$00 
      dc.b      $ab,'6',$ab,'?',$a4,$d7,'o',$f8 
      dc.b      $96,$e0,'n',$a0,$fe,$80,$01,$80 
      dc.b      $01,'_',$01,'_',$00,' ',$00,$7f 
      dc.b      $1d,$e0,$cc,$f8,'k',$08,$8e,$f4 
      dc.b      $00,$0b,$00,$0f,$00,$04,$00,$0f 
      dc.b      $ec,$00,$fc,$00,$0c,$00,$f4,$00 
      dc.b      '/Ž/',$e6,$10,'%?',$c7
      dc.b      $f0,$00,'|',$00,$84,$00,'z',$00 
      dc.b      $05,$fe,$07,$fe,$02,$0e,$07,$fa 
      dc.b      'o',$cb,'o',$ef,'pd',$7f,$cf
      dc.b      $ec,$00,$fc,$00,$0c,$00,$f4,$00 
      dc.b      ' ',$86,'#',$06,$00,$05,$00,$07 
      dc.b      $f9,$02,$ff,$02,$03,$01,$fd,$03 
      dc.b      $f8,$a6,$fe,$ef,$02,$98,$fc,$ff 
      dc.b      'e',$f6,'w',$fe,$b2,$06,$e7,$fa 
      dc.b      $00,'a',$00,'0',$00,$01,$00,$01 
      dc.b      $00,$0d,$00,$0d,$00,$0a,$00,$0f 
      dc.b      '9}9',$ff,$c8,$81,$f5,$fe 
      dc.b      $9b,$f2,$9b,$fb,$94,$19,$9f,$f3 
      dc.b      $fb,$00,$ff,$00,$03,$00,$fd,$00 
      dc.b      $0b,$ec,$0f,$fc,$04,$0c,$0f,$f4 
      dc.b      $00,$80,$00,'`',$00,$00,$00,$00 
      dc.b      $00,'q',$00,'}',$01,'"',$00,$7f 
      dc.b      $c2,$ec,$88,$ec,$c7,$0c,$8d,$f4 
      dc.b      '/',$ab,'?',$eb,' $?',$ef 
      dc.b      $f8,$00,$f8,$00,$18,$00,$f0,$00 
      dc.b      '(',$e1,'>',$c4,$11,'c?',$c6
      dc.b      'v',$17,'v',$1f,$86,$10,$fa,$1f 
      dc.b      $d5,$14,$f5,$dc,$12,'$',$f7,$f8 
      dc.b      '/',$ab,'?',$eb,$10,'$?',$cf
      dc.b      $f8,$00,$f8,$00,$18,$00,$f0,$00 
      dc.b      '"',$ea,$01,$f3,$00,$01,$00,$03 
      dc.b      $8e,$aa,$ec,'s',$16,$01,$fc,$03 
      dc.b      $8e,$06,$ec,$b6,$16,'y',$fc,$ff 
      dc.b      'u',$ff,'u',$ff,$b2,$00,$e7,$ff 
      dc.b      $f5,'q',$fc,$e0,$04,$01,$fc,$01 
      dc.b      $00,$0d,$00,$0f,$00,$0a,$00,$0f 
      dc.b      $ed,$7f,$fd,$7f,$0c,$83,$f5,$fe 
      dc.b      $0b,$e8,$0f,$fa,$04,$09,$0f,$f3 
      dc.b      $7f,$fa,$7f,$fe,$80,$02,$ff,$fe 
      dc.b      $01,$ff,$09,$ff,$06,$00,$0f,$ff 
      dc.b      $ed,$a0,$fb,$c0,$08,$00,$f8,$00 
      dc.b      $01,'q',$00,'q',$01,'.',$01,$7f 
      dc.b      $99,$10,$d9,$b0,$d6,'p',$9f,$e8 
      dc.b      $00,'j/k',$1f,$84,'?',$ef 
      dc.b      'p',$00,'x',$00,$98,$00,$f0,$00 
      dc.b      '(',$cc,'8',$ec,$17,'k?',$cf
      dc.b      $88,$00,$d8,$17,'(',$0f,$f4,$1f 
      dc.b      '%8',$a5,'<',$c2,$cc,$f7,$f8
      dc.b      ',',$ca,'>',$eb,$11,'d?',$cf
      dc.b      'p',$be,'x',$ff,$98,$80,$f0,$ff 
      dc.b      $80,'"',$a0,$1b,$80,$01,$80,$03 
      dc.b      $8c,'"',$8e,$db,'v',$01,$fc,$03 
      dc.b      $8c,$9f,$8e,$df,'v`',$fc,$ff
      dc.b      $c5,'8',$f5,$bb,$12,'g',$e7,$ff 
      dc.b      $08,$81,$ad,$00,$f0,$01,$fc,$01 
      dc.b      '_q',$7f,$db,'@v',$7f,$df 
      dc.b      $d1,'n',$f9,'o',$10,$93,$e9,$fe 
      dc.b      's3w',$bb,'lz',$7f,$f3
      dc.b      'd',$06,'tg',$8b,$f8,$ff,$ff
      dc.b      $0d,$90,$0d,$d1,$0a,'/',$0f,$ff 
      dc.b      $19,$c0,$9c,$80,$e0,$00,$fc,$00 
      dc.b      $01,'_',$00,$7f,$01,' ',$01,$7f 
      dc.b      $09,$08,$dd,$18,'f',$d8,$9f,$e8 
      dc.b      $27,$aa,'7',$ef,$18,'$?',$cf
      dc.b      'x',$00,'p',$00,$98,$00,$f0,$00 
      dc.b      '/„?',$ee,$10,'#?',$cf
      dc.b      $84,$13,$8c,$1b,'l',$0c,$f4,$1f 
      dc.b      $d5,$fc,$f7,$f8,$12,$0c,$e7,$f8 
      dc.b      ',',$ea,',',$cf,$13,'d?',$cf
      dc.b      'x',$01,'p',$a9,$98,'~',$f0,$ff 
      dc.b      ' ',$1a,$a0,$0b,$00,$01,$80,$03 
      dc.b      $f8,$da,$fe,$8b,$02,$01,$fc,$03 
      dc.b      $f8,$a3,$fe,$fb,$02,'d',$fc,$ff 
      dc.b      $d5,$27,$e7,$b7,$12,'h',$e7,$ff 
      dc.b      $f5,$01,$fd,$00,$04,$01,$f8,$01 
      dc.b      $00,$89,'v',$dd,'?',$06,$7f,$df 
      dc.b      $89,'o',$e9,$ee,'(',$93,$d9,$fe 
      dc.b      $03,'8[9<',$d8,$7f,$f1
      dc.b      $a7,$f9,$a7,$f9,'x',$06,$ff,$ff 
      dc.b      $02,$9f,$86,$9f,$01,'`',$87,$ff 
      dc.b      $e4,$80,$e6,'@',$18,$00,$fe,$00 
      dc.b      $01,'_',$00,$7f,$01,' ',$01,$7f 
      dc.b      $8b,$c8,$d9,$d8,$c6,$18,$9d,$e8 
      dc.b      $27,$ea,'7',$ee,$18,'e?',$cf
      dc.b      '`',$00,'x',$00,$88,$00,$f0,$00 
      dc.b      '/',$c5,'?',$ec,$10,'c?',$ce
      dc.b      $e4,$13,$ec,$1b,$0c,$0c,$f4,$1f 
      dc.b      $f5,$f0,$f7,$fc,'2',$04,$e7,$f8 
      dc.b      '/',$aa,'?',$ce,$10,'%?',$cf
      dc.b      '`žx',$df,$88,'`',$f0,$ff 
      dc.b      $80,$0a,$a0,$0b,$80,$01,$00,$03 
      dc.b      $fc,$82,$fe,$83,$06,$09,$fc,$03 
      dc.b      $fc,$a3,$fe,$e3,$06,'\',$fc,$ff 
      dc.b      $d5,$27,$e7,$27,$12,$d8,$e7,$ff 
      dc.b      $f5,$00,$fd,$00,$04,$01,$f8,$00 
      dc.b      'oko',$db,'0d',$7f,$9f
      dc.b      $a9,'l',$e9,$cf,'(',$b1,$d9,$fe 
      dc.b      'o',$e0,'o',$f8,'0',$08,$7f,$f0 
      dc.b      '_',$be,$df,$be,'`a',$bf,$ff
      dc.b      $81,'~',$c3,'~',$81,$81,'b',$ff 
      dc.b      $fa,'`',$fb,'@',$06,$00,$fd,$00 
      dc.b      $00,'y',$00,'}',$01,'"',$00,$7f 
      dc.b      $db,$d0,$d9,$f0,$d6,$10,$9d,$e8 
      dc.b      ')',$ab,'=',$eb,$12,'$?',$cf
      dc.b      $e0,$00,$f8,$00,$08,$00,$f0,$00 
      dc.b      ',',$ed,'>',$ec,$11,'k?',$ce
      dc.b      $e8,$14,$f8,$1e,$08,$09,$f4,$1f 
      dc.b      $d5,$90,$f5,$dc,$12,'$',$e7,$f8 
      dc.b      '/',$cb,'/',$eb,$10,'d?',$cf
      dc.b      $e0,$a7,$f8,$b7,$08,'i',$f0,$ff 
      dc.b      $a0,$02,$80,$03,$80,$09,$00,$03 
      dc.b      $ce,$8a,$ee,$83,$16,$09,$fc,$0b 
      dc.b      $ce,$bf,$ee,$bf,$16,'@',$fc,$ff 
      dc.b      $e5,$f6,$f5,$ff,'2',$06,$e7,$ff 
      dc.b      'h',$81,$f9,$00,'h',$01,$f4,$01 
      dc.b      '_',$95,$7f,$dd,' ',$d2,$7f,$9f 
      dc.b      $f1,'|',$f9,$7f,$10,$81,$e9,$fe 
      dc.b      'y',$e8,'}',$f0,'"',$08,$7f,$f0 
      dc.b      '5',$bf,$7f,$ff,'%',$80,'_',$ff 
      dc.b      $e0,$d6,$e1,$ff,'`',$96,$a1,$7f 
      dc.b      $ff,$c0,$ff,$a0,$01,$80,$fe,$80 
      dc.b      $01,'y',$01,']',$00,'"',$00,$7f 
      dc.b      $04,$cc,$ce,$ec,'c',$0c,$8d,$f4 
      dc.b      ')',$cb,'-',$ef,$12,'d?',$cf
      dc.b      $f8,$00,$f8,$00,$18,$00,$f0,$00 
      dc.b      ',',$82,'.',$e7,$11,'!?',$c6
      dc.b      'f',$14,'v',$16,$86,$09,$fa,$1f 
      dc.b      $e5,$9c,$f5,$98,'2l',$e7,$f8
      dc.b      '(',$eb,'.',$ef,$11,'d?',$cf
      dc.b      $f8,$a7,$f8,$b7,$18,'i',$f0,$ff 
      dc.b      $00,$0a,$a0,$02,$80,$09,$00,$0b 
      dc.b      $c8,$82,$ee,$82,$12,$09,$fc,$03 
      dc.b      $c8,'|',$ee,$fe,$12,$01,$fc,$ff 
      dc.b      $d5,$fa,$f7,$ff,$12,$0b,$e7,$fc 
      dc.b      $95,'qt',$e0,$f4,$01,$0c,$01
      dc.b      'sm{',$8f,'$j',$7f,$8f
      dc.b      $e5,'g',$fd,$f7,$0c,$8b,$f5,$fe 
      dc.b      'y',$e8,'}',$f0,'"',$08,$7f,$f0 
      dc.b      '-9>',$fd,'/',$e2,'0',$1f 
      dc.b      '@',$b4,$e0,$fb,'@',$bf,$a0,$c0 
      dc.b      $e5,' ',$f7,$a0,$89,$00,'~',$80 
      dc.b      $00,'y',$00,'y',$01,'&',$00,$7f 
      dc.b      $dd,$80,$8c,$d8,$cb,'(',$8e,$f4 
      dc.b      ')',$ca,')',$ef,$16,'d?',$cf
      dc.b      '<',$00,$bc,$00,'\',$00,$f4,$00 
      dc.b      ',',$ee,',',$c6,$13,'e?',$c7
      dc.b      $c0,$14,'l',$14,$94,$0b,'z',$1f 
      dc.b      $e5,$f8,$f5,$fc,'2',$0c,$e7,$f8 
      dc.b      '(',$ca,'8',$ef,$17,'d?',$cf
      dc.b      '<',$a6,$bc,$e7,'\x',$f4,$ff
      dc.b      $a0,$0a,' ',$02,$80,$09,$00,$0b 
      dc.b      $ce,$8a,$cc,$82,'6',$09,$fc,$0b 
      dc.b      $ce,$b4,$cc,$f6,'6',$89,$fc,$ff 
      dc.b      $e5,$1e,$f7,$de,'2.',$e7,$fa
      dc.b      $00,'a',$00,'0',$00,$01,$00,$01 
      dc.b      's',$ad,'[',$ef,'$',$ea,$7f,$af 
      dc.b      $f9,'f',$f9,'g',$08,$9b,$f5,$fe 
      dc.b      'y',$f0,'y',$f8,'&',$18,$7f,$f0 
      dc.b      $00,'i',$00,'m',$00,'r',$00,$7f 
      dc.b      $e0,$01,$e0,$01,' ',$01,$c0,$01 
      dc.b      $a7,$80,$b7,$a0,'h',$80,$ff,$00 
      dc.b      $01,'_',$00,$7f,$01,' ',$01,$7f 
      dc.b      $8a,$0e,$d6,$1e,$c1,$ee,$87,$f2 
      dc.b      '/',$c9,'?',$ed,$10,'f?',$cf
      dc.b      '/',$fe,'?',$ff,$c0,$00,$ff,$ff 
      dc.b      $af,$c5,$bf,$eb,$90,'`',$bf,$c3 
      dc.b      $07,$17,$0f,$1f,$f7,$08,$f9,$1f 
      dc.b      $e5,'4',$f7,$bc,'2d',$e7,$f8
      dc.b      '/',$a9,'?',$cd,$10,'&?',$cf
      dc.b      '/??',$7f,$c0,$c1,$ff,$ff 
      dc.b      ' ',$02,$a0,$03,$80,$09,$00,$03 
      dc.b      $fc,$8a,$fe,$83,$06,$09,$fc,$0b 
      dc.b      $fc,$14,$fe,$1c,$06,$0b,$fc,$1f 
      dc.b      $e4,$97,$f6,$9f,'3`',$e7,$ff
      dc.b      $ff,'p',$ff,$d0,$00,'a',$ff,$c0 
      dc.b      'sys',$fb,',f',$7f,$bf
      dc.b      $f5,'}',$fd,$ff,$04,$81,$f9,$fe 
      dc.b      $1e,'*_',$bb,' j',$7f,$f3 
      dc.b      $ff,$c9,$ff,$d9,$00,'6',$ff,$ff 
      dc.b      $ab,$ff,$ef,$ff,'(',$00,$cf,$ff 
      dc.b      '&',$a0,'g',$80,$d8,$80,$ff,$00 
      dc.b      $01,'_',$00,$7f,$01,' ',$01,$7f 
      dc.b      $c6,$f0,$de,'t',$c5,$84,$87,'z' 
      dc.b      ',',$c9,'>',$e9,$11,'f?',$cf
      dc.b      $fc,$cb,$fb,'5',$07,$fe,$fb,'5' 
      dc.b      '/',$e3,$bf,$ef,$10,'b',$bf,$c3 
      dc.b      'x',$16,':',$1f,$c2,$08,$bd,$1f 
      dc.b      'e8w',$bc,$b2,'l',$e7,$f8 
      dc.b      '/',$c9,'/',$e9,$10,'f?',$cf
      dc.b      $f8,'?',$fb,$bf,$07,$c1,$ff,$ff 
      dc.b      $a0,$0a,$a0,$03,$80,$09,$00,$0b 
      dc.b      $fe,$8a,$fe,$83,$06,$09,$fc,$0b 
      dc.b      $fe,$17,$fe,$1f,$06,$08,$fc,$1f 
      dc.b      $d4,$fc,$e4,$fd,$13,$03,$e7,$ff 
      dc.b      $00,$90,$9a,$d0,$ff,$01,$ff,$c0 
      dc.b      '\',$c1,'^',$d5,'!>',$7f,$ff
      dc.b      '5~',$bd,$ff,'d',$83,$f9,$fe
      dc.b      'z0z:e',$d9,$7f,$f3 
      dc.b      $00,$09,$c0,$ad,$ff,$f2,$ff,$ff 
      dc.b      $a0,$00,$eb,$02,$27,$ff,$cf,$ff 
      dc.b      '&',$80,$b7,$a0,$c8,$80,$ff,$00 
      dc.b      $01,'s',$00,'{',$01,'$',$01,$7f 
      dc.b      $1d,'7',$cb,'?@',$c7,$83,$f9
      dc.b      ',',$85,',',$ef,$13,'"?',$cf
      dc.b      $ff,$fe,$ff,$ff,$00,$00,$ff,$ff 
      dc.b      $a9,$8e,$bd,$e5,$92,' ?',$c1
      dc.b      $9b,$96,$9f,$96,'c',$89,$fc,$9f 
      dc.b      'e4u8',$92,$c4,$e7,$f8
      dc.b      ',',$c5,'.',$ef,$11,'b?',$cf
      dc.b      $ff,$fe,$ff,$ff,$00,$00,$ff,$ff 
      dc.b      $80,$0a,$a0,$03,$80,$09,$00,$0b 
      dc.b      $98,$82,$de,$83,'"',$09,$fc,$03 
      dc.b      $98,$16,$de,$17,'"',$08,$fc,$1f 
      dc.b      'b',$ff,'w',$ff,$b1,$00,$e7,$ff 
      dc.b      $ff,'a',$ff,$d0,$00,'a',$ff,$81 
      dc.b      '\',$ff,'\',$ff,'#',$00,$7f,$ff 
      dc.b      ')e)v',$c8,$89,$f5,$fe
      dc.b      $1b,$f2,$1f,$fb,$14,$19,$1f,$f3 
      dc.b      'w',$f9,'w',$f9,$88,$06,$ff,$ff 
      dc.b      $c9,$df,$cd,$df,'f ',$af,$ff
      dc.b      $e7,'`',$e7,' ',$19,$00,$fe,$80 
      dc.b      $00,'s',$00,'s',$01,',',$00,$7f 
      dc.b      $c3,'`',$9f,'2',$c2,$ca,$83,$bd 
      dc.b      '/',$ec,'/',$cc,$10,'k?',$cf
      dc.b      $e7,$c6,$f7,$f7,$08,$08,$ff,$ff 
      dc.b      ')',$e1,$a9,$cf,$96,'a?',$c1
      dc.b      $b0,$17,$99,$17,'e',$08,$de,$9f 
      dc.b      $f5,$f0,$e5,$fc,'2',$04,$e7,$f8 
      dc.b      ',',$ac,',',$cc,$13,'+?',$cf
      dc.b      $e7,$c6,$f7,$f7,$08,$08,$ff,$ff 
      dc.b      ' ',$0a,$80,$02,$80,$09,$00,$0b 
      dc.b      $9e,$82,$9c,$82,'f',$09,$fc,$03 
      dc.b      $9e,$16,$9c,$16,'f',$09,$fc,$1f 
      dc.b      'fsv{',$b5,$84,$e7,$ff
      dc.b      $e3,$11,$fb,$c0,$04,'a',$ff,$81 
      dc.b      '_',$e3,$7f,$fb,' ',$04,$7f,$ff 
      dc.b      $e5,'d',$fd,'g',$0c,$b9,$f5,$fe 
      dc.b      $0a,'r',$0b,'z',$04,$99,$0f,$f3 
      dc.b      $cf,$1f,$ff,$df,$00,' ',$ff,$ff 
      dc.b      '+<',$eb,$ff,'d',$00,$af,$ff
      dc.b      '|',$80,$7f,$e0,$81,$80,$fe,$80 
      dc.b      $00,'_',$00,$7f,$01,' ',$00,$7f 
      dc.b      $8a,$93,$d1,$97,$c4,'k',$81,$fc 
      dc.b      $af,$ca,$bf,$e6,$90,'a',$bf,$c7 
      dc.b      $e7,$c7,$e7,$c7,$18,'9',$ff,$ff 
      dc.b      '/',$c5,$bf,$e8,$90,'b?',$c0
      dc.b      'i',$d7,$cb,$df,'5',$c8,$fe,'_' 
      dc.b      $e5,$fc,$f7,$fc,'2',$0c,$e7,$f8 
      dc.b      '/',$ca,'?',$e6,$10,'a?',$c7
      dc.b      $e7,$c7,$e7,$c7,$18,'9',$ff,$ff 
      dc.b      $00,$02,$a0,$03,$80,$09,$00,$03 
      dc.b      $fc,$8a,$fe,$83,$06,$09,$fc,$0b 
      dc.b      $fc,$17,$fe,$1f,$06,$08,$fc,$1f 
      dc.b      $d5,'s',$f3,'s',$10,$8c,$e3,$ff 
      dc.b      $e3,$90,$e3,$c0,$1c,$c1,$ff,$80 
      dc.b      '_',$e3,$7f,$e3,' ',$1c,$7f,$ff 
      dc.b      $c5,$7f,$f9,$ff,$10,$83,$e9,$fe 
      dc.b      $0a,'j',$0e,'{',$05,$89,$0f,$f3 
      dc.b      $cf,$1e,$cf,$1f,'0',$e0,$ff,$ff 
      dc.b      '+<',$cf,'<',$84,$c3,'o',$ff
      dc.b      'x',$e0,$7f,'@',$82,$00,$fd,$00 
      dc.b      $00,'^',$00,'_',$01,' ',$00,$7f 
      dc.b      'q',$ad,$c7,$8f,'aq',$81,$de
      dc.b      '/%/',$eb,$10,' ',$bf,$c3 
      dc.b      $7f,$fd,$7f,$ff,$80,$01,$ff,$ff 
      dc.b      $af,'(',$af,$e3,$90,' ?',$c0
      dc.b      $d6,$97,$c7,$97,$b8,$88,$ef,'_' 
      dc.b      $95,$e4,$f5,$fc,$12,$04,$e7,$f8 
      dc.b      '/%/',$eb,$10,' ?',$c3
      dc.b      $7f,$fd,$7f,$ff,$80,$01,$ff,$ff 
      dc.b      $a0,$0a,$a0,$0a,$80,$01,$00,$03 
      dc.b      $f2,$82,$fe,$82,$02,$09,$fc,$03 
      dc.b      $f2,$17,$fe,$17,$02,$08,$fc,$1f 
      dc.b      $b2,$bf,$f5,$bf,'0@',$e1,$ff
      dc.b      $fe,$c1,$ff,$d0,$00,$c1,$ff,$81 
      dc.b      '_',$ff,'_',$ff,' ',$00,$7f,$ff 
      dc.b      $09,'y',$f5,$7f,' ',$81,$d1,$fe 
      dc.b      $0b,$da,$0b,$fa,$04,$19,$0f,$f3 
      dc.b      $ff,$f8,$ff,$ff,$00,$01,$ff,$fe 
      dc.b      'k',$ff,$ab,$ff,$04,$00,$8f,$ff 
      dc.b      $e1,$00,$fe,$c0,$04,$00,$fa,$00 
      dc.b      $00,',',$00,$7f,$01,$0c,$00,$7f 
      dc.b      $85,'c',$90,$df,$82,'3@',$ec
      dc.b      $16,'j?',$cd,$06,'@',$bf,$a1
      dc.b      $d9,$bd,$ff,$fd,$19,$bd,$ff,$fe 
      dc.b      $16,'b?',$c8,$06,'a',$bf,$a0
      dc.b      $a1,$8b,'o',$9f,$19,$83,'v_'
      dc.b      '#(',$e7,$e8,' (',$d7,$f4 
      dc.b      $15,'j?m',$05,'@?',$a1
      dc.b      $99,$bd,$bf,$fd,'y',$bd,$ff,$fe 
      dc.b      ' ',$01,' ',$03,$00,$08,$80,$03 
      dc.b      'd',$81,$fc,$83,'d',$08,$fa,$03 
      dc.b      'd',$0b,$fc,$1f,'d',$03,$fa,$1f 
      dc.b      'el',$e6,$ff,'`',$0c,$d0,$ff
      dc.b      $de,$90,$fe,$90,$de,$81,$ff,'@' 
      dc.b      ',',$cc,$7f,$ff,$0c,$cc,$7f,$ff 
      dc.b      $94,$ca,$ed,$fa,$c0,$0a,'!',$fd 
      dc.b      $05,$b1,$0f,$f3,$01,$b0,$0f,$eb 
      dc.b      $b6,'d',$ff,$ff,$b6,'f',$7f,$f9 
      dc.b      $a6,$d9,'o',$ff,$02,$d9,$0d,$ff 
      dc.b      $92,$80,$fd,$80,$98,$00,$e4,$00 
      dc.b      $01,$d5,$01,'[',$00,'_',$00,'`' 
      dc.b      'p',$aa,'rva',$1e,$c0,'a' 
      dc.b      $aa,$b9,$ad,$aa,$af,$a4,$b0,'`' 
      dc.b      $a5,'n',$fb,$9e,$bf,$fc,$c0,$03 
      dc.b      $aa,$b8,$ad,$a9,$af,$a0,$b0,'`' 
      dc.b      'uu;v',$8f,'w0',$d8 
      dc.b      'uv',$d7,$b5,$d5,$f4,'6',$0c
      dc.b      'j',$bd,$bd,$ae,'/',$a0,'0`'
      dc.b      $a5,'n',$fb,$9e,$bf,$fc,$c0,$03 
      dc.b      $e0,$0e,$a0,$0a,$80,$02,$80,$03 
      dc.b      $ab,$8e,$da,$8a,$fa,$02,$06,$03 
      dc.b      $ab,'5',$da,$d6,$fa,$17,$06,$18 
      dc.b      '^',$d2,$d7,'}',$d0,'_0`' 
      dc.b      $b7,'q',$cf,'q',$fe,'@',$01,$c0 
      dc.b      $da,$e9,'}',$f7,'_',$ff,'`',$00 
      dc.b      'ou',$dd,$ed,'a}',$c1,$83 
      dc.b      $9a,$aa,'kk',$0b,$ea,$0c,$1b
      dc.b      $d7,'k',$ef,$be,$ff,$fa,$00,$06 
      dc.b      '{]',$ef,$be,$0b,$ff,$0c,$00
      dc.b      '-',$00,$fb,$00,$e8,$00,$18,$00 
      dc.b      $00,'@',$01,$80,$00,$00,$00,$00 
      dc.b      'b@1',$00,$00,$80,$00,$00 
      dc.b      $00,'$',$00,$1a,$00,$01,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $00,'!',$00,$18,$00,$00,$00,$00 
      dc.b      ' ',$00,$80,$00,'@',$00,$00,$00 
      dc.b      $00,$05,$00,$03,$00,$00,$00,$00 
      dc.b      $a0,'%',$c0,$1b,$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $80,$02,'`',$0c,$00,$00,$00,$00 
      dc.b      $02,$02,$01,$8c,$00,$00,$00,$00 
      dc.b      $02,$d0,$01,$e0,$00,$00,$00,$00 
      dc.b      $12,$a0,$0d,$c0,$00,$00,$00,$00 
      dc.b      $00,'@',$00,'1',$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dc.b      $a9,$01,'v',$00,$00,$00,$00,$00 
      dc.b      'h',$00,$f0,$00,$00,$00,$00,$00 
      dc.b      $00,$05,$00,$03,$00,$00,$00,$00 
      dc.b      'h',$00,$b0,$00,$00,$00,$00,$00 
      dc.b      $14,$00,$0e,$00,$00,$00,$00,$00 
      dc.b      $01,'y',$00,$e6,$00,$00,$00,$00 
      dc.b      $11,'c',$e0,$fc,$00,$00,$00,$00 
      dc.b      'ai',$fe,$f0,$00,$00,$00,$00
      dc.b      '^',$ba,$ef,'}',$00,$00,$00,$00 
      dc.b      $ad,'h',$de,$f0,$00,$00,$00,$00 
      dc.b      $b6,$b7,'y',$cf,$00,$00,$00,$00 
      dc.b      'um',$bb,$be,$00,$00,$00,$00
      dc.b      $b7,'ix',$f0,$00,$00,$00,$00
      dc.b      'k{',$f7,$9d,$00,$00,$00,$00
      dc.b      $a0,$0a,$c0,$07,$00,$00,$00,$00 
      dc.b      'v',$8a,$ef,$07,$00,$00,$00,$00 
      dc.b      $b6,$db,$cf,'<',$00,$00,$00,$00 
      dc.b      $b4,$ad,'xs',$00,$00,$00,$00
      dc.b      $d5,'q',$ee,$e0,$00,$00,$00,$00 
      dc.b      'h',$ca,$f7,'7',$00,$00,$00,$00 
      dc.b      $a5,')',$c3,$d7,$00,$00,$00,$00 
      dc.b      'm2',$9e,$cf,$00,$00,$00,$00
      dc.b      've',$b9,$fe,$00,$00,$00,$00
      dc.b      '*',$ba,$1f,'g',$00,$00,$00,$00 
      dc.b      $b4,$00,'x',$00,$00,$00,$00,$00 
      dcb.w     408,0 
      dc.b      $00,$02,$00,$01,$00,$00,$00,$00 
      dc.b      $8c,$c7,$80,$00,$7f,$ff,$0c,$c7 
      dc.b      $0c,$a8,$00,$b0,$ff,'@',$0c,$00 
      dc.b      $05,$93,$03,$83,$00,'|',$00,$10 
      dc.b      'l',$ca,$9c,$0c,$03,$f0,$00,$c0 
      dc.b      'v',$d6,'0',$07,$0f,$f8,$06,$d0 
      dc.b      $94,'e',$0c,$06,$03,$f8,$00,'`' 
      dc.b      $a6,'8`',$00,$1f,$ff,$06,'8'
      dc.b      $c6,'t',$00,'x',$ff,$a0,$c6,$00 
      dc.b      $00,$15,$00,$0d,$00,$02,$00,$00 
      dc.b      'kj',$08,'l',$f7,$b0,'c',$00
      dc.b      'y',$b6,'9',$87,$06,'x',$00,'0' 
      dc.b      $80,$b5,$00,'q',$00,$0e,$00,$04 
      dc.b      $ad,'r',$8c,'as',$80,'!',$00
      dc.b      $91,$d1,$80,$01,$7f,$fe,$11,$d0 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dcb.w     8,0 
l00c1:dcb.w     9,0 
      dc.b      $00,$03,$00,$00,$00,$00,$80,$00 
      dcb.w     3,0 
      dc.b      $00,'*',$00,$1c,$00,$00,$00,$00 
      dc.b      $01,$01,$06,$00,$00,$00,$00,$00 
      dc.b      'h',$09,$d0,$06,' ',$00,$00,$00 
      dc.b      'p',$02,$e0,$01,$00,$00,$00,$00 
      dc.b      $a4,$05,$d8,$03,$00,$00,$00,$00 
      dc.b      ' ',$00,'@',$00,$80,$00,$00,$00 
      dc.b      $00,$15,$00,$0e,$00,$00,$00,$00 
      dc.b      $00,'d',$00,'8',$00,$00,$00,$00 
      dcb.w     28,0
      dc.b      $1b,$ea,$0f,$fb,'(',$0a,$0f,$fb 
      dc.b      $ff,$fd,$ff,$ff,$00,$01,$ff,$ff 
      dc.b      $b0,'7`',$1f,$00,'p',$00,$1f
      dc.b      $d9,$be,$f6,$ff,$10,$80,$f0,$ff 
      dc.b      $f6,$ff,$bb,$ff,$82,$00,$83,$ff 
      dc.b      $db,$df,$f7,$7f,$10,'@',$f0,$7f 
      dc.b      'f',$fa,$db,$fe,'b',$02,$c3,$fe 
      dc.b      $bf,$fe,$ff,$ff,$80,$00,$ff,$ff 
      dc.b      $c8,$0b,$b0,$06,$80,$00,$80,$00 
      dcb.w     4,0 
      dc.b      $00,$08,$00,$08,$00,$00,$00,$08 
      dcb.w     5,0 
      dc.b      $08,$00,$00,$00,$00,$00,$00,$00 
      dcb.w     6,0 
      dc.b      $00,$08,$00,$00,$00,$00,$00,$00 
      dc.b      $00,$00,$00,$10,$0a,$d2,$27,$e1 
      dc.b      $0f,$fb,$00,$03,$cc,$b3,$ff,$fc 
      dc.b      $ff,$ff,'x',$00,$b0,$15,$00,'o' 
      dc.b      $80,$1f,' ',$01,$a0,$ad,$c0,'~' 
      dc.b      $f0,$ff,'*',$00,'6g',$01,$ff
      dc.b      $87,$ff,'5',$00,';v',$c0,'?'
      dc.b      $f8,$7f,$80,$04,$82,$b4,$01,$f8 
      dc.b      $c3,$fe,$00,$01,$b3,$19,$7f,$fe 
      dc.b      $ff,$ff,$a4,$16,$d8,$0d,$00,$00 
      dc.b      $c0,$01,$00,$00,$00,$00,$00,$00 
      dcb.w     3,0 
      dc.b      $00,$08,$00,$08,$00,$00,$00,$00 
      dcb.w     2,0 
      dc.b      $08,$00,$08,$00,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $00,$08,$00,$08,$00,$08,$00,$00 
      dcb.w     4,0 
      dc.b      ')',$ea,'-',$fb,$06,$09,$0f,$f3 
      dc.b      $7f,$fc,$7f,$fc,$80,$03,$ff,$ff 
      dc.b      $a0,'s',$d8,'[',$00,$0c,$c0,$1f 
      dc.b      $d0,$9e,$f0,$df,$10,'`',$e0,$ff 
      dc.b      $94,$7f,$ad,$7f,$83,$80,$0f,$ff 
      dc.b      $ca,'o',$cd,'o00',$fc,$7f 
      dc.b      'bz',$c3,'~a',$82,$83,$fc 
      dc.b      $9f,$fe,$df,$fe,'`',$01,$ff,$ff 
      dc.b      'p',$0d,'l',$1b,$80,$00,$e0,$03 
      dc.b      'm',$c7,$9e,'d',$ff,$c7,$00,'8' 
      dc.b      'kk',$fc,$eb,$ff,$e3,$00,$1c
      dc.b      'u',$b7,$be,'y',$ff,$ff,$00,$00 
      dc.b      $01,'c',$0b,$eb,$03,$e3,$f4,$14 
      dc.b      '[',$ed,$fc,'s',$ff,$ff,$00,$00 
      dc.b      $80,$88,$e3,$eb,$e3,$eb,$1c,$14 
      dc.b      'v',$c2,$b9,$ea,$ff,$e2,$00,$15 
      dc.b      $09,':',$09,$bb,'&y',$0f,$f3
      dc.b      $ff,$1f,$ff,$df,$00,' ',$ff,$ff 
      dc.b      't',$13,'h',$13,$c0,'l',$a0,$1f 
      dc.b      $f0,$9f,$f0,$9f,'0a',$e0,$ff
      dc.b      $a9,$f1,$9d,$fd,$86,$02,$1f,$ff 
      dc.b      $f5,'o',$f6,'o',$0c,'0',$fa,$7f 
      dc.b      $c2,'~',$c2,'~',$c1,$86,$83,$fc 
      dc.b      $bf,$e7,$ff,$f7,'@',$08,$ff,$ff 
      dc.b      $aa,'*',$b4,$17,'`',$01,$d0,$07 
      dcb.w     6,0 
      dc.b      $00,$08,$00,$08,$00,$00,$00,$00 
      dcb.w     2,0 
      dc.b      $08,$08,$08,$08,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $08,$00,$08,$00,$08,$00,$00,$08 
      dc.b      $00,$08,$00,$08,$00,$00,$00,$00 
      dc.b      '+2',$0f,':$',$d9,'/',$f3 
      dc.b      $e7,'?',$f7,'?',$08,$c0,$ff,$ff 
      dc.b      $f8,'w',$f4,$17,'0h',$d0,'_'
      dc.b      $d0,$a6,$f0,$b7,$10,'h',$e0,$ff 
      dc.b      $b3,$f1,$b3,$f1,$ac,$0e,'?',$ff 
      dc.b      $ff,'_',$ff,'_',$03,' ',$fd,$7f 
      dc.b      'b',$9a,$c2,$de,'a"',$83,$fc
      dc.b      $b9,$e7,$bd,$e7,'b',$18,$ff,$ff 
      dc.b      $fc,$1c,$fa,',8',$0b,$c8,$0f
      dcb.w     6,0 
      dc.b      $00,$08,$00,$08,$00,$00,$00,$00 
      dcb.w     2,0 
      dc.b      $08,$00,$08,$08,$00,$00,$00,$00 
      dc.b      $00,$00,$08,$00,$00,$00,$08,$00 
      dc.b      $00,$08,$00,$08,$00,$08,$08,$00 
      dc.b      $00,$00,$08,$08,$00,$00,$00,$00 
      dc.b      $0b,$ca,$0b,$fa,'$',$09,$0f,$f3 
      dc.b      $e7,$fc,$e7,$fe,$18,$01,$ff,$ff 
      dc.b      $a0,$14,$f4,$1e,' i',$d0,$1f
      dc.b      $e0,$a7,$f0,$f7,'0i',$e0,$ff
      dc.b      $07,$ff,$af,$ff,$98,$00,'?',$ff 
      dc.b      $ca,'s',$ef,'{',$12,'$',$fd,$7f 
      dc.b      $82,$9c,$c2,$de,$c1,'&',$83,$fc 
      dc.b      $b9,$ff,$b9,$ff,'f',$00,$ff,$ff 
      dc.b      $e0,'!',$f2,'+',$10,$06,$e8,$0f 
      dcb.w     4,0 
      dc.b      $00,$18,$00,$18,$00,$10,$00,$18 
      dcb.w     4,0 
      dc.b      $10,$08,$08,$08,$00,$00,$00,$00 
      dc.b      $08,$00,$08,$00,$00,$00,$08,$00 
      dc.b      $08,$10,$08,$00,$08,$00,$00,$18 
      dc.b      $08,$08,$08,$08,$00,$00,$00,$00 
      dc.b      $05,$92,$0f,$f3,'!',$91,$0f,$eb 
      dc.b      $f9,'l',$ff,$fe,$01,'a',$ff,$ff 
      dc.b      $f0,$14,$f4,$1c,$10,'k',$e0,$1f 
      dc.b      $e0,$a7,$f0,$e7,'0y',$e0,$ff
      dc.b      '$',$b4,$a6,$ff,$99,'4?',$ff
      dc.b      $cf,'s',$ef,'s',$11,',',$fe,$7f 
      dc.b      $82,$9c,$c3,$9e,$c1,'f',$83,$fc 
      dc.b      $be,'n',$ff,$ff,'@@',$ff,$ff
      dc.b      'h)z)',$88,$06,$f0,$0f
      dc.b      $02,$d5,$03,'>',$03,$ff,$00,$00 
      dc.b      $aa,$da,'v',$db,$fe,$a3,$01,$fc 
      dc.b      $e3,$a0,'"b',$e3,$e2,$1c,$1d
      dc.b      $db,'j[',$ab,'#',$e3,$04,$14
      dc.b      $87,$eb,'l',$9c,$e7,$ff,$18,$00 
      dc.b      $08,$a1,$ea,'#',$ea,'#',$15,$dc 
      dc.b      $80,$8a,'kj',$e3,$e2,$14,$15
      dc.b      '*',$aa,$0b,'k+',$e9,',',$1b
      dc.b      $f9,$bc,$fd,$fc,$01,$f3,$fe,$0f 
      dc.b      $d4,'u',$f0,$1d,$10,'j',$e0,'_' 
      dc.b      $d0,$bf,$f0,$ff,$10,'a',$e0,$ff 
      dc.b      ',',$db,$bc,$ff,$93,'_?',$e0
      dc.b      $cd,'_',$cf,$7f,'1 ',$fe,$7f
      dc.b      'b',$fc,$83,$fe,'a',$06,$83,$fc 
      dc.b      $be,':',$ff,'{@t',$ff,$8f 
      dc.b      'j',$0b,'x',$0f,$88,'$',$f0,$0f 
      dcb.w     4,0 
      dc.b      $00,$a8,$00,$e8,$00,'@',$00,$e8 
      dc.b      $00,$08,$00,$08,$00,$08,$00,$00 
      dc.b      $e8,$10,$a8,$08,'@',$00,'@',$00 
      dc.b      $08,$00,$08,$00,$00,$00,$08,$00 
      dc.b      $10,$00,$00,'@',$00,'@',$18,$e8 
      dc.b      $08,$10,$08,$08,$00,$00,$00,$00 
      dc.b      ' ',$02,$00,$03,' ',$01,' ',$03 
      dc.b      $ff,'7',$ff,'7',$07,'(',$fd,'?' 
      dc.b      $e4,'w',$f0,$17,'0h',$e0,'_'
      dc.b      $df,'?',$ff,$7f,$00,$c1,$ff,$ff 
      dc.b      '/',$b3,$bf,$f3,$90,'2?',$d3
      dc.b      '~_',$7f,'_',$83,' ',$fe,$7f
      dc.b      $02,$cc,$c3,$ee,'a',$16,$83,$fc 
      dc.b      $bf,$da,$ff,$da,'a',$d5,$ff,'_' 
      dc.b      'r+p',$0f,$90,'$',$e8,'/' 
      dcb.w     4,0 
      dc.b      $00,'@',$00,'`',$00,$88,$00,$e8 
      dc.b      $00,$08,$00,$08,$00,$08,$08,$00 
      dc.b      '@',$a0,'`x',$88,$00,$00,$00
      dc.b      $00,$08,$08,$08,$00,$00,$08,$08 
      dc.b      $d0,$a8,'p',$88,'p',$88,$88,'`' 
      dc.b      $08,$d8,$08,'x',$00,' ',$00,$00 
      dc.b      $0b,$ea,$0f,$fa,'(',$09,$0f,$fb 
      dc.b      $8a,$17,$ee,$1f,$12,$08,$fc,$1f 
      dc.b      $d4,$14,$f0,$1f,$10,'h',$e0,$1f 
      dc.b      '`?k?',$9f,$c1,$ff,$ff
      dc.b      $af,$e1,'/',$e1,$90,'`?',$c1
      dc.b      '}q',$ff,'}"',$fe,$7f
      dc.b      $c2,$c8,$83,$ce,$c1,'2',$83,$fc 
      dc.b      $a2,$9b,$bb,$9f,'d',$94,$ff,$1f 
      dc.b      $dc,$0b,$fa,$0b,$18,'$',$e8,$0f 
      dcb.w     4,0 
      dc.b      $00,$98,$00,$98,$00,$00,$00,$98 
      dc.b      $08,$00,$08,$00,$08,$00,$00,$08 
      dc.b      $98,'@',$98,$a8,$00,'@',$00,'@' 
      dc.b      $10,$00,$18,$00,$10,$08,$18,$08 
      dc.b      $a8,$00,$e8,$00,$e8,$00,'@',$98 
      dc.b      $10,$e8,$08,$a8,$00,'@',$00,'@' 
      dc.b      ' ',$12,'+',$d2,$07,$e1,$0f,$fb 
      dc.b      $9c,$16,$9e,$1f,'f',$08,$fc,$1f 
      dc.b      '`vt^',$b0,$09,$e0,$1f
      dc.b      $7f,$c6,$7f,$f7,$80,$08,$ff,$ff 
      dc.b      $a9,$c1,'-',$e1,$92,'`?',$c1
      dc.b      'dqwq',$89,'.',$fe,$7f
      dc.b      $82,$fe,$c2,$fc,$c1,$06,$83,$fc 
      dc.b      $a7,'#',$a7,$b7,'y',$ac,$ff,'?' 
      dc.b      $a2,'*',$f4,'+ ',$04,$d0,$0f
      dc.b      $00,$05,$00,$06,$00,$07,$00,$00 
      dc.b      $ae,$db,'v',$da,$fe,$ab,$01,$fc 
      dc.b      $a2,$aa,'c',$ea,$e3,$ea,$1c,$15 
      dc.b      $da,$ad,'r',$8f,'"',$07,$05,$00 
      dc.b      $a7,$a8,$fd,'j',$87,$e2,$f8,$1d 
      dc.b      '@',$a8,$ca,'"',$ca,'"%',$dd
      dc.b      $a0,'bzb',$02,$8a,$05,$05 
      dc.b      $09,$ea,$0d,$fb,'&',$09,$0f,$f3 
      dc.b      $fe,$16,$fc,$16,$06,$09,$fc,$1f 
      dc.b      'p',$17,'d',$17,$b0,'h',$e0,$1f 
      dc.b      $ff,$c7,$ff,$c7,$00,'9',$ff,$ff 
      dc.b      ')',$e1,$bd,$c1,$92,'`?',$c1
      dc.b      'g_',$c6,$7f,$bb,' ',$fe,$7f
      dc.b      $02,$fe,$c3,$fc,'a',$06,$83,$fc 
      dc.b      $bf,$93,$ff,';a',$8c,$ff,'?'
      dc.b      $14,'*',$d4,'/p',$04,$b0,$0f
      dcb.w     8,0 
      dc.b      $08,$10,$08,$00,$08,$00,$00,$18 
      dc.b      $00,$00,$00,$98,$00,$00,$00,$00 
      dc.b      $00,$00,$e8,$00,'@',$08,$e8,$08 
      dc.b      $98,$00,$98,$00,$98,$00,$00,$00 
      dc.b      '@',$98,$a8,$98,'@',$00,'@',$00 
      dc.b      ')',$fa,$0d,$fb,'&',$19,'/',$f3 
      dc.b      $f8,$17,$fe,$1f,$02,$08,$fc,$1f 
      dc.b      $d4,'k',$e0,$1f,$10,'c',$e0,'_' 
      dc.b      '6',$bf,$ff,$bf,'6a',$ff,$ff
      dc.b      $a9,$81,$b9,$e1,$96,' ?',$c1
      dc.b      '~_',$ff,$7f,$83,' ',$fe,$7f
      dc.b      $82,$fc,$c2,$fe,$c1,$06,$83,$fc 
      dc.b      $be,$17,$ff,$b7,'@',$88,$ff,'?' 
      dc.b      't',$0a,$d4,$0e,'p%',$b0,$0f
      dcb.w     8,0 
      dc.b      $08,' ',$08,' ',$08,' ',$00,'x' 
      dc.b      $00,' ',$00,'p',$00,$00,$00,$00 
      dc.b      $a8,$00,$e8,$00,' ',$08,$e8,$08 
      dc.b      $d8,$00,'p',$00,'p',$00,$88,$00 
      dc.b      $a8,$d8,$c8,'p',$00,' ',$00,$00 
      dc.b      $0a,'j',$0f,'z$',$89,$0f,$f3
      dc.b      $c8,$17,$ee,$17,$12,$08,$fc,$1f 
      dc.b      $e4,$14,$f0,$17,'0w',$e0,$18
      dc.b      $ad,'3s{',$ff,'e',$00,$ff 
      dc.b      $af,$81,$af,$e1,$90,' ?',$c1
      dc.b      'e_v',$7f,$89,' ',$fe,$7f 
      dc.b      $c2,$ca,$c2,$ec,$c1,$12,$83,$fc 
      dc.b      $b2,'#',$bb,$b3,'d',$ac,$ff,'?' 
      dc.b      $e2,'+',$f4,$0b,' $',$d0,'/'
      dcb.w     8,0 
      dc.b      $10,$00,$00,'@',$00,'@',$18,$e8 
      dcb.w     4,0 
      dc.b      $00,$18,$98,$18,$00,$10,$98,$18 
      dcb.w     5,0 
      dc.b      $98,$00,$00,$00,$00,$00,$0a,'r' 
      dc.b      $0b,'z$',$99,$0f,$f3,$ce,$14
      dc.b      $cc,$17,'6',$08,$fc,$1f,'p',$00 
      dc.b      't',$00,$b0,'@',$e0,$00,$00,$b2 
      dc.b      $00,$bb,$00,'d',$00,$ff,'/',$e1 
      dc.b      $bf,$e1,$90,'`?',$c1,'f_' 
      dc.b      $f7,$7f,$8b,' ',$fe,$7f,$c2,$cc 
      dc.b      $c3,$ee,$c1,$16,$83,$fc,$b3,$92 
      dc.b      $b3,$17,'m',$9c,$ff,$1f,'\+'
      dc.b      'z',$0f,$98,'$',$e8,'/',$00,'-' 
      dc.b      $00,'3',$00,'?',$00,$00,'[v'
      dc.b      $ec,$ee,$ff,$fe,$00,$01,$d2,$ab 
      dc.b      'r',$8a,'r',$8b,$8d,'d[',$fb
      dc.b      $fc,'g',$ff,$ff,$00,$00,$ae,$d8 
      dc.b      $fe,$db,$8e,$a3,$f9,$fc,$ad,'x' 
      dc.b      's',$be,$ff,$fe,$00,$01,$a9,'j' 
      dc.b      's',$9e,$03,$fe,$04,$01,'*r'
      dc.b      $0a,'z%™/',$f3,$fc,$14
      dc.b      $fe,$1c,$06,$0b,$fc,$1f,'d@'
      dc.b      't',$00,$b0,'@',$e0,'@',$00,$b3 
      dc.b      $00,$f3,$00,'m',$00,$ff,$a8,$f3 
      dc.b      '>',$f3,$91,'r?',$d3,'gq' 
      dc.b      $e7,'}',$9b,'"',$fe,$7f,$e6,$ce 
      dc.b      $e7,$ce,$e5,'6',$a7,$fc,$bf,$0a 
      dc.b      $bf,'Ža',$85,$ff,$0f,'r',$0a
      dc.b      'r',$0f,$90,'$',$e8,$0f,$00,$00 
      dcb.w     7,0 
      dc.b      $a8,$00,$e8,$00,$e8,$00,'@',$98 
      dcb.w     4,0 
      dc.b      $00,$a8,$00,$e8,$00,'@',$00,$e8 
      dcb.w     8,0 
      dc.b      '+',$f2,$0f,$fb,'$',$19,'/',$f3 
      dc.b      $9a,$17,$de,$1f,'"',$08,$fc,$1f 
      dc.b      $d0,'w',$e4,$1f,$10,'p',$e0,'_' 
      dc.b      $ff,'?',$ff,$7f,$00,$c1,$ff,$ff 
      dc.b      '$',$be,$b4,$fe,$9b,$01,'?',$ff 
      dc.b      '|i',$ff,'i6',$fe,$7f
      dc.b      '|',$f8,$fd,$fe,$03,$02,$ff,$fc 
      dc.b      $a6,$8b,$f7,$8f,'h',$84,$ff,$0f 
      dc.b      $e8,')',$fa,'-',$08,$06,$f0,$0f 
      dcb.w     8,0 
      dc.b      '@ ',$c8,' ',$c8,'  p'
      dcb.w     4,0 
      dc.b      $00,'@',$00,'`',$00,$88,$00,$e8 
      dcb.w     8,0 
      dc.b      $0b,'2',$0f,$bb,'$y',$0f,$f3
      dc.b      $9c,$17,$de,$17,'&',$08,$fc,$1f 
      dc.b      $e4,$00,$f0,$16,'0o',$e0,$1f
      dc.b      $00,'?f',$bf,$ff,$c1,$ff,$ff
      dc.b      $a7,$e0,$a7,$ed,$98,$1f,'?',$ff 
      dc.b      'momo',$91,'0',$fe,$7f
      dc.b      $c0,$9a,$d8,$da,'?"',$ff,$fc
      dc.b      $a7,$0b,$f7,$8b,'i',$84,$ff,$0f 
      dc.b      $f2,'+',$f8,'/',$18,$04,$f0,$0f 
      dcb.w     8,0 
      dc.b      $98,$00,$98,$00,$98,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $00,$98,$00,$98,$00,$00,$00,$98 
      dcb.w     8,0 
      dc.b      $0b,'"',$0b,':$',$c9,$0f,$f3
      dc.b      $9a,$16,$9c,$17,'b',$08,$fc,$1f 
      dc.b      'd',$13,'p',$1b,$b0,'l',$e0,$1f 
      dc.b      $ff,$e6,$ff,$f7,$00,$08,$ff,$ff 
      dc.b      $07,$ff,$af,$ff,$98,$00,'?',$ff 
      dc.b      $ca,$0f,$ca,'_20',$fd,$7f 
      dc.b      $ff,$94,$ff,$94,$00,'d',$ff,$fa 
      dc.b      $a6,$8b,$a7,$0b,'x',$84,$ff,$0f 
      dc.b      '0',$0a,$ba,$0f,'x$',$f0,$0f
      dc.b      $0b,'u',$0c,$ef,$0f,$ff,$00,$00 
      dc.b      'm',$c6,$9e,'f',$ff,$c6,$00,'9' 
      dc.b      $db,$db,'r|s',$ff,$8c,$00 
      dc.b      $ee,':r',$27,$fe,'?',$01,$c0
      dc.b      $de,$d9,$e2,$db,$fe,$ab,$01,$fc 
      dc.b      $9a,$d6,$fd,$ef,$ff,$ff,$00,$00 
      dc.b      $de,'š?~',$ff,$fe,$00,$01 
      dc.b      '+',$fa,$0b,$f2,'$',$19,'/',$f3 
      dc.b      $f8,$16,$fe,$16,$02,$09,$fc,$1f 
      dc.b      'tv`',$17,$90,'h',$e0,'_' 
      dc.b      '9',$e7,$bd,$e7,'b',$19,$ff,$ff 
      dc.b      $b3,$9c,'3',$de,$ac,'!?',$ff
      dc.b      $f9,$e7,$ff,'g',$03,'x',$fd,$7f 
      dc.b      '9',$f2,$bd,$fe,'b',$06,$ff,$fa 
      dc.b      $be,$0b,$bf,$8b,'@',$84,$ff,$0f 
      dc.b      '**2',$0a,$c8,'%',$f0,'/' 
l00c2:dc.b      $00,$09,$00,$06,$00,$00,$00,$00 
      dc.b      $10,$02,$a0,$01,'@',$00,$00,$00 
      dc.b      $a2,$a0,$c1,$c0,$00,$00,$00,$00 
      dc.b      $00,'h',$00,'5',$00,$02,$00,$00 
      dc.b      $80,$01,$00,$00,$00,$00,$00,$00 
      dc.b      $00,$00,$c0,$00,$00,$00,$00,$00 
      dcb.w     5,0 
      dc.b      $00,$08,$00,$00,$00,$00,$00,$08 
      dc.b      $00,$08,$00,$00,$00,$08,$00,$00 
      dcb.w     2,0 
      dc.b      $00,$08,$00,$00,$00,$00,$00,$00 
      dcb.w     9,0 
      dc.b      $bf,$fe,$ff,$ff,$80,$00,$ff,$ff 
      dc.b      $f6,$ff,$bb,$ff,$82,$00,$83,$ff 
      dc.b      $db,'m',$f6,'7',$10,$04,$f0,$07 
      dc.b      $ff,$f7,$ff,$fd,$00,$04,$ff,$fc 
      dc.b      $b7,$ff,$df,$ff,$10,$00,$1f,$ff 
      dc.b      $dc,$00,$f4,$00,$10,$00,$f0,$00 
      dcb.w     8,0 
      dc.b      $80,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     2,0 
      dc.b      $80,$00,$80,$00,$80,$00,$80,$00 
      dc.b      $80,$00,$00,$00,$00,$00,$00,$00 
      dcb.w     6,0 
      dc.b      $80,$01,$99,$19,$7f,$fe,$ff,$ff 
      dc.b      '*',$00,$b6,'k',$01,$ff,$87,$ff 
      dc.b      '5',$d4,';l',$c0,$03,$f8,$0f
      dc.b      $00,$09,$c8,$cd,$ff,$f0,$ff,$fc 
      dc.b      'p',$00,$b3,'#',$0f,$ff,'?',$ff 
      dc.b      '$',$00,'4',$00,$c0,$00,$f0,$00 
      dcb.w     9,0 
      dc.b      $80,$00,$00,$00,$00,$00,$80,$00 
      dc.b      $80,$00,$00,$00,$80,$00,$80,$00 
      dc.b      $80,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     7,0 
      dc.b      $1f,$fe,'_',$ff,$e0,$00,$ff,$ff 
      dc.b      $94,$7f,$ad,$7f,$83,$80,$0f,$ff 
      dc.b      $ca,$a8,$cd,$da,'0',$07,$fc,$1f 
      dc.b      $ff,$f4,$ff,$fd,$00,$04,$ff,$f8 
      dc.b      $a3,$ff,'k',$ff,$1c,$00,$7f,$ff 
      dc.b      $d0,$00,$f4,$00,$10,$00,$e0,$00 
      dcb.w     8,0 
      dc.b      $80,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     2,0 
      dc.b      $80,$00,$80,$00,$00,$00,$00,$00 
      dc.b      $00,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     6,0 
      dc.b      '|f',$7f,'w',$80,$88,$ff,$ff
      dc.b      $a9,$f1,$9d,$fd,$86,$02,$1f,$ff 
      dc.b      $f5,'s',$f6,$bb,$0c,$0c,$fa,'?' 
      dc.b      $e3,'5',$fb,$bc,$04,'d',$ff,$f8 
      dc.b      'o',$8c,$ef,$ee,'0',$11,$ff,$ff 
      dc.b      $d4,'z',$f4,'g',$10,$7f,$e0,$80 
      dc.b      $ab,'n|',$f2,$ff,$fe,$00,$01
      dc.b      ':',$de,$27,$e2,'?',$fe,$c0,$01 
      dc.b      $ad,'v',$b3,$be,'?',$fe,'@',$01 
      dc.b      '66:',$0e,$be,'>',$c1,$c1 
      dc.b      $b6,$dc,$b9,$e4,$bf,$fc,'@',$03 
      dc.b      'u',$bd,'o',$c7,$7f,$ff,$80,$00 
      dc.b      'o',$00,$f1,$00,$ff,$00,$00,$00 
      dc.b      $fc,'g',$fc,'g',$03,$99,$ff,$ff 
      dc.b      '3',$f3,$b3,$f3,$ac,$0c,'?',$ff 
      dc.b      $ff,$e7,$ff,'g',$03,'x',$fd,$7f 
      dc.b      $e3,'9',$e3,'=',$1c,$cd,$ff,$f9 
      dc.b      $9f,$8c,$9f,$8c,'`s',$ff,$ff
      dc.b      $e0,$00,$f4,$00,'0',$00,$e0,$00 
      dcb.w     4,0 
      dc.b      $80,$01,$80,$00,$80,$00,$00,$00 
      dc.b      $00,$01,$80,$01,$00,$01,$00,$01 
      dc.b      $80,$81,$80,$80,$00,$80,$80,$01 
      dcb.w     3,0 
      dc.b      $80,$00,$00,$00,$00,$00,$00,$00 
      dcb.w     5,0 
      dc.b      $ff,$fd,$ff,$ff,$00,$01,$ff,$ff 
      dc.b      $87,$ff,$af,$ff,$98,$00,'?',$ff 
      dc.b      $ca,$0f,$ef,'_',$12,'0',$fd,$7f 
      dc.b      $ff,$ec,$ff,$fd,$00,$0c,$ff,$f9 
      dc.b      '?',$ff,$7f,$ff,$c0,$00,$ff,$ff 
      dc.b      $b4,$00,$f0,$00,'0',$00,$e0,$00 
      dc.b      $00,$00,$80,$00,$00,$00,$80,$00 
      dc.b      $00,$0a,$00,$07,$00,$00,$80,$00 
      dc.b      $00,$0d,$80,$8d,$00,$0a,$00,$8f 
      dc.b      $80,$02,$80,$02,$00,$02,$80,$85 
      dc.b      $00,$00,$00,$80,$00,$00,$80,$00 
      dc.b      $00,$00,$00,$80,$00,$00,$00,$80 
      dcb.w     4,0 
      dc.b      '-',$b5,$bf,$fd,'m',$b5,$ff,$fe 
      dc.b      '$',$b4,'&',$ff,$19,'4',$bf,$ff 
      dc.b      $cf,'i',$ef,'m',$11,'2',$fe,$7f 
      dc.b      'm',$a9,$ff,$e9,'m',$a8,$ff,$f5 
      dc.b      '%',$b6,'7',$ff,$c9,$b6,$ff,$ff 
      dc.b      $a0,$00,$a4,$00,$a0,$00,$d0,$00 
      dc.b      $80,$00,$80,$00,$00,$00,$80,$00 
      dc.b      $80,$04,$80,$0a,$80,$04,$00,$04 
      dc.b      $00,$8a,$80,$8e,$00,$04,$00,$8e 
      dc.b      $80,$80,$80,$84,$00,$84,$80,$0e 
      dc.b      $00,$80,$00,$80,$00,$00,$80,$00 
      dc.b      $00,$80,$00,$80,$00,$00,$00,$80 
      dcb.w     4,0 
      dc.b      '6',$96,'?n',$d7,$fe,$f8,$01
      dc.b      $ac,$db,$bc,$ff,$93,'_',$bf,$e0 
      dc.b      $cd,'y',$cf,'y1&',$fe,$7f 
      dc.b      $b4,$b5,$fb,'u',$bf,$f4,$c0,$0d 
      dc.b      'f',$d2,$e7,$ed,$9a,$ff,$ff,$00 
      dc.b      $dc,'h',$d4,'v',$d0,'~0' 
      dc.b      ';.',$a7,$f2,'?',$fe,$c0,$01
      dc.b      $b6,'*',$aa,'(',$be,' a',$d0
      dc.b      $ac,'$',$b2,$a6,'>(a',$de 
      dc.b      '6',$aa,':',$a8,$be,$a8,$c1,'v' 
      dc.b      $b6,'*',$ba,$bf,$be,'?a@' 
      dc.b      $da,'.>',$a9,$fe,'/',$01,$d0
      dc.b      $b7,$ad,$f8,$fe,$ff,$ff,$00,$00 
      dc.b      $ec,$00,$fc,$00,$0c,$00,$f4,$00 
      dc.b      '/',$b3,'?',$f3,$10,'2?',$d3
      dc.b      '~_',$7f,$7f,$83,' ',$fe,$7f
      dc.b      '`',$01,$e0,$01,'`',$00,$a0,$01 
      dc.b      '}',$80,$ff,$80,$81,$80,$fe,$80 
      dc.b      $10,$00,$0c,$00,$00,$00,$00,$00 
      dc.b      $80,$01,$80,$00,$00,$00,$80,$01 
      dc.b      $00,$80,$00,$89,$00,$80,$80,$00 
      dc.b      $00,$89,$80,$89,$00,$00,$00,$89 
      dc.b      $81,$00,$80,$00,$00,$00,$81,$89 
      dc.b      $00,$80,$00,$80,$00,$00,$80,$00 
      dc.b      $00,$80,$00,$80,$00,$00,$00,$80 
      dcb.w     4,0 
      dc.b      $ff,$e8,$ff,$f8,$00,$08,$ff,$f8 
      dc.b      '/',$e1,'/',$e1,$10,'`?',$c1
      dc.b      '}_',$ff,'_ ',$fe,$7f
      dc.b      $c0,$01,$c0,$01,$c0,$00,$80,$01 
      dc.b      $7f,$fd,$7f,$ff,$80,$01,$ff,$ff 
      dc.b      't',$00,'8',$00,$00,$00,$00,$00 
      dc.b      $00,$8d,$80,$87,$00,$07,$80,$88 
      dc.b      $00,$82,$00,$87,$00,$80,$80,$00 
      dc.b      $00,$0d,$00,$8d,$00,$0a,$00,$8f 
      dc.b      $8d,$02,$87,$02,$87,$02,$88,$85 
      dc.b      $00,$80,$00,$80,$00,$00,$00,$00 
      dc.b      $00,$00,$80,$80,$00,$00,$00,$80 
      dcb.w     4,0 
      dc.b      'p',$10,'wx',$8f,$e0,$ff,$f8
      dc.b      ')',$ca,'-',$ee,$12,'i?',$cf
      dc.b      'fs',$f7,'[',$8b,'$',$fe,$7f
      dc.b      $80,$01,$c0,$01,$c0,$00,$80,$01 
      dc.b      'n',$02,'n',$eb,$91,$fc,$ff,$ff 
      dc.b      ' ',$01,'@',$01,$00,$01,$00,$01 
      dc.b      $00,$0a,$80,$0e,$00,$8e,$80,$84 
      dc.b      $80,$00,$80,$00,$80,$00,$00,$80 
      dc.b      $01,$00,$01,$80,$01,$00,$01,$80 
      dc.b      $0a,$80,$0e,$80,$0e,$80,$04,$00 
      dc.b      $01,$00,$00,$80,$00,$00,$00,$00 
      dc.b      $81,$00,$81,$80,$01,$00,$01,$80 
      dcb.w     4,0 
      dc.b      'o',$e8,'o',$f8,$90,$08,$ff,$f0 
      dc.b      ')',$e0,'=',$cb,$12,'g?',$cf
      dc.b      'gsg{',$9b,'$',$fe,$7f
      dc.b      $c0,$01,$80,$01,$c0,$00,$80,$01 
      dc.b      'i',$fd,$ed,$ff,$92,$01,$ff,$fe 
      dc.b      '@j@o',$00,'h',$00,$9f
      dc.b      '>',$a4,$a2,$ac,'>,',$c1,$d2
      dc.b      '&',$b6,$ba,$af,$be,$bf,'a@'
      dc.b      $ca,$1a,'/',$a7,$e8,'?',$1f,$c0 
      dc.b      $f4,'{<',$e7,$fc,$ff,$02,$00
      dc.b      'm',$b6,$a5,$ba,$e2,'>',$10,'a' 
      dc.b      '2;',$b7,$bc,'0?o',$c0
      dc.b      $8e,$b7,$89,$f8,$8f,$ff,'p',$00 
      dc.b      'o',$e8,'o',$f8,$b0,$08,$ff,$f0 
      dc.b      ')',$89,'9',$ed,$16,'&?',$cf
      dc.b      $fc,'s',$ff,'s',$01,',',$fe,$7f 
      dc.b      $00,$01,$c0,$01,'@',$00,$80,$01 
      dc.b      'i',$fd,$c9,$ff,$b6,$01,$ff,$fe 
      dc.b      '@',$00,'@',$0e,$00,$04,$00,$0e 
      dc.b      $00,$09,$80,$09,$00,$89,$80,$80 
      dc.b      $81,$00,$80,$00,$80,$00,$01,$80 
      dc.b      $00,$00,$0e,$80,$04,$00,$0e,$80 
      dc.b      $09,$80,$09,$80,$09,$80,$00,$00 
      dc.b      $0e,$80,$0a,$80,$04,$00,$04,$00 
      dc.b      $80,$00,$8e,$80,$04,$00,$0e,$80 
      dcb.w     4,0 
      dc.b      $ec,$d0,$ff,$f0,$0c,$d0,$ff,$e8 
      dc.b      '/',$8b,'/',$ef,$10,'$?',$cf
      dc.b      '=_',$be,'_a ',$fe,$7f
      dc.b      $00,$01,$c0,$01,'@',$00,$80,$01 
      dc.b      '}š',$7f,$fe,$81,$9a,$ff,$fd
      dc.b      ' ',$0a,'@',$0e,$00,$02,$00,$0e 
      dc.b      $80,$0d,$80,$07,$00,$87,$80,$88 
      dc.b      $82,$00,$02,$00,$02,$00,$85,$80 
      dc.b      $0a,$80,$0e,$80,$02,$00,$0e,$80 
      dc.b      $0d,$80,$07,$00,$07,$00,$08,$80 
      dc.b      $04,$00,$06,$00,$08,$80,$00,$00 
      dc.b      $8a,$80,$8e,$80,$02,$00,$0e,$80 
      dcb.w     4,0 
      dc.b      $f5,'(',$fe,$e8,$17,$e8,$f8,$18 
      dc.b      ',',$eb,'>',$ef,$11,'d?',$cf
      dc.b      '=_',$be,$7f,'a ',$fe,$7f 
      dc.b      $c0,$01,$c0,$01,$c0,$00,$80,$01 
      dc.b      '~',$a5,$ff,$dd,$82,$fd,$ff,$03 
      dc.b      't',$00,'8',$09,$00,$00,$00,$09 
      dc.b      $01,$80,$81,$80,$01,$00,$81,$80 
      dc.b      $00,$00,$04,$00,$04,$00,$0e,$80 
      dc.b      $00,$00,$09,$80,$00,$00,$09,$80 
      dcb.w     4,0 
      dc.b      $09,$81,$09,$80,$00,$00,$00,$00 
      dc.b      $00,$00,$89,$80,$00,$00,$09,$80 
      dcb.w     4,0 
      dc.b      '<',$00,$bc,$00,'\',$00,$f4,$00 
      dc.b      ',',$cb,',',$eb,$13,'d?',$cf
      dc.b      '>q?}',$c3,'"',$fe,$7f
      dc.b      $e0,$01,$e0,$01,$e0,$00,$a0,$01 
      dc.b      'g',$80,$f7,$80,$8b,$80,$fe,$80 
      dc.b      $10,'j',$0c,'o',$00,'h',$00,$9f 
      dc.b      $ad,$bb,$ad,$a7,$aa,'?',$df,$c0 
      dc.b      'j',$bb,$88,$ac,$e8,$bf,$16,'@' 
      dc.b      'j',$ab,$ef,$9c,$e8,$bf,$1f,$c0 
      dc.b      'um',$ef,$9f,$ff,$ff,$00,$00
      dc.b      'm',$aa,$a5,$27,$e2,' ',$10,'p' 
      dc.b      '*',$ab,$af,$bf,'(',$bf,'w@'
      dc.b      '}',$bc,$8f,$c4,$ff,$fc,$00,$00 
      dc.b      '*',$d6,'9',$ef,$c0,$00,$f8,$00 
      dc.b      $af,$a3,'?',$eb,$10,'$?',$cf
      dc.b      $c5,'i',$f7,'i',$09,'6',$fe,$7f 
      dc.b      $7f,$f5,$ff,$fd,$00,$04,$ff,$fd 
      dc.b      '%',$ff,$a7,$ff,$d8,$00,$ff,$ff 
      dc.b      $dc,$00,$f4,$00,$10,$00,$f0,$00 
      dc.b      $0a,$80,$0e,$80,$04,$00,$0e,$80 
      dcb.w     3,0 
      dc.b      $09,$80,$00,$00,$00,$00,$00,$00 
      dcb.w     5,0 
      dc.b      $00,$04,$00,$0a,$00,$04,$00,$04 
      dc.b      $00,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $f8,$82,$fb,$01,$18,$00,$f0,$00 
      dc.b      '/',$cb,$bf,$ef,$10,'h?',$cf
      dc.b      'fogo',$bb,'0',$fe,$7f
      dc.b      $e6,'y',$d9,$ad,'?',$f0,$d9,$ad 
      dc.b      '?',$00,'?f',$c0,$ff,$ff,$ff
      dc.b      '$',$00,$b4,$00,$c0,$00,$f0,$00 
      dc.b      $04,$00,$06,$00,$08,$80,$0e,$80 
      dc.b      $02,$00,$02,$00,$02,$00,$05,$00 
      dcb.w     8,0 
      dc.b      $00,$0a,$00,$08,$00,$00,$00,$00 
      dc.b      $80,$00,$80,$00,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      'a',$01,'x',$00,$8a,$00,$f0,$00 
      dc.b      '(',$a3,'.',$c3,$91,'"?',$c3
      dc.b      '~/',$ff,$7f,$83,$10,$fe,$7f
      dc.b      $ff,$f4,$ff,$fd,$00,$04,$ff,$f9 
      dc.b      $bf,$ff,$ff,$ff,'@',$00,$ff,$ff 
      dc.b      $d0,$00,$f4,$00,$10,$00,$e0,$00 
      dc.b      $09,$80,$09,$80,$00,$00,$09,$80 
      dcb.w     13,0
      dc.b      $00,$09,$00,$00,$00,$00,$00,$00 
      dc.b      $80,$00,$00,$00,$00,$00,$00,$00 
      dcb.w     3,0 
      dc.b      'z',$00,'r',$00,$98,$00,$f0,$00 
      dc.b      $a8,$81,$a8,$e1,$17,' ?',$c1
      dc.b      'ngog',$93,'x',$fe,$7f
      dc.b      '>1',$bf,$bd,'@e',$ff,$f9 
      dc.b      $9c,$f8,$9e,$fe,'a',$01,$ff,$ff 
      dc.b      $c4,'v',$f0,'o',$10,$7f,$e0,$80 
      dc.b      $cd,$bb,'-',$a7,$ea,$bf,$1f,$c0 
      dc.b      'kv',$9c,$f9,$ff,$ff,$00,$00
      dc.b      $b6,$aa,'y',$df,$ff,$ff,$00,$00 
      dc.b      $da,$d5,'?;',$ff,$ff,$00,$00
      dc.b      '[b',$e7,$a7,$ff,$e0,$00,$18
      dc.b      '6',$fd,'?',$1e,'?',$ff,$c0,$00 
      dc.b      $e0,$00,' ',$00,$e0,$00,$00,$00 
l00c3:dcb.w     10,0
      dc.b      $00,$02,$00,$00,$bf,'/',$ff,$bf 
      dc.b      'a',$90,$ff,'?',$e1,'~',$e1,$ff 
      dc.b      '`',$83,$c1,$fe,$01,'ca',$e3
      dc.b      $04,$9c,$01,$ff,$9f,$f2,$9f,$f9 
      dc.b      '`',$18,$ff,$f1,$b9,$cf,$b9,$cf 
      dc.b      'f0',$ff,$ff,$15,'s',$eb,'s'
      dc.b      '@',$8c,$a3,$ff,$9e,'+',$9f,$cf 
      dc.b      '`',$84,$ff,'o',$f8,$bf,$f8,$ff 
      dc.b      $18,'a',$f0,$ff,$02,$bf,$a0,$ff 
      dc.b      $82,'a',$02,$ff,$00,$02,$a0,$03 
      dc.b      $80,$09,$00,$03,$fe,$14,$fe,$1c 
      dc.b      $06,$0b,$fc,$1f,$d5,'s',$f3,'s' 
      dc.b      $10,$8c,$e3,$ff,$e3,$95,$e3,$cd 
      dc.b      $1c,$c2,$ff,$8f,$cf,$8e,$cf,$8f 
      dc.b      '0s',$ff,$fe,'@',$00,$00,$00
      dcb.w     20,0
      dc.b      $00,$02,$00,$00,$bc,$af,$bf,$af 
      dc.b      '@',$90,$ff,'?!y',$e1,$7f 
      dc.b      ' ',$81,$c1,$fe,'a',$7f,'a',$7f 
      dc.b      $04,$80,$01,$ff,$ff,$c9,$ff,$fa 
      dc.b      $00,$08,$ff,$f0,'_',$fc,$df,$ff 
      dc.b      '`',$00,$bf,$ff,'*',$bf,$dd,$bf 
      dc.b      $80,$c0,'a',$7f,$f8,'k',$ff,$ab 
      dc.b      $01,$04,$fe,$8f,$c8,$bc,$f8,$bf 
      dc.b      $08,'@',$f0,$ff,$a0,$bc,$80,$bf 
      dc.b      $82,'@',$00,$ff,$80,$02,$a0,$02 
      dc.b      $80,$09,$00,$03,$f2,$17,$fe,$17 
      dc.b      $02,$08,$fc,$1f,$b2,$bf,$f5,$bf 
      dc.b      '0@',$e1,$ff,$fe,$ca,$ff,$d6
      dc.b      $00,$c1,$ff,$87,$ff,$fb,$ff,$ff 
      dc.b      $00,$03,$ff,$fe,$00,$00,'@',$00 
      dcb.w     18,0
      dc.b      $00,$02,$00,$02,$00,$00,$00,$00 
      dc.b      'y',$19,$ff,'?',$19,$01,$fe,$bf 
      dc.b      '@',$aa,'a',$fa,'@*',$a1,$fd
      dc.b      $04,$db,'e',$ff,$00,'[',$01,$bf 
      dc.b      'q',$92,$ff,$f3,'q',$90,$ff,$e8 
      dc.b      $b6,'r',$7f,$ff,'&s_',$fc 
      dc.b      ']l',$b6,$ff,$00,'l',$80,$bf
      dc.b      $e4,$a6,$ff,'o',$e6,$00,$f9,$0f 
      dc.b      'pu',$d0,$fd,'p',$15,$e8,$fe
      dc.b      $02,'y"',$ff,$00,$19,$80,$fe
      dc.b      $00,$01,' ',$03,$00,$08,$80,$03 
      dc.b      $94,$0b,$f4,$1f,$14,$03,$fa,$1f 
      dc.b      'el',$e6,$ff,'`',$0c,$d0,$ff
      dc.b      $de,$95,$fe,$9b,$de,$80,$ff,'c' 
      dc.b      $b3,'z',$ff,$fa,'3z',$ff,$fd
      dc.b      '@',$00,'@',$00,$00,$00,$00,$00 
      dcb.w     16,0
      dc.b      $00,$03,$00,$02,$00,$00,$00,$00 
      dc.b      $aa,$aa,$b6,$bd,$be,$af,$c1,$b0 
      dc.b      $b3,'u',$ad,$ed,$a1,'}a',$83
      dc.b      $c7,'je',$f7,$01,$7f,$01,$80
      dc.b      $da,$af,'7k',$ff,$e8,$00,$18
      dc.b      'ie',$be,$df,'/',$fd,'0',$03
      dc.b      $b6,$d2,'c}',$00,'_',$00,'`'
      dc.b      $cb,'z',$be,$ef,$fa,$0b,$06,$0c 
      dc.b      $a8,$aa,'h',$f6,$e8,$be,$18,$c1 
      dc.b      $e3,$aa,$a2,$b6,$80,$be,$80,$c1 
      dc.b      $e0,$0e,$a0,$0b,$80,$02,$80,$03 
      dc.b      $ab,'5',$da,$d6,$fa,$17,$06,$18 
      dc.b      '^',$d2,$d7,'}',$d0,'_0`' 
      dc.b      $b7,'{',$cf,']',$fe,'a',$01,$c1 
      dc.b      'j',$dd,$f7,'=',$7f,$f9,$80,$07 
      dc.b      $c0,$00,'@',$00,$00,$00,$00,$00 
      dcb.w     17,0
      dc.b      $00,$03,$00,$00,$00,$00,$80,$00 
      dcb.w     3,0 
      dc.b      '-',$01,$1e,$00,$00,$00,$00,$00 
      dc.b      $01,$00,$c6,$00,$00,$00,$00,$00 
      dc.b      $00,$09,$00,$06,$00,$00,$00,$00 
      dc.b      'p',$02,$e0,$01,$00,$00,$00,$00 
      dc.b      $a2,$a0,$c1,$c0,$00,$00,$00,$00 
      dc.b      $05,'h',$03,$b0,$00,$00,$00,$00 
      dcb.w     4,0 
      dc.b      $80,$80,'c',$00,$00,$00,$00,$00 
      dc.b      $80,$02,'`',$0c,$00,$00,$00,$00 
      dc.b      $02,$d0,$01,$e0,$00,$00,$00,$00 
      dc.b      $12,$a0,$0d,$c0,$00,$00,$00,$00 
      dc.b      $00,'j',$00,'7',$00,$00,$00,$00 
      dc.b      $80,$01,$00,$00,$00,$00,$00,$00 
      dc.b      $00,$00,$c0,$00,$00,$00,$00,$00 
      dcb.w     16,0
      dc.b      $00,$02,$00,$01,$00,$00,$00,$00 
      dc.b      $ad,'d',$d3,$9b,$00,$00,$00,$00 
      dc.b      '-!',$f3,$df,$00,$00,$00,$00
      dc.b      'eu',$83,$bb,$00,$00,$00,$00
      dc.b      ';z',$fc,$fc,$00,$00,$00,$00
      dc.b      'u',$aa,';',$df,$00,$00,$00,$00 
      dc.b      $80,$ba,$00,'}',$00,$00,$00,$00 
      dc.b      $95,'*',$fe,$1d,$00,$00,$00,$00 
      dc.b      $a9,$9a,$df,$fd,$00,$00,$00,$00 
      dc.b      $a2,$d5,$c1,$ef,$00,$00,$00,$00 
      dc.b      $a0,$0b,$c0,$07,$00,$00,$00,$00 
      dc.b      'r',$d2,$bf,'?',$00,$00,$00,$00 
      dc.b      $b4,$aa,'xw',$00,$00,$00,$00
      dc.b      $da,$d2,'=',$e1,$00,$00,$00,$00 
      dc.b      $b7,'u',$cf,$bb,$00,$00,$00,$00 
      dc.b      '@',$00,$80,$00,$00,$00,$00,$00 
      dcb.w     8,0 
l00c4:dc.b      $07,$1e,'%%(gi0'
      dc.b      '!',$1a,'-i2(.i'
      dc.b      ',',$1e,$1e,'i!',$1e,'+',$1e
      dc.b      'i",i0!',$1a,'-'
      dc.b      'i)',$1e,'()%',$1e,'i'
      dc.b      $27,'(+&',$1a,'%%2' 
      dc.b      'i',$1c,$1a,'%%i',$1a,'i' 
      dc.b      $1d,$1e,'&(hi',$08,'-'
      dc.b      'i',$1f,$1e,$1a,'-.+',$1e 
      dc.b      ',i +',$1a,')!"'
      dc.b      $1c,',gi&.,"' 
      dc.b      $1c,'i',$1a,$27,$1d,'i',$1a,$27 
      dc.b      '"&',$1a,'-"(',$27,','
      dc.b      'i@-!",i,'
      dc.b      $1c,'+(%%"',$27,' ' 
      dc.b      'i&',$1e,',,',$1a,' ',$1e 
      dc.b      'i',$1a,$27,$1d,'i-!',$1e 
      dc.b      'i-+"',$1a,' %',$1e 
      dc.b      ',i',$1a,$1b,'(/',$1e,'a' 
      dc.b      'hi',$0b,$1e,'-c,i' 
      dc.b      '-',$1e,'%%i2(.'
      dc.b      'i0!(i!',$1a,','
      dc.b      'i',$1d,'(',$27,$1e,'i0!' 
      dc.b      $1a,'-ei',$13,'!',$1e,'i' 
      dc.b      '&.,"',$1c,'i0',$1a 
      dc.b      ',i',$1c,'(&)(,'
      dc.b      $1e,$1d,'i',$1b,'2i',$02,$07
      dc.b      $11,$08,$12,'i(',$1f,'i',$14
      dc.b      $27,'%"&"-',$1e,$1d 
      dc.b      'i',$0c,$1a,'-+"',$1c,'$' 
      dc.b      ',i@',$14,$0b,$0c,'ah'
      dc.b      'i',$13,'!',$1e,'i,',$1c,'+'
      dc.b      $1e,$1e,$27,'i0',$1a,',i' 
      dc.b      ')+( +',$1a,'&&'
      dc.b      $1e,$1d,'i',$1b,'2i',$13,$07
      dc.b      $04,'i',$05,$00,$13,$04,'i',$1a 
      dc.b      $27,$1d,'i)+',$1e,')',$1a 
      dc.b      '+',$1e,$1d,'i',$1f,'(+i' 
      dc.b      '-!',$1e,'i',$0a,$0e,$0d,$12
      dc.b      $02,$07,$13,'i',$00,$0b,$12,'i' 
      dc.b      $07,$0e,$01,$01,$18,'i',$1e,'1' 
      dc.b      '!"',$1b,'"-"(',$27 
      dc.b      'i',$1b,'2i',$06,$14,$0d,$12
      dc.b      $13,$08,$02,$0a,'hiii'
      dc.b      'iiiiiiii'
      dc.b      'iii',$0f,'+',$1e,',',$1e 
      dc.b      $27,'-',$1a,'-"(',$27,',' 
      dc.b      'i(',$1f,'i(-!',$1e 
      dc.b      '+i',$1d,$1e,'&(,i' 
      dc.b      '0"%%i-',$1a,'$'
      dc.b      $1e,'i)%',$1a,$1c,$1e,'i' 
      dc.b      $1e,'/',$1e,'+2i',$1f,'.' 
      dc.b      '%%i!(.+h'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiii',$02,'!',$1a,'*'
      dc.b      '.',$1e,'i!',$1e,'.+',$1e 
      dc.b      'i)%',$1e,'"',$27,$1e,'i' 
      dc.b      '"%i2i',$1a,'.+'
      dc.b      $1a,'i.',$27,$1e,'i)+'
      dc.b      $1e,',',$1e,$27,'-',$1a,'-"'
      dc.b      '(',$27,'i',$1d,'c',$1a,'.-'
      dc.b      '+',$1e,',i',$1d,$1e,'&(' 
      dc.b      ',hiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiii',$09,$1e
      dc.b      $1d,$1e,'i/(%%',$1e 
      dc.b      'i',$12,'-.',$27,$1d,$1e,'i'
      dc.b      $1f,'"',$27,$1d,$1e,'-i',$1e
      dc.b      '"',$27,$1e,'i',$0f,'+',$1a,$1e 
      dc.b      ',',$1e,$27,'-',$1a,'-"(' 
      dc.b      $27,'i',$1a,$27,$1d,$1e,'+',$1e 
      dc.b      '+i',$03,$1e,'&(,i' 
      dc.b      ',-',$1a,'--hii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'ii',$00,'%%i',$12,'-'
      dc.b      '(',$27,$27,'i&',$1a,$1a,$1c
      dc.b      '!',$1e,$27,'i',$1e,$1c,'!i'
      dc.b      $1e,$27,' i',$0f,'+',$1e,','
      dc.b      $1e,$27,'-',$1a,'-"(.'
      dc.b      $27,'i/.',$27,'ii',$1a
      dc.b      $1a,$27,$1e,'+',$1e,$27,'i',$03 
      dc.b      $1e,'&(',$1e,$27,'i>>'
      dc.b      '>iiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiii',$0e,$0a,'g' 
      dc.b      'i-!",i-',$1e 
      dc.b      '1-i0"%%i'
      dc.b      ',((',$27,'i,-',$1a 
      dc.b      '+-i',$1a,' ',$1a,'"',$27 
      dc.b      'hhhiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiiiiii'
      dc.b      'iiiii',$ff,$00,$00 
l00c5:dc.b      $02,$1e,'d',$e0,'~>',$02,$00
      dc.b      $82,$fe,$fe,$00,$92,$fe,'l',$00 
      dc.b      '|',$fe,$82,$00,$82,$c6,'d',$00 
      dc.b      $82,$fe,$fe,$00,$82,$fe,'|',$00 
      dc.b      $82,$fe,$fe,$00,$92,$ba,$c6,$00 
      dc.b      $82,$fe,$fe,$02,$90,$b8,$c0,$00 
      dc.b      '|',$fe,$82,$00,$92,$de,'^',$00 
      dc.b      $82,$fe,$fe,$00,$92,$fe,$82,$00 
      dc.b      $00,$82,$fe,$fe,$82,$00,$00,$00 
      dc.b      $04,$06,$02,$80,$fe,$fc,$80,$00 
      dc.b      $82,$fe,$fe,$82,'0',$de,$82,$00 
      dc.b      $82,$fe,$fe,$80,$02,$02,$06,$82 
      dc.b      $e6,'r8',$10,'b',$fe,$82,$00
      dc.b      $82,$e6,'r8',$9c,$ce,$80,$00
      dc.b      '|',$fe,$82,$00,$82,$fe,'|',$00 
      dc.b      $82,$fe,$fe,$02,$90,$f0,'`',$00 
      dc.b      '|',$fe,$82,$00,$82,$ff,'}',$00 
      dc.b      $82,$fe,$fe,$02,$90,$fe,'f',$00 
      dc.b      'd',$f6,$b2,'8',$9a,$de,'l',$c0 
      dc.b      $80,$02,$fe,$fe,$02,$80,$c0,$00 
      dc.b      $80,$fc,$fe,$00,$82,$fc,$80,$00 
      dc.b      $80,$f0,$fc,$1e,$84,$f0,$80,$e0 
      dc.b      $f8,$1e,$c6,$f0,'<',$8e,$c2,$00 
      dc.b      $c2,$e6,'r8',$9c,$ce,$86,$00
      dc.b      $80,$e2,$fe,'>',$82,$e0,$80,$00 
      dc.b      $c6,$8e,$9c,'8r',$e2,$c6,$00
      dc.b      $04,'.* >',$1e,$02,$00
      dc.b      $82,$fe,$fe,$00,'">',$1c,$00
      dc.b      $1c,'>"',$00,'"6',$14,$00 
      dc.b      $1c,'>"',$80,$fe,$fe,$02,$00
      dc.b      $1c,'>*',$02,'*:',$18,$00 
      dc.b      $10,'~',$fe,$10,$90,$c0,'@',$00 
      dc.b      $1a,'?%',$01,'%}x',$00
      dc.b      $82,$fe,$fe,$02,' >',$1e,$00
      dc.b      $00,'"',$be,$be,$02,$00,$00,$00 
      dc.b      $02,$03,$01,$00,'!',$bf,$be,$00 
      dc.b      $82,$fe,$fe,$00,'<&',$02,$00
      dc.b      $00,$82,$fe,$fe,$02,$00,$00,'"' 
      dc.b      '>>',$02,' > >',$00 
      dc.b      '">>',$02,' >',$02,$00
      dc.b      $1c,'>"',$00,'">',$1c,$00 
      dc.b      '!??',$01,'$<',$18,$00
      dc.b      $18,'<$',$00,'??!',$00
      dc.b      '">>',$02,' 0',$10,$00
      dc.b      $12,'::',$08,'..$',$00
      dc.b      ' |',$fe,' "',$06,$04,' ' 
      dc.b      '<>',$02,' >>',$02,$00
      dc.b      ' 8<',$06,'$0 0'
      dc.b      '<',$0e,'"8',$1e,$06,'0',$00
      dc.b      '"28',$1c,$0e,'&"',$00
      dc.b      ' 9=',$05,'!?>',$00 
      dc.b      '2&',$0e,$1c,'82&',$00
      dc.b      $00,$02,$82,$fe,$fe,$02,$02,$00 
      dc.b      'f',$ce,$9c,'8',$f2,$e2,'f',$00 
      dc.b      'd',$c6,$82,$10,$92,$fe,'l',$00 
      dc.b      $18,'8h',$02,$fe,$fe,$0a,$00
      dc.b      $f4,$f6,$92,$00,$92,$9e,$cc,$00 
      dc.b      '|',$fe,$92,$00,$92,$de,'l',$00 
      dc.b      $00,$c0,$86,$8e,$18,$f0,$e0,$00 
      dc.b      'l',$fe,$92,$00,$92,$fe,'l',$00 
      dc.b      'd',$f6,$92,$00,$92,$fe,'|',$00 
      dc.b      '|',$fe,$82,$00,$82,$fe,'|',$00 
      dc.b      $00,$fa,$fa,$00,$00,$00,$00,$00 
      dc.b      $00,$c0,$e0,$00,$c0,$e0,$00,$00 
      dc.b      $00,'<~',$c3,$81,$81,$00,$00
      dc.b      $00,$81,$81,$c3,'~<',$00,$00
      dc.b      '@',$c0,$80,$1a,$9a,$f0,'`',$00 
      dc.b      $00,$00,$c0,$e0,$00,$00,$00,$00 
      dc.b      $00,$10,$10,$10,$10,$10,$00,$00 
      dc.b      $00,'ff',$00,$00,$00,$00,$00
      dc.b      $00,'fg',$00,$00,$00,$00,$00
      dc.b      $00,$06,$07,$00,$00,$00,$00,$00 
      dc.b      $00,$06,$06,$00,$00,$00,$00,$00 
      dcb.w     4,0 
l00c6:dc.b      $07,'s',$06,'t',$05,'d',$05,'t' 
      dc.b      $04,'7',$06,'4',$04,'[',$04,'s' 
      dc.b      $07,'s',$06,'t',$05,'d',$05,'t' 
      dc.b      $04,'7',$06,'4',$04,'[',$04,'s' 
      dc.b      $04,'c',$06,'s',$04,'d',$02,'d' 
      dc.b      $03,'4',$02,'g',$04,'4',$03,'s' 
      dc.b      $04,'c',$06,'s',$04,'d',$02,'d' 
      dc.b      $03,'4',$02,'g',$04,'4',$03,'s' 
      dc.b      $02,'s',$04,'s',$05,'s',$01,'t' 
      dc.b      $00,'4',$01,'%',$00,'6',$02,'4' 
      dc.b      $02,'s',$04,'s',$05,'s',$01,'t' 
      dc.b      $00,'4',$01,'%',$00,'6',$02,'4' 
      dc.b      $00,'e',$01,'s',$02,'s',$04,'s' 
      dc.b      $00,'u',$01,'e',$03,'%',$02,$17 
      dc.b      $00,'e',$01,'s',$02,'s',$04,'s' 
      dc.b      $00,'u',$01,'e',$03,'%',$02,$17 
      dc.b      $01,'6',$01,'e',$00,'s',$02,'t' 
      dc.b      $03,'s',$02,'e',$01,'e',$03,$05 
      dc.b      $01,'6',$01,'e',$00,'s',$02,'t' 
      dc.b      $03,'s',$02,'e',$01,'e',$03,$05 
      dc.b      $04,'u',$04,'f',$04,'v',$01,'u' 
      dc.b      $00,'r',$00,'d',$02,'s',$04,'u' 
      dc.b      $04,'u',$04,'f',$04,'v',$01,'u' 
      dc.b      $00,'r',$00,'d',$02,'s',$04,'u' 
      dc.b      $01,'s',$05,'u',$02,'e',$04,'&' 
      dc.b      $06,'f',$04,'u',$01,'b',$01,'u' 
      dc.b      $01,'s',$05,'u',$02,'e',$04,'&' 
      dc.b      $06,'f',$04,'u',$01,'b',$01,'u' 
      dc.b      $01,'e',$00,'d',$04,'u',$06,'s' 
      dc.b      $06,'f',$06,'f',$07,'u',$00,'u' 
      dc.b      $01,'e',$00,'d',$04,'u',$06,'s' 
      dc.b      $06,'f',$06,'f',$07,'u',$00,'u' 
l00c7:dc.b      'uu33',$0f,$0f,$00,$00
l00c8:dc.b      'a',$fa,'(nc',$fa,$0d,'v' 
      dc.b      'p@a',$00,$02,$84,'c',$fa 
      dc.b      $0d,'lp>a',$00,$02,'z'
      dc.b      'c',$fa,$0d,'bp<a',$00
      dc.b      $02,'pc',$fa,$0d,'8p:'
      dc.b      'a',$00,$02,'fc',$fa,$0d,'.'
      dc.b      'p8a',$00,$02,'\c',$fa
      dc.b      $0d,'$p6a',$00,$02,'r'
      dc.b      'c',$fa,$0d,$1a,'p4a',$00 
      dc.b      $02,'hc',$fa,$0d,$10,'p2' 
      dc.b      'a',$00,$02,'>c',$fa,$0d,$06
      dc.b      'p0a',$00,$02,'4c',$fa
      dc.b      $0c,$fc,'p.a',$00,$02,'*' 
      dc.b      'c',$fa,$0c,$f2,'p,a',$00 
      dc.b      $02,' c',$fa,$0c,$e8,'p*' 
      dc.b      'a',$00,$02,$16,'c',$fa,$0c,$de 
      dc.b      'p(a',$00,$02,$0c,'c',$fa 
      dc.b      $0c,$d4,'p&a',$00,$02,$02 
      dc.b      'c',$fa,$0c,$ca,'p$a',$00 
      dc.b      $01,$f8,'c',$fa,$0c,$c0,'p"'
      dc.b      'a',$00,$01,$ee,'c',$fa,$0c,$b6 
      dc.b      'p a',$00,$01,$e4,'c',$fa 
      dc.b      $0c,$ac,'p',$1e,'a',$00,$01,$da 
      dc.b      'c',$fa,$0c,$a2,'p',$1c,'a',$00 
      dc.b      $01,$d0,'c',$fa,$0c,$98,'p',$1a 
      dc.b      'a',$00,$01,$c6,'c',$fa,$0c,'Ž' 
      dc.b      'p',$18,'a',$00,$01,$bc,'c',$fa 
      dc.b      $0c,$84,'p',$16,'a',$00,$01,$b2 
      dc.b      'c',$fa,$0c,'zp',$14,'a',$00
      dc.b      $01,$a8,'c',$fa,$0c,'pp',$12
      dc.b      'a',$00,$01,$9e,'c',$fa,$0c,'f' 
      dc.b      'p',$10,'a',$00,$01,$94,'c',$fa 
      dc.b      $0c,'\p',$0e,'a',$00,$01,$8a
      dc.b      'c',$fa,$0c,'rp',$0c,'a',$00
      dc.b      $01,$80,'c',$fa,$0c,'hp',$0a
      dc.b      'a',$00,$01,'vc',$fa,$0c,'>'
      dc.b      'p',$08,'a',$00,$01,'lc',$fa
      dc.b      $0c,'4p',$06,'a',$00,$01,'b'
      dc.b      'c',$fa,$0c,'*p',$04,'a',$00
      dc.b      $01,'xc',$fa,$0c,' p',$02 
      dc.b      'a',$00,$01,'nc',$fa,$0c,$16
      dc.b      'p',$00,'a',$00,$01,'dc',$fa
      dc.b      $0b,$ec,'p',$02,'a',$00,$01,':' 
      dc.b      'c',$fa,$0b,$e2,'p',$04,'a',$00 
      dc.b      $01,'0c',$fa,$0b,$d8,'p',$06
      dc.b      'a',$00,$01,'&c',$fa,$0b,$ce
      dc.b      'p',$08,'a',$00,$01,$1c,'c',$fa 
      dc.b      $0b,$c4,'p',$0a,'a',$00,$01,$12 
      dc.b      'c',$fa,$0b,$ba,'p',$0c,'a',$00 
      dc.b      $01,$08,'c',$fa,$0b,$b0,'p',$0e 
      dc.b      'a',$00,$00,$fe,'c',$fa,$0b,$a6 
      dc.b      'p',$10,'a',$00,$00,$f4,'c',$fa 
      dc.b      $0b,$9c,'p',$12,'a',$00,$00,$ea 
      dc.b      'c',$fa,$0b,$92,'p',$14,'a',$00 
      dc.b      $00,$e0,'c',$fa,$0b,$88,'p',$16 
      dc.b      'a',$00,$00,$d6,'c',$fa,$0b,'~' 
      dc.b      'p',$18,'a',$00,$00,$cc,'c',$fa 
      dc.b      $0b,'tp',$1a,'a',$00,$00,$c2
      dc.b      'c',$fa,$0b,'jp',$1c,'a',$00
      dc.b      $00,$b8,'c',$fa,$0b,'`p',$1e
      dc.b      'a',$00,$00,$ae,'c',$fa,$0b,'v' 
      dc.b      'p a',$00,$00,$a4,'c',$fa 
      dc.b      $0b,'lp"a',$00,$00,'š'
      dc.b      'c',$fa,$0b,'bp$a',$00
      dc.b      $00,$90,'c',$fa,$0b,'8p&' 
      dc.b      'a',$00,$00,$86,'c',$fa,$0b,'.' 
      dc.b      'p(a',$00,$00,'|c',$fa
      dc.b      $0b,'$p*a',$00,$00,'r'
      dc.b      'c',$fa,$0b,$1a,'p,a',$00 
      dc.b      $00,'hc',$fa,$0b,$10,'p.' 
      dc.b      'a',$00,$00,'^c',$fa,$0b,$06
      dc.b      'p0a',$00,$00,'tc',$fa
      dc.b      $0a,$fc,'p2a',$00,$00,'j' 
      dc.b      'c',$fa,$0a,$f2,'p4a',$00 
      dc.b      $00,'@c',$fa,$0a,$e8,'p6' 
      dc.b      'a',$00,$00,'6c',$fa,$0a,$de
      dc.b      'p8a',$00,$00,',c',$fa
      dc.b      $0a,$d4,'p:a',$00,$00,'"' 
      dc.b      'c',$fa,$0a,$ca,'p<a',$00 
      dc.b      $00,$18,'c',$fa,$0a,$c0,'p>'
      dc.b      'a',$00,$00,$0e,'c',$fa,$0a,$b6 
      dc.b      'p@a',$00,$00,$04,'nu'
      dc.b      '4',$00,$d4,'be',$fa,$0b,'('
      dc.b      '(2 ',$fc,',',$04,$d8,$84 
      dc.b      'd',$86,'e',$fa,$0a,$d8,'42'
      dc.b      $00,$00,'dbe',$fa,$0a,$86 
      dc.b      'n',$f2,' ',$00,'hfjf'
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rfl6:',$19,'rf'
      dc.b      'l0:',$19,'rfl*'
      dc.b      ':',$19,'rfl$:',$19 
      dc.b      'rfl',$1e,':',$19,'rf'
      dc.b      'l',$18,'hhchri'
      dc.b      's is an '
      dc.b      'idiot !!'
      dc.b      '!',$00,'0',$c5,'hf',$9c,$84
      dc.b      'hfjflh:',$19 
      dc.b      'rflb:',$19,'rf'
      dc.b      'l<:',$19,'rfl6'
      dc.b      ':',$19,'rfl0:',$19 
      dc.b      'rfl*:',$19,'rf'
      dc.b      'l$:',$19,'rfl',$1e 
      dc.b      ':',$19,'rfl',$18,'hh'
      dc.b      'chris is'
      dc.b      ' an idio'
      dc.b      't !!!',$00,'0',$c5 
      dc.b      'hf',$9c,$84,'hfjf' 
      dc.b      'lh:',$19,'rflb'
      dc.b      ':',$19,'rfl<:',$19 
      dc.b      'rf'
l00c9:dc.b      'l6:',$19,'rfl0'
      dc.b      ':',$19,'rfl*:',$19 
      dc.b      'rfl$:',$19,'rf'
      dc.b      'l',$1e,':',$19,'rfl',$18 
      dc.b      'hhchris '
      dc.b      'is an id'
      dc.b      'iot !!!',$00 
      dc.b      '0',$c5,'hf',$9c,$84,'hf' 
      dc.b      'jflh:',$19,'rf'
      dc.b      'lb:',$19,'rfl<'
      dc.b      ':',$19,'rfl6:',$19 
      dc.b      'rfl0:',$19,'rf'
      dc.b      'l*:',$19,'rfl$'
      dc.b      ':',$19,'rfl',$1e,':',$19 
      dc.b      'rfl',$18,'hhch'
      dc.b      'ris is a'
      dc.b      'n idiot '
      dc.b      '!!!',$00,'0',$c5,'hf'
      dc.b      $9c,$84,'a',$e8,$00,'@',$90,$c0 
      dc.b      'nu',$80,$00,$c0,$00,$e0,$00
      dc.b      $f0,$00,$f8,$00,$fc,$00,$fe,$00 
      dc.b      $ff,$00,$ff,$80,$ff,$c0,$ff,$e0 
      dc.b      $ff,$f0,$ff,$f8,$ff,$fc,$ff,$fe 
      dc.b      $ff,$ff,$00,$01,$00,$03,$00,$07 
      dc.b      $00,$0f,$00,$1f,$00,'?',$00,$7f 
      dc.b      $00,$ff,$01,$ff,$03,$ff,$07,$ff 
      dc.b      $0f,$ff,$1f,$ff,'?',$ff,$7f,$ff 
      dc.b      $ff,$ff,$00,$00,$00,'t',$00,$a8 
      dc.b      $00,$fc,$01,'p',$01,$a4,$01,$f8 
      dc.b      $02,'l',$02,$a0,$02,$f4,$03,'h' 
      dc.b      $03,$9c,$03,$f0,$04,'d',$04,$98 
      dc.b      $04,$ec,$05,'@',$05,$94,$05,$e8 
      dc.b      $06,'<',$06,$90,$06,$e4,$07,'8' 
      dc.b      $07,$8c,$07,$e0,$08,'4',$08,$88 
      dc.b      $08,$dc,$09,'0',$09,$84,$09,$d8 
      dc.b      $0a,',',$0a,$80,$00,$08,$00,$00 
      dc.b      $00,$04,$00,$00,$00,$02,$aa,$aa 
      dc.b      $00,$02,$00,$00,$00,$01,$99,$99 
      dc.b      $00,$01,'uu',$00,$01,'$',$92
      dc.b      $00,$01,$00,$00,$00,$00,$e3,$8e 
      dc.b      $00,$00,$cc,$cc,$00,$00,$ba,'.' 
      dc.b      $00,$00,$aa,$aa,$00,$00,$9d,$89 
      dc.b      $00,$00,$92,'i',$00,$00,$88,$88 
      dc.b      $00,$00,$80,$00,$00,$00,'xx'
      dc.b      $00,$00,'q',$c7,$00,$00,'k',$ca 
      dc.b      $00,$00,'ff',$00,$00,'a',$86
      dc.b      $00,$00,']',$17,$00,$00,'y',$0b 
      dc.b      $00,$00,'uu',$00,$00,'q',$eb
      dc.b      $00,$00,'n',$c4,$00,$00,'k',$da 
      dc.b      $00,$00,'i$',$00,$00,'f',$9e
      dc.b      $00,$00,'dd',$00,$00,'b',$10
      dc.b      $00,$00,'@',$00 
 bss
l00ca:ds.w      1 
l00cb:ds.w      1 
l00cc:ds.b      6656
l00cd:ds.b      46
l00ce:ds.b      4096
l00cf:ds.b      1010
l00d0:ds.b      1010
l00d1:ds.w      1 
l00d2:ds.l      1 
l00d3:ds.b      49280 
l00d4:ds.b      57786 
l00d5:ds.b      260786
l00d6:ds.b      238386
zuend: end
