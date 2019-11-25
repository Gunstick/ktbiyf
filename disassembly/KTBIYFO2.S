
text
begin
	pea	l0000(pc)
	move.w	#$26,-(a7)		;supexec
	trap	#$e
	addq.l	#6,a7
	clr.w	-(a7)		;pterm0
	trap	#1
l0000	lea	l001e(pc),a0
	move.l	a7,(a0)+
	lea	l0085,a7
	move	sr,(a0)+
	move	#$2700,sr
	move	usp,a1
	move.l	a1,(a0)+
	moveq	#$12,d0
	bsr	l0010
	moveq	#$1a,d0
	bsr	l0010
	move.l	$408.w,l0019
	move.l	#l001a,$408.w
	bsr	l0015
	bsr	l0012
	bsr.s	l0002
	bsr	l0006
	bsr	l000c
	bsr	l0009
	bra	l0027
l0001	lea	l0085,a7
	bsr	l0009
	bsr	l0008
	bsr	l0004
	moveq	#$14,d0
	bsr	l0010
	moveq	#8,d0
	bsr	l0010
	lea	l001e(pc),a0
	movea.l	(a0)+,a7
	move	(a0)+,sr
	movea.l	(a0)+,a1
	move	a1,usp
	move.l	l0019(pc),$408.w
	rts

l0002	lea	l001f(pc),a0
	move.b	$ffff8260.w,(a0)+
	move.b	$ffff820a.w,(a0)+
	move.l	$ffff8200.w,(a0)+
	tst.w	l0023
	beq.s	l0003
	move.b	$ffff8209.w,(a0)+
	move.b	$ffff820d.w,(a0)+
	move.b	$ffff820f.w,(a0)+
	move.b	$ffff8265.w,(a0)+
l0003	movem.l	$ffff8240.w,d0-d7
	movem.l	d0-d7,(a0)
	lea	l0020(pc),a0
	move.l	$68.w,(a0)+
	move.l	$70.w,(a0)+
	move.l	$114.w,(a0)+
	move.l	$118.w,(a0)+
	move.l	$120.w,(a0)+
	move.l	$134.w,(a0)+
	lea	l0021(pc),a0
	move.b	$fffffa07.w,(a0)+
	move.b	$fffffa09.w,(a0)+
	move.b	$fffffa13.w,(a0)+
	move.b	$fffffa15.w,(a0)+
	move.b	$fffffa17.w,(a0)+
	move.b	$fffffa19.w,(a0)+
	move.b	$fffffa1b.w,(a0)+
	move.b	$fffffa1d.w,(a0)+
	rts

l0004	lea	l0021(pc),a0
	move.b	(a0)+,$fffffa07.w
	move.b	(a0)+,$fffffa09.w
	move.b	(a0)+,$fffffa13.w
	move.b	(a0)+,$fffffa15.w
	move.b	(a0)+,$fffffa17.w
	move.b	(a0)+,$fffffa19.w
	move.b	(a0)+,$fffffa1b.w
	move.b	(a0)+,$fffffa1d.w
	lea	l0020(pc),a0
	move.l	(a0)+,$68.w
	move.l	(a0)+,$70.w
	move.l	(a0)+,$114.w
	move.l	(a0)+,$118.w
	move.l	(a0)+,$120.w
	move.l	(a0)+,$134.w
	lea	l001f(pc),a0
	move.b	(a0)+,$ffff8260.w
	move.b	(a0)+,$ffff820a.w
	move.l	(a0)+,$ffff8200.w
	tst.w	l0023
	beq.s	l0005
	move.b	(a0)+,$ffff8209.w
	move.b	(a0)+,$ffff820d.w
	move.b	(a0)+,$ffff820f.w
	move.b	(a0)+,$ffff8265.w
l0005	movem.l	(a0),d0-d7
	movem.l	d0-d7,$ffff8240.w
	rts

l0006	movem.l	l0024(pc),d0-d7
	movem.l	d0-d7,$ffff8240.w
	bsr	l000d
	move.b	#0,$ffff8260.w
	move.b	#2,$ffff820a.w
	tst.w	l0023
	beq.s	l0007
	clr.b	$ffff8209.w
	clr.b	$ffff820d.w
	clr.b	$ffff820f.w
	clr.b	$ffff8265.w
l0007	rts

l0008	move.b	#2,$ffff820a.w
	bsr	l000d
	move.b	#0,$ffff820a.w
	bsr	l000d
	move.b	#2,$ffff820a.w
	bsr	l000d
	rts

l0009	moveq	#$a,d0
	lea	$ffff8800.w,a0
l000a	move.b	d0,(a0)
	move.b	#0,2(a0)
	dbf	d0,l000a
	move.b	#7,(a0)
	move.b	#$7f,2(a0)
	move.b	#$e,(a0)
	move.b	#$26,2(a0)
	tst.w	l0023
	beq.s	l000b
	clr.w	$ffff8900.w
	move.w	#$7ff,$ffff8924.w
	move.w	#$4e8,$ffff8922.w
	move.w	#$554,$ffff8922.w
	move.w	#$514,$ffff8922.w
	move.w	#$486,$ffff8922.w
	move.w	#$446,$ffff8922.w
	move.w	#$401,$ffff8922.w
l000b	rts

l000c	move.l	#l001d,$68.w
	move.l	#l001d,$70.w
	move.l	#l001d,$114.w
	move.l	#l001d,$118.w
	move.l	#l001d,$120.w
	move.l	#l001d,$134.w
	bclr	#3,$fffffa17.w
	clr.b	$fffffa07.w
	clr.b	$fffffa09.w
	rts

l000d	movem.l	a0/d0-d1,-(a7)
	lea	$ffff8209.w,a0
	movep.w	-8(a0),d0
l000e	tst.b	(a0)
	beq.s	l000e
l000f	tst.b	(a0)
	bne.s	l000f
	movep.w	-4(a0),d1
	cmp.w	d0,d1
	bne.s	l000f
	movem.l	(a7)+,a0/d0-d1
	rts

l0010	lea	$fffffc00.w,a0
l0011	move.b	(a0),d1
	btst	#1,d1
	beq.s	l0011
	move.b	d0,2(a0)
	rts

l0012	move.b	#0,$fffffa19.w
	move.b	#$ff,$fffffa1f.w
	move.b	#1,$fffffa19.w
	moveq	#$ff,d0
l0013	dbf	d0,l0013
	moveq	#0,d0
	move.b	$fffffa1f.w,d0
	move.b	#0,$fffffa19.w
	cmp.w	#$9b,d0
	ble.s	l0014
	move.w	#$ffff,l0022
l0014	rts

l0015	clr.w	l0023
	rts

	move.l	a7,l0017
	move.l	8.w,l0018
	move.l	#l0016,8.w
	tst.w	$ffff8900.l
	move.w	#$ffff,l0023
l0016	lea	0.l,a7
l0017	equ	*-4
	move.l	#0,8.w
l0018	equ	*-6
	rts

	dc.b	'XBRATFSY'
l0019	dcb.w	2
l001a	bsr.s	l001b
	movea.l	l0019(pc),a0
	jmp	(a0)
l001b	move	#$2700,sr
	movem.l	l0024(pc),d0-d7
	movem.l	d0-d7,$ffff8240.w
	bra	l0001
l001c	move	sr,-(a7)
	move	#$2700,sr
	lea	$fffffa00.w,a1
	movep.w	7(a1),d0
	move.w	d0,-(a7)
	movep.l	19(a1),d0
	move.l	d0,-(a7)
	movep.w	27(a1),d0
	move.w	d0,-(a7)
	move.l	$68.w,-(a7)
	move.l	$70.w,-(a7)
	move.l	$114.w,-(a7)
	move.l	$118.w,-(a7)
	move.l	$120.w,-(a7)
	move.l	$134.w,-(a7)
	lea	l0021(pc),a0
	move.b	(a0)+,$fffffa07.w
	move.b	(a0)+,$fffffa09.w
	move.b	(a0)+,$fffffa13.w
	move.b	(a0)+,$fffffa15.w
	move.b	(a0)+,$fffffa17.w
	move.b	(a0)+,$fffffa19.w
	move.b	(a0)+,$fffffa1b.w
	move.b	(a0)+,$fffffa1d.w
	lea	l0020(pc),a0
	move.l	(a0)+,$68.w
	move.l	(a0)+,$70.w
	move.l	(a0)+,$114.w
	move.l	(a0)+,$118.w
	move.l	(a0)+,$120.w
	move.l	(a0)+,$134.w
	move	#$2300,sr
	clr.w	-(a7)
	pea	(a5)
	move.w	#$3d,-(a7)		;fopen
	trap	#1
	addq.l	#8,a7
	tst.w	d0
	bmi	l001b
	move.w	d0,d7
	pea	(a6)
	move.l	#$7a120,-(a7)
	move.w	d7,-(a7)
	move.w	#$3f,-(a7)		;fread
	trap	#1
	lea	12(a7),a7
	move.w	d7,-(a7)
	move.w	#$3e,-(a7)		;fclose
	trap	#1
	addq.l	#4,a7
	move	#$2700,sr
	move.l	(a7)+,$134.w
	move.l	(a7)+,$120.w
	move.l	(a7)+,$118.w
	move.l	(a7)+,$114.w
	move.l	(a7)+,$70.w
	move.l	(a7)+,$68.w
	lea	$fffffa00.w,a1
	move.w	(a7)+,d0
	movep.w	d0,27(a1)
	move.l	(a7)+,d0
	movep.l	d0,19(a1)
	move.w	(a7)+,d0
	movep.w	d0,7(a1)
	move	(a7)+,sr
	rts

l001d	dc.b	'Ns'
l001e	dcb.w	4
l001f	dcb.w	21
l0020	dcb.w	12
l0021	dcb.w	5
l0022	dc.b	0,0
l0023	dc.b	0,0
l0024	dcb.w	32
l0025	dc.b	'*.xsd',0
l0026	dc.b	'*.XMD',0
l0027	lea	l007b,a0
	lea	zuend,a1
	movem.l	l0024(pc),a2-a6/d1-d7
l0028	movem.l	a2-a6/d1-d7,(a0)
	movem.l	a2-a6/d1-d7,48(a0)
	movem.l	a2-a6/d1-d7,96(a0)
	lea	144(a0),a0
	cmpa.l	a0,a1
	bpl.s	l0028
	move.l	#l0084,d0
	add.l	#$ff,d0
	and.l	#$ffff00,d0
	move.l	d0,l0083
	movea.l	d0,a1
	ror.l	#8,d0
	lea	$ffff8201.w,a0
	movep.w	d0,0(a0)
	lea	12870(a1),a1
	move.l	a1,l0038
	lea	7360(a1),a1
	move.l	a1,l0056
	lea	15458(a1),a1
	move.l	a1,l0057
	lea	56(a1),a1
	move.l	a1,l005d
	movem.l	l0078,d1-d2
	movea.l	l0057(pc),a0
	lea	202(a0),a0
	moveq	#7,d0
l0029	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	movem.l	d1-d2,-(a0)
	lea	438(a0),a0
	dbf	d0,l0029
	bsr	l0040
	jsr	l0079
	lea	l0085,a7
	bsr	l000d
	lea	l0025(pc),a5
	lea	l0087,a6
	bsr	l001c
	lea	l0026(pc),a5
	lea	l0085,a6
	bsr	l001c
	lea	l0071,a0
	movea.l	l0083,a1
	moveq	#$21,d0
l002a	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,80(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,120(a1)
	lea	160(a1),a1
	dbf	d0,l002a
	pea	(a1)
	lea	l0072,a0
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,d1-d6
	movem.l	d1-d6,80(a1)
	lea	204(a1),a1
	moveq	#$13,d0
l002b	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,80(a1)
	lea	8(a0),a0
	lea	230(a1),a1
	dbf	d0,l002b
	lea	l0073,a0
	movea.l	(a7)+,a1
	lea	96(a1),a1
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,d1-d6
	movem.l	d1-d6,80(a1)
	lea	228(a1),a1
	moveq	#$13,d0
l002c	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,d1-d6
	movem.l	d1-d6,80(a1)
	lea	230(a1),a1
	dbf	d0,l002c
	lea	-120(a1),a1
	lea	l0074,a0
	moveq	#5,d0
l002d	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,40(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,80(a1)
	movem.l	(a0)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,120(a1)
	lea	160(a1),a1
	dbf	d0,l002d
	move.l	#l0085,l0069
	move.l	#l0087,l006a
	move.l	#l0086,l006b
	move.l	#l0080,l006c
	move.l	#l0081,l006d
	move.w	l0023(pc),l006e
	bsr	l0064
	move.l	#l0052,$70.w
	tst.w	l0023
	bne.s	l002e
	move.l	l0068(pc),$68.w
	lea	$ffff8800.w,a5
	movea.l	l006c(pc),a6
l002e	move.b	#1,$fffffa07.w
	move.b	#1,$fffffa13.w
	movem.l	l0070,d0-d7
	movem.l	d0-d7,$ffff8240.w
	move	#$2300,sr
l002f	tst.b	l0082
	beq.s	l002f
	sf	l0082
	move.l	l004d(pc),l0058
	move.l	#l0050,l0059
l0030	equ	*-8
	move	#$2500,sr
	bsr	l0066
	move	#$2100,sr
	movem.l	l0070,a0/d0-d6
	movem.l	a0/d0-d6,$ffff8240.w
	bsr.s	l0031
	bsr	l0065
	bsr	l0040
	cmpi.b	#$39,$fffffc02.w
	beq	l001b
	bra.s	l002f
l0031	lea	l007e,a0
	movea.l	a0,a4
	movea.l	a0,a1
	moveq	#0,d1
	moveq	#$16,d0
l0032	subq.w	#4,(a1)+
	bge.s	l0033
	move.w	d1,-2(a1)
l0033	dbf	d0,l0032
	movea.l	l006f(pc),a1
	lea	l003f(pc),a2
	moveq	#0,d2
	tst.b	21(a1)
	beq.s	l0034
	sf	21(a1)
	move.w	10(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	22(a1),41(a0,d1.w)
l0034	tst.b	45(a1)
	beq.s	l0035
	sf	45(a1)
	move.w	34(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	46(a1),41(a0,d1.w)
l0035	tst.b	69(a1)
	beq.s	l0036
	sf	69(a1)
	move.w	58(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	70(a1),41(a0,d1.w)
l0036	tst.b	93(a1)
	beq.s	l0037
	sf	93(a1)
	move.w	82(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	94(a1),41(a0,d1.w)
l0037	lea	0.l,a0
l0038	equ	*-4
	moveq	#0,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	move.w	(a4)+,d1
	bsr	l0039
	move.w	d1,d0
	rts

l0039	move	a0,usp
	lea	l003e(pc),a1
	move.w	d0,d2
	move.w	d1,d3
	cmp.w	d1,d2
	bge.s	l003a
	exg	d3,d2
l003a	moveq	#0,d5
	move.w	#$3e,d4
	sub.w	d2,d4
	adda.w	0(a1,d4.w),a0
	add.w	d4,d4
	neg.w	d4
	lea	-328(a1),a2
	jmp	0(a2,d4.w)
	move.w	d5,-7360(a0)
	move.w	d5,-7130(a0)
	move.w	d5,-6900(a0)
	move.w	d5,-6670(a0)
	move.w	d5,-6440(a0)
	move.w	d5,-6210(a0)
	move.w	d5,-5980(a0)
	move.w	d5,-5750(a0)
	move.w	d5,-5520(a0)
	move.w	d5,-5290(a0)
	move.w	d5,-5060(a0)
	move.w	d5,-4830(a0)
	move.w	d5,-4600(a0)
	move.w	d5,-4370(a0)
	move.w	d5,-4140(a0)
	move.w	d5,-3910(a0)
	move.w	d5,-3680(a0)
	move.w	d5,-3450(a0)
	move.w	d5,-3220(a0)
	move.w	d5,-2990(a0)
	move.w	d5,-2760(a0)
	move.w	d5,-2530(a0)
	move.w	d5,-2300(a0)
	move.w	d5,-2070(a0)
	move.w	d5,-1840(a0)
	move.w	d5,-1610(a0)
	move.w	d5,-1380(a0)
	move.w	d5,-1150(a0)
	move.w	d5,-920(a0)
	move.w	d5,-690(a0)
	move.w	d5,-460(a0)
	move.w	d5,-230(a0)
	sub.w	d3,d2
	move.w	d0,d4
	sub.w	d1,d4
	add.w	#$40,d4
	lea	l007f,a2
	lsl.w	#5,d4
	adda.w	d4,a2
	adda.w	0(a1,d2.w),a0
	add.w	d2,d2
	neg.w	d2
	lea	l003b(pc),a3
	jmp	0(a3,d2.w)
	move.w	(a2)+,-7360(a0)
	move.w	(a2)+,-7130(a0)
	move.w	(a2)+,-6900(a0)
	move.w	(a2)+,-6670(a0)
	move.w	(a2)+,-6440(a0)
	move.w	(a2)+,-6210(a0)
	move.w	(a2)+,-5980(a0)
	move.w	(a2)+,-5750(a0)
	move.w	(a2)+,-5520(a0)
	move.w	(a2)+,-5290(a0)
	move.w	(a2)+,-5060(a0)
	move.w	(a2)+,-4830(a0)
	move.w	(a2)+,-4600(a0)
	move.w	(a2)+,-4370(a0)
	move.w	(a2)+,-4140(a0)
	move.w	(a2)+,-3910(a0)
	move.w	(a2)+,-3680(a0)
	move.w	(a2)+,-3450(a0)
	move.w	(a2)+,-3220(a0)
	move.w	(a2)+,-2990(a0)
	move.w	(a2)+,-2760(a0)
	move.w	(a2)+,-2530(a0)
	move.w	(a2)+,-2300(a0)
	move.w	(a2)+,-2070(a0)
	move.w	(a2)+,-1840(a0)
	move.w	(a2)+,-1610(a0)
	move.w	(a2)+,-1380(a0)
	move.w	(a2)+,-1150(a0)
	move.w	(a2)+,-920(a0)
	move.w	(a2)+,-690(a0)
	move.w	(a2)+,-460(a0)
	move.w	(a2)+,-230(a0)
l003b	moveq	#$ff,d5
	adda.w	0(a1,d3.w),a0
	add.w	d3,d3
	neg.w	d3
	lea	l003c(pc),a2
	jmp	0(a2,d3.w)
	move.w	d5,-7360(a0)
	move.w	d5,-7130(a0)
	move.w	d5,-6900(a0)
	move.w	d5,-6670(a0)
	move.w	d5,-6440(a0)
	move.w	d5,-6210(a0)
	move.w	d5,-5980(a0)
	move.w	d5,-5750(a0)
	move.w	d5,-5520(a0)
	move.w	d5,-5290(a0)
	move.w	d5,-5060(a0)
	move.w	d5,-4830(a0)
	move.w	d5,-4600(a0)
	move.w	d5,-4370(a0)
	move.w	d5,-4140(a0)
	move.w	d5,-3910(a0)
	move.w	d5,-3680(a0)
	move.w	d5,-3450(a0)
	move.w	d5,-3220(a0)
	move.w	d5,-2990(a0)
	move.w	d5,-2760(a0)
	move.w	d5,-2530(a0)
	move.w	d5,-2300(a0)
	move.w	d5,-2070(a0)
	move.w	d5,-1840(a0)
	move.w	d5,-1610(a0)
	move.w	d5,-1380(a0)
	move.w	d5,-1150(a0)
	move.w	d5,-920(a0)
	move.w	d5,-690(a0)
	move.w	d5,-460(a0)
	move.w	d5,-230(a0)
l003c	move	usp,a0
	adda.w	#2,a0
l003d	equ	*-2
	moveq	#$10,d0
	sub.w	l003d(pc),d0
	move.w	d0,-14(a1)
	rts

l003e	dc.b	0,0,0,$e6,1,$cc,2,$b2
	dc.b	3,$98,4,'~',5,'d',6,'J'
	dc.b	7,'0',8,$16,8,$fc,9,$e2
	dc.b	$a,$c8,$b,$ae,$c,$94,$d,'z'
	dc.b	$e,'`',$f,'F',$10,',',$11,$12
	dc.b	$11,$f8,$12,$de,$13,$c4,$14,$aa
	dc.b	$15,$90,$16,'v',$17,'\',$18,'B'
	dc.b	$19,'(',$1a,$e,$1a,$f4,$1b,$da
	dcb.w	20
l003f	dcb.w	16
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe
	dc.b	$ff,$fe,$ff,$fe,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fc,$ff,$fc
	dc.b	$ff,$fc,$ff,$fc,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fa
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f8,$ff,$f8
	dc.b	$ff,$f8,$ff,$f8,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f6,$ff,$f6
	dc.b	$ff,$f6,$ff,$f6,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f4,$ff,$f4
	dc.b	$ff,$f4,$ff,$f4,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f2,$ff,$f2
	dc.b	$ff,$f2,$ff,$f2,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$f0,$ff,$f0,$ff,$f0,$ff,$f0
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ee,$ff,$ee
	dc.b	$ff,$ee,$ff,$ee,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ec,$ff,$ec,$ff,$ec,$ff,$ec
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$ea,$ff,$ea,$ff,$ea,$ff,$ea
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e8,$ff,$e8,$ff,$e8,$ff,$e8
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e6,$ff,$e6,$ff,$e6,$ff,$e6
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e4,$ff,$e4,$ff,$e4,$ff,$e4
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e2,$ff,$e2,$ff,$e2,$ff,$e2
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$e0,$ff,$e0,$ff,$e0,$ff,$e0
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$de,$ff,$de,$ff,$de,$ff,$de
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$dc,$ff,$dc
	dc.b	$ff,$dc,$ff,$dc,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$da,$ff,$da,$ff,$da,$ff,$da
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
	dc.b	$ff,$d8,$ff,$d8,$ff,$d8,$ff,$d8
l0040	addi.l	#$1a0,l004d
	subq.w	#1,l007b
	bpl.s	l0046
	moveq	#0,d0
l0041	equ	*-1
	beq.s	l0042
	move.w	#1,l007b
	sf	l0041
	move.l	#$49,d0
	bra.s	l0045
l0042	st	l0041
	move.w	#7,l007b
	lea	l0075,a0
l0043	equ	*-4
	moveq	#0,d0
	move.b	(a0)+,d0
	cmp.b	#$ff,d0
	bne.s	l0044
	lea	l0075,a0
	move.b	(a0)+,d0
l0044	move.l	a0,l0043
l0045	lsl.w	#3,d0
	subq.l	#1,d0
	move.l	#l0076,l0049
	add.l	d0,l0049
l0046	subq.w	#1,l007c
	bcc.s	l004c
	move.w	#0,d0
l0047	equ	*-2
	move.w	d0,l004a
	add.w	#$10,d0
	cmp.w	#$1a0,d0
	bne.s	l0048
	moveq	#0,d0
l0048	move.w	d0,l0047
	move.w	#$f,l007c
	lea	l007d,a1
	move.l	a1,l004d
	lea	l0076,a0
l0049	equ	*-4
	movea.l	a1,a2
	lea	0(a1,d0.w),a1
	adda.w	#0,a2
l004a	equ	*-2
	move.b	(a0)+,d0
	moveq	#7,d2
l004b	move.w	6240(a2),d1
	add.b	d0,d0
	addx.w	d1,d1
	move.w	d1,(a1)+
	addq.w	#2,a2
	dbf	d2,l004b
	bra.s	l004f
l004c	movea.l	l0049(pc),a0
	lea	l007a,a1
l004d	equ	*-4
	adda.w	l0047(pc),a1
	move.b	(a0)+,d0
	move.w	#7,d2
l004e	move.w	-416(a1),d1
	add.b	d0,d0
	addx.w	d1,d1
	move.w	d1,(a1)+
	dbf	d2,l004e
l004f	move.l	a0,l0049
	lea	l0050(pc),a2
	move.w	l0047(pc),d0
	lsr.w	#3,d0
	lea	2(a2,d0.w),a2
	move.l	a2,l0030
	rts

l0050	dc.b	0,0,0,$10,0,' ',0,'0'
	dc.b	0,'@',0,'P',0,'`',0,'p'
	dc.b	0,$80,0,$90,0,$a0,0,$b0
	dc.b	0,$c0,0,$d0,0,$e0,0,$f0
	dc.b	1,0,1,$10,1,' ',1,'0'
	dc.b	1,'@',1,'P',1,'`',1,'p'
	dc.b	1,$80,1,$90,0,0,0,$10
	dc.b	0,' ',0,'0',0,'@',0,'P'
	dc.b	0,'`',0,'p',0,$80,0,$90
	dc.b	0,$a0,0,$b0,0,$c0,0,$d0
	dc.b	0,$e0,0,$f0,1,0,1,$10
	dc.b	1,' ',1,'0',1,'@',1,'P'
	dc.b	1,'`',1,'p',1,$80,1,$90
	dc.b	0,0
l0051	clr.b	$fffffa1b.w
	move.l	#l0053,$120.w
	move.b	#$21,$fffffa21.w
	move.b	#8,$fffffa1b.w
	rte

l0052	move.l	#l0051,$70.w
	rte

l0053	move	#$2700,sr
	movem.l	a0-a4/d0,-(a7)
	movea.l	l0067(pc),a4
	clr.b	$fffffa1b.w
	move.l	#l005a,$120.w
	move.b	#$e,$fffffa21.w
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	lea	$ffff8209.w,a0
l0054	move.b	(a0),d0
	cmp.b	(a0),d0
	bne.s	l0054
	move.b	(a0),d0
l0055	cmp.b	(a0),d0
	beq.s	l0055
	move.b	(a0),d0
	neg.w	d0
	lsl.w	d0,d0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lea	0.l,a0
l0056	equ	*-4
	movea.l	a0,a1
	lea	-460(a0),a0
	lea	230(a1),a1
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	(a0),(a1)
	lea	-460(a0),a0
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	230(a1),a1
	move.l	476(a0),-214(a1)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	492(a0),-198(a1)
	move.l	508(a0),-182(a1)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	move.l	524(a0),-166(a1)
	move.l	540(a0),-150(a1)
	move.l	556(a0),-134(a1)
	move.l	572(a0),-118(a1)
	move.l	588(a0),-102(a1)
	move.l	604(a0),-86(a1)
	move.l	620(a0),-70(a1)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	lea	0.l,a0
l0057	equ	*-4
	lea	l007d,a1
l0058	equ	*-4
	movea.l	a1,a3
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	lea	l0050,a2
l0059	equ	*-4
	nop
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	a1,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.l	a1,l005e
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.b	#8,$fffffa1b.w
	move.l	a2,l005f
	movem.l	(a7)+,a0-a4/d0
	rte

l005a	move	#$2700,sr
	movem.l	a0-a4/d0,-(a7)
	movea.l	l0067(pc),a4
	clr.b	$fffffa1b.w
	move.l	#l0062,$120.w
	move.b	#$47,$fffffa21.w
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	l0060(pc),d0
	move.w	d0,$ffff8242.w
	move.w	d0,$ffff8250.w
	st	l0082
	move.l	#$60006,d0
	move.l	d0,$ffff8248.w
	move.l	d0,$ffff824c.w
	lea	$ffff8209.w,a0
l005b	move.b	(a0),d0
	cmp.b	(a0),d0
	bne.s	l005b
	move.b	(a0),d0
l005c	cmp.b	(a0),d0
	beq.s	l005c
	move.b	(a0),d0
	neg.w	d0
	lsl.w	d0,d0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lea	l0061(pc),a1
	lea	0.l,a0
l005d	equ	*-4
	move.l	#l007d,d0
l005e	equ	*-4
	lea	l0050,a2
l005f	equ	*-4
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	addq.w	#8,a0
	movea.l	d0,a3
	adda.w	(a2)+,a3
	move.w	(a3)+,(a0)
	move.w	(a3)+,230(a0)
	move.w	(a3)+,460(a0)
	move.w	(a3)+,690(a0)
	move.w	(a3)+,920(a0)
	move.w	(a3)+,1150(a0)
	move.w	(a3)+,1380(a0)
	move.w	(a3)+,1610(a0)
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.w	(a1),$ffff8242.w
	move.w	(a1)+,$ffff8250.w
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.w	120(a1),$ffff8240.w
	nop
	nop
	nop
	nop
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	move.b	#8,$fffffa1b.w
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	(a7)+,a0-a4/d0
	rte

	dc.b	7,'w',6,'v',5,'u',4,'t'
	dc.b	3,'s'
l0060	dc.b	2,'r'
l0061	dc.b	1,'q',0,'p',0,'q',0,'r'
	dc.b	0,'s',0,'t',0,'u',0,'v'
	dc.b	0,'w',0,'g',0,'W',0,'G'
	dc.b	0,'7',0,$27,0,$17,0,7
	dc.b	1,7,2,7,3,7,4,7
	dc.b	5,7,6,7,7,7,7,6
	dc.b	7,5,7,4,7,3,7,2
	dc.b	7,1,7,0,7,$10,7,' '
	dc.b	7,'0',7,'@',7,'P',7,'`'
	dc.b	7,'p',6,'p',5,'p',4,'p'
	dc.b	3,'p',2,'p',1,'p',0,'p'
	dc.b	1,'q',2,'r',3,'s',4,'t'
	dc.b	5,'u',6,'v',7,'w',6,'f'
	dc.b	5,'U',4,'D',3,'3',2,'"'
	dc.b	1,$11,0,0,$ff,$ff,0,0
	dcb.w	65
l0062	dc.b	'H',$e7,$f8,$88,'(z',6,$c2
	dc.b	'B8',$fa,$1b,' <',0,6
	dc.b	0,6,'!',$c0,$82,'@!',$c0
	dc.b	$82,'D0<'
l0063	dc.b	0,0
	addq.w	#2,d0
	and.w	#$e,d0
	move.w	d0,l0063
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.b	$ffff8209.w,d1
	neg.w	d1
	lsl.w	d1,d1
	lea	l0077,a0
	lea	0(a0,d0.w),a0
	movem.l	(a0),d1-d4
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	move.b	#2,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	movem.l	d1-d3,$ffff8250.w
	move.b	#2,$ffff8260.w
	move.b	#0,$ffff8260.w
	move.l	d4,$ffff825c.w
	movem.l	(a0),d1-d4
	lea	32(a0),a0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#0,$ffff820a.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#1,$ffff8260.w
	move.b	#0,$ffff8260.w
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b	#2,$ffff820a.w
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	movem.l	(a7)+,a4/a0/d0-d4
	rte

	data
l0064	dc.b	'`',0,0,'4`',0,1,$f4
l0065	dc.b	'`',0,1,$f8
l0066	dc.b	'`',0,7,$aa
l0067	dc.b	0,0,$17,'~'
l0068	dc.b	0,0,$17,'n'
l0069	dcb.w	2
l006a	dcb.w	2
l006b	dcb.w	2
l006c	dcb.w	2
l006d	dcb.w	2
l006e	dc.b	0,0
l006f	dc.b	0,0,6,'f',0,0,$17,'~'
	dc.b	'H',$e7,$ff,$fe,'G',$fa,$ff,$c4
	dc.b	'*k',0,$1c,',k',0,' '
	dc.b	'(k',0,$18,'<',$1d,'~',$1e
	dc.b	'0,',0,4,'J@g>'
	dc.b	'D@a',0,1,'j(Ž'
	dc.b	'Jl',0,6,'g 0<'
	dc.b	1,$8f,'2,',0,6,'4',1
	dc.b	'A',$f6,$10,0,'"H<',$d9
	dc.b	'TBf',4,'"H4',1
	dc.b	'Q',$c8,$ff,$f4,'`',$10,'0<'
	dc.b	1,$8f,$12,'&',$e1,'I',$12,$1e
	dc.b	'<',$c1,'Q',$c8,$ff,$fc,'I',$ec
	dc.b	0,$a,'Q',$cf,$ff,$b4,' z'
	dc.b	$ff,$86,'0<',1,$f8,'"<'
	dc.b	$10,0,$10,0,' ',$c1,'Q',$c8
	dc.b	$ff,$fc,'Jk',0,',g>'
	dc.b	'Bx',$89,0,'1',$fc,0,2
	dc.b	$89,' 7|',6,$b8,0,$e
	dc.b	'7|',1,'N',5,$94,'7|'
	dc.b	1,'>',5,$ba,'7|',1,'n'
	dc.b	5,$e0,'7|',1,'^',6,6
	dc.b	'7|Ns',$17,'n',$27,'|'
	dc.b	0,0,'0',$d4,1,'(',$27,'|'
	dc.b	0,0,3,$f2,2,'  ',$b
	dc.b	$d1,$ab,0,$10,$d1,$ab,0,$14
	dc.b	$d1,$ab,0,'2',$d1,$ab,0,'.'
	dc.b	'Jk',0,',g',$16,'A',$fa
	dc.b	'6p0<',$1f,$ff,'2',$10
	dc.b	$e8,'I',$92,'|',0,'@0',$c1
	dc.b	'Q',$c8,$ff,$f4,'0<',2,$fb
	dc.b	'"<',0,0,$1e,'xA',$fa
	dc.b	$a,'P$',$10,'v',0,'HB'
	dc.b	'6',2,$86,$c1,'HC4',3
	dc.b	'HBHC',$84,$c1,'0',$c2
	dc.b	'0',$c3,'Q',$c8,$ff,$e6,$27,'|'
	dc.b	'`',0,0,'^',0,$f4,'A',$fa
	dc.b	4,$d8,'p',3,'r',0,'C',$fa
	dc.b	9,$96,' ',$c9,'0',$c1,'0',$c1
	dc.b	'0',$c1,' ',$c1,'Q',$c8,$ff,$f4
	dc.b	'A',$fa,4,$f6,'p',3,'r',0
	dc.b	'C',$fa,9,'| ',$c9,'0',$c1
	dc.b	'0',$c1,'0',$c1,'0',$c1,' ',$c1
	dc.b	'0',$c1,'0',$c1,'0',$c1,'0',$c1
	dc.b	'Q',$c8,$ff,$ea,$17,'|',0,6
	dc.b	2,$91,'7|',3,$f0,2,$9c
	dc.b	'"k',0,$18,'7i',1,'6'
	dc.b	2,$b8,'7i',1,'8',2,$b2
	dc.b	'E',$e9,1,':',$27,'J',2,$c0
	dc.b	'E',$e9,1,$ba,$27,'J',2,$ce
	dc.b	'L',$df,$7f,$ff,'NuA',$fa
	dc.b	0,'$',$e2,'HS@r',0
	dc.b	$12,$1d,'4',1,$e8,'A',$c4,'|'
	dc.b	0,$f,$dc,'0',$10,0,$1c,$c6
	dc.b	$dc,'0 ',0,$1c,$c6,'Q',$c8
	dc.b	$ff,$e6,'Nu',0,1,2,4
	dc.b	8,$10,' @',$80,$c0,$e0,$f0
	dc.b	$f8,$fc,$fe,$ff,'H',$e7,$ff,$fe
	dc.b	'`',0,$ff,'TH',$e7,$fe,$f8
	dc.b	'I',$fa,$fd,$f8,'A',$fa,$fe,$18
	dc.b	' (',0,4,' ',$98,'!',0
	dc.b	'Jl',0,',g4"',0
	dc.b	$d2,$bc,0,0,2,'z',$11,$c0
	dc.b	$89,7,$e0,$88,$11,$c0,$89,5
	dc.b	$e0,$88,$11,$c0,$89,3,'Bx'
	dc.b	$89,0,'1',$fc,0,1,$89,0
	dc.b	$11,$c1,$89,$13,$e0,$89,$11,$c1
	dc.b	$89,$11,$e0,$89,$11,$c1,$89,9
	dc.b	'`',2,',@p',1,'S@'
	dc.b	'o6',$19,'@',2,'SA',$fa
	dc.b	3,$d0,'C',$fa,4,4,'a',0
	dc.b	1,$a2,'A',$fa,3,$d2,'C',$fa
	dc.b	4,$10,'a',0,1,$96,'A',$fa
	dc.b	3,$d4,'C',$fa,4,$1c,'a',0
	dc.b	1,$8a,'A',$fa,3,$d6,'C',$fa
	dc.b	4,'(a',0,1,'~`~'
	dc.b	$19,'|',0,0,2,'SJ,'
	dc.b	6,',f',$e,'0<',0,0
	dc.b	$d0,'|',0,$10,$b0,'|',4,0
	dc.b	'f0B,',6,',p',$ff
	dc.b	'R',$80,$b0,'|',0,0,'f',4
	dc.b	'0<',0,0,$19,'@',2,$ad
	dc.b	'A',$f9,0,0,0,0,$10,'0'
	dc.b	0,0,'H@',$ec,$88,$d0,$bc
	dcb.w	2
	dc.b	')@',2,$de,'p',0,'9@'
	dc.b	2,$9c,$d0,$bc,0,0,0,0
	dc.b	'&@A',$fa,3,'dC',$fa
	dc.b	3,$ac,'a(A',$fa,3,'>'
	dc.b	'C',$fa,3,'ra',$1e,'A',$fa
	dc.b	3,'^C',$fa,3,$b0,'a',$14
	dc.b	'A',$fa,3,'8C',$fa,3,'v'
	dc.b	'a',$a,'a',0,2,$84,'L',$df
	dc.b	$1f,$7f,'Nu#[',0,$c
	dc.b	'p',0,$10,')',0,$d,'g',$1c
	dc.b	$d0,'@$z',$fc,$f2,'E',$f2
	dc.b	0,$f6,'"',$da,'"',$da,'0',$12
	dc.b	'2',$80,$c0,'|>',0,'Q',$89
	dc.b	'3@',0,$16,'p',0,$10,')'
	dc.b	0,$c,'g$E',$fa,7,$ae
	dc.b	$c,')',0,6,0,$e,'g',0
	dc.b	0,'Ž02',0,$fe,'3@'
	dc.b	0,$a,' ',$d9,' ',$d9,'0',$91
	dc.b	'Q',$88,'Q',$89,'P',$e9,0,$15
	dc.b	'p',0,$10,')',0,$e,'0;'
	dc.b	0,6,'N',$fb,0,2,0,' '
	dc.b	0,' ',0,' ',0,' ',0,' '
	dc.b	0,' ',0,' ',0,' ',0,' '
	dc.b	0,' ',0,' ',0,'0',0,'<'
	dc.b	0,'T',0,' ',0,'Z0)'
	dc.b	0,$a,'E',$fa,8,8,'!r'
	dc.b	0,0,0,$a,'Nu',$19,'i'
	dc.b	0,$f,2,$ad,'F,',6,','
	dc.b	'`',$e4,1,9,0,$f,'B',0
	dc.b	'3@',0,8,'1@',0,8
	dc.b	$c0,'|>',0,'3@',0,$16
	dc.b	'`',$cc,'F,',6,',`',$c6
	dc.b	$10,')',0,$f,$19,'@',2,'S'
	dc.b	$19,'@',2,$91,'`',$b8,'02'
	dc.b	0,$fe,'3@',0,$10,'r',0
	dc.b	$12,')',0,$f,$b0,'i',0,$a
	dc.b	'g',$c,'n',2,'DA3A'
	dc.b	0,$12,'`',0,$ff,'lBi'
	dc.b	0,$12,'`',0,$ff,'dp',0
	dc.b	$10,')',0,$e,'0;',0,6
	dc.b	'N',$fb,0,2,0,' ',0,$90
	dc.b	0,$a8,0,$c6,1,2,$ff,$82
	dc.b	$ff,$82,$ff,$82,$ff,$82,$ff,$82
	dc.b	1,'P',$ff,$82,$ff,$82,$ff,$82
	dc.b	$ff,$82,$ff,$82,'J)',0,$f
	dc.b	'g',0,$ff,'\p',0,$10,':'
	dc.b	$fe,'O',$90,':',$fe,$d,$d0,'@'
	dc.b	'0;',0,4,'N',$fb,0,2
	dc.b	0,$1e,0,'(',$ff,'F',0,$1e
	dc.b	0,'(',$ff,'F',0,$1e,0,'('
	dc.b	$ff,'F',0,$1e,0,'(',$ff,'F'
	dc.b	0,$1e,0,'(',$ff,'Fp',0
	dc.b	$10,')',0,$f,$e8,8,'`',$a
	dc.b	'p',0,$10,')',0,$f,$c0,'|'
	dc.b	0,$f,$d0,'@2)',0,$a
	dc.b	'E',$fa,6,$b2,'t#',$b2,'b'
	dc.b	'_',$ca,$ff,$fc,'02',0,0
	dc.b	'E',$fa,7,$a,'!r',0,0
	dc.b	0,$a,'Nup',0,$10,')'
	dc.b	0,$f,'2)',0,$a,$92,'@'
	dc.b	'l',2,'r',0,'3A',0,$a
	dc.b	'`',0,$fe,$dc,'p',0,$10,')'
	dc.b	0,$f,'2)',0,$a,$d2,'@'
	dc.b	$b2,'|',$b,$9c,'o',4,'2<'
	dc.b	$b,$9c,'3A',0,$a,'`',0
	dc.b	$fe,$be,'0)',0,$12,'g',0
	dc.b	$fe,$b6,'m',$12,$d0,'i',0,$a
	dc.b	$b0,'i',0,$10,'n',$1a,'3@'
	dc.b	0,$a,'`',0,$fe,$a2,$d0,'i'
	dc.b	0,$a,$b0,'i',0,$10,'m',8
	dc.b	'3@',0,$a,'`',0,$fe,$90
	dc.b	'3i',0,$10,0,$a,'Bi'
	dc.b	0,$12,'`',0,$fe,$82,'E',$fa
	dc.b	6,'D',$10,')',0,$14,$e4,'H'
	dc.b	$c0,'|',0,$1f,'r',0,$12,'2'
	dc.b	0,0,$10,')',0,$f,$c0,'|'
	dc.b	0,$f,$c2,$c0,$e8,'I',$c2,'|'
	dc.b	$ff,$fc,'0)',0,$a,'J)'
	dc.b	0,$14,'k',4,$d0,'A`',2
	dc.b	$90,'AE',$fa,6,'X!r'
	dc.b	0,0,0,$a,$12,')',0,$f
	dc.b	$e4,'I',$c2,'|',0,'<',$d3,')'
	dc.b	0,$14,'Nu',$10,')',0,$f
	dc.b	'H',$80,$d0,'i',0,8,$c,'@'
	dc.b	0,'@l',0,$fe,'"J@'
	dc.b	'k',0,$fe,$1c,'3@',0,8
	dc.b	'1@',0,8,$c0,'|>',0
	dc.b	'3@',0,$16,'`',0,$fe,8
	dc.b	'A',$fa,2,'@0',$bc,'Nq'
	dc.b	'C',$fa,0,$92,'0)',0,4
	dc.b	'k',$14,'2)',0,6,'k',6
	dc.b	'0',$bc,'t',0,'`',8,$d0,'A'
	dc.b	'j',$fc,'3@',0,4,'A',$fa
	dc.b	2,'00',$bc,'NqC',$fa
	dc.b	0,'z0)',0,4,'k',$14
	dc.b	'2)',0,6,'k',6,'0',$bc
	dc.b	'z',0,'`',8,$d0,'Aj',$fc
	dc.b	'3@',0,4,'A',$fa,2,$f0
	dc.b	'0',$bc,'NqC',$fa,0,'b'
	dc.b	'0)',0,4,'k',$14,'2)'
	dc.b	0,6,'k',6,'0',$bc,'t',0
	dc.b	'`',8,$d0,'Aj',$fc,'3@'
	dc.b	0,4,'A',$fa,2,$e0,'0',$bc
	dc.b	'NqC',$fa,0,'J0)'
	dc.b	0,4,'k',$14,'2)',0,6
	dc.b	'k',6,'0',$bc,'z',0,'`',8
	dc.b	$d0,'Aj',$fc,'3@',0,4
	dc.b	'Nu',0,0,0,0,0,0
	dcb.w	74
	dc.b	'H',$e7,$fe,$f8,'&z',$f9,'\'
	dc.b	'I',$fa,$ff,'^ Tp',0
	dc.b	'0,',0,4,'2,',0,8
	dc.b	'$,',0,$a,'t',0,'I',$fa
	dc.b	$ff,'V"Tv',0,'6,'
	dc.b	0,4,'8,',0,8,'*,'
	dc.b	0,$a,'z',0,'E',$fa,'0',$82
	dc.b	'<<',1,$f4,'HF',$12,'0'
	dc.b	0,0,'<2',$10,0,$18,'1'
	dc.b	'0',0,$dc,'r@',0,'6',$c6
	dc.b	'BF',$d0,$82,$d1,'F',$d6,$85
	dc.b	$d7,'FHFQ',$ce,$ff,$de
	dc.b	'I',$fa,$ff,6,'9@',0,4
	dc.b	'I',$ec,0,$e,'9C',0,4
	dc.b	'&z',$f8,$f0,'I',$fa,$ff,$e
	dc.b	' Tp',0,'0,',0,4
	dc.b	'2,',0,8,'$,',0,$a
	dc.b	't',0,'I',$fa,$ff,6,'"T'
	dc.b	'v',0,'6,',0,4,'8,'
	dc.b	0,8,'*,',0,$a,'z',0
	dc.b	'E',$fa,'0',$16,'<<',1,$f4
	dc.b	'HF',$12,'0',0,0,'<2'
	dc.b	$10,0,$18,'10',0,$dc,'r'
	dc.b	'@',0,$16,$c6,'RKBF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	'HFQ',$ce,$ff,$dc,'I',$fa
	dc.b	$fe,$b4,'9@',0,4,'I',$ec
	dc.b	0,$e,'9C',0,4,'0+'
	dc.b	$ff,$fe,'6',$c0,'6',$c0,'6',$c0
	dc.b	'6',$c0,'6',$c0,'L',$df,$1f,$7f
	dc.b	'NuH',$e7,$fe,$f8,'&z'
	dc.b	$f8,'jI',$fa,$fe,'l T'
	dc.b	'p',0,'0,',0,4,'2,'
	dc.b	0,8,'$,',0,$a,'t',0
	dc.b	'I',$fa,$fe,'d"Tv',0
	dc.b	'6,',0,4,'8,',0,8
	dc.b	'*,',0,$a,'z',0,'E',$fa
	dc.b	'/',$90,'I',$fa,$f,$8c,'>',$1e
	dc.b	'*',$b4,'p',4,'.4p',0
	dc.b	$f,$cd,0,0,'|MHF'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	'6',$c6,'BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,'6',$c6,'BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	'6',$c6,'BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,'6',$c6,'BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	'>',$1e,'*',$b4,'p',4,'.4'
	dc.b	'p',0,$f,$cd,0,0,'Nq'
	dc.b	'HFQ',$ce,$ff,'z',$12,'0'
	dc.b	0,0,'<2',$10,0,$18,'1'
	dc.b	'0',0,$dc,'r@',0,'6',$c6
	dc.b	'BF',$d0,$82,$d1,'F',$d6,$85
	dc.b	$d7,'FI',$fa,$fd,$84,'9@'
	dc.b	0,4,'I',$ec,0,$e,'9C'
	dc.b	0,4,'&z',$f7,'nI',$fa
	dc.b	$fd,$8c,' Tp',0,'0,'
	dc.b	0,4,'2,',0,8,'$,'
	dc.b	0,$a,'t',0,'I',$fa,$fd,$84
	dc.b	'"Tv',0,'6,',0,4
	dc.b	'8,',0,8,'*,',0,$a
	dc.b	'z',0,'E',$fa,'.”I',$fa
	dc.b	$e,$90,'NqNqNq'
	dc.b	'NqNqNqNq'
	dc.b	'NqNqNqNq'
	dc.b	'NqNqNqNq'
	dc.b	'NqNqNqNq'
	dc.b	'NqNqNqNq'
	dc.b	'>',$1e,'*',$b4,'p',4,'.4'
	dc.b	'p',0,$f,$cd,0,0,'<<'
	dc.b	0,$19,'HF',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,$dd,'[BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	$dd,'[BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,$dd,'[BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	$dd,'[BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F>',$1e,'*',$b4
	dc.b	'p',4,'.4p',0,$f,$cd
	dc.b	0,0,'Nq',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,$dd,'[BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	$dd,'[BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F',$12,'0',0,0
	dc.b	'<2',$10,0,$18,'10',0
	dc.b	$dc,'r@',0,$dd,'[BF'
	dc.b	$d0,$82,$d1,'F',$d6,$85,$d7,'F'
	dc.b	$12,'0',0,0,'<2',$10,0
	dc.b	$18,'10',0,$dc,'r@',0
	dc.b	$dd,'[BF',$d0,$82,$d1,'F'
	dc.b	$d6,$85,$d7,'F>',$1e,'*',$b4
	dc.b	'p',4,'.4p',0,$f,$cd
	dc.b	0,0,$12,'0',0,0,'<2'
	dc.b	$10,0,$18,'10',0,$dc,'r'
	dc.b	'@',0,$dd,'[BF',$d0,$82
	dc.b	$d1,'F',$d6,$85,$d7,'F',$12,'0'
	dc.b	0,0,'<2',$10,0,$18,'1'
	dc.b	'0',0,$dc,'r@',0,$dd,'['
	dc.b	'BF',$d0,$82,$d1,'F',$d6,$85
	dc.b	$d7,'F',$12,'0',0,0,'<2'
	dc.b	$10,0,$18,'10',0,$dc,'r'
	dc.b	'@',0,$dd,'[BF',$d0,$82
	dc.b	$d1,'F',$d6,$85,$d7,'F',$12,'0'
	dc.b	0,0,'<2',$10,0,$18,'1'
	dc.b	'0',0,$dc,'r@',0,$dd,'['
	dc.b	'BF',$d0,$82,$d1,'F',$d6,$85
	dc.b	$d7,'F>',$1e,'*',$b4,'p',4
	dc.b	'.4p',0,$f,$cd,0,0
	dc.b	'HFQ',$ce,$fe,'~',$12,'0'
	dc.b	0,0,'<2',$10,0,$18,'1'
	dc.b	'0',0,$dc,'r@',0,$dd,'['
	dc.b	'BF',$d0,$82,$d1,'F',$d6,$85
	dc.b	$d7,'FI',$fa,$fb,'x9@'
	dc.b	0,4,'I',$ec,0,$e,'9C'
	dc.b	0,4,'0+',$ff,$fe,'6',$c0
	dc.b	'6',$c0,'6',$c0,'6',$c0,'6',$c0
	dc.b	'L',$df,$1f,$7f,'Nu',$80,$80
	dc.b	$b,$9c,$a,$dc,$a,'$',9,'|'
	dc.b	8,$d4,8,'<',7,$ac,7,'$'
	dc.b	6,$a4,6,',',5,$bc,5,'P'
	dc.b	4,$ec,4,$8c,4,'0',3,$dc
	dc.b	3,$88,3,'<',2,$f4,2,$b0
	dc.b	2,'p',2,'4',1,$fc,1,$c4
	dc.b	1,$94,1,'d',1,'4',1,$c
	dc.b	0,$e4,0,$bc,0,$98,0,'x'
	dc.b	0,'X',0,'8',0,$1c,0,0
	dcb.w	16
	dc.b	0,$18,'1Jax',$8d,$a1
	dc.b	$b4,$c5,$d4,$e0,$eb,$f4,$fa,$fd
	dc.b	$ff,$fd,$fa,$f4,$eb,$e0,$d4,$c5
	dc.b	$b4,$a1,$8d,'xaJ1',$18
	dc.b	'C',$e0,'pnC9[',$a8
	dc.b	'B',$95,'ušA',$f4,$a7,'5'
	dc.b	'AV',$da,'H@',$bb,$f9,'r'
	dc.b	'@#',$f0,$1c,'?',$8e,$aa,'p'
	dc.b	'>',$fc,$15,'L>l',$1e,'@'
	dc.b	'=',$de,$b3,$81,'=S',$c3,$e5
	dc.b	'<',$cb,'>',$da,'<E',$14,'a'
	dc.b	';',$c1,'5',7,';?',$91,$de
	dc.b	':',$c0,$1c,'y:B',$c6,$e7
	dc.b	'9',$c7,$83,$ac,'9NE',$bd
	dc.b	'8',$d7,0,'}8a',$a7,$b6
	dc.b	'7',$ee,'/',$96,'7|',$8c,$ab
	dc.b	'7',$c,$b3,$e0,'6',$9e,'šx'
	dc.b	'626',$c,'5',$c7,'|',$86
	dc.b	'5^d',$1f,'4',$f6,$e3,']'
	dc.b	'4',$90,$f1,$e,'4,„E'
	dc.b	'3',$c9,$94,'[3h',$18,$ea
	dc.b	'3',8,9,$c8,'2',$a9,'_',$b
	dc.b	'2L',$11,2,'1',$f0,$18,'3'
	dc.b	'1',$95,'m]1<',9,'p'
	dc.b	'0',$e3,$e5,$91,'0',$8c,$fb,$15
	dc.b	'07C/',$e2,$b8,$85
	dc.b	'/',$8f,'T',0,'/=',$f,$f9
	dc.b	'.',$eb,$e6,$a2,'.',$9b,$d2,'R'
	dc.b	'.L',$cd,$89,'-',$fe,$d2,$ec
	dc.b	'-',$b1,$dd,'A-e',$e7,'t'
	dc.b	'-',$1a,$ec,$91,',',$d0,$e7,$c5
	dc.b	',',$87,$d4,'[,?',$ad,$bf
	dc.b	'+',$f8,'oy+',$b2,$15,'-'
	dc.b	'+l',$9a,$9c,'+',$27,$fb,$a1
	dc.b	'*',$e4,'42*',$a1,'@^'
	dc.b	'*_',$1c,'K*',$1d,$c4,'8'
	dc.b	')',$dd,'4{)',$9d,'i',$80
	dc.b	')^_',$c9,') ',$13,$ee
	dc.b	'(',$e2,$82,$99,'(',$a5,$a8,$89
	dc.b	'(i',$82,$91,'(.',$d,$96
	dc.b	$27,$f3,'F',$8f,$27,$b9,'*',$86
	dc.b	$27,$7f,$b6,$94,$27,'F',$e7,$e3
	dc.b	$27,$e,$bb,$b0,'&',$d7,'/D'
	dc.b	'&',$a0,'?',$fa,'&i',$eb,';'
	dc.b	'&4.~%',$ff,7,'H'
	dc.b	'%',$ca,'s.%',$96,'o',$ce
	dc.b	'%b',$fa,$d8,'%0',$12,5
	dc.b	'$',$fd,$b3,$1c,'$',$cb,$db,$f0
	dc.b	'$',$9a,$8a,'^$i',$bc,'P'
	dc.b	'$9o',$bb,'$',9,$a2,$9e
	dc.b	'#',$da,'S',4,'#',$ab,$7f,0
	dc.b	'#}$',$b1,'#OB>'
	dc.b	'#!',$d5,$d9,'"',$f4,$dd,$bd
	dc.b	'"',$c8,'X."',$9c,'Cw'
	dc.b	'"p',$9d,$ee,'"Ee',$f1
	dc.b	'"',$1a,$99,$e4,'!',$f0,'87'
	dc.b	'!',$c6,'?]!',$9c,$ad,$d4
	dc.b	'!s',$82,' !J',$ba,$cd
	dc.b	'!"Vm ',$fa,'Sš'
	dc.b	' ',$d2,$b0,$f5,' ',$ab,'m$'
	dc.b	' ',$84,$86,$d4,' ]',$fc,$b9
	dc.b	' 7',$cd,$8c,' ',$11,$f8,$e
	dc.b	$1f,$ec,'{',3,$1f,$c7,'U8'
	dc.b	$1f,$a2,$85,'|',$1f,'~',$a,$a6
	dc.b	$1f,'Y',$e3,$92,$1f,'6',$f,' '
	dc.b	$1f,$12,$8c,'7',$1e,$ef,'Y',$c0
	dc.b	$1e,$cc,'v',$ae,$1e,$a9,$e1,$f2
	dc.b	$1e,$87,$9a,$88,$1e,'e',$9f,'m'
	dc.b	$1e,'C',$ef,$a3,$1e,'"',$8a,'0'
	dc.b	$1e,1,'n!',$1d,$e0,$9a,$83
	dc.b	$1d,$c0,$e,'k',$1d,$9f,$c8,$ef
	dc.b	$1d,$7f,$c9,'*',$1d,'`',$e,'<'
	dc.b	$1d,'@',$97,'H',$1d,'!cs'
	dc.b	$1d,2,'q',$e8,$1c,$e3,$c1,$d6
	dc.b	$1c,$c5,'Rk',$1c,$a7,'"',$de
	dc.b	$1c,$89,'2f',$1c,'k',$80,'>'
	dc.b	$1c,'N',$b,$a5,$1c,'0',$d3,$db
	dc.b	$1c,$13,$d8,'%',$1b,$f7,$17,$cb
	dc.b	$1b,$da,$92,$16,$1b,$be,'FU'
	dc.b	$1b,$a2,'3',$d7,$1b,$86,'Y',$f0
	dc.b	$1b,'j',$b7,$f4,$1b,'OM<'
	dc.b	$1b,'4',$19,'#',$1b,$19,$1b,6
	dc.b	$1a,$fe,'RE',$1a,$e3,$be,'C'
	dc.b	$1a,$c9,'^d',$1a,$af,'2',$f
	dc.b	$1a,$95,'8',$af,$1a,'{q',$ae
	dc.b	$1a,'a',$dc,'{',$1a,'Hx',$87
	dc.b	$1a,'/EB',$1a,$16,'B"'
	dc.b	$19,$fd,'n',$9e,$19,$e4,$ca,'-'
	dc.b	$19,$cc,'TK',$19,$b4,$c,'u'
	dc.b	$19,$9b,$f2,$27,$19,$84,4,$e4
	dc.b	$19,'lD-',$19,'T',$af,$85
	dc.b	$19,'=Ft',$19,'&',8,$81
	dc.b	$19,$e,$f5,'4',$18,$f8,$c,$19
	dc.b	$18,$e1,'L',$bd,$18,$ca,$b6,$ae
	dc.b	$18,$b4,'I|',$18,$9e,4,$b8
	dc.b	$18,$87,$e7,$f5,$18,'q',$f2,$c8
	dc.b	$18,'\$',$c8,$18,'F}',$8a
	dc.b	$18,'0',$fc,$aa,$18,$1b,$a1,$c0
	dc.b	$18,6,'li',$17,$f1,'\B'
	dc.b	$17,$dc,'p',$ea,$17,$c7,$aa,0
	dc.b	$17,$b3,7,'%',$17,$9e,$87,$fc
	dc.b	$17,$8a,',)',$17,'u',$f3,'Q'
	dc.b	$17,'a',$dd,$19,$17,'M',$e9,')'
	dc.b	$17,':',$17,')',$17,'&f',$c4
	dc.b	$17,$12,$d7,$a5,$16,$ff,'iv'
	dc.b	$16,$ec,$1b,$e5,$16,$d8,$ee,$a0
	dc.b	$16,$c5,$e1,'W',$16,$b2,$f3,$ba
	dc.b	$16,$a0,'%z',$16,$8d,'vH'
	dc.b	$16,'z',$e5,$da,$16,'hs',$e2
	dc.b	$16,'V ',$17,$16,'C',$ea,'-'
	dc.b	$16,'1',$d1,$de,$16,$1f,$d6,$df
	dc.b	$16,$d,$f8,$ec,$15,$fc,'7',$bc
	dc.b	$15,$ea,$93,$c,$15,$d9,$a,$96
	dc.b	$15,$c7,$9e,$18,$15,$b6,'MN'
	dc.b	$15,$a5,$17,$f6,$15,$93,$fd,$d0
	dc.b	$15,$82,$fe,$9c,$15,'r',$1a,$19
	dc.b	$15,'aP',9,$15,'P',$a0,'/'
	dc.b	$15,'@',$a,'L',$15,'/Ž%'
	dc.b	$15,$1f,'+~',$15,$e,$e2,$1c
	dc.b	$14,$fe,$b1,$c4,$14,$ee,'š='
	dc.b	$14,$de,$9b,'N',$14,$ce,$b4,$c0
	dc.b	$14,$be,$e6,'Y',$14,$af,'/',$e4
	dc.b	$14,$9f,$91,'+',$14,$90,9,$f7
	dc.b	$14,$80,$9a,$13,$14,'qAL'
	dc.b	$14,'a',$ff,'m',$14,'R',$d4,'D'
	dc.b	$14,'C',$bf,$9e,$14,'4',$c1,'H'
	dc.b	$14,'%',$d9,$12,$14,$17,6,$cb
	dc.b	$14,8,'JB',$13,$f9,$a3,'G'
	dc.b	$13,$eb,$11,$ad,$13,$dc,$95,'C'
	dc.b	$13,$ce,'-',$db,$13,$bf,$db,'J'
	dc.b	$13,$b1,$9d,'`',$13,$a3,'s',$f1
	dc.b	$13,$95,'^',$d3,$13,$87,']',$d8
	dc.b	$13,'yp',$d6,$13,'k',$97,$a2
	dc.b	$13,']',$d2,$12,$13,'P',$1f,$fd
	dc.b	$13,'B9',$13,'4',$f5,$9d
	dc.b	$13,$27,'}',2,$13,$1a,$17,'?'
	dc.b	$13,$c,$c4,',',$12,$ff,$83,$a4
	dc.b	$12,$f2,'U',$7f,$12,$e5,'9',$97
	dc.b	$12,$d8,'/',$c6,$12,$cb,'7',$e7
	dc.b	$12,$be,'Q',$d5,$12,$b1,'}l'
	dc.b	$12,$a4,$ba,$87,$12,$98,9,2
	dc.b	$12,$8b,'h',$bb,$12,'~',$d9,$8e
	dc.b	$12,'r[X',$12,'e',$ed,$f8
	dc.b	$12,'Y',$91,'J',$12,'ME/'
	dc.b	$12,'A',9,$83,$12,'4',$de,'('
	dc.b	$12,'(',$c2,$fb,$12,$1c,$b7,$dd
	dc.b	$12,$10,$bc,$ae,$12,4,$d1,'O'
	dc.b	$11,$f8,$f5,$a0,$11,$ed,')',$82
	dc.b	$11,$e1,'l',$d6,$11,$d5,$bf,$80
	dc.b	$11,$ca,'!_',$11,$be,$92,'X'
	dc.b	$11,$b3,$12,'L',$11,$a7,$a1,$1f
	dc.b	$11,$9c,'>',$b3,$11,$90,$ea,$ec
	dc.b	$11,$85,$a5,$af,$11,'zn',$de
	dc.b	$11,'oF_',$11,'d,',$17
	dc.b	$11,'Y',$1f,$e9,$11,'N!',$bb
	dc.b	$11,'C1s',$11,'8N',$f7
	dc.b	$11,'-z,',$11,'"',$b2,$f8
	dc.b	$11,$17,$f9,'C',$11,$d,'L',$f2
	dc.b	$11,2,$ad,$ed,$10,$f8,$1c,$1b
	dc.b	$10,$ed,$97,'d',$10,$e3,$1f,$ae
	dc.b	$10,$d8,$b4,$e3,$10,$ce,'V',$ea
	dc.b	$10,$c4,5,$ab,$10,$b9,$c1,$10
	dc.b	$10,$af,$89,0,$10,$a5,']f'
	dc.b	$10,$9b,'>*',$10,$91,'+6'
	dc.b	$10,$87,'$t',$10,'})',$cd
	dc.b	$10,'s;,',$10,'iXz'
	dc.b	$10,'_',$81,$a3,$10,'U',$b6,$92
	dc.b	$10,'K',$f7,'0',$10,'BCj'
	dc.b	$10,'8',$9b,'*',$10,'.',$fe,'\'
	dc.b	$10,'%l',$ec,$10,$1b,$e6,$c6
	dc.b	$10,$12,'k',$d5,$10,8,$fc,7
	dc.b	$f,$ff,$97,'G',$f,$f6,'=',$81
	dc.b	$f,$ec,$ee,$a4,$f,$e3,$aa,$9c
	dc.b	$f,$da,'qU',$f,$d1,'B',$be
	dc.b	$f,$c8,$1e,$c3,$f,$bf,5,'S'
	dc.b	$f,$b5,$f6,'[',$f,$ac,$f1,$c9
	dc.b	$f,$a3,$f7,$8b,$f,$9b,7,$90
	dc.b	$f,$92,'!',$c6,$f,$89,'F',$1b
	dc.b	$f,$80,'t',$7f,$f,'w',$ac,$e0
	dc.b	$f,'n',$ef,'-',$f,'f;W'
	dc.b	$f,']',$91,'K',$f,'T',$f0,$f9
	dc.b	$f,'LZQ',$f,'C',$cd,'D'
	dc.b	$f,';I',$c0,$f,'2',$cf,$b6
	dc.b	$f,'*_',$16,$f,'!',$f7,$d1
	dc.b	$f,$19,$99,$d7,$f,$11,'E',$18
	dc.b	$f,8,$f9,$85,$f,0,$b7,$10
	dc.b	$e,$f8,'}',$a9,$e,$f0,'MA'
	dc.b	$e,$e8,'%',$ca,$e,$e0,7,'5'
	dc.b	$e,$d7,$f1,'s',$e,$cf,$e4,'w'
	dc.b	$e,$c7,$e0,'1',$e,$bf,$e4,$95
	dc.b	$e,$b7,$f1,$93,$e,$b0,7,$1e
	dc.b	$e,$a8,'%(',$e,$a0,'K',$a4
	dc.b	$e,$98,'z',$83,$e,$90,$b1,$b9
	dc.b	$e,$88,$f1,'9',$e,$81,'8',$f4
	dc.b	$e,'y',$88,$de,$e,'q',$e0,$eb
	dc.b	$e,'jA',$c,$e,'b',$a9,'5'
	dc.b	$e,'[',$19,'[',$e,'S',$91,'o'
	dc.b	$e,'L',$11,'f',$e,'D™3'
	dc.b	$e,'=(',$ca,$e,'5',$c0,$1f
	dc.b	$e,'._&',$e,$27,5,$d2
	dc.b	$e,$1f,$b4,$19,$e,$18,'i',$ed
	dc.b	$e,$11,$27,'D',$e,9,$ec,$12
	dc.b	$e,2,$b8,'L',$d,$fb,$8b,$e5
	dc.b	$d,$f4,'f',$d3,$d,$ed,'I',$b
	dc.b	$d,$e6,'2',$81,$d,$df,'#*'
	dc.b	$d,$d8,$1a,$fc,$d,$d1,$19,$eb
	dc.b	$d,$ca,$1f,$ed,$d,$c3,',',$f8
	dc.b	$d,$bc,'@',$ff,$d,$b5,'[',$fa
	dc.b	$d,$ae,'}',$dd,$d,$a7,$a6,$9e
	dc.b	$d,$a0,$d6,'3',$d,$9a,$c,$91
	dc.b	$d,$93,'I',$af,$d,$8c,$8d,$83
	dc.b	$d,$85,$d8,2,$d,$7f,')"'
	dc.b	$d,'x',$80,$db,$d,'q',$df,'!'
	dc.b	$d,'kC',$ec,$d,'d',$af,'2'
	dc.b	$d,'^ ',$e9,$d,'W',$99,7
	dc.b	$d,'Q',$17,$85,$d,'J',$9c,'W'
	dc.b	$d,'D',$27,'v',$d,'=',$b8,$d7
	dc.b	$d,'7Pr',$d,'0',$ee,'='
	dc.b	$d,'*',$92,'1',$d,'$<C'
	dc.b	$d,$1d,$ec,'k',$d,$17,$a2,$a1
	dc.b	$d,$11,'^',$db,$d,$b,'!',$11
	dc.b	$d,4,$e9,':',$c,$fe,$b7,'O'
	dc.b	$c,$f8,$8b,'E',$c,$f2,'e',$16
	dc.b	$c,$ec,'D',$b9,$c,$e6,'*%'
	dc.b	$c,$e0,$15,'S',$c,$da,6,':'
	dc.b	$c,$d3,$fc,$d2,$c,$cd,$f9,$13
	dc.b	$c,$c7,$fa,$f6,$c,$c2,2,'r'
	dc.b	$c,$bc,$f,$7f,$c,$b6,'"',$16
	dc.b	$c,$b0,':/',$c,$aa,'W',$c2
	dc.b	$c,$a4,'z',$c9,$c,$9e,$a3,':'
	dc.b	$c,$98,$d1,$f,$c,$93,4,'@'
	dc.b	$c,$8d,'<',$c6,$c,$87,'z',$9a
	dc.b	$c,$81,$bd,$b4,$c,'|',6,$c
	dc.b	$c,'vS',$9d,$c,'p',$a6,'^'
	dc.b	$c,'j',$fe,'I',$c,'e[W'
	dc.b	$c,'_',$bd,$80,$c,'Z$',$be
	dc.b	$c,'T',$91,9,$c,'O',2,'\'
	dc.b	$c,'Ix',$ae,$c,'C',$f3,$fa
	dc.b	$c,'>t9',$c,'8',$f9,'d'
	dc.b	$c,'3',$83,'t',$c,'.',$12,'d'
	dc.b	$c,'(',$a6,'+',$c,'#>',$c5
	dc.b	$c,$1d,$dc,'*',$c,$18,'~U'
	dc.b	$c,$13,'%>',$c,$d,$d0,$e0
	dc.b	$c,8,$81,'4',$c,3,'64'
	dc.b	$b,$fd,$ef,$db,$b,$f8,$ae,'!'
	dc.b	$b,$f3,'q',1,$b,$ee,'8u'
	dc.b	$b,$e9,4,'v',$b,$e3,$d5,0
	dc.b	$b,$de,$aa,$b,$b,$d9,$83,$92
	dc.b	$b,$d4,'a',$90,$b,$cf,'C',$fe
	dc.b	$b,$ca,'*',$d7,$b,$c5,$16,$14
	dc.b	$b,$c0,5,$b1,$b,$ba,$f9,$a8
	dc.b	$b,$b5,$f1,$f3,$b,$b0,$ee,$8c
	dc.b	$b,$ab,$ef,'n',$b,$a6,$f4,$94
	dc.b	$b,$a1,$fd,$f8,$b,$9d,$b,$94
	dc.b	$b,$98,$1d,'d',$b,$93,'3b'
	dc.b	$b,'ŽM',$88,$b,$89,'k',$d2
	dc.b	$b,$84,'Ž:',$b,$7f,$b4,$bb
	dc.b	$b,'z',$df,'O',$b,'v',$d,$f2
	dc.b	$b,'q@',$9f,$b,'lwP'
	dc.b	$b,'g',$b2,0,$b,'b',$f0,$ab
	dc.b	$b,'^3L',$b,'Yy',$dd
	dc.b	$b,'T',$c4,'Y',$b,'P',$12,$bd
	dc.b	$b,'Ke',2,$b,'F',$bb,'$'
	dc.b	$b,'B',$15,$1f,$b,'=r',$ed
	dc.b	$b,'8',$d4,$8a,$b,'49',$f1
	dc.b	$b,'/',$a3,$1e,$b,'+',$10,$b
	dc.b	$b,'&',$80,$b5,$b,'!',$f5,$16
	dc.b	$b,$1d,'m+',$b,$18,$e8,$ef
	dc.b	$b,$14,'h\',$b,$f,$eb,'o'
	dc.b	$b,$b,'r$',$b,6,$fc,'v'
	dc.b	$b,2,$8a,'`',$a,$fe,$1b,$de
	dc.b	$a,$f9,$b0,$ec,$a,$f5,'I',$86
	dc.b	$a,$f0,$e5,$a7,$a,$ec,$85,'K'
	dc.b	$a,$e8,'(n',$a,$e3,$cf,$c
	dc.b	$a,$df,'y ',$a,$db,'&',$a7
	dc.b	$a,$d6,$d7,$9c,$a,$d2,$8b,$fb
	dc.b	$a,$ce,'C',$c0,$a,$c9,$fe,$e8
	dc.b	$a,$c5,$bd,'n',$a,$c1,$7f,'N'
	dc.b	$a,$bd,'D',$84,$a,$b9,$d,$c
	dc.b	$a,$b4,$d8,$e3,$a,$b0,$a8,4
	dc.b	$a,$ac,'zl',$a,$a8,'P',$17
	dc.b	$a,$a4,')',1,$a,$a0,5,'&'
	dc.b	$a,$9b,$e4,$82,$a,$97,$c7,$12
	dc.b	$a,$93,$ac,$d2,$a,$8f,$95,$bf
	dc.b	$a,$8b,$81,$d4,$a,$87,'q',$e
	dc.b	$a,$83,'ci',$a,$7f,'X',$e2
	dc.b	$a,'{Qu',$a,'wM',$1e
	dc.b	$a,'sK',$db,$a,'oM',$a7
	dc.b	$a,'kR',$7f,$a,'gZ`'
	dc.b	$a,'ceE',$a,'_s,'
	dc.b	$a,'[',$84,$12,$a,'W',$97,$f2
	dc.b	$a,'S',$ae,$ca,$a,'O',$c8,$95
	dc.b	$a,'K',$e5,'Q',$a,'H',4,$fb
	dc.b	$a,'D',$27,$8f,$a,'@M',9
	dc.b	$a,'<ug',$a,'8',$a0,$a6
	dc.b	$a,'4',$ce,$c1,$a,'0',$ff,$b6
	dc.b	$a,'-3',$82,$a,')j"'
	dc.b	$a,'%',$a3,$92,$a,'!',$df,$cf
	dc.b	$a,$1e,$1e,$d6,$a,$1a,'`',$a4
	dc.b	$a,$16,$a5,'6',$a,$12,$ec,$89
	dc.b	$a,$f,'6',$9a,$a,$b,$83,'e'
	dc.b	$a,7,$d2,$e8,$a,4,'%!'
	dc.b	$a,0,'z',$b,9,$fc,$d1,$a3
	dc.b	9,$f9,'+',$e8,9,$f5,$88,$d6
	dc.b	9,$f1,$e8,'j',9,$ee,'J',$a1
	dc.b	9,$ea,$af,'y',9,$e7,$16,$ed
	dc.b	9,$e3,$80,$fd,9,$df,$ed,$a5
	dc.b	9,$dc,'\',$e1,9,$d8,$ce,$b0
	dc.b	9,$d5,'C',$e,9,$d1,$b9,$f8
	dc.b	9,$ce,'3m',9,$ca,$af,'i'
	dc.b	9,$c7,'-',$e9,9,$c3,$ae,$ec
	dc.b	9,$c0,'2m',9,$bc,$b8,'k'
	dc.b	9,$b9,'@',$e2,9,$b5,$cb,$d1
	dc.b	9,$b2,'Y4',9,$ae,$e9,9
	dc.b	9,$ab,'{M',9,$a8,$f,$fe
	dc.b	9,$a4,$a7,$19,9,$a1,'@',$9c
	dc.b	9,$9d,$dc,$84,9,'šz',$ce
	dc.b	9,$97,$1b,'y',9,$93,$be,$81
	dc.b	9,$90,'c',$e4,9,$8d,$b,$9f
	dc.b	9,$89,$b5,$b1,9,$86,'b',$16
	dc.b	9,$83,$10,$cc,9,$7f,$c1,$d2
	dc.b	9,'|u#',9,'y*',$bf
	dc.b	9,'u',$e2,$a2,9,'r',$9c,$cb
	dc.b	9,'oY7',9,'l',$17,$e3
	dc.b	9,'h',$d8,$cd,9,'e',$9b,$f3
	dc.b	9,'baS',9,'_(',$ea
	dc.b	9,'[',$f2,$b7,9,'X',$be,$b6
	dc.b	9,'U',$8c,$e5,9,'R]C'
	dc.b	9,'O/',$cd,9,'L',4,$81
	dc.b	9,'H',$db,'\',9,'E',$b4,']'
	dc.b	9,'B',$8f,$81,9,'?l',$c7
	dc.b	9,'<L+',9,'9-',$ac
	dc.b	9,'6',$11,'G',9,'2',$f6,$fc
	dc.b	9,'/',$de,$c6,9,',',$c8,$a5
	dc.b	9,')',$b4,$96,9,'&',$a2,$97
	dc.b	9,'#',$92,$a6,9,' ',$84,$c1
	dc.b	9,$1d,'x',$e7,9,$1a,'o',$14
	dc.b	9,$17,'gG',9,$14,'a}'
	dc.b	9,$11,']',$b6,9,$e,'[',$ee
	dc.b	9,$b,'\%',9,8,'^W'
	dc.b	9,5,'b',$83,9,2,'h',$a7
	dc.b	8,$ff,'p',$c1,8,$fc,'z',$d0
	dc.b	8,$f9,$86,$d0,8,$f6,$94,$c1
	dc.b	8,$f3,$a4,$a0,8,$f0,$b6,'k'
	dc.b	8,$ed,$ca,'!',8,$ea,$df,$c0
	dc.b	8,$e7,$f7,'E',8,$e5,$10,$af
	dc.b	8,$e2,'+',$fd,8,$df,'I,'
	dc.b	8,$dc,'h:',8,$d9,$89,'&'
	dc.b	8,$d6,$ab,$ed,8,$d3,$d0,$8f
	dc.b	8,$d0,$f7,9,8,$ce,$1f,'Y'
	dc.b	8,$cb,'I~',8,$c8,'uv'
	dc.b	8,$c5,$a3,'?',8,$c2,$d2,$d7
	dc.b	8,$c0,4,'=',8,$bd,'7o'
	dc.b	8,$ba,'lk',8,$b7,$a3,'/'
	dc.b	8,$b4,$db,$bb,8,$b2,$16,$b
	dc.b	8,$af,'R',$1f,8,$ac,$8f,$f4
	dc.b	8,$a9,$cf,$8a,8,$a7,$10,$dd
	dc.b	8,$a4,'S',$ee,8,$a1,$98,$b9
	dc.b	8,$9e,$df,'>',8,$9c,$27,'{'
	dc.b	8,$99,'qn',8,$96,$bd,$16
	dc.b	8,$94,$a,'p',8,$91,'Y|'
	dc.b	8,$8e,$aa,'7',8,$8b,$fc,$a1
	dc.b	8,$89,'P',$b7,8,$86,$a6,'y'
	dc.b	8,$83,$fd,$e4,8,$81,'V',$f6
	dc.b	8,'~',$b1,$af,8,'|',$e,$d
	dc.b	8,'yl',$f,8,'v',$cb,$b2
	dc.b	8,'t,',$f5,8,'q',$8f,$d7
	dc.b	8,'n',$f4,'V',8,'lZq'
	dc.b	8,'i',$c2,'&',8,'g+u'
	dc.b	8,'d',$96,'Z',8,'b',2,$d5
	dc.b	8,'_p',$e5,8,'\',$e0,$88
	dc.b	8,'ZQ',$bc,8,'W',$c4,$80
	dc.b	8,'U8',$d3,8,'R',$ae,$b3
	dc.b	8,'P&',$1f,8,'M',$9f,$15
	dc.b	8,'K',$19,$94,8,'H',$95,$9b
	dc.b	8,'F',$13,'(',8,'C',$92,':'
	dc.b	8,'A',$12,$cf,8,'>',$94,$e6
	dc.b	8,'<',$18,'~',8,'9',$9d,$96
	dc.b	8,'7$+',8,'4',$ac,'='
	dc.b	8,'25',$ca,8,'/',$c0,$d1
	dc.b	8,'-MQ',8,'*',$db,'I'
	dc.b	8,'(j',$b6,8,'%',$fb,$98
	dc.b	8,'#',$8d,$ed,8,'!!',$b5
	dc.b	8,$1e,$b6,$ed,8,$1c,'M',$95
	dc.b	8,$19,$e5,$ab,8,$17,$7f,'.'
	dc.b	8,$15,$1a,$1d,8,$12,$b6,'v'
	dc.b	'>',$1e,'*',$bb,'p',$10,'.;'
	dc.b	'p',8,$f,$cd,0,0,'Ns'
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,0,9,0,$a,0,0,0
	dc.b	8,2,9,0,$a,0,0,0
	dc.b	8,2,9,1,$a,0,0,0
	dc.b	8,3,9,1,$a,0,0,0
	dc.b	8,4,9,1,$a,0,0,0
	dc.b	8,5,9,1,$a,0,0,0
	dc.b	8,6,9,0,$a,0,0,0
	dc.b	8,6,9,1,$a,0,0,0
	dc.b	8,6,9,3,$a,0,0,0
	dc.b	8,7,9,1,$a,0,0,0
	dc.b	8,7,9,2,$a,0,0,0
	dc.b	8,7,9,3,$a,0,1,0
	dc.b	8,7,9,4,$a,0,1,0
	dc.b	8,8,9,1,$a,0,0,0
	dc.b	8,8,9,2,$a,0,0,0
	dc.b	8,8,9,3,$a,0,1,0
	dc.b	8,8,9,4,$a,0,1,0
	dc.b	8,9,9,0,$a,0,0,0
	dc.b	8,9,9,1,$a,0,0,0
	dc.b	8,9,9,3,$a,0,0,0
	dc.b	8,9,9,4,$a,0,0,0
	dc.b	8,9,9,5,$a,0,0,0
	dc.b	8,9,9,5,$a,0,1,0
	dc.b	8,9,9,5,$a,0,3,0
	dc.b	8,9,9,6,$a,0,2,0
	dc.b	8,9,9,6,$a,0,3,0
	dc.b	8,$a,9,1,$a,0,0,0
	dc.b	8,$a,9,3,$a,0,0,0
	dc.b	8,$a,9,3,$a,0,1,0
	dc.b	8,$a,9,5,$a,0,0,0
	dc.b	8,$a,9,5,$a,0,2,0
	dc.b	8,$a,9,5,$a,0,3,0
	dc.b	8,$a,9,6,$a,0,2,0
	dc.b	8,$a,9,7,$a,0,0,0
	dc.b	8,$a,9,7,$a,0,2,0
	dc.b	8,$b,9,1,$a,0,0,0
	dc.b	8,$b,9,3,$a,0,0,0
	dc.b	8,$b,9,3,$a,0,1,0
	dc.b	8,$b,9,4,$a,0,1,0
	dc.b	8,$b,9,5,$a,0,1,0
	dc.b	8,$b,9,5,$a,0,3,0
	dc.b	8,$b,9,6,$a,0,2,0
	dc.b	8,$b,9,6,$a,0,3,0
	dc.b	8,$b,9,7,$a,0,2,0
	dc.b	8,$b,9,7,$a,0,4,0
	dc.b	8,$b,9,8,$a,0,0,0
	dc.b	8,$b,9,8,$a,0,1,0
	dc.b	8,$b,9,8,$a,0,3,0
	dc.b	8,$b,9,8,$a,0,4,0
	dc.b	8,$b,9,8,$a,0,5,0
	dc.b	8,$b,9,9,$a,0,1,0
	dc.b	8,$b,9,9,$a,0,3,0
	dc.b	8,$b,9,9,$a,0,4,0
	dc.b	8,$c,9,2,$a,0,0,0
	dc.b	8,$c,9,2,$a,0,1,0
	dc.b	8,$c,9,4,$a,0,1,0
	dc.b	8,$c,9,5,$a,0,1,0
	dc.b	8,$c,9,5,$a,0,3,0
	dc.b	8,$c,9,6,$a,0,2,0
	dc.b	8,$c,9,7,$a,0,0,0
	dc.b	8,$c,9,7,$a,0,2,0
	dc.b	8,$c,9,7,$a,0,4,0
	dc.b	8,$c,9,7,$a,0,5,0
	dc.b	8,$c,9,8,$a,0,2,0
	dc.b	8,$c,9,8,$a,0,4,0
	dc.b	8,$c,9,8,$a,0,5,0
	dc.b	8,$c,9,9,$a,0,0,0
	dc.b	8,$c,9,9,$a,0,2,0
	dc.b	8,$c,9,9,$a,0,4,0
	dc.b	8,$c,9,9,$a,0,5,0
	dc.b	8,$c,9,9,$a,0,6,0
	dc.b	8,$c,9,9,$a,0,7,0
	dc.b	8,$c,9,9,$a,0,7,0
	dc.b	8,$c,9,$a,$a,0,0,0
	dc.b	8,$c,9,$a,$a,0,3,0
	dc.b	8,$d,9,2,$a,0,0,0
	dc.b	8,$d,9,3,$a,0,1,0
	dc.b	8,$d,9,5,$a,0,0,0
	dc.b	8,$d,9,5,$a,0,2,0
	dc.b	8,$d,9,6,$a,0,1,0
	dc.b	8,$d,9,7,$a,0,0,0
	dc.b	8,$d,9,7,$a,0,2,0
	dc.b	8,$d,9,7,$a,0,4,0
	dc.b	8,$d,9,7,$a,0,5,0
	dc.b	8,$d,9,8,$a,0,2,0
	dc.b	8,$d,9,8,$a,0,4,0
	dc.b	8,$d,9,9,$a,0,0,0
	dc.b	8,$d,9,9,$a,0,1,0
	dc.b	8,$d,9,9,$a,0,4,0
	dc.b	8,$d,9,9,$a,0,5,0
	dc.b	8,$d,9,9,$a,0,6,0
	dc.b	8,$d,9,9,$a,0,7,0
	dc.b	8,$d,9,$a,$a,0,0,0
	dc.b	8,$d,9,$a,$a,0,0,0
	dc.b	8,$d,9,$a,$a,0,3,0
	dc.b	8,$d,9,$a,$a,0,5,0
	dc.b	8,$d,9,$a,$a,0,6,0
	dc.b	8,$d,9,$a,$a,0,7,0
	dc.b	8,$d,9,$a,$a,0,8,0
	dc.b	8,$d,9,$a,$a,0,8,0
	dc.b	8,$d,9,$a,$a,0,8,0
	dc.b	8,$d,9,$b,$a,0,1,0
	dc.b	8,$d,9,$b,$a,0,4,0
	dc.b	8,$d,9,$b,$a,0,6,0
	dc.b	8,$d,9,$b,$a,0,7,0
	dc.b	8,$d,9,$b,$a,0,7,0
	dc.b	8,$d,9,$b,$a,0,8,0
	dc.b	8,$d,9,$b,$a,0,8,0
	dc.b	8,$d,9,$b,$a,0,9,0
	dc.b	8,$d,9,$b,$a,0,9,0
	dc.b	8,$d,9,$b,$a,0,9,0
	dc.b	8,$d,9,$b,$a,0,$a,0
	dc.b	8,$d,9,$b,$a,0,$a,0
	dc.b	8,$d,9,$b,$a,0,$a,0
	dc.b	8,$d,9,$b,$a,0,$a,0
	dc.b	8,$d,9,$b,$a,0,$a,0
	dc.b	8,$d,9,$c,$a,0,2,0
	dc.b	8,$d,9,$c,$a,0,5,0
	dc.b	8,$d,9,$c,$a,0,6,0
	dc.b	8,$e,9,0,$a,0,0,0
	dc.b	8,$e,9,3,$a,0,1,0
	dc.b	8,$e,9,5,$a,0,2,0
	dc.b	8,$e,9,6,$a,0,2,0
	dc.b	8,$e,9,7,$a,0,2,0
	dc.b	8,$e,9,7,$a,0,5,0
	dc.b	8,$e,9,8,$a,0,1,0
	dc.b	8,$e,9,8,$a,0,5,0
	dc.b	8,$e,9,9,$a,0,0,0
	dc.b	8,$e,9,9,$a,0,3,0
	dc.b	8,$e,9,9,$a,0,6,0
	dc.b	8,$e,9,9,$a,0,7,0
	dc.b	8,$e,9,9,$a,0,8,0
	dc.b	8,$e,9,9,$a,0,8,0
	dc.b	8,$e,9,$a,$a,0,2,0
	dc.b	8,$e,9,$a,$a,0,6,0
	dc.b	8,$e,9,$a,$a,0,7,0
	dc.b	8,$e,9,$a,$a,0,8,0
	dc.b	8,$e,9,$a,$a,0,9,0
	dc.b	8,$e,9,$a,$a,0,9,0
	dc.b	8,$e,9,$a,$a,0,9,0
	dc.b	8,$e,9,$b,$a,0,3,0
	dc.b	8,$e,9,$b,$a,0,7,0
	dc.b	8,$e,9,$b,$a,0,8,0
	dc.b	8,$e,9,$b,$a,0,9,0
	dc.b	8,$e,9,$b,$a,0,9,0
	dc.b	8,$e,9,$b,$a,0,$a,0
	dc.b	8,$e,9,$b,$a,0,$a,0
	dc.b	8,$e,9,$b,$a,0,$a,0
	dc.b	8,$e,9,$b,$a,0,$a,0
	dc.b	8,$e,9,$c,$a,0,0,0
	dc.b	8,$e,9,$c,$a,0,0,0
	dc.b	8,$e,9,$c,$a,0,0,0
	dc.b	8,$e,9,$c,$a,0,7,0
	dc.b	8,$e,9,$c,$a,0,7,0
	dc.b	8,$e,9,$c,$a,0,8,0
	dc.b	8,$e,9,$c,$a,0,8,0
	dc.b	8,$e,9,$c,$a,0,9,0
	dc.b	8,$e,9,$c,$a,0,$a,0
	dc.b	8,$e,9,$c,$a,0,$a,0
	dc.b	8,$e,9,$c,$a,0,$a,0
	dc.b	8,$e,9,$c,$a,0,$a,0
	dc.b	8,$e,9,$c,$a,0,$b,0
	dc.b	8,$e,9,$c,$a,0,$b,0
	dc.b	8,$e,9,$c,$a,0,$b,0
	dc.b	8,$e,9,$d,$a,0,0,0
	dc.b	8,$e,9,$d,$a,0,0,0
	dc.b	8,$e,9,$d,$a,0,0,0
	dc.b	8,$e,9,$d,$a,0,7,0
	dc.b	8,$e,9,$d,$a,0,7,0
	dc.b	8,$e,9,$d,$a,0,7,0
	dc.b	8,$e,9,$d,$a,0,9,0
	dc.b	8,$e,9,$d,$a,0,9,0
	dc.b	8,$e,9,$d,$a,0,9,0
	dc.b	8,$e,9,$d,$a,0,$a,0
	dc.b	8,$e,9,$d,$a,0,$a,0
	dc.b	8,$e,9,$d,$a,0,$a,0
	dc.b	8,$e,9,$d,$a,0,$b,0
	dc.b	8,$e,9,$d,$a,0,$b,0
	dc.b	8,$e,9,$d,$a,0,$b,0
	dc.b	8,$f,9,0,$a,0,0,0
	dc.b	8,$f,9,0,$a,0,0,0
	dc.b	8,$f,9,0,$a,0,0,0
	dc.b	8,$f,9,7,$a,0,0,0
	dc.b	8,$f,9,7,$a,0,0,0
	dc.b	8,$f,9,9,$a,0,0,0
	dc.b	8,$f,9,9,$a,0,0,0
	dc.b	8,$f,9,9,$a,0,0,0
	dc.b	8,$f,9,$a,$a,0,0,0
	dc.b	8,$f,9,$a,$a,0,0,0
	dc.b	8,$f,9,$a,$a,0,9,0
	dc.b	8,$f,9,$b,$a,0,0,0
	dc.b	8,$f,9,$b,$a,0,0,0
	dc.b	8,$f,9,$b,$a,0,0,0
	dc.b	8,$f,9,$b,$a,0,$a,0
	dc.b	8,$f,9,$b,$a,0,$a,0
	dc.b	8,$f,9,$c,$a,0,0,0
	dc.b	8,$f,9,$c,$a,0,0,0
	dc.b	8,$f,9,$c,$a,0,9,0
	dc.b	8,$f,9,$c,$a,0,9,0
	dc.b	8,$f,9,$c,$a,0,$a,0
	dc.b	8,$f,9,$c,$a,0,$a,0
	dc.b	8,$f,9,$c,$a,0,$a,0
	dc.b	8,$f,9,$c,$a,0,$b,0
	dc.b	8,$f,9,$c,$a,0,$b,0
	dc.b	8,$f,9,$c,$a,0,$b,0
	dc.b	8,$f,9,$c,$a,0,$c,0
	dc.b	8,$f,9,$c,$a,0,$c,0
	dc.b	8,$f,9,$c,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,0,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$b,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$c,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$d,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,0,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$c,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	8,$f,9,$e,$a,0,$d,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,8
	dc.b	4,8,4,8,4,8,4,8
	dc.b	4,8,4,8,4,8,4,8
	dc.b	4,8,4,$10,4,$10,4,$10
	dc.b	4,$10,4,$10,4,$10,4,$10
	dc.b	4,$10,4,$10,4,$10,4,$18
	dc.b	4,$18,4,$18,4,$18,4,$18
	dc.b	4,$18,4,$18,4,$18,4,$18
	dc.b	4,$18,4,' ',4,' ',4,' '
	dc.b	4,' ',4,' ',4,' ',4,' '
	dc.b	4,' ',4,' ',4,' ',4,'('
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'(',4,'0',4,'0',4,'0'
	dc.b	3,$c8,3,$c8,3,$c8,3,$c8
	dc.b	3,$d0,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d0,3,$d8,3,$d8
	dc.b	3,$d8,3,$d8,3,$d8,3,$d8
	dc.b	3,$d8,3,$d8,3,$d8,3,$d8
	dc.b	3,$e0,3,$e0,3,$e0,3,$e0
	dc.b	3,$e0,3,$e0,3,$e0,3,$e0
	dc.b	3,$e0,3,$e0,3,$e8,3,$e8
	dc.b	3,$e8,3,$e8,3,$e8,3,$e8
	dc.b	3,$e8,3,$e8,3,$e8,3,$e8
	dc.b	3,$f0,3,$f0,3,$f0,3,$f0
	dc.b	3,$f0,3,$f0,3,$f0,3,$f0
	dc.b	3,$f0,3,$f0,3,$f8,3,$f8
	dc.b	3,$f8,3,$f8,3,$f8,3,$f8
	dc.b	3,$f8,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,8,4,8,4,8,4,8
	dc.b	4,8,4,8,4,8,4,$10
	dc.b	4,$10,4,$10,4,$10,4,$10
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,$18,4,$18,4,$18,4,$18
	dc.b	4,$18,4,' ',4,' ',4,' '
	dc.b	4,' ',4,' ',4,' ',4,' '
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'(',4,'(',4,'(',4,'0'
	dc.b	4,'0',4,'0',4,'0',4,'0'
	dc.b	4,'0',4,'0',4,'0',4,'8'
	dc.b	4,'8',4,'8',4,'8',4,'8'
	dc.b	4,'8',4,'8',4,'@',4,'@'
	dc.b	4,'@',4,'@',4,'@',4,'@'
	dc.b	3,$b8,3,$b8,3,$b8,3,$b8
	dc.b	3,$b8,3,$b8,3,$b8,3,$c0
	dc.b	3,$c0,3,$c0,3,$c0,3,$c0
	dc.b	3,$c0,3,$c0,3,$c8,3,$c8
	dc.b	3,$c8,3,$c8,3,$c8,3,$c8
	dc.b	3,$c8,3,$c8,3,$d0,3,$d0
	dc.b	3,$d0,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d8,3,$d8,3,$d8
	dc.b	3,$d8,3,$d8,3,$d8,3,$d8
	dc.b	3,$e0,3,$e0,3,$e0,3,$e0
	dc.b	3,$e0,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$e8,3,$e8,3,$e8
	dc.b	3,$e8,3,$e8,3,$f0,3,$f0
	dc.b	3,$f0,3,$f0,3,$f0,3,$f0
	dc.b	3,$f0,3,$f8,3,$f8,3,$f8
	dc.b	3,$f8,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,8,4,8,4,8,4,8
	dc.b	4,$10,4,$10,4,$10,4,$10
	dc.b	4,$10,4,$18,4,$18,4,$18
	dc.b	4,$18,4,$18,4,$18,4,' '
	dc.b	4,' ',4,' ',4,' ',4,' '
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'(',4,'(',4,'0',4,'0'
	dc.b	4,'0',4,'0',4,'0',4,'8'
	dc.b	4,'8',4,'8',4,'8',4,'8'
	dc.b	4,'8',4,'@',4,'@',4,'@'
	dc.b	4,'@',4,'@',4,'@',4,'H'
	dc.b	4,'H',4,'H',4,'H',4,'H'
	dc.b	4,'P',4,'P',4,'P',4,'P'
	dc.b	4,'P',4,'P',4,'X',4,'X'
	dc.b	3,$a0,3,$a0,3,$a0,3,$a8
	dc.b	3,$a8,3,$a8,3,$a8,3,$a8
	dc.b	3,$a8,3,$b0,3,$b0,3,$b0
	dc.b	3,$b0,3,$b0,3,$b8,3,$b8
	dc.b	3,$b8,3,$b8,3,$b8,3,$b8
	dc.b	3,$c0,3,$c0,3,$c0,3,$c0
	dc.b	3,$c0,3,$c0,3,$c8,3,$c8
	dc.b	3,$c8,3,$c8,3,$c8,3,$d0
	dc.b	3,$d0,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d8,3,$d8,3,$d8
	dc.b	3,$d8,3,$d8,3,$e0,3,$e0
	dc.b	3,$e0,3,$e0,3,$e0,3,$e0
	dc.b	3,$e8,3,$e8,3,$e8,3,$e8
	dc.b	3,$e8,3,$f0,3,$f0,3,$f0
	dc.b	3,$f0,3,$f0,3,$f0,3,$f8
	dc.b	3,$f8,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,4,8,4,8,4,8
	dc.b	4,8,4,8,4,$10,4,$10
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,$18,4,$18,4,$18,4,' '
	dc.b	4,' ',4,' ',4,' ',4,'('
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'0',4,'0',4,'0',4,'0'
	dc.b	4,'8',4,'8',4,'8',4,'8'
	dc.b	4,'8',4,'@',4,'@',4,'@'
	dc.b	4,'@',4,'@',4,'H',4,'H'
	dc.b	4,'H',4,'H',4,'P',4,'P'
	dc.b	4,'P',4,'P',4,'P',4,'X'
	dc.b	4,'X',4,'X',4,'X',4,'`'
	dc.b	4,'`',4,'`',4,'`',4,'`'
	dc.b	4,'h',4,'h',4,'h',4,'h'
	dc.b	3,$88,3,$90,3,$90,3,$90
	dc.b	3,$90,3,$98,3,$98,3,$98
	dc.b	3,$98,3,$98,3,$a0,3,$a0
	dc.b	3,$a0,3,$a0,3,$a8,3,$a8
	dc.b	3,$a8,3,$a8,3,$a8,3,$b0
	dc.b	3,$b0,3,$b0,3,$b0,3,$b8
	dc.b	3,$b8,3,$b8,3,$b8,3,$b8
	dc.b	3,$c0,3,$c0,3,$c0,3,$c0
	dc.b	3,$c0,3,$c8,3,$c8,3,$c8
	dc.b	3,$c8,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d0,3,$d8,3,$d8
	dc.b	3,$d8,3,$d8,3,$e0,3,$e0
	dc.b	3,$e0,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$e8,3,$e8,3,$f0
	dc.b	3,$f0,3,$f0,3,$f0,3,$f0
	dc.b	3,$f8,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,8,4,8,4,8,4,8
	dc.b	4,$10,4,$10,4,$10,4,$10
	dc.b	4,$18,4,$18,4,$18,4,$18
	dc.b	4,' ',4,' ',4,' ',4,' '
	dc.b	4,'(',4,'(',4,'(',4,'('
	dc.b	4,'0',4,'0',4,'0',4,'0'
	dc.b	4,'8',4,'8',4,'8',4,'8'
	dc.b	4,'@',4,'@',4,'@',4,'@'
	dc.b	4,'H',4,'H',4,'H',4,'H'
	dc.b	4,'P',4,'P',4,'P',4,'P'
	dc.b	4,'X',4,'X',4,'X',4,'X'
	dc.b	4,'`',4,'`',4,'`',4,'h'
	dc.b	4,'h',4,'h',4,'h',4,'p'
	dc.b	4,'p',4,'p',4,'p',4,'x'
	dc.b	4,'x',4,'x',4,'x',4,$80
	dc.b	3,'x',3,'x',3,$80,3,$80
	dc.b	3,$80,3,$80,3,$88,3,$88
	dc.b	3,$88,3,$88,3,$90,3,$90
	dc.b	3,$90,3,$90,3,$98,3,$98
	dc.b	3,$98,3,$a0,3,$a0,3,$a0
	dc.b	3,$a0,3,$a8,3,$a8,3,$a8
	dc.b	3,$a8,3,$b0,3,$b0,3,$b0
	dc.b	3,$b0,3,$b8,3,$b8,3,$b8
	dc.b	3,$b8,3,$c0,3,$c0,3,$c0
	dc.b	3,$c0,3,$c8,3,$c8,3,$c8
	dc.b	3,$c8,3,$d0,3,$d0,3,$d0
	dc.b	3,$d0,3,$d8,3,$d8,3,$d8
	dc.b	3,$d8,3,$e0,3,$e0,3,$e0
	dc.b	3,$e0,3,$e8,3,$e8,3,$e8
	dc.b	3,$e8,3,$f0,3,$f0,3,$f0
	dc.b	3,$f0,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,8,4,8,4,8,4,$10
	dc.b	4,$10,4,$10,4,$10,4,$18
	dc.b	4,$18,4,$18,4,' ',4,' '
	dc.b	4,' ',4,' ',4,'(',4,'('
	dc.b	4,'(',4,'0',4,'0',4,'0'
	dc.b	4,'8',4,'8',4,'8',4,'8'
	dc.b	4,'@',4,'@',4,'@',4,'H'
	dc.b	4,'H',4,'H',4,'H',4,'P'
	dc.b	4,'P',4,'P',4,'X',4,'X'
	dc.b	4,'X',4,'`',4,'`',4,'`'
	dc.b	4,'`',4,'h',4,'h',4,'h'
	dc.b	4,'p',4,'p',4,'p',4,'p'
	dc.b	4,'x',4,'x',4,'x',4,$80
	dc.b	4,$80,4,$80,4,$88,4,$88
	dc.b	4,$88,4,$88,4,$90,4,$90
	dc.b	3,'h',3,'h',3,'h',3,'p'
	dc.b	3,'p',3,'p',3,'p',3,'x'
	dc.b	3,'x',3,'x',3,$80,3,$80
	dc.b	3,$80,3,$88,3,$88,3,$88
	dc.b	3,$88,3,$90,3,$90,3,$90
	dc.b	3,$98,3,$98,3,$98,3,$98
	dc.b	3,$a0,3,$a0,3,$a0,3,$a8
	dc.b	3,$a8,3,$a8,3,$b0,3,$b0
	dc.b	3,$b0,3,$b0,3,$b8,3,$b8
	dc.b	3,$b8,3,$c0,3,$c0,3,$c0
	dc.b	3,$c0,3,$c8,3,$c8,3,$c8
	dc.b	3,$d0,3,$d0,3,$d0,3,$d8
	dc.b	3,$d8,3,$d8,3,$d8,3,$e0
	dc.b	3,$e0,3,$e0,3,$e8,3,$e8
	dc.b	3,$e8,3,$e8,3,$f0,3,$f0
	dc.b	3,$f0,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,8,4,8,4,8,4,$10
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,$18,4,' ',4,' ',4,' '
	dc.b	4,'(',4,'(',4,'(',4,'0'
	dc.b	4,'0',4,'0',4,'8',4,'8'
	dc.b	4,'8',4,'@',4,'@',4,'@'
	dc.b	4,'H',4,'H',4,'H',4,'P'
	dc.b	4,'P',4,'P',4,'X',4,'X'
	dc.b	4,'X',4,'`',4,'`',4,'`'
	dc.b	4,'h',4,'h',4,'h',4,'p'
	dc.b	4,'p',4,'p',4,'x',4,'x'
	dc.b	4,'x',4,$80,4,$80,4,$80
	dc.b	4,$88,4,$88,4,$88,4,$90
	dc.b	4,$90,4,$90,4,$90,4,$98
	dc.b	4,$98,4,$98,4,$a0,4,$a0
	dc.b	3,'X',3,'X',3,'X',3,'`'
	dc.b	3,'`',3,'`',3,'h',3,'h'
	dc.b	3,'h',3,'h',3,'p',3,'p'
	dc.b	3,'p',3,'x',3,'x',3,'x'
	dc.b	3,$80,3,$80,3,$80,3,$88
	dc.b	3,$88,3,$88,3,$90,3,$90
	dc.b	3,$90,3,$98,3,$98,3,$98
	dc.b	3,$a0,3,$a0,3,$a0,3,$a8
	dc.b	3,$a8,3,$a8,3,$b0,3,$b0
	dc.b	3,$b0,3,$b8,3,$b8,3,$b8
	dc.b	3,$c0,3,$c0,3,$c0,3,$c8
	dc.b	3,$c8,3,$c8,3,$d0,3,$d0
	dc.b	3,$d0,3,$d8,3,$d8,3,$d8
	dc.b	3,$e0,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$e8,3,$f0,3,$f0
	dc.b	3,$f0,3,$f8,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,8
	dc.b	4,8,4,8,4,$10,4,$10
	dc.b	4,$10,4,$18,4,$18,4,' '
	dc.b	4,' ',4,' ',4,'(',4,'('
	dc.b	4,'(',4,'0',4,'0',4,'0'
	dc.b	4,'8',4,'8',4,'@',4,'@'
	dc.b	4,'@',4,'H',4,'H',4,'H'
	dc.b	4,'P',4,'P',4,'P',4,'X'
	dc.b	4,'X',4,'`',4,'`',4,'`'
	dc.b	4,'h',4,'h',4,'h',4,'p'
	dc.b	4,'p',4,'p',4,'x',4,'x'
	dc.b	4,$80,4,$80,4,$80,4,$88
	dc.b	4,$88,4,$88,4,$90,4,$90
	dc.b	4,$90,4,$98,4,$98,4,$a0
	dc.b	4,$a0,4,$a0,4,$a8,4,$a8
	dc.b	4,$a8,4,$b0,4,$b0,4,$b8
	dc.b	3,'@',3,'@',3,'H',3,'H'
	dc.b	3,'P',3,'P',3,'P',3,'X'
	dc.b	3,'X',3,'X',3,'`',3,'`'
	dc.b	3,'h',3,'h',3,'h',3,'p'
	dc.b	3,'p',3,'p',3,'x',3,'x'
	dc.b	3,'x',3,$80,3,$80,3,$88
	dc.b	3,$88,3,$88,3,$90,3,$90
	dc.b	3,$90,3,$98,3,$98,3,$98
	dc.b	3,$a0,3,$a0,3,$a8,3,$a8
	dc.b	3,$a8,3,$b0,3,$b0,3,$b0
	dc.b	3,$b8,3,$b8,3,$b8,3,$c0
	dc.b	3,$c0,3,$c8,3,$c8,3,$c8
	dc.b	3,$d0,3,$d0,3,$d0,3,$d8
	dc.b	3,$d8,3,$d8,3,$e0,3,$e0
	dc.b	3,$e8,3,$e8,3,$e8,3,$f0
	dc.b	3,$f0,3,$f0,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,8
	dc.b	4,8,4,8,4,$10,4,$10
	dc.b	4,$18,4,$18,4,$18,4,' '
	dc.b	4,' ',4,'(',4,'(',4,'('
	dc.b	4,'0',4,'0',4,'8',4,'8'
	dc.b	4,'8',4,'@',4,'@',4,'H'
	dc.b	4,'H',4,'H',4,'P',4,'P'
	dc.b	4,'X',4,'X',4,'X',4,'`'
	dc.b	4,'`',4,'h',4,'h',4,'h'
	dc.b	4,'p',4,'p',4,'x',4,'x'
	dc.b	4,'x',4,$80,4,$80,4,$88
	dc.b	4,$88,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$98,4,$98,4,$a0
	dc.b	4,$a0,4,$a8,4,$a8,4,$a8
	dc.b	4,$b0,4,$b0,4,$b8,4,$b8
	dc.b	4,$b8,4,$c0,4,$c0,4,$c8
	dc.b	3,'0',3,'0',3,'8',3,'8'
	dc.b	3,'@',3,'@',3,'@',3,'H'
	dc.b	3,'H',3,'P',3,'P',3,'P'
	dc.b	3,'X',3,'X',3,'`',3,'`'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'p',3,'p',3,'x',3,'x'
	dc.b	3,$80,3,$80,3,$80,3,$88
	dc.b	3,$88,3,$90,3,$90,3,$90
	dc.b	3,$98,3,$98,3,$a0,3,$a0
	dc.b	3,$a0,3,$a8,3,$a8,3,$b0
	dc.b	3,$b0,3,$b0,3,$b8,3,$b8
	dc.b	3,$c0,3,$c0,3,$c0,3,$c8
	dc.b	3,$c8,3,$d0,3,$d0,3,$d0
	dc.b	3,$d8,3,$d8,3,$e0,3,$e0
	dc.b	3,$e0,3,$e8,3,$e8,3,$f0
	dc.b	3,$f0,3,$f0,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,8
	dc.b	4,8,4,$10,4,$10,4,$18
	dc.b	4,$18,4,$18,4,' ',4,' '
	dc.b	4,'(',4,'(',4,'0',4,'0'
	dc.b	4,'0',4,'8',4,'8',4,'@'
	dc.b	4,'@',4,'H',4,'H',4,'H'
	dc.b	4,'P',4,'P',4,'X',4,'X'
	dc.b	4,'`',4,'`',4,'`',4,'h'
	dc.b	4,'h',4,'p',4,'p',4,'x'
	dc.b	4,'x',4,$80,4,$80,4,$80
	dc.b	4,$88,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$98,4,$98,4,$a0
	dc.b	4,$a0,4,$a8,4,$a8,4,$b0
	dc.b	4,$b0,4,$b0,4,$b8,4,$b8
	dc.b	4,$c0,4,$c0,4,$c8,4,$c8
	dc.b	4,$c8,4,$d0,4,$d0,4,$d8
	dc.b	3,' ',3,' ',3,'(',3,'('
	dc.b	3,'0',3,'0',3,'0',3,'8'
	dc.b	3,'8',3,'@',3,'@',3,'H'
	dc.b	3,'H',3,'H',3,'P',3,'P'
	dc.b	3,'X',3,'X',3,'`',3,'`'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'p',3,'x',3,'x',3,'x'
	dc.b	3,$80,3,$80,3,$88,3,$88
	dc.b	3,$90,3,$90,3,$98,3,$98
	dc.b	3,$98,3,$a0,3,$a0,3,$a8
	dc.b	3,$a8,3,$b0,3,$b0,3,$b0
	dc.b	3,$b8,3,$b8,3,$c0,3,$c0
	dc.b	3,$c8,3,$c8,3,$c8,3,$d0
	dc.b	3,$d0,3,$d8,3,$d8,3,$e0
	dc.b	3,$e0,3,$e0,3,$e8,3,$e8
	dc.b	3,$f0,3,$f0,3,$f8,3,$f8
	dc.b	4,0,4,0,4,0,4,8
	dc.b	4,8,4,$10,4,$10,4,$18
	dc.b	4,$18,4,' ',4,' ',4,'('
	dc.b	4,'(',4,'0',4,'0',4,'8'
	dc.b	4,'8',4,'8',4,'@',4,'@'
	dc.b	4,'H',4,'H',4,'P',4,'P'
	dc.b	4,'X',4,'X',4,'`',4,'`'
	dc.b	4,'h',4,'h',4,'p',4,'p'
	dc.b	4,'x',4,'x',4,'x',4,$80
	dc.b	4,$80,4,$88,4,$88,4,$90
	dc.b	4,$90,4,$98,4,$98,4,$a0
	dc.b	4,$a0,4,$a8,4,$a8,4,$b0
	dc.b	4,$b0,4,$b0,4,$b8,4,$b8
	dc.b	4,$c0,4,$c0,4,$c8,4,$c8
	dc.b	4,$d0,4,$d0,4,$d8,4,$d8
	dc.b	4,$e0,4,$e0,4,$e8,4,$e8
	dc.b	3,8,3,$10,3,$10,3,$18
	dc.b	3,$18,3,' ',3,' ',3,'('
	dc.b	3,'(',3,'0',3,'0',3,'8'
	dc.b	3,'8',3,'@',3,'@',3,'H'
	dc.b	3,'H',3,'H',3,'P',3,'P'
	dc.b	3,'X',3,'X',3,'`',3,'`'
	dc.b	3,'h',3,'h',3,'p',3,'p'
	dc.b	3,'x',3,'x',3,$80,3,$80
	dc.b	3,$80,3,$88,3,$88,3,$90
	dc.b	3,$90,3,$98,3,$98,3,$a0
	dc.b	3,$a0,3,$a8,3,$a8,3,$b0
	dc.b	3,$b0,3,$b8,3,$b8,3,$c0
	dc.b	3,$c0,3,$c0,3,$c8,3,$c8
	dc.b	3,$d0,3,$d0,3,$d8,3,$d8
	dc.b	3,$e0,3,$e0,3,$e8,3,$e8
	dc.b	3,$f0,3,$f0,3,$f8,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,' ',4,' ',4,'(',4,'('
	dc.b	4,'0',4,'0',4,'8',4,'8'
	dc.b	4,'@',4,'@',4,'H',4,'H'
	dc.b	4,'P',4,'P',4,'X',4,'X'
	dc.b	4,'`',4,'`',4,'h',4,'h'
	dc.b	4,'p',4,'p',4,'x',4,'x'
	dc.b	4,$80,4,$80,4,$88,4,$88
	dc.b	4,$90,4,$90,4,$98,4,$98
	dc.b	4,$a0,4,$a0,4,$a8,4,$a8
	dc.b	4,$b0,4,$b0,4,$b8,4,$b8
	dc.b	4,$c0,4,$c0,4,$c8,4,$c8
	dc.b	4,$d0,4,$d0,4,$d8,4,$d8
	dc.b	4,$e0,4,$e0,4,$e8,4,$e8
	dc.b	4,$f0,4,$f0,4,$f8,4,$f8
	dc.b	2,$f8,3,0,3,0,3,8
	dc.b	3,8,3,$10,3,$10,3,$18
	dc.b	3,$18,3,' ',3,' ',3,'('
	dc.b	3,'(',3,'0',3,'0',3,'8'
	dc.b	3,'8',3,'@',3,'@',3,'H'
	dc.b	3,'H',3,'P',3,'P',3,'X'
	dc.b	3,'X',3,'`',3,'`',3,'h'
	dc.b	3,'h',3,'p',3,'p',3,'x'
	dc.b	3,'x',3,$80,3,$80,3,$88
	dc.b	3,$88,3,$90,3,$90,3,$98
	dc.b	3,$98,3,$a0,3,$a0,3,$a8
	dc.b	3,$a8,3,$b0,3,$b0,3,$b8
	dc.b	3,$b8,3,$c0,3,$c0,3,$c8
	dc.b	3,$c8,3,$d0,3,$d0,3,$d8
	dc.b	3,$d8,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,' ',4,' ',4,'(',4,'('
	dc.b	4,'0',4,'0',4,'8',4,'@'
	dc.b	4,'@',4,'H',4,'H',4,'P'
	dc.b	4,'P',4,'X',4,'X',4,'`'
	dc.b	4,'`',4,'h',4,'h',4,'p'
	dc.b	4,'p',4,'x',4,$80,4,$80
	dc.b	4,$88,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$98,4,$a0,4,$a0
	dc.b	4,$a8,4,$a8,4,$b0,4,$b0
	dc.b	4,$b8,4,$c0,4,$c0,4,$c8
	dc.b	4,$c8,4,$d0,4,$d0,4,$d8
	dc.b	4,$d8,4,$e0,4,$e0,4,$e8
	dc.b	4,$e8,4,$f0,4,$f0,4,$f8
	dc.b	5,0,5,0,5,8,5,8
	dc.b	2,$e8,2,$f0,2,$f0,2,$f8
	dc.b	2,$f8,3,0,3,8,3,8
	dc.b	3,$10,3,$10,3,$18,3,$18
	dc.b	3,' ',3,' ',3,'(',3,'('
	dc.b	3,'0',3,'0',3,'8',3,'8'
	dc.b	3,'@',3,'H',3,'H',3,'P'
	dc.b	3,'P',3,'X',3,'X',3,'`'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'p',3,'x',3,'x',3,$80
	dc.b	3,$88,3,$88,3,$90,3,$90
	dc.b	3,$98,3,$98,3,$a0,3,$a0
	dc.b	3,$a8,3,$a8,3,$b0,3,$b0
	dc.b	3,$b8,3,$b8,3,$c0,3,$c8
	dc.b	3,$c8,3,$d0,3,$d0,3,$d8
	dc.b	3,$d8,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$10,4,$18,4,$18
	dc.b	4,' ',4,'(',4,'(',4,'0'
	dc.b	4,'0',4,'8',4,'8',4,'@'
	dc.b	4,'H',4,'H',4,'P',4,'P'
	dc.b	4,'X',4,'X',4,'`',4,'h'
	dc.b	4,'h',4,'p',4,'p',4,'x'
	dc.b	4,'x',4,$80,4,$88,4,$88
	dc.b	4,$90,4,$90,4,$98,4,$98
	dc.b	4,$a0,4,$a0,4,$a8,4,$b0
	dc.b	4,$b0,4,$b8,4,$b8,4,$c0
	dc.b	4,$c0,4,$c8,4,$d0,4,$d0
	dc.b	4,$d8,4,$d8,4,$e0,4,$e0
	dc.b	4,$e8,4,$f0,4,$f0,4,$f8
	dc.b	4,$f8,5,0,5,0,5,8
	dc.b	5,$10,5,$10,5,$18,5,$18
	dc.b	2,$d8,2,$e0,2,$e0,2,$e8
	dc.b	2,$e8,2,$f0,2,$f8,2,$f8
	dc.b	3,0,3,0,3,8,3,8
	dc.b	3,$10,3,$18,3,$18,3,' '
	dc.b	3,' ',3,'(',3,'(',3,'0'
	dc.b	3,'8',3,'8',3,'@',3,'@'
	dc.b	3,'H',3,'H',3,'P',3,'X'
	dc.b	3,'X',3,'`',3,'`',3,'h'
	dc.b	3,'h',3,'p',3,'p',3,'x'
	dc.b	3,$80,3,$80,3,$88,3,$88
	dc.b	3,$90,3,$90,3,$98,3,$a0
	dc.b	3,$a0,3,$a8,3,$a8,3,$b0
	dc.b	3,$b0,3,$b8,3,$c0,3,$c0
	dc.b	3,$c8,3,$c8,3,$d0,3,$d0
	dc.b	3,$d8,3,$e0,3,$e0,3,$e8
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$18,4,$18,4,' '
	dc.b	4,' ',4,'(',4,'0',4,'0'
	dc.b	4,'8',4,'8',4,'@',4,'H'
	dc.b	4,'H',4,'P',4,'P',4,'X'
	dc.b	4,'`',4,'`',4,'h',4,'h'
	dc.b	4,'p',4,'x',4,'x',4,$80
	dc.b	4,$80,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$98,4,$a0,4,$a8
	dc.b	4,$a8,4,$b0,4,$b0,4,$b8
	dc.b	4,$c0,4,$c0,4,$c8,4,$c8
	dc.b	4,$d0,4,$d8,4,$d8,4,$e0
	dc.b	4,$e0,4,$e8,4,$f0,4,$f0
	dc.b	4,$f8,4,$f8,5,0,5,8
	dc.b	5,8,5,$10,5,$10,5,$18
	dc.b	5,' ',5,' ',5,'(',5,'('
	dc.b	2,$c8,2,$d0,2,$d0,2,$d8
	dc.b	2,$d8,2,$e0,2,$e8,2,$e8
	dc.b	2,$f0,2,$f0,2,$f8,3,0
	dc.b	3,0,3,8,3,8,3,$10
	dc.b	3,$18,3,$18,3,' ',3,' '
	dc.b	3,'(',3,'0',3,'0',3,'8'
	dc.b	3,'8',3,'@',3,'H',3,'H'
	dc.b	3,'P',3,'P',3,'X',3,'`'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'x',3,'x',3,$80,3,$80
	dc.b	3,$88,3,$90,3,$90,3,$98
	dc.b	3,$98,3,$a0,3,$a8,3,$a8
	dc.b	3,$b0,3,$b0,3,$b8,3,$c0
	dc.b	3,$c0,3,$c8,3,$c8,3,$d0
	dc.b	3,$d8,3,$d8,3,$e0,3,$e0
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$18,4,$18,4,' '
	dc.b	4,'(',4,'(',4,'0',4,'0'
	dc.b	4,'8',4,'@',4,'@',4,'H'
	dc.b	4,'P',4,'P',4,'X',4,'`'
	dc.b	4,'`',4,'h',4,'h',4,'p'
	dc.b	4,'x',4,'x',4,$80,4,$88
	dc.b	4,$88,4,$90,4,$90,4,$98
	dc.b	4,$a0,4,$a0,4,$a8,4,$b0
	dc.b	4,$b0,4,$b8,4,$c0,4,$c0
	dc.b	4,$c8,4,$c8,4,$d0,4,$d8
	dc.b	4,$d8,4,$e0,4,$e8,4,$e8
	dc.b	4,$f0,4,$f8,4,$f8,5,0
	dc.b	5,0,5,8,5,$10,5,$10
	dc.b	5,$18,5,' ',5,' ',5,'('
	dc.b	5,'(',5,'0',5,'8',5,'8'
	dc.b	2,$b8,2,$c0,2,$c0,2,$c8
	dc.b	2,$d0,2,$d0,2,$d8,2,$d8
	dc.b	2,$e0,2,$e8,2,$e8,2,$f0
	dc.b	2,$f8,2,$f8,3,0,3,0
	dc.b	3,8,3,$10,3,$10,3,$18
	dc.b	3,' ',3,' ',3,'(',3,'0'
	dc.b	3,'0',3,'8',3,'8',3,'@'
	dc.b	3,'H',3,'H',3,'P',3,'X'
	dc.b	3,'X',3,'`',3,'h',3,'h'
	dc.b	3,'p',3,'p',3,'x',3,$80
	dc.b	3,$80,3,$88,3,$90,3,$90
	dc.b	3,$98,3,$98,3,$a0,3,$a8
	dc.b	3,$a8,3,$b0,3,$b8,3,$b8
	dc.b	3,$c0,3,$c8,3,$c8,3,$d0
	dc.b	3,$d0,3,$d8,3,$e0,3,$e0
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,8
	dc.b	4,$10,4,$18,4,$18,4,' '
	dc.b	4,'(',4,'(',4,'0',4,'8'
	dc.b	4,'8',4,'@',4,'H',4,'H'
	dc.b	4,'P',4,'X',4,'X',4,'`'
	dc.b	4,'h',4,'h',4,'p',4,'x'
	dc.b	4,'x',4,$80,4,$88,4,$88
	dc.b	4,$90,4,$98,4,$98,4,$a0
	dc.b	4,$a8,4,$a8,4,$b0,4,$b8
	dc.b	4,$b8,4,$c0,4,$c8,4,$c8
	dc.b	4,$d0,4,$d8,4,$d8,4,$e0
	dc.b	4,$e8,4,$e8,4,$f0,4,$f8
	dc.b	4,$f8,5,0,5,8,5,8
	dc.b	5,$10,5,$18,5,$18,5,' '
	dc.b	5,'(',5,'(',5,'0',5,'8'
	dc.b	5,'8',5,'@',5,'H',5,'H'
	dc.b	2,$a8,2,$b0,2,$b0,2,$b8
	dc.b	2,$c0,2,$c0,2,$c8,2,$d0
	dc.b	2,$d0,2,$d8,2,$e0,2,$e0
	dc.b	2,$e8,2,$f0,2,$f0,2,$f8
	dc.b	3,0,3,0,3,8,3,$10
	dc.b	3,$10,3,$18,3,' ',3,' '
	dc.b	3,'(',3,'0',3,'0',3,'8'
	dc.b	3,'@',3,'@',3,'H',3,'P'
	dc.b	3,'P',3,'X',3,'`',3,'`'
	dc.b	3,'h',3,'p',3,'p',3,'x'
	dc.b	3,$80,3,$80,3,$88,3,$90
	dc.b	3,$90,3,$98,3,$a0,3,$a0
	dc.b	3,$a8,3,$b0,3,$b0,3,$b8
	dc.b	3,$c0,3,$c0,3,$c8,3,$d0
	dc.b	3,$d0,3,$d8,3,$e0,3,$e0
	dc.b	3,$e8,3,$f0,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$10,4,$18,4,' ',4,' '
	dc.b	4,'(',4,'0',4,'0',4,'8'
	dc.b	4,'@',4,'H',4,'H',4,'P'
	dc.b	4,'X',4,'X',4,'`',4,'h'
	dc.b	4,'h',4,'p',4,'x',4,$80
	dc.b	4,$80,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$a0,4,$a0,4,$a8
	dc.b	4,$b0,4,$b8,4,$b8,4,$c0
	dc.b	4,$c8,4,$c8,4,$d0,4,$d8
	dc.b	4,$d8,4,$e0,4,$e8,4,$f0
	dc.b	4,$f0,4,$f8,5,0,5,0
	dc.b	5,8,5,$10,5,$10,5,$18
	dc.b	5,' ',5,'(',5,'(',5,'0'
	dc.b	5,'8',5,'8',5,'@',5,'H'
	dc.b	5,'H',5,'P',5,'X',5,'`'
	dc.b	2,$98,2,$98,2,$a0,2,$a8
	dc.b	2,$b0,2,$b0,2,$b8,2,$c0
	dc.b	2,$c0,2,$c8,2,$d0,2,$d0
	dc.b	2,$d8,2,$e0,2,$e8,2,$e8
	dc.b	2,$f0,2,$f8,2,$f8,3,0
	dc.b	3,8,3,8,3,$10,3,$18
	dc.b	3,' ',3,' ',3,'(',3,'0'
	dc.b	3,'0',3,'8',3,'@',3,'@'
	dc.b	3,'H',3,'P',3,'X',3,'X'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'x',3,'x',3,$80,3,$88
	dc.b	3,$90,3,$90,3,$98,3,$a0
	dc.b	3,$a0,3,$a8,3,$b0,3,$b0
	dc.b	3,$b8,3,$c0,3,$c8,3,$c8
	dc.b	3,$d0,3,$d8,3,$d8,3,$e0
	dc.b	3,$e8,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$10,4,$18,4,' ',4,'('
	dc.b	4,'(',4,'0',4,'8',4,'@'
	dc.b	4,'@',4,'H',4,'P',4,'P'
	dc.b	4,'X',4,'`',4,'h',4,'h'
	dc.b	4,'p',4,'x',4,$80,4,$80
	dc.b	4,$88,4,$90,4,$90,4,$98
	dc.b	4,$a0,4,$a8,4,$a8,4,$b0
	dc.b	4,$b8,4,$c0,4,$c0,4,$c8
	dc.b	4,$d0,4,$d0,4,$d8,4,$e0
	dc.b	4,$e8,4,$e8,4,$f0,4,$f8
	dc.b	5,0,5,0,5,8,5,$10
	dc.b	5,$10,5,$18,5,' ',5,'('
	dc.b	5,'(',5,'0',5,'8',5,'@'
	dc.b	5,'@',5,'H',5,'P',5,'P'
	dc.b	5,'X',5,'`',5,'h',5,'h'
	dc.b	2,$88,2,$90,2,$90,2,$98
	dc.b	2,$a0,2,$a8,2,$a8,2,$b0
	dc.b	2,$b8,2,$b8,2,$c0,2,$c8
	dc.b	2,$d0,2,$d0,2,$d8,2,$e0
	dc.b	2,$e8,2,$e8,2,$f0,2,$f8
	dc.b	2,$f8,3,0,3,8,3,$10
	dc.b	3,$10,3,$18,3,' ',3,'('
	dc.b	3,'(',3,'0',3,'8',3,'8'
	dc.b	3,'@',3,'H',3,'P',3,'P'
	dc.b	3,'X',3,'`',3,'h',3,'h'
	dc.b	3,'p',3,'x',3,'x',3,$80
	dc.b	3,$88,3,$90,3,$90,3,$98
	dc.b	3,$a0,3,$a8,3,$a8,3,$b0
	dc.b	3,$b8,3,$b8,3,$c0,3,$c8
	dc.b	3,$d0,3,$d0,3,$d8,3,$e0
	dc.b	3,$e8,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,$18,4,' ',4,'('
	dc.b	4,'0',4,'0',4,'8',4,'@'
	dc.b	4,'H',4,'H',4,'P',4,'X'
	dc.b	4,'`',4,'`',4,'h',4,'p'
	dc.b	4,'x',4,'x',4,$80,4,$88
	dc.b	4,$90,4,$90,4,$98,4,$a0
	dc.b	4,$a8,4,$a8,4,$b0,4,$b8
	dc.b	4,$c0,4,$c8,4,$c8,4,$d0
	dc.b	4,$d8,4,$e0,4,$e0,4,$e8
	dc.b	4,$f0,4,$f8,4,$f8,5,0
	dc.b	5,8,5,$10,5,$10,5,$18
	dc.b	5,' ',5,'(',5,'(',5,'0'
	dc.b	5,'8',5,'@',5,'@',5,'H'
	dc.b	5,'P',5,'X',5,'X',5,'`'
	dc.b	5,'h',5,'p',5,'x',5,'x'
	dc.b	2,'x',2,$80,2,$80,2,$88
	dc.b	2,$90,2,$98,2,$a0,2,$a0
	dc.b	2,$a8,2,$b0,2,$b8,2,$b8
	dc.b	2,$c0,2,$c8,2,$d0,2,$d0
	dc.b	2,$d8,2,$e0,2,$e8,2,$e8
	dc.b	2,$f0,2,$f8,3,0,3,0
	dc.b	3,8,3,$10,3,$18,3,$18
	dc.b	3,' ',3,'(',3,'0',3,'0'
	dc.b	3,'8',3,'@',3,'H',3,'P'
	dc.b	3,'P',3,'X',3,'`',3,'h'
	dc.b	3,'h',3,'p',3,'x',3,$80
	dc.b	3,$80,3,$88,3,$90,3,$98
	dc.b	3,$98,3,$a0,3,$a8,3,$b0
	dc.b	3,$b0,3,$b8,3,$c0,3,$c8
	dc.b	3,$c8,3,$d0,3,$d8,3,$e0
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,$18,4,' ',4,'('
	dc.b	4,'0',4,'8',4,'8',4,'@'
	dc.b	4,'H',4,'P',4,'X',4,'X'
	dc.b	4,'`',4,'h',4,'p',4,'p'
	dc.b	4,'x',4,$80,4,$88,4,$90
	dc.b	4,$90,4,$98,4,$a0,4,$a8
	dc.b	4,$b0,4,$b0,4,$b8,4,$c0
	dc.b	4,$c8,4,$d0,4,$d0,4,$d8
	dc.b	4,$e0,4,$e8,4,$e8,4,$f0
	dc.b	4,$f8,5,0,5,8,5,8
	dc.b	5,$10,5,$18,5,' ',5,'('
	dc.b	5,'(',5,'0',5,'8',5,'@'
	dc.b	5,'H',5,'H',5,'P',5,'X'
	dc.b	5,'`',5,'`',5,'h',5,'p'
	dc.b	5,'x',5,$80,5,$80,5,$88
	dc.b	2,'h',2,'p',2,'x',2,'x'
	dc.b	2,$80,2,$88,2,$90,2,$98
	dc.b	2,$98,2,$a0,2,$a8,2,$b0
	dc.b	2,$b0,2,$b8,2,$c0,2,$c8
	dc.b	2,$d0,2,$d0,2,$d8,2,$e0
	dc.b	2,$e8,2,$f0,2,$f0,2,$f8
	dc.b	3,0,3,8,3,$10,3,$10
	dc.b	3,$18,3,' ',3,'(',3,'('
	dc.b	3,'0',3,'8',3,'@',3,'H'
	dc.b	3,'H',3,'P',3,'X',3,'`'
	dc.b	3,'h',3,'h',3,'p',3,'x'
	dc.b	3,$80,3,$88,3,$88,3,$90
	dc.b	3,$98,3,$a0,3,$a0,3,$a8
	dc.b	3,$b0,3,$b8,3,$c0,3,$c0
	dc.b	3,$c8,3,$d0,3,$d8,3,$e0
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,' ',4,'('
	dc.b	4,'0',4,'8',4,'@',4,'H'
	dc.b	4,'H',4,'P',4,'X',4,'`'
	dc.b	4,'h',4,'h',4,'p',4,'x'
	dc.b	4,$80,4,$88,4,$90,4,$90
	dc.b	4,$98,4,$a0,4,$a8,4,$b0
	dc.b	4,$b0,4,$b8,4,$c0,4,$c8
	dc.b	4,$d0,4,$d8,4,$d8,4,$e0
	dc.b	4,$e8,4,$f0,4,$f8,5,0
	dc.b	5,0,5,8,5,$10,5,$18
	dc.b	5,' ',5,' ',5,'(',5,'0'
	dc.b	5,'8',5,'@',5,'H',5,'H'
	dc.b	5,'P',5,'X',5,'`',5,'h'
	dc.b	5,'h',5,'p',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$90,5,$98
	dc.b	2,'X',2,'`',2,'h',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$88
	dc.b	2,$90,2,$90,2,$98,2,$a0
	dc.b	2,$a8,2,$b0,2,$b0,2,$b8
	dc.b	2,$c0,2,$c8,2,$d0,2,$d8
	dc.b	2,$d8,2,$e0,2,$e8,2,$f0
	dc.b	2,$f8,2,$f8,3,0,3,8
	dc.b	3,$10,3,$18,3,' ',3,' '
	dc.b	3,'(',3,'0',3,'8',3,'@'
	dc.b	3,'H',3,'H',3,'P',3,'X'
	dc.b	3,'`',3,'h',3,'h',3,'p'
	dc.b	3,'x',3,$80,3,$88,3,$90
	dc.b	3,$90,3,$98,3,$a0,3,$a8
	dc.b	3,$b0,3,$b0,3,$b8,3,$c0
	dc.b	3,$c8,3,$d0,3,$d8,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,'(',4,'('
	dc.b	4,'0',4,'8',4,'@',4,'H'
	dc.b	4,'P',4,'X',4,'X',4,'`'
	dc.b	4,'h',4,'p',4,'x',4,$80
	dc.b	4,$88,4,$88,4,$90,4,$98
	dc.b	4,$a0,4,$a8,4,$b0,4,$b8
	dc.b	4,$b8,4,$c0,4,$c8,4,$d0
	dc.b	4,$d8,4,$e0,4,$e8,4,$e8
	dc.b	4,$f0,4,$f8,5,0,5,8
	dc.b	5,$10,5,$18,5,$18,5,' '
	dc.b	5,'(',5,'0',5,'8',5,'@'
	dc.b	5,'H',5,'H',5,'P',5,'X'
	dc.b	5,'`',5,'h',5,'p',5,'x'
	dc.b	5,'x',5,$80,5,$88,5,$90
	dc.b	5,$98,5,$a0,5,$a0,5,$a8
	dc.b	2,'H',2,'P',2,'X',2,'X'
	dc.b	2,'`',2,'h',2,'p',2,'x'
	dc.b	2,$80,2,$80,2,$88,2,$90
	dc.b	2,$98,2,$a0,2,$a8,2,$b0
	dc.b	2,$b0,2,$b8,2,$c0,2,$c8
	dc.b	2,$d0,2,$d8,2,$e0,2,$e0
	dc.b	2,$e8,2,$f0,2,$f8,3,0
	dc.b	3,8,3,$10,3,$10,3,$18
	dc.b	3,' ',3,'(',3,'0',3,'8'
	dc.b	3,'@',3,'@',3,'H',3,'P'
	dc.b	3,'X',3,'`',3,'h',3,'p'
	dc.b	3,'p',3,'x',3,$80,3,$88
	dc.b	3,$90,3,$98,3,$a0,3,$a0
	dc.b	3,$a8,3,$b0,3,$b8,3,$c0
	dc.b	3,$c8,3,$d0,3,$d0,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,'(',4,'0'
	dc.b	4,'8',4,'8',4,'@',4,'H'
	dc.b	4,'P',4,'X',4,'`',4,'h'
	dc.b	4,'p',4,'p',4,'x',4,$80
	dc.b	4,$88,4,$90,4,$98,4,$a0
	dc.b	4,$a8,4,$b0,4,$b0,4,$b8
	dc.b	4,$c0,4,$c8,4,$d0,4,$d8
	dc.b	4,$e0,4,$e8,4,$e8,4,$f0
	dc.b	4,$f8,5,0,5,8,5,$10
	dc.b	5,$18,5,' ',5,' ',5,'('
	dc.b	5,'0',5,'8',5,'@',5,'H'
	dc.b	5,'P',5,'X',5,'`',5,'`'
	dc.b	5,'h',5,'p',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$98,5,$98
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	2,'8',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'`',2,'`',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$88
	dc.b	2,$90,2,$98,2,$98,2,$a0
	dc.b	2,$a8,2,$b0,2,$b8,2,$c0
	dc.b	2,$c8,2,$d0,2,$d8,2,$d8
	dc.b	2,$e0,2,$e8,2,$f0,2,$f8
	dc.b	3,0,3,8,3,$10,3,$10
	dc.b	3,$18,3,' ',3,'(',3,'0'
	dc.b	3,'8',3,'@',3,'H',3,'H'
	dc.b	3,'P',3,'X',3,'`',3,'h'
	dc.b	3,'p',3,'x',3,$80,3,$88
	dc.b	3,$88,3,$90,3,$98,3,$a0
	dc.b	3,$a8,3,$b0,3,$b8,3,$c0
	dc.b	3,$c0,3,$c8,3,$d0,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,'(',4,'0'
	dc.b	4,'8',4,'@',4,'H',4,'P'
	dc.b	4,'X',4,'X',4,'`',4,'h'
	dc.b	4,'p',4,'x',4,$80,4,$88
	dc.b	4,$90,4,$98,4,$a0,4,$a8
	dc.b	4,$b0,4,$b0,4,$b8,4,$c0
	dc.b	4,$c8,4,$d0,4,$d8,4,$e0
	dc.b	4,$e8,4,$f0,4,$f8,5,0
	dc.b	5,8,5,8,5,$10,5,$18
	dc.b	5,' ',5,'(',5,'0',5,'8'
	dc.b	5,'@',5,'H',5,'P',5,'X'
	dc.b	5,'`',5,'`',5,'h',5,'p'
	dc.b	5,'x',5,$80,5,$88,5,$90
	dc.b	5,$98,5,$a0,5,$a8,5,$b0
	dc.b	5,$b8,5,$b8,5,$c0,5,$c8
	dc.b	2,'(',2,'0',2,'8',2,'@'
	dc.b	2,'@',2,'H',2,'P',2,'X'
	dc.b	2,'`',2,'h',2,'p',2,'x'
	dc.b	2,$80,2,$88,2,$90,2,$98
	dc.b	2,$98,2,$a0,2,$a8,2,$b0
	dc.b	2,$b8,2,$c0,2,$c8,2,$d0
	dc.b	2,$d8,2,$e0,2,$e8,2,$f0
	dc.b	2,$f0,2,$f8,3,0,3,8
	dc.b	3,$10,3,$18,3,' ',3,'('
	dc.b	3,'0',3,'8',3,'@',3,'H'
	dc.b	3,'H',3,'P',3,'X',3,'`'
	dc.b	3,'h',3,'p',3,'x',3,$80
	dc.b	3,$88,3,$90,3,$98,3,$a0
	dc.b	3,$a0,3,$a8,3,$b0,3,$b8
	dc.b	3,$c0,3,$c8,3,$d0,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,'(',4,'0'
	dc.b	4,'8',4,'@',4,'H',4,'P'
	dc.b	4,'X',4,'`',4,'h',4,'p'
	dc.b	4,'x',4,$80,4,$88,4,$88
	dc.b	4,$90,4,$98,4,$a0,4,$a8
	dc.b	4,$b0,4,$b8,4,$c0,4,$c8
	dc.b	4,$d0,4,$d8,4,$e0,4,$e8
	dc.b	4,$f0,4,$f8,5,0,5,8
	dc.b	5,$10,5,$10,5,$18,5,' '
	dc.b	5,'(',5,'0',5,'8',5,'@'
	dc.b	5,'H',5,'P',5,'X',5,'`'
	dc.b	5,'h',5,'p',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$98,5,$98
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	5,$c0,5,$c8,5,$d0,5,$d8
	dc.b	2,$18,2,' ',2,'(',2,'0'
	dc.b	2,'8',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'`',2,'`',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$88
	dc.b	2,$90,2,$98,2,$a0,2,$a8
	dc.b	2,$b0,2,$b8,2,$c0,2,$c8
	dc.b	2,$d0,2,$d8,2,$e0,2,$e8
	dc.b	2,$e8,2,$f0,2,$f8,3,0
	dc.b	3,8,3,$10,3,$18,3,' '
	dc.b	3,'(',3,'0',3,'8',3,'@'
	dc.b	3,'H',3,'P',3,'X',3,'`'
	dc.b	3,'h',3,'p',3,'p',3,'x'
	dc.b	3,$80,3,$88,3,$90,3,$98
	dc.b	3,$a0,3,$a8,3,$b0,3,$b8
	dc.b	3,$c0,3,$c8,3,$d0,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,0,4,8,4,$10
	dc.b	4,$18,4,' ',4,'(',4,'0'
	dc.b	4,'8',4,'@',4,'H',4,'P'
	dc.b	4,'X',4,'`',4,'h',4,'p'
	dc.b	4,'x',4,$80,4,$88,4,$90
	dc.b	4,$98,4,$a0,4,$a8,4,$b0
	dc.b	4,$b8,4,$c0,4,$c8,4,$d0
	dc.b	4,$d8,4,$e0,4,$e8,4,$f0
	dc.b	4,$f8,5,0,5,8,5,$10
	dc.b	5,$18,5,' ',5,' ',5,'('
	dc.b	5,'0',5,'8',5,'@',5,'H'
	dc.b	5,'P',5,'X',5,'`',5,'h'
	dc.b	5,'p',5,'x',5,$80,5,$88
	dc.b	5,$90,5,$98,5,$a0,5,$a8
	dc.b	5,$b0,5,$b8,5,$c0,5,$c8
	dc.b	5,$d0,5,$d8,5,$e0,5,$e8
	dc.b	2,8,2,$10,2,$18,2,' '
	dc.b	2,'(',2,'0',2,'8',2,'@'
	dc.b	2,'H',2,'P',2,'X',2,'`'
	dc.b	2,'h',2,'p',2,'x',2,$80
	dc.b	2,$88,2,$90,2,$98,2,$a0
	dc.b	2,$a8,2,$b0,2,$b8,2,$c0
	dc.b	2,$c8,2,$d0,2,$d8,2,$d8
	dc.b	2,$e0,2,$e8,2,$f0,2,$f8
	dc.b	3,0,3,8,3,$10,3,$18
	dc.b	3,' ',3,'(',3,'0',3,'8'
	dc.b	3,'@',3,'H',3,'P',3,'X'
	dc.b	3,'`',3,'h',3,'p',3,'x'
	dc.b	3,$80,3,$88,3,$90,3,$98
	dc.b	3,$a0,3,$a8,3,$b0,3,$b8
	dc.b	3,$c0,3,$c8,3,$d0,3,$d8
	dc.b	3,$e0,3,$e8,3,$f0,3,$f8
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'8'
	dc.b	4,'@',4,'H',4,'P',4,'X'
	dc.b	4,'`',4,'h',4,'p',4,'x'
	dc.b	4,$80,4,$88,4,$90,4,$98
	dc.b	4,$a0,4,$a8,4,$b0,4,$b8
	dc.b	4,$c0,4,$c8,4,$d0,4,$d8
	dc.b	4,$e0,4,$e8,4,$f0,4,$f8
	dc.b	5,0,5,8,5,$10,5,$18
	dc.b	5,' ',5,'(',5,'0',5,'8'
	dc.b	5,'@',5,'H',5,'P',5,'X'
	dc.b	5,'`',5,'h',5,'p',5,'x'
	dc.b	5,$80,5,$88,5,$90,5,$98
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	5,$c0,5,$c8,5,$d0,5,$d8
	dc.b	5,$e0,5,$e8,5,$f0,5,$f8
	dc.b	1,$f8,2,0,2,8,2,$10
	dc.b	2,$18,2,' ',2,'(',2,'0'
	dc.b	2,'8',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'`',2,'h',2,'p'
	dc.b	2,'x',2,$80,2,$88,2,$90
	dc.b	2,$98,2,$a0,2,$a8,2,$b0
	dc.b	2,$b8,2,$c0,2,$c8,2,$d0
	dc.b	2,$d8,2,$e0,2,$e8,2,$f0
	dc.b	2,$f8,3,0,3,8,3,$10
	dc.b	3,$18,3,' ',3,'(',3,'0'
	dc.b	3,'8',3,'@',3,'H',3,'P'
	dc.b	3,'X',3,'`',3,'h',3,'p'
	dc.b	3,'x',3,$80,3,$88,3,$90
	dc.b	3,$98,3,$a0,3,$a8,3,$b0
	dc.b	3,$b8,3,$c0,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'8'
	dc.b	4,'@',4,'H',4,'P',4,'X'
	dc.b	4,'`',4,'h',4,'p',4,'x'
	dc.b	4,$80,4,$88,4,$90,4,$98
	dc.b	4,$a0,4,$a8,4,$b0,4,$b8
	dc.b	4,$c0,4,$c8,4,$d0,4,$d8
	dc.b	4,$e0,4,$e8,4,$f8,5,0
	dc.b	5,8,5,$10,5,$18,5,' '
	dc.b	5,'(',5,'0',5,'8',5,'@'
	dc.b	5,'H',5,'P',5,'X',5,'`'
	dc.b	5,'h',5,'p',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$98,5,$a0
	dc.b	5,$a8,5,$b0,5,$b8,5,$c0
	dc.b	5,$c8,5,$d0,5,$d8,5,$e0
	dc.b	5,$f0,5,$f8,6,0,6,8
	dc.b	1,$e8,1,$f0,1,$f8,2,0
	dc.b	2,8,2,$18,2,' ',2,'('
	dc.b	2,'0',2,'8',2,'@',2,'H'
	dc.b	2,'P',2,'X',2,'`',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$88
	dc.b	2,$90,2,$98,2,$a0,2,$a8
	dc.b	2,$b0,2,$b8,2,$c0,2,$c8
	dc.b	2,$d0,2,$d8,2,$e0,2,$e8
	dc.b	2,$f0,2,$f8,3,0,3,$10
	dc.b	3,$18,3,' ',3,'(',3,'0'
	dc.b	3,'8',3,'@',3,'H',3,'P'
	dc.b	3,'X',3,'`',3,'h',3,'p'
	dc.b	3,'x',3,$80,3,$88,3,$90
	dc.b	3,$98,3,$a0,3,$a8,3,$b0
	dc.b	3,$b8,3,$c0,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'8'
	dc.b	4,'@',4,'H',4,'P',4,'X'
	dc.b	4,'`',4,'h',4,'p',4,'x'
	dc.b	4,$88,4,$90,4,$98,4,$a0
	dc.b	4,$a8,4,$b0,4,$b8,4,$c0
	dc.b	4,$c8,4,$d0,4,$d8,4,$e0
	dc.b	4,$e8,4,$f0,4,$f8,5,8
	dc.b	5,$10,5,$18,5,' ',5,'('
	dc.b	5,'0',5,'8',5,'@',5,'H'
	dc.b	5,'P',5,'X',5,'`',5,'h'
	dc.b	5,'p',5,'x',5,$80,5,$90
	dc.b	5,$98,5,$a0,5,$a8,5,$b0
	dc.b	5,$b8,5,$c0,5,$c8,5,$d0
	dc.b	5,$d8,5,$e0,5,$e8,5,$f0
	dc.b	5,$f8,6,0,6,$10,6,$18
	dc.b	1,$d8,1,$e0,1,$e8,1,$f8
	dc.b	2,0,2,8,2,$10,2,$18
	dc.b	2,' ',2,'(',2,'0',2,'8'
	dc.b	2,'@',2,'H',2,'P',2,'X'
	dc.b	2,'`',2,'h',2,'x',2,$80
	dc.b	2,$88,2,$90,2,$98,2,$a0
	dc.b	2,$a8,2,$b0,2,$b8,2,$c0
	dc.b	2,$c8,2,$d0,2,$d8,2,$e0
	dc.b	2,$e8,2,$f0,3,0,3,8
	dc.b	3,$10,3,$18,3,' ',3,'('
	dc.b	3,'0',3,'8',3,'@',3,'H'
	dc.b	3,'P',3,'X',3,'`',3,'h'
	dc.b	3,'p',3,$80,3,$88,3,$90
	dc.b	3,$98,3,$a0,3,$a8,3,$b0
	dc.b	3,$b8,3,$c0,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'8'
	dc.b	4,'@',4,'H',4,'P',4,'`'
	dc.b	4,'h',4,'p',4,'x',4,$80
	dc.b	4,$88,4,$90,4,$98,4,$a0
	dc.b	4,$a8,4,$b8,4,$c0,4,$c8
	dc.b	4,$d0,4,$d8,4,$e0,4,$e8
	dc.b	4,$f0,4,$f8,5,0,5,$10
	dc.b	5,$18,5,' ',5,'(',5,'0'
	dc.b	5,'8',5,'@',5,'H',5,'P'
	dc.b	5,'X',5,'h',5,'p',5,'x'
	dc.b	5,$80,5,$88,5,$90,5,$98
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	5,$c8,5,$d0,5,$d8,5,$e0
	dc.b	5,$e8,5,$f0,5,$f8,6,0
	dc.b	6,8,6,$10,6,' ',6,'('
	dc.b	1,$c8,1,$d0,1,$d8,1,$e8
	dc.b	1,$f0,1,$f8,2,0,2,8
	dc.b	2,$10,2,$18,2,' ',2,'('
	dc.b	2,'0',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'`',2,'h',2,'p'
	dc.b	2,'x',2,$80,2,$88,2,$90
	dc.b	2,$a0,2,$a8,2,$b0,2,$b8
	dc.b	2,$c0,2,$c8,2,$d0,2,$d8
	dc.b	2,$e0,2,$e8,2,$f8,3,0
	dc.b	3,8,3,$10,3,$18,3,' '
	dc.b	3,'(',3,'0',3,'8',3,'@'
	dc.b	3,'P',3,'X',3,'`',3,'h'
	dc.b	3,'p',3,'x',3,$80,3,$88
	dc.b	3,$90,3,$98,3,$a8,3,$b0
	dc.b	3,$b8,3,$c0,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'8'
	dc.b	4,'@',4,'P',4,'X',4,'`'
	dc.b	4,'h',4,'p',4,'x',4,$80
	dc.b	4,$88,4,$98,4,$a0,4,$a8
	dc.b	4,$b0,4,$b8,4,$c0,4,$c8
	dc.b	4,$d0,4,$d8,4,$e8,4,$f0
	dc.b	4,$f8,5,0,5,8,5,$10
	dc.b	5,$18,5,' ',5,'0',5,'8'
	dc.b	5,'@',5,'H',5,'P',5,'X'
	dc.b	5,'`',5,'h',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$98,5,$a0
	dc.b	5,$a8,5,$b0,5,$b8,5,$c8
	dc.b	5,$d0,5,$d8,5,$e0,5,$e8
	dc.b	5,$f0,5,$f8,6,0,6,$10
	dc.b	6,$18,6,' ',6,'(',6,'0'
	dc.b	1,$c0,1,$c8,1,$d0,1,$d8
	dc.b	1,$e0,1,$e8,1,$f8,2,0
	dc.b	2,8,2,$10,2,$18,2,' '
	dc.b	2,'(',2,'0',2,'@',2,'H'
	dc.b	2,'P',2,'X',2,'`',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$90
	dc.b	2,$98,2,$a0,2,$a8,2,$b0
	dc.b	2,$b8,2,$c0,2,$c8,2,$d8
	dc.b	2,$e0,2,$e8,2,$f0,2,$f8
	dc.b	3,0,3,8,3,$10,3,' '
	dc.b	3,'(',3,'0',3,'8',3,'@'
	dc.b	3,'H',3,'P',3,'X',3,'`'
	dc.b	3,'p',3,'x',3,$80,3,$88
	dc.b	3,$90,3,$98,3,$a0,3,$a8
	dc.b	3,$b8,3,$c0,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'0',4,'@'
	dc.b	4,'H',4,'P',4,'X',4,'`'
	dc.b	4,'h',4,'x',4,$80,4,$88
	dc.b	4,$90,4,$98,4,$a0,4,$a8
	dc.b	4,$b8,4,$c0,4,$c8,4,$d0
	dc.b	4,$d8,4,$e0,4,$f0,4,$f8
	dc.b	5,0,5,8,5,$10,5,$18
	dc.b	5,' ',5,'0',5,'8',5,'@'
	dc.b	5,'H',5,'P',5,'X',5,'h'
	dc.b	5,'p',5,'x',5,$80,5,$88
	dc.b	5,$90,5,$98,5,$a8,5,$b0
	dc.b	5,$b8,5,$c0,5,$c8,5,$d0
	dc.b	5,$e0,5,$e8,5,$f0,5,$f8
	dc.b	6,0,6,8,6,$10,6,' '
	dc.b	6,'(',6,'0',6,'8',6,'@'
	dc.b	1,$b0,1,$b8,1,$c0,1,$c8
	dc.b	1,$d0,1,$d8,1,$e8,1,$f0
	dc.b	1,$f8,2,0,2,8,2,$10
	dc.b	2,$18,2,'(',2,'0',2,'8'
	dc.b	2,'@',2,'H',2,'P',2,'`'
	dc.b	2,'h',2,'p',2,'x',2,$80
	dc.b	2,$88,2,$90,2,$a0,2,$a8
	dc.b	2,$b0,2,$b8,2,$c0,2,$c8
	dc.b	2,$d8,2,$e0,2,$e8,2,$f0
	dc.b	2,$f8,3,0,3,8,3,$18
	dc.b	3,' ',3,'(',3,'0',3,'8'
	dc.b	3,'@',3,'P',3,'X',3,'`'
	dc.b	3,'h',3,'p',3,'x',3,$80
	dc.b	3,$90,3,$98,3,$a0,3,$a8
	dc.b	3,$b0,3,$b8,3,$c8,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'(',4,'8',4,'@'
	dc.b	4,'H',4,'P',4,'X',4,'h'
	dc.b	4,'p',4,'x',4,$80,4,$88
	dc.b	4,$98,4,$a0,4,$a8,4,$b0
	dc.b	4,$b8,4,$c0,4,$d0,4,$d8
	dc.b	4,$e0,4,$e8,4,$f0,5,0
	dc.b	5,8,5,$10,5,$18,5,' '
	dc.b	5,'0',5,'8',5,'@',5,'H'
	dc.b	5,'P',5,'X',5,'h',5,'p'
	dc.b	5,'x',5,$80,5,$88,5,$98
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	5,$c8,5,$d0,5,$d8,5,$e0
	dc.b	5,$e8,5,$f8,6,0,6,8
	dc.b	6,$10,6,$18,6,' ',6,'0'
	dc.b	6,'8',6,'@',6,'H',6,'P'
	dc.b	1,$98,1,$a8,1,$b0,1,$b8
	dc.b	1,$c0,1,$c8,1,$d8,1,$e0
	dc.b	1,$e8,1,$f0,1,$f8,2,0
	dc.b	2,$10,2,$18,2,' ',2,'('
	dc.b	2,'0',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'`',2,'p',2,'x'
	dc.b	2,$80,2,$88,2,$90,2,$a0
	dc.b	2,$a8,2,$b0,2,$b8,2,$c0
	dc.b	2,$c8,2,$d8,2,$e0,2,$e8
	dc.b	2,$f0,2,$f8,3,8,3,$10
	dc.b	3,$18,3,' ',3,'(',3,'8'
	dc.b	3,'@',3,'H',3,'P',3,'X'
	dc.b	3,'`',3,'p',3,'x',3,$80
	dc.b	3,$88,3,$90,3,$a0,3,$a8
	dc.b	3,$b0,3,$b8,3,$c0,3,$d0
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'0',4,'8',4,'@'
	dc.b	4,'H',4,'P',4,'`',4,'h'
	dc.b	4,'p',4,'x',4,$80,4,$90
	dc.b	4,$98,4,$a0,4,$a8,4,$b8
	dc.b	4,$c0,4,$c8,4,$d0,4,$d8
	dc.b	4,$e8,4,$f0,4,$f8,5,0
	dc.b	5,8,5,$18,5,' ',5,'('
	dc.b	5,'0',5,'@',5,'H',5,'P'
	dc.b	5,'X',5,'`',5,'p',5,'x'
	dc.b	5,$80,5,$88,5,$90,5,$a0
	dc.b	5,$a8,5,$b0,5,$b8,5,$c8
	dc.b	5,$d0,5,$d8,5,$e0,5,$e8
	dc.b	5,$f8,6,0,6,8,6,$10
	dc.b	6,$18,6,'(',6,'0',6,'8'
	dc.b	6,'@',6,'H',6,'X',6,'`'
	dc.b	1,$90,1,$98,1,$a0,1,$b0
	dc.b	1,$b8,1,$c0,1,$c8,1,$d0
	dc.b	1,$e0,1,$e8,1,$f0,1,$f8
	dc.b	2,0,2,$10,2,$18,2,' '
	dc.b	2,'(',2,'0',2,'@',2,'H'
	dc.b	2,'P',2,'X',2,'h',2,'p'
	dc.b	2,'x',2,$80,2,$88,2,$98
	dc.b	2,$a0,2,$a8,2,$b0,2,$b8
	dc.b	2,$c8,2,$d0,2,$d8,2,$e0
	dc.b	2,$f0,2,$f8,3,0,3,8
	dc.b	3,$10,3,' ',3,'(',3,'0'
	dc.b	3,'8',3,'@',3,'P',3,'X'
	dc.b	3,'`',3,'h',3,'x',3,$80
	dc.b	3,$88,3,$90,3,$98,3,$a8
	dc.b	3,$b0,3,$b8,3,$c0,3,$c8
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,' ',4,'0',4,'8',4,'@'
	dc.b	4,'H',4,'X',4,'`',4,'h'
	dc.b	4,'p',4,$80,4,$88,4,$90
	dc.b	4,$98,4,$a8,4,$b0,4,$b8
	dc.b	4,$c0,4,$c8,4,$d8,4,$e0
	dc.b	4,$e8,4,$f0,5,0,5,8
	dc.b	5,$10,5,$18,5,'(',5,'0'
	dc.b	5,'8',5,'@',5,'P',5,'X'
	dc.b	5,'`',5,'h',5,'x',5,$80
	dc.b	5,$88,5,$90,5,$98,5,$a8
	dc.b	5,$b0,5,$b8,5,$c0,5,$d0
	dc.b	5,$d8,5,$e0,5,$e8,5,$f8
	dc.b	6,0,6,8,6,$10,6,' '
	dc.b	6,'(',6,'0',6,'8',6,'H'
	dc.b	6,'P',6,'X',6,'`',6,'h'
	dc.b	1,$80,1,$90,1,$98,1,$a0
	dc.b	1,$a8,1,$b0,1,$c0,1,$c8
	dc.b	1,$d0,1,$d8,1,$e8,1,$f0
	dc.b	1,$f8,2,0,2,$10,2,$18
	dc.b	2,' ',2,'(',2,'8',2,'@'
	dc.b	2,'H',2,'P',2,'`',2,'h'
	dc.b	2,'p',2,'x',2,$80,2,$90
	dc.b	2,$98,2,$a0,2,$a8,2,$b8
	dc.b	2,$c0,2,$c8,2,$d0,2,$e0
	dc.b	2,$e8,2,$f0,2,$f8,3,8
	dc.b	3,$10,3,$18,3,' ',3,'0'
	dc.b	3,'8',3,'@',3,'H',3,'P'
	dc.b	3,'`',3,'h',3,'p',3,'x'
	dc.b	3,$88,3,$90,3,$98,3,$a0
	dc.b	3,$b0,3,$b8,3,$c0,3,$c8
	dc.b	3,$d8,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,'(',4,'0',4,'8',4,'@'
	dc.b	4,'P',4,'X',4,'`',4,'p'
	dc.b	4,'x',4,$80,4,$88,4,$98
	dc.b	4,$a0,4,$a8,4,$b0,4,$c0
	dc.b	4,$c8,4,$d0,4,$e0,4,$e8
	dc.b	4,$f0,4,$f8,5,8,5,$10
	dc.b	5,$18,5,' ',5,'0',5,'8'
	dc.b	5,'@',5,'P',5,'X',5,'`'
	dc.b	5,'h',5,'x',5,$80,5,$88
	dc.b	5,$98,5,$a0,5,$a8,5,$b0
	dc.b	5,$c0,5,$c8,5,$d0,5,$d8
	dc.b	5,$e8,5,$f0,5,$f8,6,8
	dc.b	6,$10,6,$18,6,' ',6,'0'
	dc.b	6,'8',6,'@',6,'H',6,'X'
	dc.b	6,'`',6,'h',6,'x',6,$80
	dc.b	1,'p',1,'x',1,$80,1,$90
	dc.b	1,$98,1,$a0,1,$b0,1,$b8
	dc.b	1,$c0,1,$c8,1,$d8,1,$e0
	dc.b	1,$e8,1,$f0,2,0,2,8
	dc.b	2,$10,2,' ',2,'(',2,'0'
	dc.b	2,'8',2,'H',2,'P',2,'X'
	dc.b	2,'`',2,'p',2,'x',2,$80
	dc.b	2,$90,2,$98,2,$a0,2,$a8
	dc.b	2,$b8,2,$c0,2,$c8,2,$d8
	dc.b	2,$e0,2,$e8,2,$f0,3,0
	dc.b	3,8,3,$10,3,$18,3,'('
	dc.b	3,'0',3,'8',3,'H',3,'P'
	dc.b	3,'X',3,'`',3,'p',3,'x'
	dc.b	3,$80,3,$88,3,$98,3,$a0
	dc.b	3,$a8,3,$b8,3,$c0,3,$c8
	dc.b	3,$d0,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,'(',4,'0',4,'8',4,'H'
	dc.b	4,'P',4,'X',4,'h',4,'p'
	dc.b	4,'x',4,$80,4,$90,4,$98
	dc.b	4,$a0,4,$b0,4,$b8,4,$c0
	dc.b	4,$d0,4,$d8,4,$e0,4,$e8
	dc.b	4,$f8,5,0,5,8,5,$18
	dc.b	5,' ',5,'(',5,'8',5,'@'
	dc.b	5,'H',5,'P',5,'`',5,'h'
	dc.b	5,'p',5,$80,5,$88,5,$90
	dc.b	5,$a0,5,$a8,5,$b0,5,$b8
	dc.b	5,$c8,5,$d0,5,$d8,5,$e8
	dc.b	5,$f0,5,$f8,6,8,6,$10
	dc.b	6,$18,6,' ',6,'0',6,'8'
	dc.b	6,'@',6,'P',6,'X',6,'`'
	dc.b	6,'p',6,'x',6,$80,6,$88
	dc.b	1,'`',1,'p',1,'x',1,$80
	dc.b	1,$88,1,$98,1,$a0,1,$a8
	dc.b	1,$b8,1,$c0,1,$c8,1,$d8
	dc.b	1,$e0,1,$e8,1,$f0,2,0
	dc.b	2,8,2,$10,2,' ',2,'('
	dc.b	2,'0',2,'@',2,'H',2,'P'
	dc.b	2,'X',2,'h',2,'p',2,'x'
	dc.b	2,$88,2,$90,2,$98,2,$a8
	dc.b	2,$b0,2,$b8,2,$c0,2,$d0
	dc.b	2,$d8,2,$e0,2,$f0,2,$f8
	dc.b	3,0,3,$10,3,$18,3,' '
	dc.b	3,'(',3,'8',3,'@',3,'H'
	dc.b	3,'X',3,'`',3,'h',3,'x'
	dc.b	3,$80,3,$88,3,$90,3,$a0
	dc.b	3,$a8,3,$b0,3,$c0,3,$c8
	dc.b	3,$d0,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,$18
	dc.b	4,'(',4,'0',4,'8',4,'H'
	dc.b	4,'P',4,'X',4,'h',4,'p'
	dc.b	4,'x',4,$88,4,$90,4,$98
	dc.b	4,$a8,4,$b0,4,$b8,4,$c8
	dc.b	4,$d0,4,$d8,4,$e8,4,$f0
	dc.b	4,$f8,5,8,5,$10,5,$18
	dc.b	5,'(',5,'0',5,'8',5,'H'
	dc.b	5,'P',5,'X',5,'h',5,'p'
	dc.b	5,'x',5,$88,5,$90,5,$98
	dc.b	5,$a8,5,$b0,5,$b8,5,$c8
	dc.b	5,$d0,5,$d8,5,$e8,5,$f0
	dc.b	5,$f8,6,8,6,$10,6,$18
	dc.b	6,'(',6,'0',6,'8',6,'H'
	dc.b	6,'P',6,'X',6,'`',6,'p'
	dc.b	6,'x',6,$80,6,$90,6,$98
	dc.b	1,'X',1,'`',1,'h',1,'x'
	dc.b	1,$80,1,$88,1,$98,1,$a0
	dc.b	1,$a8,1,$b0,1,$c0,1,$c8
	dc.b	1,$d0,1,$e0,1,$e8,1,$f0
	dc.b	2,0,2,8,2,$10,2,' '
	dc.b	2,'(',2,'0',2,'@',2,'H'
	dc.b	2,'P',2,'`',2,'h',2,'p'
	dc.b	2,$80,2,$88,2,$90,2,$a0
	dc.b	2,$a8,2,$b0,2,$c0,2,$c8
	dc.b	2,$d0,2,$e0,2,$e8,2,$f0
	dc.b	3,0,3,8,3,$10,3,' '
	dc.b	3,'(',3,'0',3,'@',3,'H'
	dc.b	3,'P',3,'`',3,'h',3,'p'
	dc.b	3,$80,3,$88,3,$90,3,$a0
	dc.b	3,$a8,3,$b0,3,$c0,3,$c8
	dc.b	3,$d0,3,$e0,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'0',4,'@',4,'H'
	dc.b	4,'P',4,'`',4,'h',4,'p'
	dc.b	4,$80,4,$88,4,$90,4,$a0
	dc.b	4,$a8,4,$b8,4,$c0,4,$c8
	dc.b	4,$d8,4,$e0,4,$e8,4,$f8
	dc.b	5,0,5,8,5,$18,5,' '
	dc.b	5,'(',5,'8',5,'@',5,'H'
	dc.b	5,'X',5,'`',5,'p',5,'x'
	dc.b	5,$80,5,$90,5,$98,5,$a0
	dc.b	5,$b0,5,$b8,5,$c0,5,$d0
	dc.b	5,$d8,5,$e0,5,$f0,5,$f8
	dc.b	6,0,6,$10,6,$18,6,'('
	dc.b	6,'0',6,'8',6,'H',6,'P'
	dc.b	6,'X',6,'h',6,'p',6,'x'
	dc.b	6,$88,6,$90,6,$98,6,$a8
	dc.b	1,'H',1,'P',1,'`',1,'h'
	dc.b	1,'p',1,$80,1,$88,1,$90
	dc.b	1,$a0,1,$a8,1,$b0,1,$c0
	dc.b	1,$c8,1,$d0,1,$e0,1,$e8
	dc.b	1,$f8,2,0,2,8,2,$18
	dc.b	2,' ',2,'(',2,'8',2,'@'
	dc.b	2,'H',2,'X',2,'`',2,'h'
	dc.b	2,'x',2,$80,2,$88,2,$98
	dc.b	2,$a0,2,$b0,2,$b8,2,$c0
	dc.b	2,$d0,2,$d8,2,$e0,2,$f0
	dc.b	2,$f8,3,0,3,$10,3,$18
	dc.b	3,' ',3,'0',3,'8',3,'@'
	dc.b	3,'P',3,'X',3,'h',3,'p'
	dc.b	3,'x',3,$88,3,$90,3,$98
	dc.b	3,$a8,3,$b0,3,$b8,3,$c8
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'0',4,'@',4,'H'
	dc.b	4,'X',4,'`',4,'h',4,'x'
	dc.b	4,$80,4,$88,4,$98,4,$a0
	dc.b	4,$b0,4,$b8,4,$c0,4,$d0
	dc.b	4,$d8,4,$e8,4,$f0,4,$f8
	dc.b	5,8,5,$10,5,$18,5,'('
	dc.b	5,'0',5,'@',5,'H',5,'P'
	dc.b	5,'`',5,'h',5,'p',5,$80
	dc.b	5,$88,5,$98,5,$a0,5,$a8
	dc.b	5,$b8,5,$c0,5,$d0,5,$d8
	dc.b	5,$e0,5,$f0,5,$f8,6,0
	dc.b	6,$10,6,$18,6,'(',6,'0'
	dc.b	6,'8',6,'H',6,'P',6,'X'
	dc.b	6,'h',6,'p',6,$80,6,$88
	dc.b	6,$90,6,$a0,6,$a8,6,$b8
	dc.b	1,'8',1,'@',1,'P',1,'X'
	dc.b	1,'h',1,'p',1,'x',1,$88
	dc.b	1,$90,1,$a0,1,$a8,1,$b0
	dc.b	1,$c0,1,$c8,1,$d0,1,$e0
	dc.b	1,$e8,1,$f8,2,0,2,8
	dc.b	2,$18,2,' ',2,'(',2,'8'
	dc.b	2,'@',2,'P',2,'X',2,'`'
	dc.b	2,'p',2,'x',2,$88,2,$90
	dc.b	2,$98,2,$a8,2,$b0,2,$b8
	dc.b	2,$c8,2,$d0,2,$e0,2,$e8
	dc.b	2,$f0,3,0,3,8,3,$10
	dc.b	3,' ',3,'(',3,'8',3,'@'
	dc.b	3,'H',3,'X',3,'`',3,'p'
	dc.b	3,'x',3,$80,3,$90,3,$98
	dc.b	3,$a0,3,$b0,3,$b8,3,$c8
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'8',4,'@',4,'H'
	dc.b	4,'X',4,'`',4,'p',4,'x'
	dc.b	4,$80,4,$90,4,$98,4,$a8
	dc.b	4,$b0,4,$b8,4,$c8,4,$d0
	dc.b	4,$e0,4,$e8,4,$f8,5,0
	dc.b	5,8,5,$18,5,' ',5,'0'
	dc.b	5,'8',5,'@',5,'P',5,'X'
	dc.b	5,'h',5,'p',5,'x',5,$88
	dc.b	5,$90,5,$a0,5,$a8,5,$b0
	dc.b	5,$c0,5,$c8,5,$d8,5,$e0
	dc.b	5,$f0,5,$f8,6,0,6,$10
	dc.b	6,$18,6,'(',6,'0',6,'8'
	dc.b	6,'H',6,'P',6,'`',6,'h'
	dc.b	6,'p',6,$80,6,$88,6,$98
	dc.b	6,$a0,6,$a8,6,$b8,6,$c0
	dc.b	1,'(',1,'8',1,'@',1,'P'
	dc.b	1,'X',1,'`',1,'p',1,'x'
	dc.b	1,$88,1,$90,1,$98,1,$a8
	dc.b	1,$b0,1,$c0,1,$c8,1,$d0
	dc.b	1,$e0,1,$e8,1,$f8,2,0
	dc.b	2,8,2,$18,2,' ',2,'0'
	dc.b	2,'8',2,'H',2,'P',2,'X'
	dc.b	2,'h',2,'p',2,$80,2,$88
	dc.b	2,$90,2,$a0,2,$a8,2,$b8
	dc.b	2,$c0,2,$c8,2,$d8,2,$e0
	dc.b	2,$f0,2,$f8,3,0,3,$10
	dc.b	3,$18,3,'(',3,'0',3,'@'
	dc.b	3,'H',3,'P',3,'`',3,'h'
	dc.b	3,'x',3,$80,3,$88,3,$98
	dc.b	3,$a0,3,$b0,3,$b8,3,$c0
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'8',4,'@',4,'P'
	dc.b	4,'X',4,'`',4,'p',4,'x'
	dc.b	4,$88,4,$90,4,$a0,4,$a8
	dc.b	4,$b8,4,$c0,4,$c8,4,$d8
	dc.b	4,$e0,4,$f0,4,$f8,5,8
	dc.b	5,$10,5,$18,5,'(',5,'0'
	dc.b	5,'@',5,'H',5,'X',5,'`'
	dc.b	5,'p',5,'x',5,$80,5,$90
	dc.b	5,$98,5,$a8,5,$b0,5,$c0
	dc.b	5,$c8,5,$d0,5,$e0,5,$e8
	dc.b	5,$f8,6,0,6,$10,6,$18
	dc.b	6,'(',6,'0',6,'8',6,'H'
	dc.b	6,'P',6,'`',6,'h',6,'x'
	dc.b	6,$80,6,$88,6,$98,6,$a0
	dc.b	6,$b0,6,$b8,6,$c8,6,$d0
	dc.b	1,$18,1,'(',1,'0',1,'@'
	dc.b	1,'H',1,'X',1,'`',1,'p'
	dc.b	1,'x',1,$80,1,$90,1,$98
	dc.b	1,$a8,1,$b0,1,$c0,1,$c8
	dc.b	1,$d0,1,$e0,1,$e8,1,$f8
	dc.b	2,0,2,$10,2,$18,2,'('
	dc.b	2,'0',2,'8',2,'H',2,'P'
	dc.b	2,'`',2,'h',2,'x',2,$80
	dc.b	2,$88,2,$98,2,$a0,2,$b0
	dc.b	2,$b8,2,$c8,2,$d0,2,$e0
	dc.b	2,$e8,2,$f0,3,0,3,8
	dc.b	3,$18,3,' ',3,'0',3,'8'
	dc.b	3,'@',3,'P',3,'X',3,'h'
	dc.b	3,'p',3,$80,3,$88,3,$98
	dc.b	3,$a0,3,$a8,3,$b8,3,$c0
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'8',4,'@',4,'P'
	dc.b	4,'X',4,'h',4,'p',4,$80
	dc.b	4,$88,4,$98,4,$a0,4,$b0
	dc.b	4,$b8,4,$c0,4,$d0,4,$d8
	dc.b	4,$e8,4,$f0,5,0,5,8
	dc.b	5,$18,5,' ',5,'0',5,'8'
	dc.b	5,'H',5,'P',5,'`',5,'h'
	dc.b	5,'p',5,$80,5,$88,5,$98
	dc.b	5,$a0,5,$b0,5,$b8,5,$c8
	dc.b	5,$d0,5,$e0,5,$e8,5,$f8
	dc.b	6,0,6,$10,6,$18,6,' '
	dc.b	6,'0',6,'8',6,'H',6,'P'
	dc.b	6,'`',6,'h',6,'x',6,$80
	dc.b	6,$90,6,$98,6,$a8,6,$b0
	dc.b	6,$c0,6,$c8,6,$d0,6,$e0
	dc.b	1,$10,1,$18,1,'(',1,'0'
	dc.b	1,'8',1,'H',1,'P',1,'`'
	dc.b	1,'h',1,'x',1,$80,1,$90
	dc.b	1,$98,1,$a8,1,$b0,1,$c0
	dc.b	1,$c8,1,$d8,1,$e0,1,$e8
	dc.b	1,$f8,2,0,2,$10,2,$18
	dc.b	2,'(',2,'0',2,'@',2,'H'
	dc.b	2,'X',2,'`',2,'p',2,'x'
	dc.b	2,$88,2,$90,2,$98,2,$a8
	dc.b	2,$b0,2,$c0,2,$c8,2,$d8
	dc.b	2,$e0,2,$f0,2,$f8,3,8
	dc.b	3,$10,3,' ',3,'(',3,'8'
	dc.b	3,'@',3,'H',3,'X',3,'`'
	dc.b	3,'p',3,'x',3,$88,3,$90
	dc.b	3,$a0,3,$a8,3,$b8,3,$c0
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$10,4,' '
	dc.b	4,'(',4,'8',4,'@',4,'P'
	dc.b	4,'X',4,'h',4,'p',4,$80
	dc.b	4,$88,4,$98,4,$a0,4,$b0
	dc.b	4,$b8,4,$c8,4,$d0,4,$e0
	dc.b	4,$e8,4,$f8,5,0,5,$10
	dc.b	5,$18,5,'(',5,'0',5,'@'
	dc.b	5,'H',5,'X',5,'`',5,'p'
	dc.b	5,'x',5,$88,5,$90,5,$a0
	dc.b	5,$a8,5,$b8,5,$c0,5,$d0
	dc.b	5,$d8,5,$e8,5,$f0,6,0
	dc.b	6,8,6,$18,6,' ',6,'0'
	dc.b	6,'8',6,'H',6,'P',6,'`'
	dc.b	6,'h',6,'x',6,$80,6,$90
	dc.b	6,$98,6,$a8,6,$b0,6,$c0
	dc.b	6,$c8,6,$d8,6,$e0,6,$f0
	dc.b	1,0,1,8,1,$18,1,' '
	dc.b	1,'0',1,'8',1,'H',1,'P'
	dc.b	1,'`',1,'h',1,'x',1,$80
	dc.b	1,$90,1,$98,1,$a8,1,$b0
	dc.b	1,$c0,1,$c8,1,$d8,1,$e0
	dc.b	1,$f0,1,$f8,2,8,2,$10
	dc.b	2,' ',2,'(',2,'8',2,'@'
	dc.b	2,'P',2,'X',2,'h',2,'p'
	dc.b	2,$80,2,$88,2,$98,2,$a0
	dc.b	2,$b0,2,$b8,2,$c8,2,$d0
	dc.b	2,$e0,2,$e8,2,$f8,3,0
	dc.b	3,$10,3,$18,3,'(',3,'0'
	dc.b	3,'@',3,'H',3,'X',3,'`'
	dc.b	3,'p',3,'x',3,$88,3,$90
	dc.b	3,$a0,3,$a8,3,$b8,3,$c0
	dc.b	3,$d0,3,$d8,3,$e8,3,$f0
	dc.b	4,0,4,8,4,$18,4,' '
	dc.b	4,'0',4,'8',4,'H',4,'P'
	dc.b	4,'`',4,'h',4,'x',4,$80
	dc.b	4,$90,4,$98,4,$a8,4,$b0
	dc.b	4,$c0,4,$c8,4,$d8,4,$e8
	dc.b	4,$f0,5,0,5,8,5,$18
	dc.b	5,' ',5,'0',5,'8',5,'H'
	dc.b	5,'P',5,'`',5,'h',5,'x'
	dc.b	5,$80,5,$90,5,$98,5,$a8
	dc.b	5,$b0,5,$c0,5,$d0,5,$d8
	dc.b	5,$e8,5,$f0,6,0,6,8
	dc.b	6,$18,6,' ',6,'0',6,'8'
	dc.b	6,'H',6,'P',6,'`',6,'h'
	dc.b	6,'x',6,$80,6,$90,6,$98
	dc.b	6,$a8,6,$b8,6,$c0,6,$d0
	dc.b	6,$d8,6,$e8,6,$f0,7,0
	dc.b	0,$f0,0,$f8,1,8,1,$10
	dc.b	1,' ',1,'(',1,'8',1,'@'
	dc.b	1,'P',1,'`',1,'h',1,'x'
	dc.b	1,$80,1,$90,1,$98,1,$a8
	dc.b	1,$b0,1,$c0,1,$c8,1,$d8
	dc.b	1,$e0,1,$f0,1,$f8,2,8
	dc.b	2,$10,2,' ',2,'(',2,'8'
	dc.b	2,'H',2,'P',2,'`',2,'h'
	dc.b	2,'x',2,$80,2,$90,2,$98
	dc.b	2,$a8,2,$b0,2,$c0,2,$c8
	dc.b	2,$d8,2,$e0,2,$f0,2,$f8
	dc.b	3,8,3,$10,3,' ',3,'0'
	dc.b	3,'8',3,'H',3,'P',3,'`'
	dc.b	3,'h',3,'x',3,$80,3,$90
	dc.b	3,$98,3,$a8,3,$b0,3,$c0
	dc.b	3,$c8,3,$d8,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,' '
	dc.b	4,'0',4,'8',4,'H',4,'P'
	dc.b	4,'`',4,'p',4,'x',4,$88
	dc.b	4,$90,4,$a0,4,$a8,4,$b8
	dc.b	4,$c0,4,$d0,4,$e0,4,$e8
	dc.b	4,$f8,5,0,5,$10,5,$18
	dc.b	5,'(',5,'0',5,'@',5,'P'
	dc.b	5,'X',5,'h',5,'p',5,$80
	dc.b	5,$88,5,$98,5,$a0,5,$b0
	dc.b	5,$c0,5,$c8,5,$d8,5,$e0
	dc.b	5,$f0,5,$f8,6,8,6,$10
	dc.b	6,' ',6,'0',6,'8',6,'H'
	dc.b	6,'P',6,'`',6,'h',6,'x'
	dc.b	6,$80,6,$90,6,$a0,6,$a8
	dc.b	6,$b8,6,$c0,6,$d0,6,$d8
	dc.b	6,$e8,6,$f8,7,0,7,$10
	dc.b	0,$e0,0,$e8,0,$f8,1,0
	dc.b	1,$10,1,' ',1,'(',1,'8'
	dc.b	1,'@',1,'P',1,'X',1,'h'
	dc.b	1,'x',1,$80,1,$90,1,$98
	dc.b	1,$a8,1,$b0,1,$c0,1,$c8
	dc.b	1,$d8,1,$e8,1,$f0,2,0
	dc.b	2,8,2,$18,2,' ',2,'0'
	dc.b	2,'8',2,'H',2,'X',2,'`'
	dc.b	2,'p',2,'x',2,$88,2,$90
	dc.b	2,$a0,2,$a8,2,$b8,2,$c8
	dc.b	2,$d0,2,$e0,2,$e8,2,$f8
	dc.b	3,0,3,$10,3,$18,3,'('
	dc.b	3,'8',3,'@',3,'P',3,'X'
	dc.b	3,'h',3,'p',3,$80,3,$88
	dc.b	3,$98,3,$a8,3,$b0,3,$c0
	dc.b	3,$c8,3,$d8,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,' '
	dc.b	4,'0',4,'8',4,'H',4,'X'
	dc.b	4,'`',4,'p',4,'x',4,$88
	dc.b	4,$98,4,$a0,4,$b0,4,$b8
	dc.b	4,$c8,4,$d8,4,$e0,4,$f0
	dc.b	4,$f8,5,8,5,$10,5,' '
	dc.b	5,'0',5,'8',5,'H',5,'P'
	dc.b	5,'`',5,'p',5,'x',5,$88
	dc.b	5,$90,5,$a0,5,$b0,5,$b8
	dc.b	5,$c8,5,$d0,5,$e0,5,$e8
	dc.b	5,$f8,6,8,6,$10,6,' '
	dc.b	6,'(',6,'8',6,'H',6,'P'
	dc.b	6,'`',6,'h',6,'x',6,$88
	dc.b	6,$90,6,$a0,6,$a8,6,$b8
	dc.b	6,$c0,6,$d0,6,$e0,6,$e8
	dc.b	6,$f8,7,0,7,$10,7,' '
	dc.b	0,$d0,0,$d8,0,$e8,0,$f8
	dc.b	1,0,1,$10,1,$18,1,'('
	dc.b	1,'8',1,'@',1,'P',1,'X'
	dc.b	1,'h',1,'p',1,$80,1,$90
	dc.b	1,$98,1,$a8,1,$b0,1,$c0
	dc.b	1,$d0,1,$d8,1,$e8,1,$f0
	dc.b	2,0,2,$10,2,$18,2,'('
	dc.b	2,'0',2,'@',2,'H',2,'X'
	dc.b	2,'h',2,'p',2,$80,2,$88
	dc.b	2,$98,2,$a8,2,$b0,2,$c0
	dc.b	2,$c8,2,$d8,2,$e8,2,$f0
	dc.b	3,0,3,8,3,$18,3,' '
	dc.b	3,'0',3,'@',3,'H',3,'X'
	dc.b	3,'`',3,'p',3,$80,3,$88
	dc.b	3,$98,3,$a0,3,$b0,3,$c0
	dc.b	3,$c8,3,$d8,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,' '
	dc.b	4,'0',4,'@',4,'H',4,'X'
	dc.b	4,'`',4,'p',4,$80,4,$88
	dc.b	4,$98,4,$a8,4,$b0,4,$c0
	dc.b	4,$c8,4,$d8,4,$e8,4,$f0
	dc.b	5,0,5,$10,5,$18,5,'('
	dc.b	5,'0',5,'@',5,'P',5,'X'
	dc.b	5,'h',5,'x',5,$80,5,$90
	dc.b	5,$98,5,$a8,5,$b8,5,$c0
	dc.b	5,$d0,5,$d8,5,$e8,5,$f8
	dc.b	6,0,6,$10,6,' ',6,'('
	dc.b	6,'8',6,'@',6,'P',6,'`'
	dc.b	6,'h',6,'x',6,$88,6,$90
	dc.b	6,$a0,6,$a8,6,$b8,6,$c8
	dc.b	6,$d0,6,$e0,6,$f0,6,$f8
	dc.b	7,8,7,$10,7,' ',7,'0'
	dc.b	0,$c0,0,$c8,0,$d8,0,$e8
	dc.b	0,$f0,1,0,1,8,1,$18
	dc.b	1,'(',1,'0',1,'@',1,'P'
	dc.b	1,'X',1,'h',1,'p',1,$80
	dc.b	1,$90,1,$98,1,$a8,1,$b8
	dc.b	1,$c0,1,$d0,1,$d8,1,$e8
	dc.b	1,$f8,2,0,2,$10,2,' '
	dc.b	2,'(',2,'8',2,'@',2,'P'
	dc.b	2,'`',2,'h',2,'x',2,$80
	dc.b	2,$90,2,$a0,2,$a8,2,$b8
	dc.b	2,$c8,2,$d0,2,$e0,2,$e8
	dc.b	2,$f8,3,8,3,$10,3,' '
	dc.b	3,'0',3,'8',3,'H',3,'P'
	dc.b	3,'`',3,'p',3,'x',3,$88
	dc.b	3,$98,3,$a0,3,$b0,3,$b8
	dc.b	3,$c8,3,$d8,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,' '
	dc.b	4,'0',4,'@',4,'H',4,'X'
	dc.b	4,'h',4,'p',4,$80,4,$90
	dc.b	4,$98,4,$a8,4,$b0,4,$c0
	dc.b	4,$d0,4,$d8,4,$e8,4,$f8
	dc.b	5,0,5,$10,5,' ',5,'('
	dc.b	5,'8',5,'@',5,'P',5,'`'
	dc.b	5,'h',5,'x',5,$88,5,$90
	dc.b	5,$a0,5,$b0,5,$b8,5,$c8
	dc.b	5,$d0,5,$e0,5,$f0,5,$f8
	dc.b	6,8,6,$18,6,' ',6,'0'
	dc.b	6,'@',6,'H',6,'X',6,'`'
	dc.b	6,'p',6,$80,6,$88,6,$98
	dc.b	6,$a8,6,$b0,6,$c0,6,$d0
	dc.b	6,$d8,6,$e8,6,$f0,7,0
	dc.b	7,$10,7,$18,7,'(',7,'8'
	dc.b	0,$b8,0,$c0,0,$d0,0,$e0
	dc.b	0,$e8,0,$f8,1,8,1,$10
	dc.b	1,' ',1,'(',1,'8',1,'H'
	dc.b	1,'P',1,'`',1,'p',1,'x'
	dc.b	1,$88,1,$98,1,$a0,1,$b0
	dc.b	1,$b8,1,$c8,1,$d8,1,$e0
	dc.b	1,$f0,2,0,2,8,2,$18
	dc.b	2,'(',2,'0',2,'@',2,'H'
	dc.b	2,'X',2,'h',2,'p',2,$80
	dc.b	2,$90,2,$98,2,$a8,2,$b8
	dc.b	2,$c0,2,$d0,2,$d8,2,$e8
	dc.b	2,$f8,3,0,3,$10,3,' '
	dc.b	3,'(',3,'8',3,'H',3,'P'
	dc.b	3,'`',3,'h',3,'x',3,$88
	dc.b	3,$90,3,$a0,3,$b0,3,$b8
	dc.b	3,$c8,3,$d8,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'0',4,'@',4,'P',4,'X'
	dc.b	4,'h',4,'x',4,$80,4,$90
	dc.b	4,$a0,4,$a8,4,$b8,4,$c8
	dc.b	4,$d0,4,$e0,4,$f0,4,$f8
	dc.b	5,8,5,$18,5,' ',5,'0'
	dc.b	5,'@',5,'H',5,'X',5,'h'
	dc.b	5,'p',5,$80,5,$90,5,$98
	dc.b	5,$a8,5,$b8,5,$c0,5,$d0
	dc.b	5,$e0,5,$e8,5,$f8,6,8
	dc.b	6,$10,6,' ',6,'0',6,'8'
	dc.b	6,'H',6,'X',6,'`',6,'p'
	dc.b	6,$80,6,$88,6,$98,6,$a8
	dc.b	6,$b0,6,$c0,6,$d0,6,$d8
	dc.b	6,$e8,6,$f8,7,0,7,$10
	dc.b	7,' ',7,'(',7,'8',7,'H'
	dc.b	0,$a8,0,$b0,0,$c0,0,$d0
	dc.b	0,$d8,0,$e8,0,$f8,1,0
	dc.b	1,$10,1,' ',1,'(',1,'8'
	dc.b	1,'H',1,'P',1,'`',1,'p'
	dc.b	1,'x',1,$88,1,$98,1,$a0
	dc.b	1,$b0,1,$c0,1,$c8,1,$d8
	dc.b	1,$e8,1,$f0,2,0,2,$10
	dc.b	2,$18,2,'(',2,'8',2,'@'
	dc.b	2,'P',2,'`',2,'h',2,'x'
	dc.b	2,$88,2,$90,2,$a0,2,$b0
	dc.b	2,$b8,2,$c8,2,$d8,2,$e0
	dc.b	2,$f0,3,0,3,8,3,$18
	dc.b	3,'(',3,'0',3,'@',3,'P'
	dc.b	3,'X',3,'h',3,'x',3,$80
	dc.b	3,$90,3,$a0,3,$a8,3,$b8
	dc.b	3,$c8,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'0',4,'@',4,'P',4,'X'
	dc.b	4,'h',4,'x',4,$88,4,$90
	dc.b	4,$a0,4,$b0,4,$b8,4,$c8
	dc.b	4,$d8,4,$e0,4,$f0,5,0
	dc.b	5,$10,5,$18,5,'(',5,'8'
	dc.b	5,'@',5,'P',5,'`',5,'p'
	dc.b	5,'x',5,$88,5,$98,5,$a0
	dc.b	5,$b0,5,$c0,5,$c8,5,$d8
	dc.b	5,$e8,5,$f8,6,0,6,$10
	dc.b	6,' ',6,'(',6,'8',6,'H'
	dc.b	6,'P',6,'`',6,'p',6,$80
	dc.b	6,$88,6,$98,6,$a8,6,$b0
	dc.b	6,$c0,6,$d0,6,$e0,6,$e8
	dc.b	6,$f8,7,8,7,$10,7,' '
	dc.b	7,'0',7,'8',7,'H',7,'X'
	dc.b	0,$90,0,$a0,0,$b0,0,$c0
	dc.b	0,$c8,0,$d8,0,$e8,0,$f0
	dc.b	1,0,1,$10,1,$18,1,'('
	dc.b	1,'8',1,'H',1,'P',1,'`'
	dc.b	1,'p',1,'x',1,$88,1,$98
	dc.b	1,$a8,1,$b0,1,$c0,1,$d0
	dc.b	1,$d8,1,$e8,1,$f8,2,0
	dc.b	2,$10,2,' ',2,'0',2,'8'
	dc.b	2,'H',2,'X',2,'`',2,'p'
	dc.b	2,$80,2,$88,2,$98,2,$a8
	dc.b	2,$b8,2,$c0,2,$d0,2,$e0
	dc.b	2,$e8,2,$f8,3,8,3,$18
	dc.b	3,' ',3,'0',3,'@',3,'H'
	dc.b	3,'X',3,'h',3,'p',3,$80
	dc.b	3,$90,3,$a0,3,$a8,3,$b8
	dc.b	3,$c8,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'0',4,'@',4,'P',4,'`'
	dc.b	4,'h',4,'x',4,$88,4,$90
	dc.b	4,$a0,4,$b0,4,$c0,4,$c8
	dc.b	4,$d8,4,$e8,4,$f0,5,0
	dc.b	5,$10,5,' ',5,'(',5,'8'
	dc.b	5,'H',5,'X',5,'`',5,'p'
	dc.b	5,$80,5,$88,5,$98,5,$a8
	dc.b	5,$b8,5,$c0,5,$d0,5,$e0
	dc.b	5,$e8,5,$f8,6,8,6,$18
	dc.b	6,' ',6,'0',6,'@',6,'P'
	dc.b	6,'X',6,'h',6,'x',6,$80
	dc.b	6,$90,6,$a0,6,$b0,6,$b8
	dc.b	6,$c8,6,$d8,6,$e0,6,$f0
	dc.b	7,0,7,$10,7,$18,7,'('
	dc.b	7,'8',7,'H',7,'P',7,'`'
	dc.b	0,$88,0,$98,0,$a8,0,$b0
	dc.b	0,$c0,0,$d0,0,$e0,0,$e8
	dc.b	0,$f8,1,8,1,$18,1,' '
	dc.b	1,'0',1,'@',1,'H',1,'X'
	dc.b	1,'h',1,'x',1,$80,1,$90
	dc.b	1,$a0,1,$a8,1,$b8,1,$c8
	dc.b	1,$d8,1,$e0,1,$f0,2,0
	dc.b	2,$10,2,$18,2,'(',2,'8'
	dc.b	2,'@',2,'P',2,'`',2,'p'
	dc.b	2,'x',2,$88,2,$98,2,$a0
	dc.b	2,$b0,2,$c0,2,$d0,2,$d8
	dc.b	2,$e8,2,$f8,3,8,3,$10
	dc.b	3,' ',3,'0',3,'8',3,'H'
	dc.b	3,'X',3,'h',3,'p',3,$80
	dc.b	3,$90,3,$98,3,$a8,3,$b8
	dc.b	3,$c8,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'@',4,'P',4,'`'
	dc.b	4,'p',4,'x',4,$88,4,$98
	dc.b	4,$a8,4,$b0,4,$c0,4,$d0
	dc.b	4,$e0,4,$e8,4,$f8,5,8
	dc.b	5,$18,5,' ',5,'0',5,'@'
	dc.b	5,'P',5,'X',5,'h',5,'x'
	dc.b	5,$88,5,$90,5,$a0,5,$b0
	dc.b	5,$c0,5,$c8,5,$d8,5,$e8
	dc.b	5,$f8,6,0,6,$10,6,' '
	dc.b	6,'0',6,'@',6,'H',6,'X'
	dc.b	6,'h',6,'x',6,$80,6,$90
	dc.b	6,$a0,6,$b0,6,$b8,6,$c8
	dc.b	6,$d8,6,$e8,6,$f0,7,0
	dc.b	7,$10,7,' ',7,'(',7,'8'
	dc.b	7,'H',7,'X',7,'`',7,'p'
	dc.b	0,'x',0,$88,0,$98,0,$a0
	dc.b	0,$b0,0,$c0,0,$d0,0,$d8
	dc.b	0,$e8,0,$f8,1,8,1,$10
	dc.b	1,' ',1,'0',1,'@',1,'H'
	dc.b	1,'X',1,'h',1,'x',1,$80
	dc.b	1,$90,1,$a0,1,$b0,1,$b8
	dc.b	1,$c8,1,$d8,1,$e8,1,$f8
	dc.b	2,0,2,$10,2,' ',2,'0'
	dc.b	2,'8',2,'H',2,'X',2,'h'
	dc.b	2,'p',2,$80,2,$90,2,$a0
	dc.b	2,$a8,2,$b8,2,$c8,2,$d8
	dc.b	2,$e0,2,$f0,3,0,3,$10
	dc.b	3,$18,3,'(',3,'8',3,'H'
	dc.b	3,'P',3,'`',3,'p',3,$80
	dc.b	3,$88,3,$98,3,$a8,3,$b8
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'@',4,'P',4,'`'
	dc.b	4,'p',4,'x',4,$88,4,$98
	dc.b	4,$a8,4,$b8,4,$c0,4,$d0
	dc.b	4,$e0,4,$f0,4,$f8,5,8
	dc.b	5,$18,5,'(',5,'8',5,'@'
	dc.b	5,'P',5,'`',5,'p',5,'x'
	dc.b	5,$88,5,$98,5,$a8,5,$b0
	dc.b	5,$c0,5,$d0,5,$e0,5,$f0
	dc.b	5,$f8,6,8,6,$18,6,'('
	dc.b	6,'0',6,'@',6,'P',6,'`'
	dc.b	6,'p',6,'x',6,$88,6,$98
	dc.b	6,$a8,6,$b0,6,$c0,6,$d0
	dc.b	6,$e0,6,$f0,6,$f8,7,8
	dc.b	7,$18,7,'(',7,'0',7,'@'
	dc.b	7,'P',7,'`',7,'h',7,'x'
	dc.b	0,'p',0,$80,0,$90,0,$98
	dc.b	0,$a8,0,$b8,0,$c8,0,$d0
	dc.b	0,$e0,0,$f0,1,0,1,8
	dc.b	1,$18,1,'(',1,'8',1,'H'
	dc.b	1,'P',1,'`',1,'p',1,$80
	dc.b	1,$88,1,$98,1,$a8,1,$b8
	dc.b	1,$c8,1,$d0,1,$e0,1,$f0
	dc.b	2,0,2,8,2,$18,2,'('
	dc.b	2,'8',2,'H',2,'P',2,'`'
	dc.b	2,'p',2,$80,2,$88,2,$98
	dc.b	2,$a8,2,$b8,2,$c0,2,$d0
	dc.b	2,$e0,2,$f0,3,0,3,8
	dc.b	3,$18,3,'(',3,'8',3,'@'
	dc.b	3,'P',3,'`',3,'p',3,$80
	dc.b	3,$88,3,$98,3,$a8,3,$b8
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'P',4,'`'
	dc.b	4,'p',4,$80,4,$90,4,$98
	dc.b	4,$a8,4,$b8,4,$c8,4,$d8
	dc.b	4,$e0,4,$f0,5,0,5,$10
	dc.b	5,' ',5,'0',5,'8',5,'H'
	dc.b	5,'X',5,'h',5,'x',5,$80
	dc.b	5,$90,5,$a0,5,$b0,5,$c0
	dc.b	5,$c8,5,$d8,5,$e8,5,$f8
	dc.b	6,8,6,$10,6,' ',6,'0'
	dc.b	6,'@',6,'P',6,'`',6,'h'
	dc.b	6,'x',6,$88,6,$98,6,$a8
	dc.b	6,$b0,6,$c0,6,$d0,6,$e0
	dc.b	6,$f0,6,$f8,7,8,7,$18
	dc.b	7,'(',7,'8',7,'@',7,'P'
	dc.b	7,'`',7,'p',7,$80,7,$90
	dc.b	0,'`',0,'h',0,'x',0,$88
	dc.b	0,$98,0,$a8,0,$b8,0,$c0
	dc.b	0,$d0,0,$e0,0,$f0,1,0
	dc.b	1,8,1,$18,1,'(',1,'8'
	dc.b	1,'H',1,'P',1,'`',1,'p'
	dc.b	1,$80,1,$90,1,$98,1,$a8
	dc.b	1,$b8,1,$c8,1,$d8,1,$e8
	dc.b	1,$f0,2,0,2,$10,2,' '
	dc.b	2,'0',2,'8',2,'H',2,'X'
	dc.b	2,'h',2,'x',2,$80,2,$90
	dc.b	2,$a0,2,$b0,2,$c0,2,$c8
	dc.b	2,$d8,2,$e8,2,$f8,3,8
	dc.b	3,$18,3,' ',3,'0',3,'@'
	dc.b	3,'P',3,'`',3,'h',3,'x'
	dc.b	3,$88,3,$98,3,$a8,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'P',4,'`'
	dc.b	4,'p',4,$80,4,$90,4,$a0
	dc.b	4,$a8,4,$b8,4,$c8,4,$d8
	dc.b	4,$e8,4,$f8,5,0,5,$10
	dc.b	5,' ',5,'0',5,'@',5,'P'
	dc.b	5,'X',5,'h',5,'x',5,$88
	dc.b	5,$98,5,$a8,5,$b0,5,$c0
	dc.b	5,$d0,5,$e0,5,$f0,5,$f8
	dc.b	6,8,6,$18,6,'(',6,'8'
	dc.b	6,'H',6,'P',6,'`',6,'p'
	dc.b	6,$80,6,$90,6,$a0,6,$a8
	dc.b	6,$b8,6,$c8,6,$d8,6,$e8
	dc.b	6,$f8,7,0,7,$10,7,' '
	dc.b	7,'0',7,'@',7,'P',7,'X'
	dc.b	7,'h',7,'x',7,$88,7,$98
	dc.b	0,'X',0,'`',0,'p',0,$80
	dc.b	0,$90,0,$a0,0,$a8,0,$b8
	dc.b	0,$c8,0,$d8,0,$e8,0,$f8
	dc.b	1,0,1,$10,1,' ',1,'0'
	dc.b	1,'@',1,'P',1,'X',1,'h'
	dc.b	1,'x',1,$88,1,$98,1,$a8
	dc.b	1,$b0,1,$c0,1,$d0,1,$e0
	dc.b	1,$f0,2,0,2,8,2,$18
	dc.b	2,'(',2,'8',2,'H',2,'P'
	dc.b	2,'`',2,'p',2,$80,2,$90
	dc.b	2,$a0,2,$a8,2,$b8,2,$c8
	dc.b	2,$d8,2,$e8,2,$f8,3,0
	dc.b	3,$10,3,' ',3,'0',3,'@'
	dc.b	3,'P',3,'X',3,'h',3,'x'
	dc.b	3,$88,3,$98,3,$a8,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'X',4,'h'
	dc.b	4,'p',4,$80,4,$90,4,$a0
	dc.b	4,$b0,4,$c0,4,$d0,4,$d8
	dc.b	4,$e8,4,$f8,5,8,5,$18
	dc.b	5,'(',5,'8',5,'H',5,'P'
	dc.b	5,'`',5,'p',5,$80,5,$90
	dc.b	5,$a0,5,$b0,5,$b8,5,$c8
	dc.b	5,$d8,5,$e8,5,$f8,6,8
	dc.b	6,$18,6,' ',6,'0',6,'@'
	dc.b	6,'P',6,'`',6,'p',6,$80
	dc.b	6,$90,6,$98,6,$a8,6,$b8
	dc.b	6,$c8,6,$d8,6,$e8,6,$f8
	dc.b	7,0,7,$10,7,' ',7,'0'
	dc.b	7,'@',7,'P',7,'`',7,'p'
	dc.b	7,'x',7,$88,7,$98,7,$a8
	dc.b	0,'@',0,'P',0,'`',0,'p'
	dc.b	0,$80,0,$88,0,$98,0,$a8
	dc.b	0,$b8,0,$c8,0,$d8,0,$e8
	dc.b	0,$f8,1,0,1,$10,1,' '
	dc.b	1,'0',1,'@',1,'P',1,'`'
	dc.b	1,'h',1,'x',1,$88,1,$98
	dc.b	1,$a8,1,$b8,1,$c8,1,$d8
	dc.b	1,$e0,1,$f0,2,0,2,$10
	dc.b	2,' ',2,'0',2,'@',2,'H'
	dc.b	2,'X',2,'h',2,'x',2,$88
	dc.b	2,$98,2,$a8,2,$b0,2,$c0
	dc.b	2,$d0,2,$e0,2,$f0,3,0
	dc.b	3,$10,3,' ',3,'(',3,'8'
	dc.b	3,'H',3,'X',3,'h',3,'x'
	dc.b	3,$88,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'X',4,'h'
	dc.b	4,'x',4,$80,4,$90,4,$a0
	dc.b	4,$b0,4,$c0,4,$d0,4,$e0
	dc.b	4,$f0,5,0,5,8,5,$18
	dc.b	5,'(',5,'8',5,'H',5,'X'
	dc.b	5,'h',5,'x',5,$80,5,$90
	dc.b	5,$a0,5,$b0,5,$c0,5,$d0
	dc.b	5,$e0,5,$f0,6,0,6,8
	dc.b	6,$18,6,'(',6,'8',6,'H'
	dc.b	6,'X',6,'h',6,'x',6,$80
	dc.b	6,$90,6,$a0,6,$b0,6,$c0
	dc.b	6,$d0,6,$e0,6,$f0,7,0
	dc.b	7,8,7,$18,7,'(',7,'8'
	dc.b	7,'H',7,'X',7,'h',7,'x'
	dc.b	7,$88,7,$90,7,$a0,7,$b0
	dc.b	0,'8',0,'H',0,'X',0,'h'
	dc.b	0,'p',0,$80,0,$90,0,$a0
	dc.b	0,$b0,0,$c0,0,$d0,0,$e0
	dc.b	0,$f0,0,$f8,1,8,1,$18
	dc.b	1,'(',1,'8',1,'H',1,'X'
	dc.b	1,'h',1,'x',1,$80,1,$90
	dc.b	1,$a0,1,$b0,1,$c0,1,$d0
	dc.b	1,$e0,1,$f0,1,$f8,2,8
	dc.b	2,$18,2,'(',2,'8',2,'H'
	dc.b	2,'X',2,'h',2,'x',2,$80
	dc.b	2,$90,2,$a0,2,$b0,2,$c0
	dc.b	2,$d0,2,$e0,2,$f0,2,$f8
	dc.b	3,8,3,$18,3,'(',3,'8'
	dc.b	3,'H',3,'X',3,'h',3,'x'
	dc.b	3,$80,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'X',4,'h'
	dc.b	4,'x',4,$88,4,$98,4,$a8
	dc.b	4,$b8,4,$c0,4,$d0,4,$e0
	dc.b	4,$f0,5,0,5,$10,5,' '
	dc.b	5,'0',5,'@',5,'P',5,'`'
	dc.b	5,'p',5,$80,5,$88,5,$98
	dc.b	5,$a8,5,$b8,5,$c8,5,$d8
	dc.b	5,$e8,5,$f8,6,8,6,$18
	dc.b	6,'(',6,'8',6,'H',6,'P'
	dc.b	6,'`',6,'p',6,$80,6,$90
	dc.b	6,$a0,6,$b0,6,$c0,6,$d0
	dc.b	6,$e0,6,$f0,7,0,7,$10
	dc.b	7,$18,7,'(',7,'8',7,'H'
	dc.b	7,'X',7,'h',7,'x',7,$88
	dc.b	7,$98,7,$a8,7,$b8,7,$c8
	dc.b	0,'(',0,'0',0,'@',0,'P'
	dc.b	0,'`',0,'p',0,$80,0,$90
	dc.b	0,$a0,0,$b0,0,$c0,0,$d0
	dc.b	0,$e0,0,$e8,0,$f8,1,8
	dc.b	1,$18,1,'(',1,'8',1,'H'
	dc.b	1,'X',1,'h',1,'x',1,$88
	dc.b	1,$98,1,$a8,1,$b0,1,$c0
	dc.b	1,$d0,1,$e0,1,$f0,2,0
	dc.b	2,$10,2,' ',2,'0',2,'@'
	dc.b	2,'P',2,'`',2,'p',2,'x'
	dc.b	2,$88,2,$98,2,$a8,2,$b8
	dc.b	2,$c8,2,$d8,2,$e8,2,$f8
	dc.b	3,8,3,$18,3,'(',3,'8'
	dc.b	3,'@',3,'P',3,'`',3,'p'
	dc.b	3,$80,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'X',4,'h'
	dc.b	4,'x',4,$88,4,$98,4,$a8
	dc.b	4,$b8,4,$c8,4,$d8,4,$e8
	dc.b	4,$f8,5,0,5,$10,5,' '
	dc.b	5,'0',5,'@',5,'P',5,'`'
	dc.b	5,'p',5,$80,5,$90,5,$a0
	dc.b	5,$b0,5,$c0,5,$d0,5,$e0
	dc.b	5,$f0,6,0,6,8,6,$18
	dc.b	6,'(',6,'8',6,'H',6,'X'
	dc.b	6,'h',6,'x',6,$88,6,$98
	dc.b	6,$a8,6,$b8,6,$c8,6,$d8
	dc.b	6,$e8,6,$f8,7,8,7,$10
	dc.b	7,' ',7,'0',7,'@',7,'P'
	dc.b	7,'`',7,'p',7,$80,7,$90
	dc.b	7,$a0,7,$b0,7,$c0,7,$d0
	dc.b	0,$18,0,'(',0,'8',0,'H'
	dc.b	0,'X',0,'h',0,'x',0,$88
	dc.b	0,$98,0,$a8,0,$b8,0,$c8
	dc.b	0,$d8,0,$e8,0,$f0,1,0
	dc.b	1,$10,1,' ',1,'0',1,'@'
	dc.b	1,'P',1,'`',1,'p',1,$80
	dc.b	1,$90,1,$a0,1,$b0,1,$c0
	dc.b	1,$d0,1,$e0,1,$f0,1,$f8
	dc.b	2,8,2,$18,2,'(',2,'8'
	dc.b	2,'H',2,'X',2,'h',2,'x'
	dc.b	2,$88,2,$98,2,$a8,2,$b8
	dc.b	2,$c8,2,$d8,2,$e8,2,$f8
	dc.b	3,0,3,$10,3,' ',3,'0'
	dc.b	3,'@',3,'P',3,'`',3,'p'
	dc.b	3,$80,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,8,4,$18,4,'('
	dc.b	4,'8',4,'H',4,'X',4,'h'
	dc.b	4,'x',4,$88,4,$98,4,$a8
	dc.b	4,$b8,4,$c8,4,$d8,4,$e8
	dc.b	4,$f8,5,8,5,$18,5,'('
	dc.b	5,'8',5,'H',5,'X',5,'h'
	dc.b	5,'x',5,$88,5,$98,5,$a8
	dc.b	5,$b8,5,$c8,5,$d8,5,$e8
	dc.b	5,$f8,6,8,6,$18,6,'('
	dc.b	6,'8',6,'H',6,'X',6,'h'
	dc.b	6,'x',6,$88,6,$98,6,$a8
	dc.b	6,$b8,6,$c8,6,$d8,6,$e8
	dc.b	6,$f8,7,8,7,$18,7,' '
	dc.b	7,'0',7,'@',7,'P',7,'`'
	dc.b	7,'p',7,$80,7,$90,7,$a0
	dc.b	7,$b0,7,$c0,7,$d0,7,$e0
	dc.b	0,8,0,$18,0,'(',0,'8'
	dc.b	0,'H',0,'X',0,'h',0,'x'
	dc.b	0,$88,0,$98,0,$a8,0,$b8
	dc.b	0,$c8,0,$d8,0,$e0,0,$f0
	dc.b	1,0,1,$10,1,' ',1,'0'
	dc.b	1,'@',1,'P',1,'`',1,'p'
	dc.b	1,$80,1,$90,1,$a0,1,$b0
	dc.b	1,$c0,1,$d0,1,$e0,1,$f0
	dc.b	2,0,2,$10,2,' ',2,'0'
	dc.b	2,'@',2,'P',2,'`',2,'p'
	dc.b	2,$80,2,$90,2,$a0,2,$b0
	dc.b	2,$c0,2,$d0,2,$e0,2,$f0
	dc.b	3,0,3,$10,3,' ',3,'0'
	dc.b	3,'@',3,'P',3,'`',3,'p'
	dc.b	3,$80,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
	dc.b	4,0,4,$10,4,' ',4,'0'
	dc.b	4,'@',4,'P',4,'`',4,'p'
	dc.b	4,$80,4,$90,4,$a0,4,$b0
	dc.b	4,$c0,4,$d0,4,$e0,4,$f0
	dc.b	5,0,5,$10,5,' ',5,'0'
	dc.b	5,'@',5,'P',5,'`',5,'p'
	dc.b	5,$80,5,$90,5,$a0,5,$b0
	dc.b	5,$c0,5,$d0,5,$e0,5,$f0
	dc.b	6,0,6,$10,6,' ',6,'0'
	dc.b	6,'@',6,'P',6,'`',6,'p'
	dc.b	6,$80,6,$90,6,$a0,6,$b0
	dc.b	6,$c0,6,$d0,6,$e0,6,$f0
	dc.b	7,0,7,$10,7,' ',7,'0'
	dc.b	7,'@',7,'P',7,'`',7,'p'
	dc.b	7,$80,7,$90,7,$a0,7,$b0
	dc.b	7,$c0,7,$d0,7,$e0,7,$f0
	dc.b	0,0,0,$10,0,' ',0,'0'
	dc.b	0,'@',0,'P',0,'`',0,'p'
	dc.b	0,$80,0,$90,0,$a0,0,$b0
	dc.b	0,$c0,0,$d0,0,$e0,0,$f0
	dc.b	1,0,1,$10,1,' ',1,'0'
	dc.b	1,'@',1,'P',1,'`',1,'p'
	dc.b	1,$80,1,$90,1,$a0,1,$b0
	dc.b	1,$c0,1,$d0,1,$e0,1,$f0
	dc.b	2,0,2,$10,2,' ',2,'0'
	dc.b	2,'@',2,'P',2,'`',2,'p'
	dc.b	2,$80,2,$90,2,$a0,2,$b0
	dc.b	2,$c0,2,$d0,2,$e0,2,$f0
	dc.b	3,0,3,$10,3,' ',3,'0'
	dc.b	3,'@',3,'P',3,'`',3,'p'
	dc.b	3,$80,3,$90,3,$a0,3,$b0
	dc.b	3,$c0,3,$d0,3,$e0,3,$f0
l0070	dc.b	0,0,3,2,4,$13,5,'$'
	dc.b	6,'5',0,'f',0,'U',0,'D'
	dc.b	0,'3',0,'"',2,'4',3,'E'
	dc.b	4,'V',7,'F',5,'g',1,'#'
l0071	dc.b	1,'Y',0,$c0,0,'?',0,$19
	dc.b	'Ql`',$e0,$80,$1f,0,$c
	dc.b	$cf,')',0,'0',$ff,$c0,$cf,0
	dc.b	'nd',$e0,0,$1f,$ff,$e,'d'
	dc.b	$f3,'(',0,'0',$ff,$c0,$f3,0
	dc.b	$b3,'9p',0,$f,$ff,3,'9'
	dc.b	$8c,$c7,0,0,$ff,$ff,$8c,$c7
	dc.b	'U',1,$16,0,$e8,0,'@',0
	dc.b	'd',$e6,$e0,0,$1f,$ff,4,$e6
	dc.b	$a2,$9b,$c1,$80,0,$7f,0,$1b
	dc.b	'T',$19,$10,0,$ef,$ff,'D',$19
	dc.b	'B',$d3,3,'0',$fc,$f,'@',3
	dc.b	$14,$a4,$18,'`',$e0,$1f,0,4
	dc.b	'tQ',0,'`',$ff,$80,'t',0
	dc.b	'm',$b8,$e0,0,$1f,$ff,$d,$b8
	dc.b	$a0,'(',$c0,$18,0,7,0,0
	dc.b	$b1,'@',1,$80,$fe,0,$b0,0
	dc.b	'Q',$b8,'0',0,$f,$ff,1,$b8
	dc.b	')M0',$c0,$c0,'?',0,$d
	dc.b	$96,$a0,0,$c0,$ff,0,$96,0
	dc.b	0,'@',1,$80,0,0,0,0
	dc.b	'B@0',$80,1,0,0,0
	dc.b	0,'%',0,$1b,0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	0,'!',0,$18,0,0,0,0
	dc.b	' ',0,$c0,0,0,0,0,0
	dcb.w	4
	dc.b	5,'E',3,$83,0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	$80,$80,'c',0,0,0,0,0
	dcb.w	4
	dc.b	2,$90,1,$a0,0,'@',0,0
	dc.b	$12,$a0,$d,$c0,0,0,0,0
	dc.b	0,'@',0,'1',0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	$a8,$a8,'pp',0,0,0,0
	dc.b	1,'Q',0,$e0,0,0,0,0
	dc.b	$10,0,$a0,0,'@',0,0,0
	dc.b	'%@',$1b,$80,0,0,0,0
	dc.b	0,$80,0,'`',0,0,0,0
	dc.b	0,$df,0,$7f,1,'@',0,$7f
	dc.b	't',$be,$d3,$7f,'@',0,$c0,$7f
	dc.b	$af,$bd,$bf,$ee,$a0,' ',$bf,$e0
	dc.b	$bf,$fe,$ff,$ff,$80,0,$ff,$ff
	dc.b	$af,$ba,$bf,$e9,$a0,' ',$bf,$e0
	dc.b	'_W',$bf,$df,0,'P?',$df
	dc.b	$d5,$ff,$f7,$ff,$14,0,$f7,$ff
	dc.b	$fb,'m',$fe,$c6,2,0,$fe,0
	dc.b	$bf,$fe,$ff,$ff,$80,0,$ff,$ff
	dc.b	$e1,$bf,$a0,$ff,$82,$80,$80,$ff
	dc.b	$ff,$ea,$ff,$fb,0,$a,$ff,$fb
	dc.b	$fb,'7',$fe,$df,2,$10,$fe,$1f
	dc.b	$de,$df,$f7,$7f,$10,'@',$f0,$7f
	dc.b	$ff,'p',$ff,$d0,0,'A',$ff,$c0
	dc.b	$df,$ff,$7f,$ff,'@',0,$7f,$ff
	dc.b	'm',$b7,$d8,$df,'@',$10,$c0,$1f
	dc.b	$fe,$da,$ff,$b0,0,$81,$ff,$80
	dc.b	'o',$ff,$bf,$ff,' ',0,'?',$ff
	dc.b	$bd,$bf,$ee,$ff,' ',$80,$e0,$ff
	dc.b	$fe,$e0,$ff,$a0,0,$80,$ff,$80
	dc.b	1,0,1,'V',0,'?',0,$7f
	dc.b	$83,'U',$96,$c9,0,'>',$c0,$eb
	dc.b	0,'J+M',$1f,$80,$bf,$e1
	dc.b	$80,1,$99,$19,$7f,$fe,$ff,$ff
	dc.b	0,'A',$ab,'K',$1f,$80,$bf,$e0
	dc.b	$aa,$80,'d',$95,$1f,$f,'u',$df
	dc.b	' ',0,$a5,$99,$c3,$ff,$f7,$ff
	dc.b	6,$ba,'gm',$f8,0,$ff,1
	dc.b	$80,1,$99,$19,$7f,$fe,$ff,$ff
	dc.b	2,0,$a2,$a9,0,$7f,$80,$ff
	dc.b	0,$10,$96,$d2,$ff,$e1,$ff,$fb
	dc.b	4,0,$b4,$15,$f8,$f,$fe,$1f
	dc.b	'%@6',$cc,$c0,'?',$f0,$ff
	dc.b	0,$90,$8c,$d0,$ff,1,$ff,$c0
	dc.b	0,0,'Y',$dc,'?',$ff,$7f,$ff
	dc.b	$d7,'P',$ed,$b3,0,$f,$e0,'?'
	dc.b	1,$ac,'Y',$d9,$fe,2,$ff,$c0
	dc.b	$a0,0,'fF',$1f,$ff,$7f,$ff
	dc.b	'J',$80,'m',$99,$80,$7f,$e1,$ff
	dc.b	1,0,$19,$a0,$fe,0,$ff,$80
	dc.b	0,'O',0,'o',1,'0',0,$7f
	dc.b	'I',$ad,$d3,$8f,'Eq',$81,$de
	dc.b	$27,$a5,'7',$eb,$18,' ',$bf,$c3
	dc.b	$1f,$fe,'_',$ff,$e0,0,$ff,$ff
	dc.b	$a7,$a4,$b7,$e9,$98,'"?',$c0
	dc.b	$d6,$93,$c7,$9b,$b8,$8c,$ef,'_'
	dc.b	$d4,$ff,$f6,$ff,$13,0,$e7,$ff
	dc.b	$f9,'U',$f9,$bb,6,0,$ff,$83
	dc.b	$1f,$fe,'_',$ff,$e0,0,$ff,$ff
	dc.b	$a0,$9f,$a0,$df,$82,'`',0,$ff
	dc.b	$ff,$ea,$ff,$fb,0,9,$ff,$f3
	dc.b	'z',$13,'~',$1b,$82,$c,$fc,$1f
	dc.b	$d2,$8f,$f5,$af,$10,'p',$e1,$ff
	dc.b	$ff,'@',$ff,$d0,0,'A',$ff,$80
	dc.b	'O',$ff,'o',$ff,'0',0,$7f,$ff
	dc.b	'*',$a3,'7k',$c0,$1c,$f0,$7f
	dc.b	$fe,'U',$fe,'n',1,$80,$ff,$e0
	dc.b	'G',$ff,$d7,$ff,'8',0,$ff,$ff
	dc.b	$a5,$1f,$eb,'_ ',$e0,$c3,$ff
	dc.b	$fe,$a0,$ff,$a0,0,$80,$ff,0
	dc.b	1,'O',0,'O',1,'0',1,$7f
	dc.b	$d2,'[',$dd,$1f,$c0,$e3,$81,$bc
	dc.b	$a4,$ea,$a6,$e7,$99,'a',$bf,$c7
	dc.b	'|f',$7f,'w',$80,$88,$ff,$ff
	dc.b	$a7,$e9,$a7,$ee,$98,'`?',$c0
	dc.b	'-',$d2,$8f,$d3,'q',$cc,$de,'_'
	dc.b	'u',$fe,'w',$ff,$b2,0,$e7,$ff
	dc.b	'>',$aa,$be,$d7,'A',$81,$ff,'G'
	dc.b	'|f',$7f,'w',$80,$88,$ff,$ff
	dc.b	$82,$97,$a0,$9f,$82,'`',2,$ff
	dc.b	'?:',$bf,$ba,'@Y',$ff,$f3
	dc.b	'~',$17,'~',$17,$86,8,$fc,$1f
	dc.b	$c5,'>',$f3,$bf,$10,$c0,$e3,$ff
	dc.b	'3Q',$bb,$d0,'DA',$ff,$81
	dc.b	'X',$f3,'^',$fb,'!',4,$7f,$ff
	dc.b	$d5,'O',$da,$ef,'00',$e8,$ff
	dc.b	$8f,$aa,$ef,$b5,$10,'`',$ff,$d1
	dc.b	$9f,$19,$df,$dd,'`"',$ff,$ff
	dc.b	$aa,'|',$e7,$7f,'!',$80,$c7,$ff
	dc.b	'f',$80,'w',$a0,$88,$80,$ff,0
	dc.b	0,'_',0,'_',1,' ',0,$7f
	dc.b	'Ox',$db,':B',$c2,$83,$bd
	dc.b	',',$cc,'<',$ec,$13,'k?',$cf
	dc.b	$fc,'g',$fc,'g',3,$99,$ff,$ff
	dc.b	'/',$a7,$af,$ed,$90,'!?',$c1
	dc.b	$bc,$16,$9d,$1e,'a',9,$de,$9f
	dc.b	'e',$ce,'u',$ee,$b2,$11,$e7,$ff
	dc.b	$7f,$fc,$7f,$ec,$80,'k',$ff,$af
	dc.b	$fc,'g',$fc,'g',3,$99,$ff,$ff
	dc.b	' ',$b7,$80,$f7,$82,'H',0,$ff
	dc.b	'#2',$bb,':D',$d9,$ff,$f3
	dc.b	$fa,$14,$fe,$1f,2,8,$fc,$1f
	dc.b	'v~v~',$b5,$81,$e7,$ff
	dc.b	'33',$d0,$cc,$c1,$ff,$81
	dc.b	'X',$f3,'x',$f3,$27,$c,$7f,$ff
	dc.b	$ff,$9f,$fd,$9f,$1d,'`',$e5,$ff
	dc.b	$9f,$ff,$9f,$fb,'`',$1a,$ff,$eb
	dc.b	'?',$19,'?',$19,$c0,$e6,$ff,$ff
	dc.b	$cc,$fc,$ec,$fc,'k',3,$cf,$ff
	dc.b	'g g',$80,$99,$80,$ff,0
	dc.b	1,'S',0,'{',1,'$',1,$7f
	dc.b	$80,$87,$da,'/',$c1,$d7,$83,'y'
	dc.b	'/!/',$eb,$10,'&?',$cf
	dc.b	$ff,$fd,$ff,$ff,0,1,$ff,$ff
	dc.b	$a9,$c2,$bd,$ed,$92,'`?',$c1
	dc.b	'C',$97,$17,$97,$eb,$88,$bc,$9f
	dc.b	$95,$cf,$f5,$cf,$12,'0',$e7,$ff
	dc.b	$f9,'A',$fd,$eb,2,'F',$ff,$af
	dc.b	$ff,$fd,$ff,$ff,0,1,$ff,$ff
	dc.b	$a2,$bf,$80,$bf,$82,'@',2,$ff
	dc.b	'#',$ca,'#',$fb,$dc,9,$ff,$f3
	dc.b	$9c,$14,$de,$1c,'&',$b,$fc,$1f
	dc.b	'@',$ff,'u',$ff,$93,0,$e7,$ff
	dc.b	$fe,$d0,$ff,$c0,0,$c1,$ff,$80
	dc.b	'_',$ff,'_',$ff,' ',0,$7f,$ff
	dc.b	$f0,'?',$f9,$7f,8,$c0,$f5,$ff
	dc.b	$fe,'P',$ff,'z',0,$91,$ff,$eb
	dc.b	$7f,$ff,$ff,$ff,$80,0,$ff,$ff
	dc.b	'a',$ff,$eb,$ff,'f',0,$cf,$ff
	dc.b	$fd,$80,$ff,$a0,1,$80,$ff,0
	dc.b	1,'S',0,'s',1,',',1,$7f
	dc.b	$9e,$c0,$d6,'D',$c5,$b4,$87,'z'
	dc.b	$16,'I?',$c9,6,'F?',$af
	dc.b	'-',$b5,$bf,$fd,'M',$b5,$ff,$fe
	dc.b	')',$cf,'9',$eb,$16,'b',$bf,$c3
	dc.b	'`',$b,'"',$1f,$da,3,$bd,$1f
	dc.b	'%',$f2,$e7,$ff,'"',2,$d7,$ff
	dc.b	$99,$e9,$fd,$e9,$82,'&',$ff,$cf
	dc.b	'-',$b5,$bf,$fd,'M',$b5,$ff,$fe
	dc.b	0,'[ ',$ff,2,$18,$80,$ff
	dc.b	$fc,$92,$ff,$f3,0,$91,$ff,$eb
	dc.b	$9c,$17,$9e,$1f,'f',8,$fc,$1f
	dc.b	$e4,$96,$f4,$df,'3&',$e7,$ff
	dc.b	$da,$80,$fe,$90,$da,$81,$ff,'@'
	dc.b	'6g',$7f,$ff,$16,'`o',$ff
	dc.b	'5%',$bd,'7D',$c9,$f9,$ff
	dc.b	$a6,'z',$ff,'z',$a0,$89,$ff,$f3
	dc.b	'Kmo',$ff,$93,'m',$ff,$ff
	dc.b	'I-I',$bf,'FM',$af,$ff
	dc.b	$b5,0,$fd,' ',$b5,0,$fe,$80
	dc.b	0,'W',0,'w',1,'(',0,$7f
	dc.b	'An”~C',$8e,$86,$f2
	dc.b	'*',$ab,'-',$af,'/',$a4,'0o'
	dc.b	'6',$96,'?n',$d7,$fe,$f8,1
	dc.b	$ab,$a4,$bb,$ca,$94,'!',$bf,$c3
	dc.b	$b7,$15,'?',$16,$c7,$17,'y',$18
	dc.b	'U',$f3,$d7,$fb,$d2,3,'7',$fc
	dc.b	'y',$ab,$f9,$ef,$e6,'$',$1f,$cf
	dc.b	'6',$96,'?n',$d7,$fe,$f8,1
	dc.b	$a3,$ae,$a2,$b6,$80,$bf,$80,$c1
	dc.b	$ba,$aa,$bf,'kC',$e9,$fc,$1b
	dc.b	$ba,$17,$bc,$17,'B',8,$fc,$1f
	dc.b	$d5,$9b,$e7,$9f,$12,'k',$e7,$fc
	dc.b	'Kp',$b7,'P',$ff,'A',0,$c0
	dc.b	'Z',$9f,'}',$7f,'_',$fa,'`',5
	dc.b	'5f',$bd,$e7,'D',$9a,$f9,$ff
	dc.b	$de,'j',$fe,'z',$f9,$89,7,$f3
	dc.b	$cd,$a5,$cf,$db,'5',$ff,$fe,0
	dc.b	$ab,'6',$ab,'?',$a4,$d7,'o',$f8
	dc.b	$96,$e0,'n',$a0,$fe,$80,1,$80
	dc.b	1,'_',1,'_',0,' ',0,$7f
	dc.b	$1d,$e0,$cc,$f8,'K',8,$8e,$f4
	dc.b	0,$b,0,$f,0,4,0,$f
	dc.b	$ec,0,$fc,0,$c,0,$f4,0
	dc.b	'/Ž/',$e6,$10,'%?',$c7
	dc.b	$f0,0,'|',0,$84,0,'z',0
	dc.b	5,$fe,7,$fe,2,$e,7,$fa
	dc.b	'o',$cb,'o',$ef,'Pd',$7f,$cf
	dc.b	$ec,0,$fc,0,$c,0,$f4,0
	dc.b	' ',$86,'#',6,0,5,0,7
	dc.b	$f9,2,$ff,2,3,1,$fd,3
	dc.b	$f8,$a6,$fe,$ef,2,$98,$fc,$ff
	dc.b	'e',$f6,'w',$fe,$b2,6,$e7,$fa
	dc.b	0,'A',0,'0',0,1,0,1
	dc.b	0,$d,0,$d,0,$a,0,$f
	dc.b	'9}9',$ff,$c8,$81,$f5,$fe
	dc.b	$9b,$f2,$9b,$fb,$94,$19,$9f,$f3
	dc.b	$fb,0,$ff,0,3,0,$fd,0
	dc.b	$b,$ec,$f,$fc,4,$c,$f,$f4
	dc.b	0,$80,0,'`',0,0,0,0
	dc.b	0,'Q',0,'}',1,'"',0,$7f
	dc.b	$c2,$ec,$88,$ec,$c7,$c,$8d,$f4
	dc.b	'/',$ab,'?',$eb,' $?',$ef
	dc.b	$f8,0,$f8,0,$18,0,$f0,0
	dc.b	'(',$e1,'>',$c4,$11,'c?',$c6
	dc.b	'v',$17,'v',$1f,$86,$10,$fa,$1f
	dc.b	$d5,$14,$f5,$dc,$12,'$',$f7,$f8
	dc.b	'/',$ab,'?',$eb,$10,'$?',$cf
	dc.b	$f8,0,$f8,0,$18,0,$f0,0
	dc.b	'"',$ea,1,$f3,0,1,0,3
	dc.b	$8e,$aa,$ec,'s',$16,1,$fc,3
	dc.b	$8e,6,$ec,$b6,$16,'y',$fc,$ff
	dc.b	'u',$ff,'u',$ff,$b2,0,$e7,$ff
	dc.b	$f5,'Q',$fc,$e0,4,1,$fc,1
	dc.b	0,$d,0,$f,0,$a,0,$f
	dc.b	$ed,$7f,$fd,$7f,$c,$83,$f5,$fe
	dc.b	$b,$e8,$f,$fa,4,9,$f,$f3
	dc.b	$7f,$fa,$7f,$fe,$80,2,$ff,$fe
	dc.b	1,$ff,9,$ff,6,0,$f,$ff
	dc.b	$ed,$a0,$fb,$c0,8,0,$f8,0
	dc.b	1,'Q',0,'q',1,'.',1,$7f
	dc.b	$99,$10,$d9,$b0,$d6,'P',$9f,$e8
	dc.b	0,'J/K',$1f,$84,'?',$ef
	dc.b	'p',0,'x',0,$98,0,$f0,0
	dc.b	'(',$cc,'8',$ec,$17,'k?',$cf
	dc.b	$88,0,$d8,$17,'(',$f,$f4,$1f
	dc.b	'%8',$a5,'<',$c2,$cc,$f7,$f8
	dc.b	',',$ca,'>',$eb,$11,'d?',$cf
	dc.b	'p',$be,'x',$ff,$98,$80,$f0,$ff
	dc.b	$80,'"',$a0,$1b,$80,1,$80,3
	dc.b	$8c,'"',$8e,$db,'v',1,$fc,3
	dc.b	$8c,$9f,$8e,$df,'v`',$fc,$ff
	dc.b	$c5,'8',$f5,$bb,$12,'G',$e7,$ff
	dc.b	8,$81,$ad,0,$f0,1,$fc,1
	dc.b	'_Q',$7f,$db,'@V',$7f,$df
	dc.b	$d1,'N',$f9,'o',$10,$93,$e9,$fe
	dc.b	'S3w',$bb,'LZ',$7f,$f3
	dc.b	'd',6,'tg',$8b,$f8,$ff,$ff
	dc.b	$d,$90,$d,$d1,$a,'/',$f,$ff
	dc.b	$19,$c0,$9c,$80,$e0,0,$fc,0
	dc.b	1,'_',0,$7f,1,' ',1,$7f
	dc.b	9,8,$dd,$18,'F',$d8,$9f,$e8
	dc.b	$27,$aa,'7',$ef,$18,'$?',$cf
	dc.b	'x',0,'p',0,$98,0,$f0,0
	dc.b	'/„?',$ee,$10,'#?',$cf
	dc.b	$84,$13,$8c,$1b,'l',$c,$f4,$1f
	dc.b	$d5,$fc,$f7,$f8,$12,$c,$e7,$f8
	dc.b	',',$ea,',',$cf,$13,'d?',$cf
	dc.b	'x',1,'p',$a9,$98,'~',$f0,$ff
	dc.b	' ',$1a,$a0,$b,0,1,$80,3
	dc.b	$f8,$da,$fe,$8b,2,1,$fc,3
	dc.b	$f8,$a3,$fe,$fb,2,'D',$fc,$ff
	dc.b	$d5,$27,$e7,$b7,$12,'H',$e7,$ff
	dc.b	$f5,1,$fd,0,4,1,$f8,1
	dc.b	0,$89,'V',$dd,'?',6,$7f,$df
	dc.b	$89,'O',$e9,$ee,'(',$93,$d9,$fe
	dc.b	3,'8[9<',$d8,$7f,$f1
	dc.b	$a7,$f9,$a7,$f9,'X',6,$ff,$ff
	dc.b	2,$9f,$86,$9f,1,'`',$87,$ff
	dc.b	$e4,$80,$e6,'@',$18,0,$fe,0
	dc.b	1,'_',0,$7f,1,' ',1,$7f
	dc.b	$8b,$c8,$d9,$d8,$c6,$18,$9d,$e8
	dc.b	$27,$ea,'7',$ee,$18,'e?',$cf
	dc.b	'`',0,'x',0,$88,0,$f0,0
	dc.b	'/',$c5,'?',$ec,$10,'c?',$ce
	dc.b	$e4,$13,$ec,$1b,$c,$c,$f4,$1f
	dc.b	$f5,$f0,$f7,$fc,'2',4,$e7,$f8
	dc.b	'/',$aa,'?',$ce,$10,'%?',$cf
	dc.b	'`žx',$df,$88,'`',$f0,$ff
	dc.b	$80,$a,$a0,$b,$80,1,0,3
	dc.b	$fc,$82,$fe,$83,6,9,$fc,3
	dc.b	$fc,$a3,$fe,$e3,6,'\',$fc,$ff
	dc.b	$d5,$27,$e7,$27,$12,$d8,$e7,$ff
	dc.b	$f5,0,$fd,0,4,1,$f8,0
	dc.b	'OKo',$db,'0D',$7f,$9f
	dc.b	$a9,'L',$e9,$cf,'(',$b1,$d9,$fe
	dc.b	'O',$e0,'o',$f8,'0',8,$7f,$f0
	dc.b	'_',$be,$df,$be,'`A',$bf,$ff
	dc.b	$81,'~',$c3,'~',$81,$81,'B',$ff
	dc.b	$fa,'`',$fb,'@',6,0,$fd,0
	dc.b	0,'Y',0,'}',1,'"',0,$7f
	dc.b	$db,$d0,$d9,$f0,$d6,$10,$9d,$e8
	dc.b	')',$ab,'=',$eb,$12,'$?',$cf
	dc.b	$e0,0,$f8,0,8,0,$f0,0
	dc.b	',',$ed,'>',$ec,$11,'k?',$ce
	dc.b	$e8,$14,$f8,$1e,8,9,$f4,$1f
	dc.b	$d5,$90,$f5,$dc,$12,'$',$e7,$f8
	dc.b	'/',$cb,'/',$eb,$10,'d?',$cf
	dc.b	$e0,$a7,$f8,$b7,8,'I',$f0,$ff
	dc.b	$a0,2,$80,3,$80,9,0,3
	dc.b	$ce,$8a,$ee,$83,$16,9,$fc,$b
	dc.b	$ce,$bf,$ee,$bf,$16,'@',$fc,$ff
	dc.b	$e5,$f6,$f5,$ff,'2',6,$e7,$ff
	dc.b	'h',$81,$f9,0,'h',1,$f4,1
	dc.b	'_',$95,$7f,$dd,' ',$d2,$7f,$9f
	dc.b	$f1,'|',$f9,$7f,$10,$81,$e9,$fe
	dc.b	'Y',$e8,'}',$f0,'"',8,$7f,$f0
	dc.b	'5',$bf,$7f,$ff,'%',$80,'_',$ff
	dc.b	$e0,$d6,$e1,$ff,'`',$96,$a1,$7f
	dc.b	$ff,$c0,$ff,$a0,1,$80,$fe,$80
	dc.b	1,'Y',1,']',0,'"',0,$7f
	dc.b	4,$cc,$ce,$ec,'C',$c,$8d,$f4
	dc.b	')',$cb,'-',$ef,$12,'d?',$cf
	dc.b	$f8,0,$f8,0,$18,0,$f0,0
	dc.b	',',$82,'.',$e7,$11,'!?',$c6
	dc.b	'f',$14,'v',$16,$86,9,$fa,$1f
	dc.b	$e5,$9c,$f5,$98,'2l',$e7,$f8
	dc.b	'(',$eb,'.',$ef,$11,'d?',$cf
	dc.b	$f8,$a7,$f8,$b7,$18,'I',$f0,$ff
	dc.b	0,$a,$a0,2,$80,9,0,$b
	dc.b	$c8,$82,$ee,$82,$12,9,$fc,3
	dc.b	$c8,'|',$ee,$fe,$12,1,$fc,$ff
	dc.b	$d5,$fa,$f7,$ff,$12,$b,$e7,$fc
	dc.b	$95,'Qt',$e0,$f4,1,$c,1
	dc.b	'SM{',$8f,'$J',$7f,$8f
	dc.b	$e5,'g',$fd,$f7,$c,$8b,$f5,$fe
	dc.b	'Y',$e8,'}',$f0,'"',8,$7f,$f0
	dc.b	'-9>',$fd,'/',$e2,'0',$1f
	dc.b	'@',$b4,$e0,$fb,'@',$bf,$a0,$c0
	dc.b	$e5,' ',$f7,$a0,$89,0,'~',$80
	dc.b	0,'Y',0,'Y',1,'&',0,$7f
	dc.b	$dd,$80,$8c,$d8,$cb,'(',$8e,$f4
	dc.b	')',$ca,')',$ef,$16,'d?',$cf
	dc.b	'<',0,$bc,0,'\',0,$f4,0
	dc.b	',',$ee,',',$c6,$13,'e?',$c7
	dc.b	$c0,$14,'l',$14,$94,$b,'z',$1f
	dc.b	$e5,$f8,$f5,$fc,'2',$c,$e7,$f8
	dc.b	'(',$ca,'8',$ef,$17,'d?',$cf
	dc.b	'<',$a6,$bc,$e7,'\X',$f4,$ff
	dc.b	$a0,$a,' ',2,$80,9,0,$b
	dc.b	$ce,$8a,$cc,$82,'6',9,$fc,$b
	dc.b	$ce,$b4,$cc,$f6,'6',$89,$fc,$ff
	dc.b	$e5,$1e,$f7,$de,'2.',$e7,$fa
	dc.b	0,'A',0,'0',0,1,0,1
	dc.b	'S',$ad,'[',$ef,'$',$ea,$7f,$af
	dc.b	$f9,'f',$f9,'g',8,$9b,$f5,$fe
	dc.b	'Y',$f0,'Y',$f8,'&',$18,$7f,$f0
	dc.b	0,'i',0,'m',0,'R',0,$7f
	dc.b	$e0,1,$e0,1,' ',1,$c0,1
	dc.b	$a7,$80,$b7,$a0,'H',$80,$ff,0
	dc.b	1,'_',0,$7f,1,' ',1,$7f
	dc.b	$8a,$e,$d6,$1e,$c1,$ee,$87,$f2
	dc.b	'/',$c9,'?',$ed,$10,'f?',$cf
	dc.b	'/',$fe,'?',$ff,$c0,0,$ff,$ff
	dc.b	$af,$c5,$bf,$eb,$90,'`',$bf,$c3
	dc.b	7,$17,$f,$1f,$f7,8,$f9,$1f
	dc.b	$e5,'4',$f7,$bc,'2D',$e7,$f8
	dc.b	'/',$a9,'?',$cd,$10,'&?',$cf
	dc.b	'/??',$7f,$c0,$c1,$ff,$ff
	dc.b	' ',2,$a0,3,$80,9,0,3
	dc.b	$fc,$8a,$fe,$83,6,9,$fc,$b
	dc.b	$fc,$14,$fe,$1c,6,$b,$fc,$1f
	dc.b	$e4,$97,$f6,$9f,'3`',$e7,$ff
	dc.b	$ff,'p',$ff,$d0,0,'A',$ff,$c0
	dc.b	'Sys',$fb,',F',$7f,$bf
	dc.b	$f5,'}',$fd,$ff,4,$81,$f9,$fe
	dc.b	$1e,'*_',$bb,' J',$7f,$f3
	dc.b	$ff,$c9,$ff,$d9,0,'6',$ff,$ff
	dc.b	$ab,$ff,$ef,$ff,'(',0,$cf,$ff
	dc.b	'&',$a0,'g',$80,$d8,$80,$ff,0
	dc.b	1,'_',0,$7f,1,' ',1,$7f
	dc.b	$c6,$f0,$de,'t',$c5,$84,$87,'z'
	dc.b	',',$c9,'>',$e9,$11,'f?',$cf
	dc.b	$fc,$cb,$fb,'5',7,$fe,$fb,'5'
	dc.b	'/',$e3,$bf,$ef,$10,'b',$bf,$c3
	dc.b	'x',$16,':',$1f,$c2,8,$bd,$1f
	dc.b	'e8w',$bc,$b2,'L',$e7,$f8
	dc.b	'/',$c9,'/',$e9,$10,'f?',$cf
	dc.b	$f8,'?',$fb,$bf,7,$c1,$ff,$ff
	dc.b	$a0,$a,$a0,3,$80,9,0,$b
	dc.b	$fe,$8a,$fe,$83,6,9,$fc,$b
	dc.b	$fe,$17,$fe,$1f,6,8,$fc,$1f
	dc.b	$d4,$fc,$e4,$fd,$13,3,$e7,$ff
	dc.b	0,$90,$9a,$d0,$ff,1,$ff,$c0
	dc.b	'\',$c1,'^',$d5,'!>',$7f,$ff
	dc.b	'5~',$bd,$ff,'D',$83,$f9,$fe
	dc.b	'Z0z:E',$d9,$7f,$f3
	dc.b	0,9,$c0,$ad,$ff,$f2,$ff,$ff
	dc.b	$a0,0,$eb,2,$27,$ff,$cf,$ff
	dc.b	'&',$80,$b7,$a0,$c8,$80,$ff,0
	dc.b	1,'S',0,'{',1,'$',1,$7f
	dc.b	$1d,'7',$cb,'?@',$c7,$83,$f9
	dc.b	',',$85,',',$ef,$13,'"?',$cf
	dc.b	$ff,$fe,$ff,$ff,0,0,$ff,$ff
	dc.b	$a9,$8e,$bd,$e5,$92,' ?',$c1
	dc.b	$9b,$96,$9f,$96,'c',$89,$fc,$9f
	dc.b	'E4u8',$92,$c4,$e7,$f8
	dc.b	',',$c5,'.',$ef,$11,'b?',$cf
	dc.b	$ff,$fe,$ff,$ff,0,0,$ff,$ff
	dc.b	$80,$a,$a0,3,$80,9,0,$b
	dc.b	$98,$82,$de,$83,'"',9,$fc,3
	dc.b	$98,$16,$de,$17,'"',8,$fc,$1f
	dc.b	'b',$ff,'w',$ff,$b1,0,$e7,$ff
	dc.b	$ff,'A',$ff,$d0,0,'A',$ff,$81
	dc.b	'\',$ff,'\',$ff,'#',0,$7f,$ff
	dc.b	')E)v',$c8,$89,$f5,$fe
	dc.b	$1b,$f2,$1f,$fb,$14,$19,$1f,$f3
	dc.b	'w',$f9,'w',$f9,$88,6,$ff,$ff
	dc.b	$c9,$df,$cd,$df,'F ',$af,$ff
	dc.b	$e7,'`',$e7,' ',$19,0,$fe,$80
	dc.b	0,'S',0,'S',1,',',0,$7f
	dc.b	$c3,'`',$9f,'2',$c2,$ca,$83,$bd
	dc.b	'/',$ec,'/',$cc,$10,'k?',$cf
	dc.b	$e7,$c6,$f7,$f7,8,8,$ff,$ff
	dc.b	')',$e1,$a9,$cf,$96,'a?',$c1
	dc.b	$b0,$17,$99,$17,'e',8,$de,$9f
	dc.b	$f5,$f0,$e5,$fc,'2',4,$e7,$f8
	dc.b	',',$ac,',',$cc,$13,'+?',$cf
	dc.b	$e7,$c6,$f7,$f7,8,8,$ff,$ff
	dc.b	' ',$a,$80,2,$80,9,0,$b
	dc.b	$9e,$82,$9c,$82,'f',9,$fc,3
	dc.b	$9e,$16,$9c,$16,'f',9,$fc,$1f
	dc.b	'fsv{',$b5,$84,$e7,$ff
	dc.b	$e3,$11,$fb,$c0,4,'A',$ff,$81
	dc.b	'_',$e3,$7f,$fb,' ',4,$7f,$ff
	dc.b	$e5,'D',$fd,'G',$c,$b9,$f5,$fe
	dc.b	$a,'r',$b,'z',4,$99,$f,$f3
	dc.b	$cf,$1f,$ff,$df,0,' ',$ff,$ff
	dc.b	'+<',$eb,$ff,'d',0,$af,$ff
	dc.b	'|',$80,$7f,$e0,$81,$80,$fe,$80
	dc.b	0,'_',0,$7f,1,' ',0,$7f
	dc.b	$8a,$93,$d1,$97,$c4,'k',$81,$fc
	dc.b	$af,$ca,$bf,$e6,$90,'a',$bf,$c7
	dc.b	$e7,$c7,$e7,$c7,$18,'9',$ff,$ff
	dc.b	'/',$c5,$bf,$e8,$90,'b?',$c0
	dc.b	'I',$d7,$cb,$df,'5',$c8,$fe,'_'
	dc.b	$e5,$fc,$f7,$fc,'2',$c,$e7,$f8
	dc.b	'/',$ca,'?',$e6,$10,'a?',$c7
	dc.b	$e7,$c7,$e7,$c7,$18,'9',$ff,$ff
	dc.b	0,2,$a0,3,$80,9,0,3
	dc.b	$fc,$8a,$fe,$83,6,9,$fc,$b
	dc.b	$fc,$17,$fe,$1f,6,8,$fc,$1f
	dc.b	$d5,'s',$f3,'s',$10,$8c,$e3,$ff
	dc.b	$e3,$90,$e3,$c0,$1c,$c1,$ff,$80
	dc.b	'_',$e3,$7f,$e3,' ',$1c,$7f,$ff
	dc.b	$c5,$7f,$f9,$ff,$10,$83,$e9,$fe
	dc.b	$a,'j',$e,'{',5,$89,$f,$f3
	dc.b	$cf,$1e,$cf,$1f,'0',$e0,$ff,$ff
	dc.b	'+<',$cf,'<',$84,$c3,'O',$ff
	dc.b	'x',$e0,$7f,'@',$82,0,$fd,0
	dc.b	0,'^',0,'_',1,' ',0,$7f
	dc.b	'Q',$ad,$c7,$8f,'Aq',$81,$de
	dc.b	'/%/',$eb,$10,' ',$bf,$c3
	dc.b	$7f,$fd,$7f,$ff,$80,1,$ff,$ff
	dc.b	$af,'(',$af,$e3,$90,' ?',$c0
	dc.b	$d6,$97,$c7,$97,$b8,$88,$ef,'_'
	dc.b	$95,$e4,$f5,$fc,$12,4,$e7,$f8
	dc.b	'/%/',$eb,$10,' ?',$c3
	dc.b	$7f,$fd,$7f,$ff,$80,1,$ff,$ff
	dc.b	$a0,$a,$a0,$a,$80,1,0,3
	dc.b	$f2,$82,$fe,$82,2,9,$fc,3
	dc.b	$f2,$17,$fe,$17,2,8,$fc,$1f
	dc.b	$b2,$bf,$f5,$bf,'0@',$e1,$ff
	dc.b	$fe,$c1,$ff,$d0,0,$c1,$ff,$81
	dc.b	'_',$ff,'_',$ff,' ',0,$7f,$ff
	dc.b	9,'y',$f5,$7f,' ',$81,$d1,$fe
	dc.b	$b,$da,$b,$fa,4,$19,$f,$f3
	dc.b	$ff,$f8,$ff,$ff,0,1,$ff,$fe
	dc.b	'K',$ff,$ab,$ff,4,0,$8f,$ff
	dc.b	$e1,0,$fe,$c0,4,0,$fa,0
	dc.b	0,',',0,$7f,1,$c,0,$7f
	dc.b	$85,'C',$90,$df,$82,'3@',$ec
	dc.b	$16,'J?',$cd,6,'@',$bf,$a1
	dc.b	$d9,$bd,$ff,$fd,$19,$bd,$ff,$fe
	dc.b	$16,'B?',$c8,6,'A',$bf,$a0
	dc.b	$a1,$8b,'o',$9f,$19,$83,'v_'
	dc.b	'#(',$e7,$e8,' (',$d7,$f4
	dc.b	$15,'J?M',5,'@?',$a1
	dc.b	$99,$bd,$bf,$fd,'Y',$bd,$ff,$fe
	dc.b	' ',1,' ',3,0,8,$80,3
	dc.b	'd',$81,$fc,$83,'d',8,$fa,3
	dc.b	'd',$b,$fc,$1f,'d',3,$fa,$1f
	dc.b	'el',$e6,$ff,'`',$c,$d0,$ff
	dc.b	$de,$90,$fe,$90,$de,$81,$ff,'@'
	dc.b	',',$cc,$7f,$ff,$c,$cc,$7f,$ff
	dc.b	$94,$ca,$ed,$fa,$c0,$a,'!',$fd
	dc.b	5,$b1,$f,$f3,1,$b0,$f,$eb
	dc.b	$b6,'d',$ff,$ff,$b6,'f',$7f,$f9
	dc.b	$a6,$d9,'o',$ff,2,$d9,$d,$ff
	dc.b	$92,$80,$fd,$80,$98,0,$e4,0
	dc.b	1,$d5,1,'[',0,'_',0,'`'
	dc.b	'p',$aa,'RvA',$1e,$c0,'a'
	dc.b	$aa,$b9,$ad,$aa,$af,$a4,$b0,'`'
	dc.b	$a5,'n',$fb,$9e,$bf,$fc,$c0,3
	dc.b	$aa,$b8,$ad,$a9,$af,$a0,$b0,'`'
	dc.b	'UU;V',$8f,'W0',$d8
	dc.b	'UV',$d7,$b5,$d5,$f4,'6',$c
	dc.b	'j',$bd,$bd,$ae,'/',$a0,'0`'
	dc.b	$a5,'n',$fb,$9e,$bf,$fc,$c0,3
	dc.b	$e0,$e,$a0,$a,$80,2,$80,3
	dc.b	$ab,$8e,$da,$8a,$fa,2,6,3
	dc.b	$ab,'5',$da,$d6,$fa,$17,6,$18
	dc.b	'^',$d2,$d7,'}',$d0,'_0`'
	dc.b	$b7,'q',$cf,'Q',$fe,'@',1,$c0
	dc.b	$da,$e9,'}',$f7,'_',$ff,'`',0
	dc.b	'oU',$dd,$ed,'A}',$c1,$83
	dc.b	$9a,$aa,'kk',$b,$ea,$c,$1b
	dc.b	$d7,'K',$ef,$be,$ff,$fa,0,6
	dc.b	'{]',$ef,$be,$b,$ff,$c,0
	dc.b	'-',0,$fb,0,$e8,0,$18,0
	dc.b	0,'@',1,$80,0,0,0,0
	dc.b	'B@1',0,0,$80,0,0
	dc.b	0,'$',0,$1a,0,1,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	0,'!',0,$18,0,0,0,0
	dc.b	' ',0,$80,0,'@',0,0,0
	dc.b	0,5,0,3,0,0,0,0
	dc.b	$a0,'%',$c0,$1b,0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	$80,2,'`',$c,0,0,0,0
	dc.b	2,2,1,$8c,0,0,0,0
	dc.b	2,$d0,1,$e0,0,0,0,0
	dc.b	$12,$a0,$d,$c0,0,0,0,0
	dc.b	0,'@',0,'1',0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dc.b	$a9,1,'v',0,0,0,0,0
	dc.b	'h',0,$f0,0,0,0,0,0
	dc.b	0,5,0,3,0,0,0,0
	dc.b	'H',0,$b0,0,0,0,0,0
	dc.b	$14,0,$e,0,0,0,0,0
	dc.b	1,'Y',0,$e6,0,0,0,0
	dc.b	$11,'C',$e0,$fc,0,0,0,0
	dc.b	'Ai',$fe,$f0,0,0,0,0
	dc.b	'^',$ba,$ef,'}',0,0,0,0
	dc.b	$ad,'h',$de,$f0,0,0,0,0
	dc.b	$b6,$b7,'y',$cf,0,0,0,0
	dc.b	'UM',$bb,$be,0,0,0,0
	dc.b	$b7,'ix',$f0,0,0,0,0
	dc.b	'K{',$f7,$9d,0,0,0,0
	dc.b	$a0,$a,$c0,7,0,0,0,0
	dc.b	'V',$8a,$ef,7,0,0,0,0
	dc.b	$b6,$db,$cf,'<',0,0,0,0
	dc.b	$b4,$ad,'xs',0,0,0,0
	dc.b	$d5,'Q',$ee,$e0,0,0,0,0
	dc.b	'H',$ca,$f7,'7',0,0,0,0
	dc.b	$a5,')',$c3,$d7,0,0,0,0
	dc.b	'm2',$9e,$cf,0,0,0,0
	dc.b	'VE',$b9,$fe,0,0,0,0
	dc.b	'*',$ba,$1f,'g',0,0,0,0
	dc.b	$b4,0,'x',0,0,0,0,0
	dcb.w	408
	dc.b	0,2,0,1,0,0,0,0
	dc.b	$8c,$c7,$80,0,$7f,$ff,$c,$c7
	dc.b	$c,$a8,0,$b0,$ff,'@',$c,0
	dc.b	5,$93,3,$83,0,'|',0,$10
	dc.b	'l',$ca,$9c,$c,3,$f0,0,$c0
	dc.b	'V',$d6,'0',7,$f,$f8,6,$d0
	dc.b	$94,'e',$c,6,3,$f8,0,'`'
	dc.b	$a6,'8`',0,$1f,$ff,6,'8'
	dc.b	$c6,'T',0,'X',$ff,$a0,$c6,0
	dc.b	0,$15,0,$d,0,2,0,0
	dc.b	'kJ',8,'L',$f7,$b0,'c',0
	dc.b	'Y',$b6,'9',$87,6,'x',0,'0'
	dc.b	$80,$b5,0,'q',0,$e,0,4
	dc.b	$ad,'R',$8c,'as',$80,'!',0
	dc.b	$91,$d1,$80,1,$7f,$fe,$11,$d0
	dc.b	'@',0,$80,0,0,0,0,0
	dcb.w	8
l0072	dcb.w	9
	dc.b	0,3,0,0,0,0,$80,0
	dcb.w	3
	dc.b	0,'*',0,$1c,0,0,0,0
	dc.b	1,1,6,0,0,0,0,0
	dc.b	'H',9,$d0,6,' ',0,0,0
	dc.b	'P',2,$e0,1,0,0,0,0
	dc.b	$a4,5,$d8,3,0,0,0,0
	dc.b	' ',0,'@',0,$80,0,0,0
	dc.b	0,$15,0,$e,0,0,0,0
	dc.b	0,'D',0,'8',0,0,0,0
	dcb.w	28
	dc.b	$1b,$ea,$f,$fb,'(',$a,$f,$fb
	dc.b	$ff,$fd,$ff,$ff,0,1,$ff,$ff
	dc.b	$b0,'7`',$1f,0,'P',0,$1f
	dc.b	$d9,$be,$f6,$ff,$10,$80,$f0,$ff
	dc.b	$f6,$ff,$bb,$ff,$82,0,$83,$ff
	dc.b	$db,$df,$f7,$7f,$10,'@',$f0,$7f
	dc.b	'f',$fa,$db,$fe,'B',2,$c3,$fe
	dc.b	$bf,$fe,$ff,$ff,$80,0,$ff,$ff
	dc.b	$c8,$b,$b0,6,$80,0,$80,0
	dcb.w	4
	dc.b	0,8,0,8,0,0,0,8
	dcb.w	5
	dc.b	8,0,0,0,0,0,0,0
	dcb.w	6
	dc.b	0,8,0,0,0,0,0,0
	dc.b	0,0,0,$10,$a,$d2,$27,$e1
	dc.b	$f,$fb,0,3,$cc,$b3,$ff,$fc
	dc.b	$ff,$ff,'X',0,$b0,$15,0,'O'
	dc.b	$80,$1f,' ',1,$a0,$ad,$c0,'~'
	dc.b	$f0,$ff,'*',0,'6g',1,$ff
	dc.b	$87,$ff,'5',0,';V',$c0,'?'
	dc.b	$f8,$7f,$80,4,$82,$b4,1,$f8
	dc.b	$c3,$fe,0,1,$b3,$19,$7f,$fe
	dc.b	$ff,$ff,$a4,$16,$d8,$d,0,0
	dc.b	$c0,1,0,0,0,0,0,0
	dcb.w	3
	dc.b	0,8,0,8,0,0,0,0
	dcb.w	2
	dc.b	8,0,8,0,0,0,0,0
	dcb.w	4
	dc.b	0,8,0,8,0,8,0,0
	dcb.w	4
	dc.b	')',$ea,'-',$fb,6,9,$f,$f3
	dc.b	$7f,$fc,$7f,$fc,$80,3,$ff,$ff
	dc.b	$a0,'S',$d8,'[',0,$c,$c0,$1f
	dc.b	$d0,$9e,$f0,$df,$10,'`',$e0,$ff
	dc.b	$94,$7f,$ad,$7f,$83,$80,$f,$ff
	dc.b	$ca,'O',$cd,'o00',$fc,$7f
	dc.b	'Bz',$c3,'~A',$82,$83,$fc
	dc.b	$9f,$fe,$df,$fe,'`',1,$ff,$ff
	dc.b	'P',$d,'l',$1b,$80,0,$e0,3
	dc.b	'm',$c7,$9e,'D',$ff,$c7,0,'8'
	dc.b	'kk',$fc,$eb,$ff,$e3,0,$1c
	dc.b	'U',$b7,$be,'y',$ff,$ff,0,0
	dc.b	1,'c',$b,$eb,3,$e3,$f4,$14
	dc.b	'[',$ed,$fc,'s',$ff,$ff,0,0
	dc.b	$80,$88,$e3,$eb,$e3,$eb,$1c,$14
	dc.b	'V',$c2,$b9,$ea,$ff,$e2,0,$15
	dc.b	9,':',9,$bb,'&Y',$f,$f3
	dc.b	$ff,$1f,$ff,$df,0,' ',$ff,$ff
	dc.b	'T',$13,'h',$13,$c0,'L',$a0,$1f
	dc.b	$f0,$9f,$f0,$9f,'0a',$e0,$ff
	dc.b	$a9,$f1,$9d,$fd,$86,2,$1f,$ff
	dc.b	$f5,'O',$f6,'O',$c,'0',$fa,$7f
	dc.b	$c2,'~',$c2,'~',$c1,$86,$83,$fc
	dc.b	$bf,$e7,$ff,$f7,'@',8,$ff,$ff
	dc.b	$aa,'*',$b4,$17,'`',1,$d0,7
	dcb.w	6
	dc.b	0,8,0,8,0,0,0,0
	dcb.w	2
	dc.b	8,8,8,8,0,0,0,0
	dcb.w	4
	dc.b	8,0,8,0,8,0,0,8
	dc.b	0,8,0,8,0,0,0,0
	dc.b	'+2',$f,':$',$d9,'/',$f3
	dc.b	$e7,'?',$f7,'?',8,$c0,$ff,$ff
	dc.b	$f8,'W',$f4,$17,'0H',$d0,'_'
	dc.b	$d0,$a6,$f0,$b7,$10,'H',$e0,$ff
	dc.b	$b3,$f1,$b3,$f1,$ac,$e,'?',$ff
	dc.b	$ff,'_',$ff,'_',3,' ',$fd,$7f
	dc.b	'B',$9a,$c2,$de,'A"',$83,$fc
	dc.b	$b9,$e7,$bd,$e7,'B',$18,$ff,$ff
	dc.b	$fc,$1c,$fa,',8',$b,$c8,$f
	dcb.w	6
	dc.b	0,8,0,8,0,0,0,0
	dcb.w	2
	dc.b	8,0,8,8,0,0,0,0
	dc.b	0,0,8,0,0,0,8,0
	dc.b	0,8,0,8,0,8,8,0
	dc.b	0,0,8,8,0,0,0,0
	dc.b	$b,$ca,$b,$fa,'$',9,$f,$f3
	dc.b	$e7,$fc,$e7,$fe,$18,1,$ff,$ff
	dc.b	$a0,$14,$f4,$1e,' I',$d0,$1f
	dc.b	$e0,$a7,$f0,$f7,'0I',$e0,$ff
	dc.b	7,$ff,$af,$ff,$98,0,'?',$ff
	dc.b	$ca,'S',$ef,'{',$12,'$',$fd,$7f
	dc.b	$82,$9c,$c2,$de,$c1,'&',$83,$fc
	dc.b	$b9,$ff,$b9,$ff,'F',0,$ff,$ff
	dc.b	$e0,'!',$f2,'+',$10,6,$e8,$f
	dcb.w	4
	dc.b	0,$18,0,$18,0,$10,0,$18
	dcb.w	4
	dc.b	$10,8,8,8,0,0,0,0
	dc.b	8,0,8,0,0,0,8,0
	dc.b	8,$10,8,0,8,0,0,$18
	dc.b	8,8,8,8,0,0,0,0
	dc.b	5,$92,$f,$f3,'!',$91,$f,$eb
	dc.b	$f9,'L',$ff,$fe,1,'A',$ff,$ff
	dc.b	$f0,$14,$f4,$1c,$10,'K',$e0,$1f
	dc.b	$e0,$a7,$f0,$e7,'0Y',$e0,$ff
	dc.b	'$',$b4,$a6,$ff,$99,'4?',$ff
	dc.b	$cf,'S',$ef,'s',$11,',',$fe,$7f
	dc.b	$82,$9c,$c3,$9e,$c1,'f',$83,$fc
	dc.b	$be,'N',$ff,$ff,'@@',$ff,$ff
	dc.b	'h)z)',$88,6,$f0,$f
	dc.b	2,$d5,3,'>',3,$ff,0,0
	dc.b	$aa,$da,'v',$db,$fe,$a3,1,$fc
	dc.b	$e3,$a0,'"b',$e3,$e2,$1c,$1d
	dc.b	$db,'j[',$ab,'#',$e3,4,$14
	dc.b	$87,$eb,'l',$9c,$e7,$ff,$18,0
	dc.b	8,$a1,$ea,'#',$ea,'#',$15,$dc
	dc.b	$80,$8a,'kj',$e3,$e2,$14,$15
	dc.b	'*',$aa,$b,'k+',$e9,',',$1b
	dc.b	$f9,$bc,$fd,$fc,1,$f3,$fe,$f
	dc.b	$d4,'U',$f0,$1d,$10,'J',$e0,'_'
	dc.b	$d0,$bf,$f0,$ff,$10,'A',$e0,$ff
	dc.b	',',$db,$bc,$ff,$93,'_?',$e0
	dc.b	$cd,'_',$cf,$7f,'1 ',$fe,$7f
	dc.b	'B',$fc,$83,$fe,'A',6,$83,$fc
	dc.b	$be,':',$ff,'{@t',$ff,$8f
	dc.b	'j',$b,'x',$f,$88,'$',$f0,$f
	dcb.w	4
	dc.b	0,$a8,0,$e8,0,'@',0,$e8
	dc.b	0,8,0,8,0,8,0,0
	dc.b	$e8,$10,$a8,8,'@',0,'@',0
	dc.b	8,0,8,0,0,0,8,0
	dc.b	$10,0,0,'@',0,'@',$18,$e8
	dc.b	8,$10,8,8,0,0,0,0
	dc.b	' ',2,0,3,' ',1,' ',3
	dc.b	$ff,'7',$ff,'7',7,'(',$fd,'?'
	dc.b	$e4,'W',$f0,$17,'0H',$e0,'_'
	dc.b	$df,'?',$ff,$7f,0,$c1,$ff,$ff
	dc.b	'/',$b3,$bf,$f3,$90,'2?',$d3
	dc.b	'~_',$7f,'_',$83,' ',$fe,$7f
	dc.b	2,$cc,$c3,$ee,'A',$16,$83,$fc
	dc.b	$bf,$da,$ff,$da,'A',$d5,$ff,'_'
	dc.b	'r+p',$f,$90,'$',$e8,'/'
	dcb.w	4
	dc.b	0,'@',0,'`',0,$88,0,$e8
	dc.b	0,8,0,8,0,8,8,0
	dc.b	'@',$a0,'`x',$88,0,0,0
	dc.b	0,8,8,8,0,0,8,8
	dc.b	$d0,$a8,'p',$88,'p',$88,$88,'`'
	dc.b	8,$d8,8,'X',0,' ',0,0
	dc.b	$b,$ea,$f,$fa,'(',9,$f,$fb
	dc.b	$8a,$17,$ee,$1f,$12,8,$fc,$1f
	dc.b	$d4,$14,$f0,$1f,$10,'H',$e0,$1f
	dc.b	'`?k?',$9f,$c1,$ff,$ff
	dc.b	$af,$e1,'/',$e1,$90,'`?',$c1
	dc.b	'}Q',$ff,'}"',$fe,$7f
	dc.b	$c2,$c8,$83,$ce,$c1,'2',$83,$fc
	dc.b	$a2,$9b,$bb,$9f,'D',$94,$ff,$1f
	dc.b	$dc,$b,$fa,$b,$18,'$',$e8,$f
	dcb.w	4
	dc.b	0,$98,0,$98,0,0,0,$98
	dc.b	8,0,8,0,8,0,0,8
	dc.b	$98,'@',$98,$a8,0,'@',0,'@'
	dc.b	$10,0,$18,0,$10,8,$18,8
	dc.b	$a8,0,$e8,0,$e8,0,'@',$98
	dc.b	$10,$e8,8,$a8,0,'@',0,'@'
	dc.b	' ',$12,'+',$d2,7,$e1,$f,$fb
	dc.b	$9c,$16,$9e,$1f,'f',8,$fc,$1f
	dc.b	'`Vt^',$b0,9,$e0,$1f
	dc.b	$7f,$c6,$7f,$f7,$80,8,$ff,$ff
	dc.b	$a9,$c1,'-',$e1,$92,'`?',$c1
	dc.b	'DQwq',$89,'.',$fe,$7f
	dc.b	$82,$fe,$c2,$fc,$c1,6,$83,$fc
	dc.b	$a7,'#',$a7,$b7,'Y',$ac,$ff,'?'
	dc.b	$a2,'*',$f4,'+ ',4,$d0,$f
	dc.b	0,5,0,6,0,7,0,0
	dc.b	$ae,$db,'v',$da,$fe,$ab,1,$fc
	dc.b	$a2,$aa,'c',$ea,$e3,$ea,$1c,$15
	dc.b	$da,$ad,'R',$8f,'"',7,5,0
	dc.b	$a7,$a8,$fd,'j',$87,$e2,$f8,$1d
	dc.b	'@',$a8,$ca,'"',$ca,'"%',$dd
	dc.b	$a0,'Bzb',2,$8a,5,5
	dc.b	9,$ea,$d,$fb,'&',9,$f,$f3
	dc.b	$fe,$16,$fc,$16,6,9,$fc,$1f
	dc.b	'p',$17,'d',$17,$b0,'H',$e0,$1f
	dc.b	$ff,$c7,$ff,$c7,0,'9',$ff,$ff
	dc.b	')',$e1,$bd,$c1,$92,'`?',$c1
	dc.b	'G_',$c6,$7f,$bb,' ',$fe,$7f
	dc.b	2,$fe,$c3,$fc,'A',6,$83,$fc
	dc.b	$bf,$93,$ff,';A',$8c,$ff,'?'
	dc.b	$14,'*',$d4,'/P',4,$b0,$f
	dcb.w	8
	dc.b	8,$10,8,0,8,0,0,$18
	dc.b	0,0,0,$98,0,0,0,0
	dc.b	0,0,$e8,0,'@',8,$e8,8
	dc.b	$98,0,$98,0,$98,0,0,0
	dc.b	'@',$98,$a8,$98,'@',0,'@',0
	dc.b	')',$fa,$d,$fb,'&',$19,'/',$f3
	dc.b	$f8,$17,$fe,$1f,2,8,$fc,$1f
	dc.b	$d4,'K',$e0,$1f,$10,'C',$e0,'_'
	dc.b	'6',$bf,$ff,$bf,'6A',$ff,$ff
	dc.b	$a9,$81,$b9,$e1,$96,' ?',$c1
	dc.b	'~_',$ff,$7f,$83,' ',$fe,$7f
	dc.b	$82,$fc,$c2,$fe,$c1,6,$83,$fc
	dc.b	$be,$17,$ff,$b7,'@',$88,$ff,'?'
	dc.b	'T',$a,$d4,$e,'P%',$b0,$f
	dcb.w	8
	dc.b	8,' ',8,' ',8,' ',0,'X'
	dc.b	0,' ',0,'p',0,0,0,0
	dc.b	$a8,0,$e8,0,' ',8,$e8,8
	dc.b	$d8,0,'p',0,'p',0,$88,0
	dc.b	$a8,$d8,$c8,'P',0,' ',0,0
	dc.b	$a,'j',$f,'z$',$89,$f,$f3
	dc.b	$c8,$17,$ee,$17,$12,8,$fc,$1f
	dc.b	$e4,$14,$f0,$17,'0W',$e0,$18
	dc.b	$ad,'3s{',$ff,'E',0,$ff
	dc.b	$af,$81,$af,$e1,$90,' ?',$c1
	dc.b	'e_v',$7f,$89,' ',$fe,$7f
	dc.b	$c2,$ca,$c2,$ec,$c1,$12,$83,$fc
	dc.b	$b2,'#',$bb,$b3,'D',$ac,$ff,'?'
	dc.b	$e2,'+',$f4,$b,' $',$d0,'/'
	dcb.w	8
	dc.b	$10,0,0,'@',0,'@',$18,$e8
	dcb.w	4
	dc.b	0,$18,$98,$18,0,$10,$98,$18
	dcb.w	5
	dc.b	$98,0,0,0,0,0,$a,'r'
	dc.b	$b,'z$',$99,$f,$f3,$ce,$14
	dc.b	$cc,$17,'6',8,$fc,$1f,'p',0
	dc.b	't',0,$b0,'@',$e0,0,0,$b2
	dc.b	0,$bb,0,'D',0,$ff,'/',$e1
	dc.b	$bf,$e1,$90,'`?',$c1,'f_'
	dc.b	$f7,$7f,$8b,' ',$fe,$7f,$c2,$cc
	dc.b	$c3,$ee,$c1,$16,$83,$fc,$b3,$92
	dc.b	$b3,$17,'M',$9c,$ff,$1f,'\+'
	dc.b	'z',$f,$98,'$',$e8,'/',0,'-'
	dc.b	0,'3',0,'?',0,0,'[V'
	dc.b	$ec,$ee,$ff,$fe,0,1,$d2,$ab
	dc.b	'r',$8a,'r',$8b,$8d,'d[',$fb
	dc.b	$fc,'g',$ff,$ff,0,0,$ae,$d8
	dc.b	$fe,$db,$8e,$a3,$f9,$fc,$ad,'X'
	dc.b	's',$be,$ff,$fe,0,1,$a9,'j'
	dc.b	's',$9e,3,$fe,4,1,'*r'
	dc.b	$a,'z%™/',$f3,$fc,$14
	dc.b	$fe,$1c,6,$b,$fc,$1f,'d@'
	dc.b	't',0,$b0,'@',$e0,'@',0,$b3
	dc.b	0,$f3,0,'M',0,$ff,$a8,$f3
	dc.b	'>',$f3,$91,'r?',$d3,'gQ'
	dc.b	$e7,'}',$9b,'"',$fe,$7f,$e6,$ce
	dc.b	$e7,$ce,$e5,'6',$a7,$fc,$bf,$a
	dc.b	$bf,'ŽA',$85,$ff,$f,'r',$a
	dc.b	'r',$f,$90,'$',$e8,$f,0,0
	dcb.w	7
	dc.b	$a8,0,$e8,0,$e8,0,'@',$98
	dcb.w	4
	dc.b	0,$a8,0,$e8,0,'@',0,$e8
	dcb.w	8
	dc.b	'+',$f2,$f,$fb,'$',$19,'/',$f3
	dc.b	$9a,$17,$de,$1f,'"',8,$fc,$1f
	dc.b	$d0,'W',$e4,$1f,$10,'P',$e0,'_'
	dc.b	$ff,'?',$ff,$7f,0,$c1,$ff,$ff
	dc.b	'$',$be,$b4,$fe,$9b,1,'?',$ff
	dc.b	'|I',$ff,'i6',$fe,$7f
	dc.b	'|',$f8,$fd,$fe,3,2,$ff,$fc
	dc.b	$a6,$8b,$f7,$8f,'H',$84,$ff,$f
	dc.b	$e8,')',$fa,'-',8,6,$f0,$f
	dcb.w	8
	dc.b	'@ ',$c8,' ',$c8,'  P'
	dcb.w	4
	dc.b	0,'@',0,'`',0,$88,0,$e8
	dcb.w	8
	dc.b	$b,'2',$f,$bb,'$Y',$f,$f3
	dc.b	$9c,$17,$de,$17,'&',8,$fc,$1f
	dc.b	$e4,0,$f0,$16,'0O',$e0,$1f
	dc.b	0,'?f',$bf,$ff,$c1,$ff,$ff
	dc.b	$a7,$e0,$a7,$ed,$98,$1f,'?',$ff
	dc.b	'MOmO',$91,'0',$fe,$7f
	dc.b	$c0,$9a,$d8,$da,'?"',$ff,$fc
	dc.b	$a7,$b,$f7,$8b,'I',$84,$ff,$f
	dc.b	$f2,'+',$f8,'/',$18,4,$f0,$f
	dcb.w	8
	dc.b	$98,0,$98,0,$98,0,0,0
	dcb.w	4
	dc.b	0,$98,0,$98,0,0,0,$98
	dcb.w	8
	dc.b	$b,'"',$b,':$',$c9,$f,$f3
	dc.b	$9a,$16,$9c,$17,'b',8,$fc,$1f
	dc.b	'd',$13,'p',$1b,$b0,'L',$e0,$1f
	dc.b	$ff,$e6,$ff,$f7,0,8,$ff,$ff
	dc.b	7,$ff,$af,$ff,$98,0,'?',$ff
	dc.b	$ca,$f,$ca,'_20',$fd,$7f
	dc.b	$ff,$94,$ff,$94,0,'d',$ff,$fa
	dc.b	$a6,$8b,$a7,$b,'X',$84,$ff,$f
	dc.b	'0',$a,$ba,$f,'X$',$f0,$f
	dc.b	$b,'U',$c,$ef,$f,$ff,0,0
	dc.b	'm',$c6,$9e,'F',$ff,$c6,0,'9'
	dc.b	$db,$db,'r|s',$ff,$8c,0
	dc.b	$ee,':r',$27,$fe,'?',1,$c0
	dc.b	$de,$d9,$e2,$db,$fe,$ab,1,$fc
	dc.b	$9a,$d6,$fd,$ef,$ff,$ff,0,0
	dc.b	$de,'š?~',$ff,$fe,0,1
	dc.b	'+',$fa,$b,$f2,'$',$19,'/',$f3
	dc.b	$f8,$16,$fe,$16,2,9,$fc,$1f
	dc.b	'TV`',$17,$90,'H',$e0,'_'
	dc.b	'9',$e7,$bd,$e7,'B',$19,$ff,$ff
	dc.b	$b3,$9c,'3',$de,$ac,'!?',$ff
	dc.b	$f9,$e7,$ff,'g',3,'X',$fd,$7f
	dc.b	'9',$f2,$bd,$fe,'B',6,$ff,$fa
	dc.b	$be,$b,$bf,$8b,'@',$84,$ff,$f
	dc.b	'**2',$a,$c8,'%',$f0,'/'
l0073	dc.b	0,9,0,6,0,0,0,0
	dc.b	$10,2,$a0,1,'@',0,0,0
	dc.b	$a2,$a0,$c1,$c0,0,0,0,0
	dc.b	0,'H',0,'5',0,2,0,0
	dc.b	$80,1,0,0,0,0,0,0
	dc.b	0,0,$c0,0,0,0,0,0
	dcb.w	5
	dc.b	0,8,0,0,0,0,0,8
	dc.b	0,8,0,0,0,8,0,0
	dcb.w	2
	dc.b	0,8,0,0,0,0,0,0
	dcb.w	9
	dc.b	$bf,$fe,$ff,$ff,$80,0,$ff,$ff
	dc.b	$f6,$ff,$bb,$ff,$82,0,$83,$ff
	dc.b	$db,'m',$f6,'7',$10,4,$f0,7
	dc.b	$ff,$f7,$ff,$fd,0,4,$ff,$fc
	dc.b	$b7,$ff,$df,$ff,$10,0,$1f,$ff
	dc.b	$dc,0,$f4,0,$10,0,$f0,0
	dcb.w	8
	dc.b	$80,0,$80,0,0,0,0,0
	dcb.w	2
	dc.b	$80,0,$80,0,$80,0,$80,0
	dc.b	$80,0,0,0,0,0,0,0
	dcb.w	6
	dc.b	$80,1,$99,$19,$7f,$fe,$ff,$ff
	dc.b	'*',0,$b6,'k',1,$ff,$87,$ff
	dc.b	'5',$d4,';l',$c0,3,$f8,$f
	dc.b	0,9,$c8,$cd,$ff,$f0,$ff,$fc
	dc.b	'P',0,$b3,'#',$f,$ff,'?',$ff
	dc.b	'$',0,'4',0,$c0,0,$f0,0
	dcb.w	9
	dc.b	$80,0,0,0,0,0,$80,0
	dc.b	$80,0,0,0,$80,0,$80,0
	dc.b	$80,0,$80,0,0,0,0,0
	dcb.w	7
	dc.b	$1f,$fe,'_',$ff,$e0,0,$ff,$ff
	dc.b	$94,$7f,$ad,$7f,$83,$80,$f,$ff
	dc.b	$ca,$a8,$cd,$da,'0',7,$fc,$1f
	dc.b	$ff,$f4,$ff,$fd,0,4,$ff,$f8
	dc.b	$a3,$ff,'k',$ff,$1c,0,$7f,$ff
	dc.b	$d0,0,$f4,0,$10,0,$e0,0
	dcb.w	8
	dc.b	$80,0,$80,0,0,0,0,0
	dcb.w	2
	dc.b	$80,0,$80,0,0,0,0,0
	dc.b	0,0,$80,0,0,0,0,0
	dcb.w	6
	dc.b	'|f',$7f,'w',$80,$88,$ff,$ff
	dc.b	$a9,$f1,$9d,$fd,$86,2,$1f,$ff
	dc.b	$f5,'S',$f6,$bb,$c,$c,$fa,'?'
	dc.b	$e3,'5',$fb,$bc,4,'D',$ff,$f8
	dc.b	'O',$8c,$ef,$ee,'0',$11,$ff,$ff
	dc.b	$d4,'Z',$f4,'g',$10,$7f,$e0,$80
	dc.b	$ab,'n|',$f2,$ff,$fe,0,1
	dc.b	':',$de,$27,$e2,'?',$fe,$c0,1
	dc.b	$ad,'V',$b3,$be,'?',$fe,'@',1
	dc.b	'66:',$e,$be,'>',$c1,$c1
	dc.b	$b6,$dc,$b9,$e4,$bf,$fc,'@',3
	dc.b	'u',$bd,'O',$c7,$7f,$ff,$80,0
	dc.b	'o',0,$f1,0,$ff,0,0,0
	dc.b	$fc,'g',$fc,'g',3,$99,$ff,$ff
	dc.b	'3',$f3,$b3,$f3,$ac,$c,'?',$ff
	dc.b	$ff,$e7,$ff,'g',3,'X',$fd,$7f
	dc.b	$e3,'9',$e3,'=',$1c,$cd,$ff,$f9
	dc.b	$9f,$8c,$9f,$8c,'`s',$ff,$ff
	dc.b	$e0,0,$f4,0,'0',0,$e0,0
	dcb.w	4
	dc.b	$80,1,$80,0,$80,0,0,0
	dc.b	0,1,$80,1,0,1,0,1
	dc.b	$80,$81,$80,$80,0,$80,$80,1
	dcb.w	3
	dc.b	$80,0,0,0,0,0,0,0
	dcb.w	5
	dc.b	$ff,$fd,$ff,$ff,0,1,$ff,$ff
	dc.b	$87,$ff,$af,$ff,$98,0,'?',$ff
	dc.b	$ca,$f,$ef,'_',$12,'0',$fd,$7f
	dc.b	$ff,$ec,$ff,$fd,0,$c,$ff,$f9
	dc.b	'?',$ff,$7f,$ff,$c0,0,$ff,$ff
	dc.b	$b4,0,$f0,0,'0',0,$e0,0
	dc.b	0,0,$80,0,0,0,$80,0
	dc.b	0,$a,0,7,0,0,$80,0
	dc.b	0,$d,$80,$8d,0,$a,0,$8f
	dc.b	$80,2,$80,2,0,2,$80,$85
	dc.b	0,0,0,$80,0,0,$80,0
	dc.b	0,0,0,$80,0,0,0,$80
	dcb.w	4
	dc.b	'-',$b5,$bf,$fd,'M',$b5,$ff,$fe
	dc.b	'$',$b4,'&',$ff,$19,'4',$bf,$ff
	dc.b	$cf,'I',$ef,'M',$11,'2',$fe,$7f
	dc.b	'm',$a9,$ff,$e9,'m',$a8,$ff,$f5
	dc.b	'%',$b6,'7',$ff,$c9,$b6,$ff,$ff
	dc.b	$a0,0,$a4,0,$a0,0,$d0,0
	dc.b	$80,0,$80,0,0,0,$80,0
	dc.b	$80,4,$80,$a,$80,4,0,4
	dc.b	0,$8a,$80,$8e,0,4,0,$8e
	dc.b	$80,$80,$80,$84,0,$84,$80,$e
	dc.b	0,$80,0,$80,0,0,$80,0
	dc.b	0,$80,0,$80,0,0,0,$80
	dcb.w	4
	dc.b	'6',$96,'?n',$d7,$fe,$f8,1
	dc.b	$ac,$db,$bc,$ff,$93,'_',$bf,$e0
	dc.b	$cd,'Y',$cf,'y1&',$fe,$7f
	dc.b	$b4,$b5,$fb,'u',$bf,$f4,$c0,$d
	dc.b	'f',$d2,$e7,$ed,$9a,$ff,$ff,0
	dc.b	$dc,'H',$d4,'v',$d0,'~0'
	dc.b	';.',$a7,$f2,'?',$fe,$c0,1
	dc.b	$b6,'*',$aa,'(',$be,' A',$d0
	dc.b	$ac,'$',$b2,$a6,'>(A',$de
	dc.b	'6',$aa,':',$a8,$be,$a8,$c1,'V'
	dc.b	$b6,'*',$ba,$bf,$be,'?A@'
	dc.b	$da,'.>',$a9,$fe,'/',1,$d0
	dc.b	$b7,$ad,$f8,$fe,$ff,$ff,0,0
	dc.b	$ec,0,$fc,0,$c,0,$f4,0
	dc.b	'/',$b3,'?',$f3,$10,'2?',$d3
	dc.b	'~_',$7f,$7f,$83,' ',$fe,$7f
	dc.b	'`',1,$e0,1,'`',0,$a0,1
	dc.b	'}',$80,$ff,$80,$81,$80,$fe,$80
	dc.b	$10,0,$c,0,0,0,0,0
	dc.b	$80,1,$80,0,0,0,$80,1
	dc.b	0,$80,0,$89,0,$80,$80,0
	dc.b	0,$89,$80,$89,0,0,0,$89
	dc.b	$81,0,$80,0,0,0,$81,$89
	dc.b	0,$80,0,$80,0,0,$80,0
	dc.b	0,$80,0,$80,0,0,0,$80
	dcb.w	4
	dc.b	$ff,$e8,$ff,$f8,0,8,$ff,$f8
	dc.b	'/',$e1,'/',$e1,$10,'`?',$c1
	dc.b	'}_',$ff,'_ ',$fe,$7f
	dc.b	$c0,1,$c0,1,$c0,0,$80,1
	dc.b	$7f,$fd,$7f,$ff,$80,1,$ff,$ff
	dc.b	'T',0,'8',0,0,0,0,0
	dc.b	0,$8d,$80,$87,0,7,$80,$88
	dc.b	0,$82,0,$87,0,$80,$80,0
	dc.b	0,$d,0,$8d,0,$a,0,$8f
	dc.b	$8d,2,$87,2,$87,2,$88,$85
	dc.b	0,$80,0,$80,0,0,0,0
	dc.b	0,0,$80,$80,0,0,0,$80
	dcb.w	4
	dc.b	'p',$10,'wX',$8f,$e0,$ff,$f8
	dc.b	')',$ca,'-',$ee,$12,'i?',$cf
	dc.b	'fS',$f7,'[',$8b,'$',$fe,$7f
	dc.b	$80,1,$c0,1,$c0,0,$80,1
	dc.b	'N',2,'n',$eb,$91,$fc,$ff,$ff
	dc.b	' ',1,'@',1,0,1,0,1
	dc.b	0,$a,$80,$e,0,$8e,$80,$84
	dc.b	$80,0,$80,0,$80,0,0,$80
	dc.b	1,0,1,$80,1,0,1,$80
	dc.b	$a,$80,$e,$80,$e,$80,4,0
	dc.b	1,0,0,$80,0,0,0,0
	dc.b	$81,0,$81,$80,1,0,1,$80
	dcb.w	4
	dc.b	'O',$e8,'o',$f8,$90,8,$ff,$f0
	dc.b	')',$e0,'=',$cb,$12,'g?',$cf
	dc.b	'gSg{',$9b,'$',$fe,$7f
	dc.b	$c0,1,$80,1,$c0,0,$80,1
	dc.b	'I',$fd,$ed,$ff,$92,1,$ff,$fe
	dc.b	'@J@o',0,'h',0,$9f
	dc.b	'>',$a4,$a2,$ac,'>,',$c1,$d2
	dc.b	'&',$b6,$ba,$af,$be,$bf,'A@'
	dc.b	$ca,$1a,'/',$a7,$e8,'?',$1f,$c0
	dc.b	$f4,'{<',$e7,$fc,$ff,2,0
	dc.b	'm',$b6,$a5,$ba,$e2,'>',$10,'A'
	dc.b	'2;',$b7,$bc,'0?O',$c0
	dc.b	$8e,$b7,$89,$f8,$8f,$ff,'p',0
	dc.b	'O',$e8,'O',$f8,$b0,8,$ff,$f0
	dc.b	')',$89,'9',$ed,$16,'&?',$cf
	dc.b	$fc,'S',$ff,'s',1,',',$fe,$7f
	dc.b	0,1,$c0,1,'@',0,$80,1
	dc.b	'I',$fd,$c9,$ff,$b6,1,$ff,$fe
	dc.b	'@',0,'@',$e,0,4,0,$e
	dc.b	0,9,$80,9,0,$89,$80,$80
	dc.b	$81,0,$80,0,$80,0,1,$80
	dc.b	0,0,$e,$80,4,0,$e,$80
	dc.b	9,$80,9,$80,9,$80,0,0
	dc.b	$e,$80,$a,$80,4,0,4,0
	dc.b	$80,0,$8e,$80,4,0,$e,$80
	dcb.w	4
	dc.b	$ec,$d0,$ff,$f0,$c,$d0,$ff,$e8
	dc.b	'/',$8b,'/',$ef,$10,'$?',$cf
	dc.b	'=_',$be,'_A ',$fe,$7f
	dc.b	0,1,$c0,1,'@',0,$80,1
	dc.b	'}š',$7f,$fe,$81,$9a,$ff,$fd
	dc.b	' ',$a,'@',$e,0,2,0,$e
	dc.b	$80,$d,$80,7,0,$87,$80,$88
	dc.b	$82,0,2,0,2,0,$85,$80
	dc.b	$a,$80,$e,$80,2,0,$e,$80
	dc.b	$d,$80,7,0,7,0,8,$80
	dc.b	4,0,6,0,8,$80,0,0
	dc.b	$8a,$80,$8e,$80,2,0,$e,$80
	dcb.w	4
	dc.b	$f5,'(',$fe,$e8,$17,$e8,$f8,$18
	dc.b	',',$eb,'>',$ef,$11,'d?',$cf
	dc.b	'=_',$be,$7f,'A ',$fe,$7f
	dc.b	$c0,1,$c0,1,$c0,0,$80,1
	dc.b	'~',$a5,$ff,$dd,$82,$fd,$ff,3
	dc.b	'T',0,'8',9,0,0,0,9
	dc.b	1,$80,$81,$80,1,0,$81,$80
	dc.b	0,0,4,0,4,0,$e,$80
	dc.b	0,0,9,$80,0,0,9,$80
	dcb.w	4
	dc.b	9,$81,9,$80,0,0,0,0
	dc.b	0,0,$89,$80,0,0,9,$80
	dcb.w	4
	dc.b	'<',0,$bc,0,'\',0,$f4,0
	dc.b	',',$cb,',',$eb,$13,'d?',$cf
	dc.b	'>Q?}',$c3,'"',$fe,$7f
	dc.b	$e0,1,$e0,1,$e0,0,$a0,1
	dc.b	'G',$80,$f7,$80,$8b,$80,$fe,$80
	dc.b	$10,'J',$c,'o',0,'h',0,$9f
	dc.b	$ad,$bb,$ad,$a7,$aa,'?',$df,$c0
	dc.b	'j',$bb,$88,$ac,$e8,$bf,$16,'@'
	dc.b	'J',$ab,$ef,$9c,$e8,$bf,$1f,$c0
	dc.b	'Um',$ef,$9f,$ff,$ff,0,0
	dc.b	'm',$aa,$a5,$27,$e2,' ',$10,'P'
	dc.b	'*',$ab,$af,$bf,'(',$bf,'W@'
	dc.b	'}',$bc,$8f,$c4,$ff,$fc,0,0
	dc.b	'*',$d6,'9',$ef,$c0,0,$f8,0
	dc.b	$af,$a3,'?',$eb,$10,'$?',$cf
	dc.b	$c5,'I',$f7,'i',9,'6',$fe,$7f
	dc.b	$7f,$f5,$ff,$fd,0,4,$ff,$fd
	dc.b	'%',$ff,$a7,$ff,$d8,0,$ff,$ff
	dc.b	$dc,0,$f4,0,$10,0,$f0,0
	dc.b	$a,$80,$e,$80,4,0,$e,$80
	dcb.w	3
	dc.b	9,$80,0,0,0,0,0,0
	dcb.w	5
	dc.b	0,4,0,$a,0,4,0,4
	dc.b	0,0,$80,0,0,0,0,0
	dcb.w	4
	dc.b	$f8,$82,$fb,1,$18,0,$f0,0
	dc.b	'/',$cb,$bf,$ef,$10,'h?',$cf
	dc.b	'FOGO',$bb,'0',$fe,$7f
	dc.b	$e6,'Y',$d9,$ad,'?',$f0,$d9,$ad
	dc.b	'?',0,'?f',$c0,$ff,$ff,$ff
	dc.b	'$',0,$b4,0,$c0,0,$f0,0
	dc.b	4,0,6,0,8,$80,$e,$80
	dc.b	2,0,2,0,2,0,5,0
	dcb.w	8
	dc.b	0,$a,0,8,0,0,0,0
	dc.b	$80,0,$80,0,0,0,0,0
	dcb.w	4
	dc.b	'a',1,'x',0,$8a,0,$f0,0
	dc.b	'(',$a3,'.',$c3,$91,'"?',$c3
	dc.b	'~/',$ff,$7f,$83,$10,$fe,$7f
	dc.b	$ff,$f4,$ff,$fd,0,4,$ff,$f9
	dc.b	$bf,$ff,$ff,$ff,'@',0,$ff,$ff
	dc.b	$d0,0,$f4,0,$10,0,$e0,0
	dc.b	9,$80,9,$80,0,0,9,$80
	dcb.w	13
	dc.b	0,9,0,0,0,0,0,0
	dc.b	$80,0,0,0,0,0,0,0
	dcb.w	3
	dc.b	'z',0,'r',0,$98,0,$f0,0
	dc.b	$a8,$81,$a8,$e1,$17,' ?',$c1
	dc.b	'Ngog',$93,'X',$fe,$7f
	dc.b	'>1',$bf,$bd,'@E',$ff,$f9
	dc.b	$9c,$f8,$9e,$fe,'a',1,$ff,$ff
	dc.b	$c4,'V',$f0,'o',$10,$7f,$e0,$80
	dc.b	$cd,$bb,'-',$a7,$ea,$bf,$1f,$c0
	dc.b	'kv',$9c,$f9,$ff,$ff,0,0
	dc.b	$b6,$aa,'y',$df,$ff,$ff,0,0
	dc.b	$da,$d5,'?;',$ff,$ff,0,0
	dc.b	'[b',$e7,$a7,$ff,$e0,0,$18
	dc.b	'6',$fd,'?',$1e,'?',$ff,$c0,0
	dc.b	$e0,0,' ',0,$e0,0,0,0
l0074	dcb.w	10
	dc.b	0,2,0,0,$bf,'/',$ff,$bf
	dc.b	'A',$90,$ff,'?',$e1,'~',$e1,$ff
	dc.b	'`',$83,$c1,$fe,1,'cA',$e3
	dc.b	4,$9c,1,$ff,$9f,$f2,$9f,$f9
	dc.b	'`',$18,$ff,$f1,$b9,$cf,$b9,$cf
	dc.b	'F0',$ff,$ff,$15,'s',$eb,'s'
	dc.b	'@',$8c,$a3,$ff,$9e,'+',$9f,$cf
	dc.b	'`',$84,$ff,'O',$f8,$bf,$f8,$ff
	dc.b	$18,'A',$f0,$ff,2,$bf,$a0,$ff
	dc.b	$82,'A',2,$ff,0,2,$a0,3
	dc.b	$80,9,0,3,$fe,$14,$fe,$1c
	dc.b	6,$b,$fc,$1f,$d5,'s',$f3,'s'
	dc.b	$10,$8c,$e3,$ff,$e3,$95,$e3,$cd
	dc.b	$1c,$c2,$ff,$8f,$cf,$8e,$cf,$8f
	dc.b	'0s',$ff,$fe,'@',0,0,0
	dcb.w	20
	dc.b	0,2,0,0,$bc,$af,$bf,$af
	dc.b	'@',$90,$ff,'?!y',$e1,$7f
	dc.b	' ',$81,$c1,$fe,'A',$7f,'A',$7f
	dc.b	4,$80,1,$ff,$ff,$c9,$ff,$fa
	dc.b	0,8,$ff,$f0,'_',$fc,$df,$ff
	dc.b	'`',0,$bf,$ff,'*',$bf,$dd,$bf
	dc.b	$80,$c0,'A',$7f,$f8,'K',$ff,$ab
	dc.b	1,4,$fe,$8f,$c8,$bc,$f8,$bf
	dc.b	8,'@',$f0,$ff,$a0,$bc,$80,$bf
	dc.b	$82,'@',0,$ff,$80,2,$a0,2
	dc.b	$80,9,0,3,$f2,$17,$fe,$17
	dc.b	2,8,$fc,$1f,$b2,$bf,$f5,$bf
	dc.b	'0@',$e1,$ff,$fe,$ca,$ff,$d6
	dc.b	0,$c1,$ff,$87,$ff,$fb,$ff,$ff
	dc.b	0,3,$ff,$fe,0,0,'@',0
	dcb.w	18
	dc.b	0,2,0,2,0,0,0,0
	dc.b	'Y',$19,$ff,'?',$19,1,$fe,$bf
	dc.b	'@',$aa,'A',$fa,'@*',$a1,$fd
	dc.b	4,$db,'E',$ff,0,'[',1,$bf
	dc.b	'q',$92,$ff,$f3,'q',$90,$ff,$e8
	dc.b	$b6,'r',$7f,$ff,'&s_',$fc
	dc.b	']l',$b6,$ff,0,'L',$80,$bf
	dc.b	$e4,$a6,$ff,'o',$e6,0,$f9,$f
	dc.b	'PU',$d0,$fd,'P',$15,$e8,$fe
	dc.b	2,'Y"',$ff,0,$19,$80,$fe
	dc.b	0,1,' ',3,0,8,$80,3
	dc.b	$94,$b,$f4,$1f,$14,3,$fa,$1f
	dc.b	'el',$e6,$ff,'`',$c,$d0,$ff
	dc.b	$de,$95,$fe,$9b,$de,$80,$ff,'C'
	dc.b	$b3,'z',$ff,$fa,'3z',$ff,$fd
	dc.b	'@',0,'@',0,0,0,0,0
	dcb.w	16
	dc.b	0,3,0,2,0,0,0,0
	dc.b	$aa,$aa,$b6,$bd,$be,$af,$c1,$b0
	dc.b	$b3,'U',$ad,$ed,$a1,'}a',$83
	dc.b	$c7,'jE',$f7,1,$7f,1,$80
	dc.b	$da,$af,'7k',$ff,$e8,0,$18
	dc.b	'ie',$be,$df,'/',$fd,'0',3
	dc.b	$b6,$d2,'c}',0,'_',0,'`'
	dc.b	$cb,'z',$be,$ef,$fa,$b,6,$c
	dc.b	$a8,$aa,'h',$f6,$e8,$be,$18,$c1
	dc.b	$e3,$aa,$a2,$b6,$80,$be,$80,$c1
	dc.b	$e0,$e,$a0,$b,$80,2,$80,3
	dc.b	$ab,'5',$da,$d6,$fa,$17,6,$18
	dc.b	'^',$d2,$d7,'}',$d0,'_0`'
	dc.b	$b7,'{',$cf,']',$fe,'A',1,$c1
	dc.b	'J',$dd,$f7,'=',$7f,$f9,$80,7
	dc.b	$c0,0,'@',0,0,0,0,0
	dcb.w	17
	dc.b	0,3,0,0,0,0,$80,0
	dcb.w	3
	dc.b	'-',1,$1e,0,0,0,0,0
	dc.b	1,0,$c6,0,0,0,0,0
	dc.b	0,9,0,6,0,0,0,0
	dc.b	'P',2,$e0,1,0,0,0,0
	dc.b	$a2,$a0,$c1,$c0,0,0,0,0
	dc.b	5,'H',3,$b0,0,0,0,0
	dcb.w	4
	dc.b	$80,$80,'c',0,0,0,0,0
	dc.b	$80,2,'`',$c,0,0,0,0
	dc.b	2,$d0,1,$e0,0,0,0,0
	dc.b	$12,$a0,$d,$c0,0,0,0,0
	dc.b	0,'J',0,'7',0,0,0,0
	dc.b	$80,1,0,0,0,0,0,0
	dc.b	0,0,$c0,0,0,0,0,0
	dcb.w	16
	dc.b	0,2,0,1,0,0,0,0
	dc.b	$ad,'d',$d3,$9b,0,0,0,0
	dc.b	'-!',$f3,$df,0,0,0,0
	dc.b	'EU',$83,$bb,0,0,0,0
	dc.b	';Z',$fc,$fc,0,0,0,0
	dc.b	'U',$aa,';',$df,0,0,0,0
	dc.b	$80,$ba,0,'}',0,0,0,0
	dc.b	$95,'*',$fe,$1d,0,0,0,0
	dc.b	$a9,$9a,$df,$fd,0,0,0,0
	dc.b	$a2,$d5,$c1,$ef,0,0,0,0
	dc.b	$a0,$b,$c0,7,0,0,0,0
	dc.b	'R',$d2,$bf,'?',0,0,0,0
	dc.b	$b4,$aa,'xw',0,0,0,0
	dc.b	$da,$d2,'=',$e1,0,0,0,0
	dc.b	$b7,'U',$cf,$bb,0,0,0,0
	dc.b	'@',0,$80,0,0,0,0,0
	dcb.w	8
l0075	dc.b	7,$1e,'IIIIII'
	dc.b	'IIIIII',$16,$1e
	dc.b	'%',$1c,'(&',$1e,'I-!'
	dc.b	$1e,'I-!',$1e,'I',$a,'"'
	dc.b	$1c,'$"',$27,' I',$13,'!'
	dc.b	$1e,'I',1,$1a,',,I',8
	dc.b	$27,'-(I',$18,'(.+'
	dc.b	'I',5,$1a,$1c,$1e,'I&.'
	dc.b	',"',$1c,$1a,'%I',$1d,$1e
	dc.b	'&(I',$1b,'2',$14,$27,'%'
	dc.b	'"&"-',$1e,$1d,'I',$c
	dc.b	$1a,'-+"',$1c,'$,H'
	dc.b	'I',$13,'!',$1e,'I&.,'
	dc.b	'"',$1c,'I',$1c,'.++',$1e
	dc.b	$27,'-%2I)%',$1a
	dc.b	'2"',$27,' I",I'
	dc.b	$1a,$27,'I;I/("'
	dc.b	$1c,$1e,'&(',$1d,$1f,'"%'
	dc.b	$1e,'I',$1c,'+',$1e,$1a,'-',$1e
	dc.b	$1d,'I',$1b,'2I',2,'!+'
	dc.b	'",I(',$1f,'I',$14,$b
	dc.b	$c,'GI',$1a,'%%I)'
	dc.b	'+( +',$1a,'&&"'
	dc.b	$27,' I',$1b,'2I',$13,'!'
	dc.b	$1e,'I',5,$1a,'-',$1e,'G '
	dc.b	'+',$1a,$1f,'"',$1c,',I',$1b
	dc.b	'2I',$13,'2+',$1e,'&I'
	dc.b	'(',$1f,'I',$13,'!',$1e,'I',$11
	dc.b	$1e,',)',$1e,$1c,'-',$1a,$1b
	dc.b	'%',$1e,',GI,',$1c,'('
	dc.b	'%%-',$1e,'1-I',$1b
	dc.b	'2I',6,'.',$27,',-"'
	dc.b	$1c,'$I(',$1f,'I',$14,$b
	dc.b	$c,'H',$13,'!",I',$1d
	dc.b	$1e,'&(I,!(.'
	dc.b	'%',$1d,'I!',$1a,'/',$1e,'I'
	dc.b	$1b,$1e,$1e,$27,'I+',$1e,'%'
	dc.b	$1e,$1a,',',$1e,$1d,'I',$1d,'.'
	dc.b	'+"',$27,' I-!',$1e
	dc.b	'I2',$1e,$1a,'+I4<'
	dc.b	'<=I',$1b,'.-0',$1e
	dc.b	'I%(,-I,('
	dc.b	'&',$1e,'!(0I"',$27
	dc.b	'-',$1e,'+',$1e,',-HI'
	dc.b	$16,$1e,'%%I!',$1e,'+'
	dc.b	$1e,'I"-I",I'
	dc.b	$1f,'"',$27,$1a,'%%2H'
	dc.b	'I',8,'-I!',$1a,',',$1a
	dc.b	'I',$1b,'"-I(',$1f,'I'
	dc.b	'.',$27,$1f,'"',$27,'",!'
	dc.b	$1e,$1d,'I-(.',$1c,'!'
	dc.b	'I',$1b,$1e,$1c,$1a,'.,',$1e
	dc.b	'I',$1a,'%%I,(.'
	dc.b	'+',$1c,$1e,'I',$1c,'(',$1d,$1e
	dc.b	'I!',$1a,',I',$1b,$1e,$1e
	dc.b	$27,'I%(,-',$1a,$27
	dc.b	$1d,'I-!",I,'
	dc.b	$1c,'+(%%I0',$1a
	dc.b	',I0+"--',$1e
	dc.b	$27,'I"',$27,'I-!',$1e
	dc.b	'I!',$1e,'1',$1e,$1d,'"-'
	dc.b	'(+HI',$d,'(-!'
	dc.b	'"',$27,' I&(+',$1e
	dc.b	'-(I,',$1a,'2GI'
	dc.b	',(I',$1e,$27,'#(2'
	dc.b	'I-!',$1e,'I&.,'
	dc.b	'"',$1c,',HIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'%',$1e,'-C,I0+'
	dc.b	$1a,')HIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIII',$ff,$12,'-'
	dc.b	'(',$27,$27,'I&',$1a,$1a,$1c
	dc.b	'!',$1e,$27,'I',$1e,$1c,'!I'
	dc.b	$1e,$27,' I',$f,'+',$1e,','
	dc.b	$1e,$27,'-',$1a,'-"(.'
	dc.b	$27,'I/.',$27,'II',$1a
	dc.b	$1a,$27,$1e,'+',$1e,$27,'I',3
	dc.b	$1e,'&(',$1e,$27,'I>>'
	dc.b	'>IIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIII',$e,$a,'G'
	dc.b	'I-!",I-',$1e
	dc.b	'1-I0"%%I'
	dc.b	',((',$27,'I,-',$1a
	dc.b	'+-I',$1a,' ',$1a,'"',$27
	dc.b	'HHHIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIIIIII'
	dc.b	'IIIII',$ff,0,0
l0076	dc.b	2,$1e,'D',$e0,'~>',2,0
	dc.b	$82,$fe,$fe,0,$92,$fe,'l',0
	dc.b	'|',$fe,$82,0,$82,$c6,'D',0
	dc.b	$82,$fe,$fe,0,$82,$fe,'|',0
	dc.b	$82,$fe,$fe,0,$92,$ba,$c6,0
	dc.b	$82,$fe,$fe,2,$90,$b8,$c0,0
	dc.b	'|',$fe,$82,0,$92,$de,'^',0
	dc.b	$82,$fe,$fe,0,$92,$fe,$82,0
	dc.b	0,$82,$fe,$fe,$82,0,0,0
	dc.b	4,6,2,$80,$fe,$fc,$80,0
	dc.b	$82,$fe,$fe,$82,'0',$de,$82,0
	dc.b	$82,$fe,$fe,$80,2,2,6,$82
	dc.b	$e6,'r8',$10,'b',$fe,$82,0
	dc.b	$82,$e6,'r8',$9c,$ce,$80,0
	dc.b	'|',$fe,$82,0,$82,$fe,'|',0
	dc.b	$82,$fe,$fe,2,$90,$f0,'`',0
	dc.b	'|',$fe,$82,0,$82,$ff,'}',0
	dc.b	$82,$fe,$fe,2,$90,$fe,'f',0
	dc.b	'd',$f6,$b2,'8',$9a,$de,'L',$c0
	dc.b	$80,2,$fe,$fe,2,$80,$c0,0
	dc.b	$80,$fc,$fe,0,$82,$fc,$80,0
	dc.b	$80,$f0,$fc,$1e,$84,$f0,$80,$e0
	dc.b	$f8,$1e,$c6,$f0,'<',$8e,$c2,0
	dc.b	$c2,$e6,'r8',$9c,$ce,$86,0
	dc.b	$80,$e2,$fe,'>',$82,$e0,$80,0
	dc.b	$c6,$8e,$9c,'8r',$e2,$c6,0
	dc.b	4,'.* >',$1e,2,0
	dc.b	$82,$fe,$fe,0,'">',$1c,0
	dc.b	$1c,'>"',0,'"6',$14,0
	dc.b	$1c,'>"',$80,$fe,$fe,2,0
	dc.b	$1c,'>*',2,'*:',$18,0
	dc.b	$10,'~',$fe,$10,$90,$c0,'@',0
	dc.b	$1a,'?%',1,'%}X',0
	dc.b	$82,$fe,$fe,2,' >',$1e,0
	dc.b	0,'"',$be,$be,2,0,0,0
	dc.b	2,3,1,0,'!',$bf,$be,0
	dc.b	$82,$fe,$fe,0,'<&',2,0
	dc.b	0,$82,$fe,$fe,2,0,0,'"'
	dc.b	'>>',2,' > >',0
	dc.b	'">>',2,' >',2,0
	dc.b	$1c,'>"',0,'">',$1c,0
	dc.b	'!??',1,'$<',$18,0
	dc.b	$18,'<$',0,'??!',0
	dc.b	'">>',2,' 0',$10,0
	dc.b	$12,'::',8,'..$',0
	dc.b	' |',$fe,' "',6,4,' '
	dc.b	'<>',2,' >>',2,0
	dc.b	' 8<',6,'$0 0'
	dc.b	'<',$e,'"8',$1e,6,'0',0
	dc.b	'"28',$1c,$e,'&"',0
	dc.b	' 9=',5,'!?>',0
	dc.b	'2&',$e,$1c,'82&',0
	dc.b	0,2,$82,$fe,$fe,2,2,0
	dc.b	'F',$ce,$9c,'8',$f2,$e2,'F',0
	dc.b	'D',$c6,$82,$10,$92,$fe,'l',0
	dc.b	$18,'8h',2,$fe,$fe,$a,0
	dc.b	$f4,$f6,$92,0,$92,$9e,$cc,0
	dc.b	'|',$fe,$92,0,$92,$de,'L',0
	dc.b	0,$c0,$86,$8e,$18,$f0,$e0,0
	dc.b	'l',$fe,$92,0,$92,$fe,'l',0
	dc.b	'd',$f6,$92,0,$92,$fe,'|',0
	dc.b	'|',$fe,$82,0,$82,$fe,'|',0
	dc.b	0,$fa,$fa,0,0,0,0,0
	dc.b	0,$c0,$e0,0,$c0,$e0,0,0
	dc.b	0,'<~',$c3,$81,$81,0,0
	dc.b	0,$81,$81,$c3,'~<',0,0
	dc.b	'@',$c0,$80,$1a,$9a,$f0,'`',0
	dc.b	0,0,$c0,$e0,0,0,0,0
	dc.b	0,$10,$10,$10,$10,$10,0,0
	dc.b	0,'ff',0,0,0,0,0
	dc.b	0,'fg',0,0,0,0,0
	dc.b	0,6,7,0,0,0,0,0
	dc.b	0,6,6,0,0,0,0,0
	dcb.w	4
l0077	dc.b	7,'s',6,'t',5,'D',5,'T'
	dc.b	4,'7',6,'4',4,'[',4,'S'
	dc.b	7,'s',6,'t',5,'D',5,'T'
	dc.b	4,'7',6,'4',4,'[',4,'S'
	dc.b	4,'c',6,'s',4,'d',2,'D'
	dc.b	3,'4',2,'G',4,'4',3,'S'
	dc.b	4,'c',6,'s',4,'d',2,'D'
	dc.b	3,'4',2,'G',4,'4',3,'S'
	dc.b	2,'S',4,'s',5,'s',1,'T'
	dc.b	0,'4',1,'%',0,'6',2,'4'
	dc.b	2,'S',4,'s',5,'s',1,'T'
	dc.b	0,'4',1,'%',0,'6',2,'4'
	dc.b	0,'E',1,'S',2,'s',4,'s'
	dc.b	0,'U',1,'E',3,'%',2,$17
	dc.b	0,'E',1,'S',2,'s',4,'s'
	dc.b	0,'U',1,'E',3,'%',2,$17
	dc.b	1,'6',1,'e',0,'S',2,'t'
	dc.b	3,'s',2,'e',1,'E',3,5
	dc.b	1,'6',1,'e',0,'S',2,'t'
	dc.b	3,'s',2,'e',1,'E',3,5
	dc.b	4,'U',4,'F',4,'V',1,'u'
	dc.b	0,'R',0,'d',2,'s',4,'u'
	dc.b	4,'U',4,'F',4,'V',1,'u'
	dc.b	0,'R',0,'d',2,'s',4,'u'
	dc.b	1,'s',5,'u',2,'E',4,'&'
	dc.b	6,'f',4,'u',1,'b',1,'u'
	dc.b	1,'s',5,'u',2,'E',4,'&'
	dc.b	6,'f',4,'u',1,'b',1,'u'
	dc.b	1,'e',0,'D',4,'U',6,'s'
	dc.b	6,'F',6,'f',7,'u',0,'u'
	dc.b	1,'e',0,'D',4,'U',6,'s'
	dc.b	6,'F',6,'f',7,'u',0,'u'
l0078	dc.b	'UU33',$f,$f,0,0
l0079	dc.b	'A',$fa,'(nC',$fa,$d,'V'
	dc.b	'p@a',0,2,$84,'C',$fa
	dc.b	$d,'Lp>a',0,2,'z'
	dc.b	'C',$fa,$d,'Bp<a',0
	dc.b	2,'pC',$fa,$d,'8p:'
	dc.b	'a',0,2,'fC',$fa,$d,'.'
	dc.b	'p8a',0,2,'\C',$fa
	dc.b	$d,'$p6a',0,2,'R'
	dc.b	'C',$fa,$d,$1a,'p4a',0
	dc.b	2,'HC',$fa,$d,$10,'p2'
	dc.b	'a',0,2,'>C',$fa,$d,6
	dc.b	'p0a',0,2,'4C',$fa
	dc.b	$c,$fc,'p.a',0,2,'*'
	dc.b	'C',$fa,$c,$f2,'p,a',0
	dc.b	2,' C',$fa,$c,$e8,'p*'
	dc.b	'a',0,2,$16,'C',$fa,$c,$de
	dc.b	'p(a',0,2,$c,'C',$fa
	dc.b	$c,$d4,'p&a',0,2,2
	dc.b	'C',$fa,$c,$ca,'p$a',0
	dc.b	1,$f8,'C',$fa,$c,$c0,'p"'
	dc.b	'a',0,1,$ee,'C',$fa,$c,$b6
	dc.b	'p a',0,1,$e4,'C',$fa
	dc.b	$c,$ac,'p',$1e,'a',0,1,$da
	dc.b	'C',$fa,$c,$a2,'p',$1c,'a',0
	dc.b	1,$d0,'C',$fa,$c,$98,'p',$1a
	dc.b	'a',0,1,$c6,'C',$fa,$c,'Ž'
	dc.b	'p',$18,'a',0,1,$bc,'C',$fa
	dc.b	$c,$84,'p',$16,'a',0,1,$b2
	dc.b	'C',$fa,$c,'zp',$14,'a',0
	dc.b	1,$a8,'C',$fa,$c,'pp',$12
	dc.b	'a',0,1,$9e,'C',$fa,$c,'f'
	dc.b	'p',$10,'a',0,1,$94,'C',$fa
	dc.b	$c,'\p',$e,'a',0,1,$8a
	dc.b	'C',$fa,$c,'Rp',$c,'a',0
	dc.b	1,$80,'C',$fa,$c,'Hp',$a
	dc.b	'a',0,1,'vC',$fa,$c,'>'
	dc.b	'p',8,'a',0,1,'lC',$fa
	dc.b	$c,'4p',6,'a',0,1,'b'
	dc.b	'C',$fa,$c,'*p',4,'a',0
	dc.b	1,'XC',$fa,$c,' p',2
	dc.b	'a',0,1,'NC',$fa,$c,$16
	dc.b	'p',0,'a',0,1,'DC',$fa
	dc.b	$b,$ec,'p',2,'a',0,1,':'
	dc.b	'C',$fa,$b,$e2,'p',4,'a',0
	dc.b	1,'0C',$fa,$b,$d8,'p',6
	dc.b	'a',0,1,'&C',$fa,$b,$ce
	dc.b	'p',8,'a',0,1,$1c,'C',$fa
	dc.b	$b,$c4,'p',$a,'a',0,1,$12
	dc.b	'C',$fa,$b,$ba,'p',$c,'a',0
	dc.b	1,8,'C',$fa,$b,$b0,'p',$e
	dc.b	'a',0,0,$fe,'C',$fa,$b,$a6
	dc.b	'p',$10,'a',0,0,$f4,'C',$fa
	dc.b	$b,$9c,'p',$12,'a',0,0,$ea
	dc.b	'C',$fa,$b,$92,'p',$14,'a',0
	dc.b	0,$e0,'C',$fa,$b,$88,'p',$16
	dc.b	'a',0,0,$d6,'C',$fa,$b,'~'
	dc.b	'p',$18,'a',0,0,$cc,'C',$fa
	dc.b	$b,'tp',$1a,'a',0,0,$c2
	dc.b	'C',$fa,$b,'jp',$1c,'a',0
	dc.b	0,$b8,'C',$fa,$b,'`p',$1e
	dc.b	'a',0,0,$ae,'C',$fa,$b,'V'
	dc.b	'p a',0,0,$a4,'C',$fa
	dc.b	$b,'Lp"a',0,0,'š'
	dc.b	'C',$fa,$b,'Bp$a',0
	dc.b	0,$90,'C',$fa,$b,'8p&'
	dc.b	'a',0,0,$86,'C',$fa,$b,'.'
	dc.b	'p(a',0,0,'|C',$fa
	dc.b	$b,'$p*a',0,0,'r'
	dc.b	'C',$fa,$b,$1a,'p,a',0
	dc.b	0,'hC',$fa,$b,$10,'p.'
	dc.b	'a',0,0,'^C',$fa,$b,6
	dc.b	'p0a',0,0,'TC',$fa
	dc.b	$a,$fc,'p2a',0,0,'J'
	dc.b	'C',$fa,$a,$f2,'p4a',0
	dc.b	0,'@C',$fa,$a,$e8,'p6'
	dc.b	'a',0,0,'6C',$fa,$a,$de
	dc.b	'p8a',0,0,',C',$fa
	dc.b	$a,$d4,'p:a',0,0,'"'
	dc.b	'C',$fa,$a,$ca,'p<a',0
	dc.b	0,$18,'C',$fa,$a,$c0,'p>'
	dc.b	'a',0,0,$e,'C',$fa,$a,$b6
	dc.b	'p@a',0,0,4,'Nu'
	dc.b	'4',0,$d4,'BE',$fa,$b,'('
	dc.b	'(2 ',$fc,',',4,$d8,$84
	dc.b	'D',$86,'E',$fa,$a,$d8,'42'
	dc.b	0,0,'DBE',$fa,$a,$86
	dc.b	'N',$f2,' ',0,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RFl6:',$19,'RF'
	dc.b	'l0:',$19,'RFl*'
	dc.b	':',$19,'RFl$:',$19
	dc.b	'RFl',$1e,':',$19,'RF'
	dc.b	'l',$18,'HHChri'
	dc.b	's is an '
	dc.b	'idiot !!'
	dc.b	'!',0,'0',$c5,'HF',$9c,$84
	dc.b	'HFJFlH:',$19
	dc.b	'RFlB:',$19,'RF'
	dc.b	'l<:',$19,'RFl6'
	dc.b	':',$19,'RFl0:',$19
	dc.b	'RFl*:',$19,'RF'
	dc.b	'l$:',$19,'RFl',$1e
	dc.b	':',$19,'RFl',$18,'HH'
	dc.b	'Chris is'
	dc.b	' an idio'
	dc.b	't !!!',0,'0',$c5
	dc.b	'HF',$9c,$84,'HFJF'
	dc.b	'lH:',$19,'RFlB'
	dc.b	':',$19,'RFl<:',$19
	dc.b	'RF'
l007a	dc.b	'l6:',$19,'RFl0'
	dc.b	':',$19,'RFl*:',$19
	dc.b	'RFl$:',$19,'RF'
	dc.b	'l',$1e,':',$19,'RFl',$18
	dc.b	'HHChris '
	dc.b	'is an id'
	dc.b	'iot !!!',0
	dc.b	'0',$c5,'HF',$9c,$84,'HF'
	dc.b	'JFlH:',$19,'RF'
	dc.b	'lB:',$19,'RFl<'
	dc.b	':',$19,'RFl6:',$19
	dc.b	'RFl0:',$19,'RF'
	dc.b	'l*:',$19,'RFl$'
	dc.b	':',$19,'RFl',$1e,':',$19
	dc.b	'RFl',$18,'HHCh'
	dc.b	'ris is a'
	dc.b	'n idiot '
	dc.b	'!!!',0,'0',$c5,'HF'
	dc.b	$9c,$84,'A',$e8,0,'@',$90,$c0
	dc.b	'Nu',$80,0,$c0,0,$e0,0
	dc.b	$f0,0,$f8,0,$fc,0,$fe,0
	dc.b	$ff,0,$ff,$80,$ff,$c0,$ff,$e0
	dc.b	$ff,$f0,$ff,$f8,$ff,$fc,$ff,$fe
	dc.b	$ff,$ff,0,1,0,3,0,7
	dc.b	0,$f,0,$1f,0,'?',0,$7f
	dc.b	0,$ff,1,$ff,3,$ff,7,$ff
	dc.b	$f,$ff,$1f,$ff,'?',$ff,$7f,$ff
	dc.b	$ff,$ff,0,0,0,'T',0,$a8
	dc.b	0,$fc,1,'P',1,$a4,1,$f8
	dc.b	2,'L',2,$a0,2,$f4,3,'H'
	dc.b	3,$9c,3,$f0,4,'D',4,$98
	dc.b	4,$ec,5,'@',5,$94,5,$e8
	dc.b	6,'<',6,$90,6,$e4,7,'8'
	dc.b	7,$8c,7,$e0,8,'4',8,$88
	dc.b	8,$dc,9,'0',9,$84,9,$d8
	dc.b	$a,',',$a,$80,0,8,0,0
	dc.b	0,4,0,0,0,2,$aa,$aa
	dc.b	0,2,0,0,0,1,$99,$99
	dc.b	0,1,'UU',0,1,'$',$92
	dc.b	0,1,0,0,0,0,$e3,$8e
	dc.b	0,0,$cc,$cc,0,0,$ba,'.'
	dc.b	0,0,$aa,$aa,0,0,$9d,$89
	dc.b	0,0,$92,'I',0,0,$88,$88
	dc.b	0,0,$80,0,0,0,'xx'
	dc.b	0,0,'q',$c7,0,0,'k',$ca
	dc.b	0,0,'ff',0,0,'a',$86
	dc.b	0,0,']',$17,0,0,'Y',$b
	dc.b	0,0,'UU',0,0,'Q',$eb
	dc.b	0,0,'N',$c4,0,0,'K',$da
	dc.b	0,0,'I$',0,0,'F',$9e
	dc.b	0,0,'DD',0,0,'B',$10
	dc.b	0,0,'@',0
	bss
l007b	ds.w	1
l007c	ds.w	1
l007d	ds.b	6656
l007e	ds.b	46
l007f	ds.b	4096
l0080	ds.b	1010
l0081	ds.b	1010
l0082	ds.w	1
l0083	ds.l	1
l0084	ds.b	49280
l0085	ds.b	57786
l0086	ds.b	260786
l0087	ds.b	238386
zuend	end
