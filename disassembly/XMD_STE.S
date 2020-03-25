; Disassembly by grazey/PHF 2020
; STe player - crashes

; The only differences between the binaries of xmd_stf and xmd_ste
; are lines 191 (the STFM version has an RTS forcing STFM machine type)
; and line 4607 - L0075 uses different data for the STF & STE


	opt	o-

	pea	start(pc)
	move.w	#$26,-(a7)
	trap	#$e
	addq.l	#6,a7
	clr.w	-(a7)
	trap	#1

start	lea	oldcpu(pc),a0
	move.l	a7,(a0)+
	lea	my_stack,a7
	move	sr,(a0)+
	move	#$2700,sr
	move	usp,a1
	move.l	a1,(a0)+
	moveq	#$12,d0
	bsr	ikbd_wrt
	moveq	#$1a,d0
	bsr	ikbd_wrt
	move.l	$408.w,old_408
	move.l	#exit_wit,$408.w
	bsr	get_st_t
	bsr.b	back
	bsr	save_sys
	bsr	vect_mfp
	bsr	sound_in
	bra	screen

exit	lea	my_stack,a7
	bsr	sound_in
	bsr	set_rez
	bsr	l0004
	moveq	#$14,d0
	bsr	ikbd_wrt
	moveq	#8,d0
	bsr	ikbd_wrt
	lea	oldcpu(pc),a0
	movea.l	(a0)+,a7
	move	(a0)+,sr
	movea.l	(a0)+,a1
	move	a1,usp
	move.l	old_408(pc),$408.w
	rts

back	lea	savesys(pc),a0
	move.b	$ffff8260.w,(a0)+
	move.b	$ffff820a.w,(a0)+
	move.l	$ffff8200.w,(a0)+
	tst.w	mach_type
	beq.b	l0003
	move.b	$ffff8209.w,(a0)+
	move.b	$ffff820d.w,(a0)+
	move.b	$ffff820f.w,(a0)+
	move.b	$ffff8265.w,(a0)+
l0003	movem.l	$ffff8240.w,d0-d7
	movem.l	d0-d7,(a0)

	lea	savevect(pc),a0
	move.l	$68.w,(a0)+
	move.l	$70.w,(a0)+
	move.l	$114.w,(a0)+
	move.l	$118.w,(a0)+
	move.l	$120.w,(a0)+
	move.l	$134.w,(a0)+
	lea	savemfp(pc),a0
	move.b	$fffffa07.w,(a0)+
	move.b	$fffffa09.w,(a0)+
	move.b	$fffffa13.w,(a0)+
	move.b	$fffffa15.w,(a0)+
	move.b	$fffffa17.w,(a0)+
	move.b	$fffffa19.w,(a0)+
	move.b	$fffffa1b.w,(a0)+
	move.b	$fffffa1d.w,(a0)+
	rts

l0004	lea	savemfp(pc),a0
	move.b	(a0)+,$fffffa07.w
	move.b	(a0)+,$fffffa09.w
	move.b	(a0)+,$fffffa13.w
	move.b	(a0)+,$fffffa15.w
	move.b	(a0)+,$fffffa17.w
	move.b	(a0)+,$fffffa19.w
	move.b	(a0)+,$fffffa1b.w
	move.b	(a0)+,$fffffa1d.w
	lea	savevect(pc),a0
	move.l	(a0)+,$68.w
	move.l	(a0)+,$70.w
	move.l	(a0)+,$114.w
	move.l	(a0)+,$118.w
	move.l	(a0)+,$120.w
	move.l	(a0)+,$134.w
	lea	savesys(pc),a0
	move.b	(a0)+,$ffff8260.w
	move.b	(a0)+,$ffff820a.w
	move.l	(a0)+,$ffff8200.w

	tst.w	mach_type
	beq.b	.not_ste
	move.b	(a0)+,$ffff8209.w
	move.b	(a0)+,$ffff820d.w
	move.b	(a0)+,$ffff820f.w
	move.b	(a0)+,$ffff8265.w
.not_ste	movem.l	(a0),d0-d7
	movem.l	d0-d7,$ffff8240.w
	rts

save_sys	movem.l	oldpal(pc),d0-d7
	movem.l	d0-d7,$ffff8240.w
	bsr	wvsync
	move.b	#0,$ffff8260.w
	move.b	#2,$ffff820a.w
	tst.w	mach_type
	beq.b	.not_ste
	clr.b	$ffff8209.w
	clr.b	$ffff820d.w
	clr.b	$ffff820f.w
	clr.b	$ffff8265.w
.not_ste	rts

set_rez	move.b	#2,$ffff820a.w
	bsr	wvsync
	move.b	#0,$ffff820a.w
	bsr	wvsync
	move.b	#2,$ffff820a.w
	bsr	wvsync
	rts

sound_in	moveq	#$a,d0
	lea	$ffff8800.w,a0
l000a	move.b	d0,(a0)
	move.b	#0,2(a0)
	dbf	d0,l000a
	move.b	#7,(a0)
	move.b	#$7f,2(a0)
	move.b	#$e,(a0)
	move.b	#$26,2(a0)

	tst.w	mach_type
	beq.b	.not_ste
	clr.w	$ffff8900.w		; DMA off
	move.w	#$7ff,$ffff8924.w	; 
	move.w	#$4e8,$ffff8922.w	; LMC
	move.w	#$554,$ffff8922.w
	move.w	#$514,$ffff8922.w
	move.w	#$486,$ffff8922.w
	move.w	#$446,$ffff8922.w
	move.w	#$401,$ffff8922.w
.not_ste	rts

vect_mfp	move.l	#_rte,$68.w
	move.l	#_rte,$70.w
	move.l	#_rte,$114.w
	move.l	#_rte,$118.w
	move.l	#_rte,$120.w
	move.l	#_rte,$134.w
	bclr	#3,$fffffa17.w
	clr.b	$fffffa07.w
	clr.b	$fffffa09.w
	rts

wvsync	movem.l	a0/d0-d1,-(a7)
	lea	$ffff8209.w,a0
	movep.w	-8(a0),d0
l000e	tst.b	(a0)
	beq.b	l000e
l000f	tst.b	(a0)
	bne.b	l000f
	movep.w	-4(a0),d1
	cmp.w	d0,d1
	bne.b	l000f
	movem.l	(a7)+,a0/d0-d1
	rts

ikbd_wrt	lea	$fffffc00.w,a0
.wait	move.b	(a0),d1
	btst	#1,d1
	beq.b	.wait
	move.b	d0,2(a0)
	rts

get_st_t	clr.w	mach_type
	move.l	a7,l0017
	move.l	8.w,l0018
	move.l	#l0016,8.w
	tst.w	$ffff8900.l
	move.w	#$ffff,mach_type
l0016	lea	0.l,a7
l0017	equ	*-4
	move.l	#0,8.w
l0018	equ	*-6
	rts

	dc.b	'XBRATFSY'
old_408	dcb.w	2

exit_wit	bsr.b	l001b
	movea.l	old_408(pc),a0
	jmp	(a0)

l001b	move	#$2700,sr
	movem.l	oldpal(pc),d0-d7
	movem.l	d0-d7,$ffff8240.w
	bra	exit

loader	move	sr,-(a7)
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
	lea	savemfp(pc),a0
	move.b	(a0)+,$fffffa07.w
	move.b	(a0)+,$fffffa09.w
	move.b	(a0)+,$fffffa13.w
	move.b	(a0)+,$fffffa15.w
	move.b	(a0)+,$fffffa17.w
	move.b	(a0)+,$fffffa19.w
	move.b	(a0)+,$fffffa1b.w
	move.b	(a0)+,$fffffa1d.w
	lea	savevect(pc),a0
	move.l	(a0)+,$68.w
	move.l	(a0)+,$70.w
	move.l	(a0)+,$114.w
	move.l	(a0)+,$118.w
	move.l	(a0)+,$120.w
	move.l	(a0)+,$134.w
	move	#$2300,sr

	clr.w	-(a7)
	pea	(a5)
	move.w	#$3d,-(a7)	; Open
	trap	#1
	addq.l	#8,a7
	tst.w	d0
	bmi	l001b
	move.w	d0,d7

	pea	(a6)
	move.l	#$7a120,-(a7)
	move.w	d7,-(a7)
	move.w	#$3f,-(a7)	; Read
	trap	#1
	lea	12(a7),a7

	move.w	d7,-(a7)
	move.w	#$3e,-(a7)	; Close
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

_rte	rte
oldcpu	dcb.w	4
savesys	dcb.w	21
savevect	dcb.w	12
savemfp	dcb.w	5
mach_type	dc.w	0
oldpal	dcb.w	32

xsd_file	dc.b	'*.xsd',0
xmd_file	dc.b	'*.xmd',0


screen	lea	l007b,a0
	lea	end_of_prog,a1
	movem.l	oldpal(pc),a2-a6/d1-d7
l0028	movem.l	a2-a6/d1-d7,(a0)
	movem.l	a2-a6/d1-d7,48(a0)
	movem.l	a2-a6/d1-d7,96(a0)
	lea	144(a0),a0
	cmpa.l	a0,a1
	bpl.b	l0028

	move.l	#screenme,d0
	add.l	#$ff,d0
	and.l	#$ffff00,d0
	move.l	d0,scr_base
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
l0029	rept	26
	movem.l	d1-d2,-(a0)
	endr
	lea	438(a0),a0
	dbf	d0,l0029
	bsr	scroller

	jsr	setup_tri

	lea	my_stack,a7
	bsr	wvsync
	lea	xsd_file(pc),a5
	lea	buffer,a6
	bsr	loader
	lea	xmd_file(pc),a5
	lea	my_stack,a6
	bsr	loader

;put gfx
	lea	gfx1,a0
	movea.l	scr_base,a1
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
	lea	gfx2,a0
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

	lea	gfx3,a0
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

	lea	gfx4,a0
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

	move.l	#my_stack,p0069
	move.l	#buffer,p006a
	move.l	#l0086,p006b
	move.l	#l0080,xmd_digi
	move.l	#l0081,p006d
	move.w	mach_type(pc),p006e
	bsr	xmd_play
	move.l	#my_vbl,$70.w

	tst.w	mach_type
	bne.b	.not_fm

	move.l	p0068(pc),$68.w
	lea	$ffff8800.w,a5
	movea.l	xmd_digi(pc),a6

.not_fm	move.b	#1,$fffffa07.w	; TB on
	move.b	#1,$fffffa13.w

 	movem.l	palette,d0-d7
	movem.l	d0-d7,$ffff8240.w
	move	#$2300,sr

mainloop	tst.b	vsync
	beq.b	mainloop
	sf	vsync
	move.l	l004d(pc),l0058
	move.l	#l0050,l0059
l0030	equ	*-8
	move	#$2500,sr
	bsr	do_calc
	move	#$2100,sr
	movem.l	palette,a0/d0-d6
	movem.l	a0/d0-d6,$ffff8240.w
	bsr.b	vu_meter
	bsr	mainplay
	bsr	scroller
	cmpi.b	#$39,$fffffc02.w
	beq	l001b
	bra.b	mainloop

vu_meter	lea	l007e,a0
	movea.l	a0,a4
	movea.l	a0,a1
	moveq	#0,d1
	moveq	#$16,d0
l0032	subq.w	#4,(a1)+
	bge.b	l0033
	move.w	d1,-2(a1)
l0033	dbf	d0,l0032
	movea.l	p006f(pc),a1
	lea	l003f(pc),a2
	moveq	#0,d2
	tst.b	21(a1)
	beq.b	l0034
	sf	21(a1)
	move.w	10(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	22(a1),41(a0,d1.w)
l0034	tst.b	45(a1)
	beq.b	l0035
	sf	45(a1)
	move.w	34(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	46(a1),41(a0,d1.w)
l0035	tst.b	69(a1)
	beq.b	l0036
	sf	69(a1)
	move.w	58(a1),d1
	move.w	0(a2,d1.w),d1
	move.b	70(a1),41(a0,d1.w)
l0036	tst.b	93(a1)
	beq.b	l0037
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
	bge.b	l003a
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

scroller	addi.l	#$1a0,l004d
	subq.w	#1,l007b
	bpl.b	l0046
	moveq	#0,d0
l0041	equ	*-1
	beq.b	l0042
	move.w	#1,l007b
	sf	l0041
	move.l	#$49,d0
	bra.b	l0045
l0042	st	l0041
	move.w	#7,l007b
	lea	l0075,a0
l0043	equ	*-4
	moveq	#0,d0
	move.b	(a0)+,d0
	cmp.b	#$ff,d0
	bne.b	l0044
	lea	l0075,a0
	move.b	(a0)+,d0
l0044	move.l	a0,l0043
l0045	lsl.w	#3,d0
	subq.l	#1,d0
	move.l	#l0076,l0049
	add.l	d0,l0049
l0046	subq.w	#1,l007c
	bcc.b	l004c
	move.w	#0,d0
l0047	equ	*-2
	move.w	d0,l004a
	add.w	#$10,d0
	cmp.w	#$1a0,d0
	bne.b	l0048
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
	bra.b	l004f
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
my_vbl1	clr.b	$fffffa1b.w
	move.l	#my_tb,$120.w
	move.b	#$21,$fffffa21.w
	move.b	#8,$fffffa1b.w
	rte

my_vbl	move.l	#my_vbl1,$70.w
	rte

my_tb	move	#$2700,sr
	movem.l	a0-a4/d0,-(a7)
	movea.l	p0067(pc),a4
	clr.b	$fffffa1b.w
	move.l	#l005a,$120.w
	move.b	#$f,$fffffa21.w
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	lea	$ffff8209.w,a0
l0054	move.b	(a0),d0
	cmp.b	(a0),d0
	bne.b	l0054
	move.b	(a0),d0
l0055	cmp.b	(a0),d0
	beq.b	l0055
	move.b	(a0),d0
	neg.w	d0
	lsl.w	d0,d0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	9
	nop
	endr
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
	movea.l	p0067(pc),a4
	clr.b	$fffffa1b.w
	move.l	#l0062,$120.w
	move.b	#$48,$fffffa21.w
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.w	l0060(pc),d0
	move.w	d0,$ffff8242.w
	move.w	d0,$ffff8250.w
	st	vsync
	move.l	#$60006,d0
	move.l	d0,$ffff8248.w
	move.l	d0,$ffff824c.w
	lea	$ffff8209.w,a0
l005b	move.b	(a0),d0
	cmp.b	(a0),d0
	bne.b	l005b
	move.b	(a0),d0
l005c	cmp.b	(a0),d0
	beq.b	l005c
	move.b	(a0),d0
	neg.w	d0
	lsl.w	d0,d0
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	24
	nop
	endr
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
	rept	55
	nop
	endr

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
	rept	10
	nop
	endr

	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	55
	nop
	endr
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
	rept	55
	nop
	endr
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
	rept	10
	nop
	endr
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	55
	nop
	endr	
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
	rept	10
	nop
	endr
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	55
	nop
	endr
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
	rept	10
	nop
	endr
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	55
	nop
	endr
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
	rept	10
	nop
	endr
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	rept	55
	nop
	endr
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
	rept	55
	nop
	endr
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
	rept	55
	nop
	endr
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
	rept	55
	nop
	endr
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
	rept	55
	nop
	endr

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
	rept	55
	nop
	endr

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
	rept	55
	nop
	endr

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
	rept	55
	nop
	endr

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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr

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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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
	rept	55
	nop
	endr


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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr

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


	rept	55
	nop
	endr

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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr
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

	rept	55
	nop
	endr

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

l0062	movem.l	d0-4/a0/a4,-(sp)
	move.l	p0067(pc),a4
	clr.b	$fffffa1b.w
	move.l	#$60006,d0
	move.l	d0,$ffff8240.w
	move.l	d0,$ffff8244.w
	move.w	#0,d0
l0063	equ	*-2	
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
	lea	colours,a0
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
	rept	48
	nop	
	endr

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
	rept	48
	nop	
	endr
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
	rept	48
	nop	
	endr
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
	rept	48
	nop	
	endr
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
	rept	48
	nop	
	endr
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
	rept	48
	nop	
	endr
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
	rept	48
	nop	
	endr
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
	rept	48
	nop
	endr
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
	rept	50
	nop
	endr
	movem.l	(a7)+,a4/a0/d0-d4
	rte


	opt	w-,x+

xmd_play	bra	p0004
	bra	xmd_init
mainplay	bra	p0017
do_calc	bra	xmd_calc
p0067	dc.l	ym_vol-xmd_play
p0068	dc.l	ym_68-xmd_play	
p0069	dcb.w	2
p006a	dcb.w	2
p006b	dcb.w	2
xmd_digi	dcb.w	2
p006d	dcb.w	2
p006e	dc.b	0,0


p006f	dc.b	0,0,06,'f'
	dc.l	ym_vol-xmd_play
p0004	movem.l	a0-a6/d0-d7,-(a7)
	lea	xmd_play(pc),a3
	movea.l	28(a3),a5
	movea.l	32(a3),a6
	movea.l	24(a3),a4
	move.w	(a5)+,d6
	moveq	#$1e,d7
xmd_sam	move.w	4(a4),d0
	tst.w	d0
	beq.b	xmd_sl_d
	neg.w	d0
	bsr	p0013
	move.l	a6,(a4)
	tst.w	6(a4)
	beq.b	xmd_sl_s
	move.w	#$18f,d0
	move.w	6(a4),d1
	move.w	d1,d2
	lea	0(a6,d1.w),a0
	movea.l	a0,a1
p0006	move.w	(a1)+,(a6)+
	addq.w	#2,d2
	bne.b	p0007
	movea.l	a0,a1
	move.w	d1,d2
p0007	dbf	d0,p0006
	bra.b	xmd_sl_d
xmd_sl_s	move.w	#$18f,d0
	move.b	-(a6),d1
	lsl.w	#8,d1
	move.b	(a6)+,d1
p0009	move.w	d1,(a6)+
	dbf	d0,p0009
xmd_sl_d	lea	10(a4),a4
	dbf	d7,xmd_sam
	movea.l	xmd_digi(pc),a0
	move.w	#$1f8,d0
	move.l	#$10001000,d1
xmd_fill	move.l	d1,(a0)+
	dbf	d0,xmd_fill
	tst.w	44(a3)
	beq.b	p000c
	clr.w	$ffff8900.w	; DMA off
	move.w	#2,$ffff8920.w	; 25khz
	move.w	#$6b8,14(a3)
	move.w	#$14e,1428(a3)
	move.w	#$13e,1466(a3)
	move.w	#$16e,1504(a3)
	move.w	#$15e,1542(a3)
	move.w	#$4e73,5998(a3)
	move.l	#$30d4,296(a3)
	move.l	#$3f2,544(a3)
p000c	move.l	a3,d0
	add.l	d0,16(a3)
	add.l	d0,20(a3)
	add.l	d0,50(a3)
	add.l	d0,46(a3)
	tst.w	44(a3)
	beq.b	p000e
	lea	xmd_volu(pc),a0
	move.w	#$1fff,d0
xmd_conv	move.w	(a0),d1
	lsr.w	#4,d1
	sub.w	#$40,d1
	move.w	d1,(a0)+
	dbf	d0,xmd_conv
p000e	move.w	#$2fb,d0
	move.l	#$1e78,d1
	lea	p004f(pc),a0
xmd_make	move.l	(a0),d2
	moveq	#0,d3
	swap	d2
	move.w	d2,d3
	divu	d1,d3
	swap	d3
	move.w	d3,d2
	swap	d2
	swap	d3
	divu	d1,d2
	move.w	d2,(a0)+
	move.w	d3,(a0)+
	dbf	d0,xmd_make
	move.l	#$6000005e,244(a3)
xmd_relo	lea	p003a(pc),a0
	moveq	#3,d0
	moveq	#0,d1
	lea	xmd_no_i(pc),a1
p0011	move.l	a1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.l	d1,(a0)+
	dbf	d0,p0011
	lea	xmd_voic(pc),a0
	moveq	#3,d0
	moveq	#0,d1
	lea	xmd_no_i(pc),a1
xmd_clr_	move.l	a1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.l	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	dbf	d0,xmd_clr_
	move.b	#6,657(a3)
	move.w	#$3f0,668(a3)
	movea.l	24(a3),a1
	move.w	310(a1),696(a3)
	move.w	312(a1),690(a3)
	lea	314(a1),a2
	move.l	a2,704(a3)
	lea	442(a1),a2
	move.l	a2,718(a3)
	movem.l	(a7)+,a0-a6/d0-d7
	rts

p0013	lea	xmd_depa(pc),a0
	lsr.w	#1,d0
	subq.w	#1,d0
p0014	moveq	#0,d1
	move.b	(a5)+,d1
	move.w	d1,d2
	asr.w	#4,d1
	and.w	#$f,d2
	add.b	0(a0,d1.w),d6
	move.b	d6,(a6)+
	add.b	0(a0,d2.w),d6
	move.b	d6,(a6)+
	dbf	d0,p0014
	rts

xmd_depa	dc.b	0,1,2,4,8,$10,' @'
	dc.b	$80,$c0,$e0,$f0,$f8,$fc,$fe,$ff
xmd_init	movem.l	a0-a6/d0-d7,-(a7)
	bra	xmd_relo

p0017	movem.l	a0-a4/d0-d6,-(a7)
	lea	xmd_play(pc),a4
	lea	xmd_digi(pc),a0
	move.l	4(a0),d0
	move.l	(a0)+,(a0)
	move.l	d0,-(a0)
	tst.w	44(a4)
	beq.b	p0018
	move.l	d0,d1
	add.l	#$27a,d1
	move.b	d0,$ffff8907.w
	lsr.l	#8,d0
	move.b	d0,$ffff8905.w
	lsr.l	#8,d0
	move.b	d0,$ffff8903.w
	clr.w	$ffff8900.w
	move.w	#1,$ffff8900.w
	move.b	d1,$ffff8913.w
	lsr.l	#8,d1
	move.b	d1,$ffff8911.w
	lsr.l	#8,d1
	move.b	d1,$ffff890f.w	; fix
	bra.b	p0019
p0018	movea.l	d0,a6
p0019	moveq	#1,d0
	subq.w	#1,d0
	ble.b	xmd_read
	move.b	d0,595(a4)
	lea	p003a(pc),a0
	lea	xmd_voic(pc),a1
	bsr	xmd_chec
	lea	xmd_chip(pc),a0
	lea	p003f(pc),a1
	bsr	xmd_chec
	lea	p003c(pc),a0
	lea	p0040(pc),a1
	bsr	xmd_chec
	lea	p003d(pc),a0
	lea	p0041(pc),a1
	bsr	xmd_chec
	bra.b	xmd_end
xmd_read	move.b	#0,595(a4)
	tst.b	1580(a4)
	bne.b	xmd_get
	move.w	#0,d0
	add.w	#$10,d0
	cmp.w	#$400,d0
	bne.b	xmd_in_p
xmd_get	clr.b	1580(a4)
	moveq	#$ff,d0
	addq.l	#1,d0
	cmp.w	#0,d0
	bne.b	p001c
	move.w	#0,d0
p001c	move.b	d0,685(a4)
	lea	0.l,a0
	move.b	0(a0,d0.w),d0
	swap	d0
	lsr.l	#6,d0
	add.l	#0,d0
	move.l	d0,734(a4)
	moveq	#0,d0
xmd_in_p	move.w	d0,668(a4)
	add.l	#0,d0
	movea.l	d0,a3
	lea	p003c(pc),a0
	lea	p0040(pc),a1
	bsr.b	p001f
	lea	p003a(pc),a0
	lea	xmd_voic(pc),a1
	bsr.b	p001f
	lea	p003d(pc),a0
	lea	p0041(pc),a1
	bsr.b	p001f
	lea	xmd_chip(pc),a0
	lea	p003f(pc),a1
	bsr.b	p001f
xmd_end	bsr	xmd_do_r
	movem.l	(a7)+,a0-a4/d0-d6
	rts

p001f	move.l	(a3)+,12(a1)
	moveq	#0,d0
	move.b	13(a1),d0
	beq.b	xmd_pv_n
	add.w	d0,d0
	movea.l	p0069(pc),a2
	lea	-10(a2,d0.w),a2
	move.l	(a2)+,(a1)+
	move.l	(a2)+,(a1)+
	move.w	(a2),d0
	move.w	d0,(a1)
	and.w	#$3e00,d0
	subq.l	#8,a1
	move.w	d0,22(a1)
xmd_pv_n	moveq	#0,d0
	move.b	12(a1),d0
	beq.b	p0021
	lea	xmd_note(pc),a2
	cmpi.b	#6,14(a1)
	beq	xmd_set
	move.w	-2(a2,d0.w),d0
	move.w	d0,10(a1)
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.w	(a1),(a0)
	subq.l	#8,a0
	subq.l	#8,a1
	st	21(a1)
p0021	moveq	#0,d0
	move.b	14(a1),d0
	move.w	xmd_comm(pc,d0.w),d0
	jmp	xmd_comm(pc,d0.w)
xmd_comm	dc.b	0,' ',0,' ',0,' ',0,' '
	dc.b	0,' ',0,' ',0,' ',0,' '
	dc.b	0,' ',0,' ',0,' ',0,'0'
	dc.b	0,'<',0,'T',0,' ',0,'Z'
p0023	move.w	10(a1),d0
	lea	p0050(pc),a2
	move.l	0(a2,d0.w),10(a0)
	rts

	move.b	15(a1),685(a4)
	not.b	1580(a4)
	bra.b	p0023
	movep.w	15(a1),d0
	clr.b	d0
	move.w	d0,8(a1)
	move.w	d0,8(a0)
	and.w	#$3e00,d0
	move.w	d0,22(a1)
	bra.b	p0023
	not.b	1580(a4)
	bra.b	p0023
	move.b	15(a1),d0
	move.b	d0,595(a4)
	move.b	d0,657(a4)
	bra.b	p0023
xmd_set	move.w	-2(a2,d0.w),d0
	move.w	d0,16(a1)
	moveq	#0,d1
	move.b	15(a1),d1
	cmp.w	10(a1),d0
	beq.b	xmd_no_p
	bgt.b	p0025
	neg.w	d1
p0025	move.w	d1,18(a1)
	bra	p0021
xmd_no_p	clr.w	18(a1)
	bra	p0021
xmd_chec	moveq	#0,d0
	move.b	14(a1),d0
	move.w	p0028(pc,d0.w),d0
	jmp	p0028(pc,d0.w)
p0028	dc.b	0,' ',0,$90,0,$a8,0,$c6
	dc.b	1,2,$ff,$82,$ff,$82,$ff,$82
	dc.b	$ff,$82,$ff,$82,1,'P',$ff,$82
	dc.b	$ff,$82,$ff,$82,$ff,$82,$ff,$82
	dc.b	'J)',0,$f,'g',0,$ff,'\'
	dc.b	'p',0,$10,':',$fe,'O',$90,':'
	dc.b	$fe,$d,$d0,'@0;',0,4
	dc.b	'N',$fb,0,2,0,$1e,0,'('
	dc.b	$ff,'F',0,$1e,0,'(',$ff,'F'
	dc.b	0,$1e,0,'(',$ff,'F',0,$1e
	dc.b	0,'(',$ff,'F',0,$1e,0,'('
	dc.b	$ff,'F'
	moveq	#0,d0
	move.b	15(a1),d0
	lsr.b	#4,d0
	bra.b	xmd_do_a
	moveq	#0,d0
	move.b	15(a1),d0
	and.w	#$f,d0
xmd_do_a	add.w	d0,d0
	move.w	10(a1),d1
	lea	p004d(pc),a2
	moveq	#$23,d2
xmd_find	cmp.w	-(a2),d1
	dble	d2,xmd_find
	move.w	0(a2,d0.w),d0
	lea	p0050(pc),a2
	move.l	0(a2,d0.w),10(a0)
	rts

	moveq	#0,d0
	move.b	15(a1),d0
	move.w	10(a1),d1
	sub.w	d0,d1
	bge.b	p002b
	moveq	#0,d1
p002b	move.w	d1,10(a1)
	bra	p0023
	moveq	#0,d0
	move.b	15(a1),d0
	move.w	10(a1),d1
	add.w	d0,d1
	cmp.w	#$b9c,d1
	ble.b	p002c
	move.w	#$b9c,d1
p002c	move.w	d1,10(a1)
	bra	p0023
	move.w	18(a1),d0
	beq	p0023
	blt.b	p002d
	add.w	10(a1),d0
	cmp.w	16(a1),d0
	bgt.b	xmd_stop
	move.w	d0,10(a1)
	bra	p0023
p002d	add.w	10(a1),d0
	cmp.w	16(a1),d0
	blt.b	xmd_stop
	move.w	d0,10(a1)
	bra	p0023
xmd_stop	move.w	16(a1),10(a1)
	clr.w	18(a1)
	bra	p0023
	lea	xmd_vibs(pc),a2
	move.b	20(a1),d0
	lsr.w	#2,d0
	and.w	#$1f,d0
	moveq	#0,d1
	move.b	0(a2,d0.w),d1
	move.b	15(a1),d0
	and.w	#$f,d0
	mulu	d0,d1
	lsr.w	#4,d1
	and.w	#$fffc,d1
	move.w	10(a1),d0
	tst.b	20(a1)
	bmi.b	p002f
	add.w	d1,d0
	bra.b	xmd_vib_
p002f	sub.w	d1,d0
xmd_vib_	lea	p0050(pc),a2
	move.l	0(a2,d0.w),10(a0)
	move.b	15(a1),d1
	lsr.w	#2,d1
	and.w	#$3c,d1
	add.b	d1,20(a1)
	rts

	move.b	15(a1),d0
	ext.w	d0
	add.w	8(a1),d0
	cmpi.w	#$40,d0
	bge	p0023
	tst.w	d0
	bmi	p0023
	move.w	d0,8(a1)
	move.w	d0,8(a0)
	and.w	#$3e00,d0
	move.w	d0,22(a1)
	bra	p0023
xmd_do_r	lea	p0045(pc),a0
	move.w	#$4e71,(a0)
	lea	p003a(pc),a1
	move.w	4(a1),d0
	bmi.b	xmd_repe
	move.w	6(a1),d1
	bmi.b	p0032
	move.w	#$7400,(a0)
	bra.b	xmd_repe
p0032	add.w	d1,d0
	bpl.b	p0032
	move.w	d0,4(a1)
xmd_repe	lea	xmd_null(pc),a0
	move.w	#$4e71,(a0)
	lea	xmd_chip(pc),a1
	move.w	4(a1),d0
	bmi.b	p0035
	move.w	6(a1),d1
	bmi.b	p0034
	move.w	#$7a00,(a0)
	bra.b	p0035
p0034	add.w	d1,d0
	bpl.b	p0034
	move.w	d0,4(a1)
p0035	lea	p0048(pc),a0
	move.w	#$4e71,(a0)
	lea	p003c(pc),a1
	move.w	4(a1),d0
	bmi.b	p0037
	move.w	6(a1),d1
	bmi.b	p0036
	move.w	#$7400,(a0)
	bra.b	p0037
p0036	add.w	d1,d0
	bpl.b	p0036
	move.w	d0,4(a1)
p0037	lea	p0049(pc),a0
	move.w	#$4e71,(a0)
	lea	p003d(pc),a1
	move.w	4(a1),d0
	bmi.b	p0039
	move.w	6(a1),d1
	bmi.b	p0038
	move.w	#$7a00,(a0)
	bra.b	p0039
p0038	add.w	d1,d0
	bpl.b	p0038
	move.w	d0,4(a1)
p0039	rts

	dc.b	0,0
p003a	dcb.w	7
xmd_chip	dcb.w	7
p003c	dcb.w	7
p003d	dcb.w	7
xmd_voic	dcb.w	12
p003f	dcb.w	12
p0040	dcb.w	12
p0041	dcb.w	12
	movem.l	a0-a4/d0-d6,-(a7)
	movea.l	p006d(pc),a3
	lea	p003a(pc),a4
	movea.l	(a4),a0
	moveq	#0,d0
	move.w	4(a4),d0
	move.w	8(a4),d1
	move.l	10(a4),d2
	moveq	#0,d2
	lea	xmd_chip(pc),a4
	movea.l	(a4),a1
	moveq	#0,d3
	move.w	4(a4),d3
	move.w	8(a4),d4
	move.l	10(a4),d5
	moveq	#0,d5
	lea	xmd_volu(pc),a2
	move.w	#$1f4,d6
p0042	swap	d6
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	swap	d6
	dbf	d6,p0042
	lea	p003a(pc),a4
	move.w	d0,4(a4)
	lea	14(a4),a4
	move.w	d3,4(a4)
	movea.l	p006d(pc),a3
	lea	p003c(pc),a4
	movea.l	(a4),a0
	moveq	#0,d0
	move.w	4(a4),d0
	move.w	8(a4),d1
	move.l	10(a4),d2
	moveq	#0,d2
	lea	p003d(pc),a4
	movea.l	(a4),a1
	moveq	#0,d3
	move.w	4(a4),d3
	move.w	8(a4),d4
	move.l	10(a4),d5
	moveq	#0,d5
	lea	xmd_volu(pc),a2
	move.w	#$1f4,d6
p0043	swap	d6
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.b	d6,(a3)+
	addq.w	#1,a3
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	swap	d6
	dbf	d6,p0043
	lea	p003c(pc),a4
	move.w	d0,4(a4)
	lea	14(a4),a4
	move.w	d3,4(a4)
	move.w	-2(a3),d0
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	movem.l	(a7)+,a0-a4/d0-d6
	rts

xmd_calc	movem.l	a0-a4/d0-d6,-(a7)
	movea.l	p006d(pc),a3
	lea	p003a(pc),a4
	movea.l	(a4),a0
	moveq	#0,d0
	move.w	4(a4),d0
	move.w	8(a4),d1
	move.l	10(a4),d2
p0045	moveq	#0,d2
	lea	xmd_chip(pc),a4
	movea.l	(a4),a1
	moveq	#0,d3
	move.w	4(a4),d3
	move.w	8(a4),d4
	move.l	10(a4),d5
xmd_null	moveq	#0,d5
	lea	xmd_volu(pc),a2
	lea	ym_vol(pc),a4
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	moveq	#$4d,d6
p0047	swap	d6
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	swap	d6
	dbf	d6,p0047
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	move.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	lea	p003a(pc),a4
	move.w	d0,4(a4)
	lea	14(a4),a4
	move.w	d3,4(a4)
	movea.l	p006d(pc),a3
	lea	p003c(pc),a4
	movea.l	(a4),a0
	moveq	#0,d0
	move.w	4(a4),d0
	move.w	8(a4),d1
	move.l	10(a4),d2
p0048	moveq	#0,d2
	lea	p003d(pc),a4
	movea.l	(a4),a1
	moveq	#0,d3
	move.w	4(a4),d3
	move.w	8(a4),d4
	move.l	10(a4),d5
p0049	moveq	#0,d5
	lea	xmd_volu(pc),a2
	lea	ym_vol(pc),a4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	move.w	#$19,d6
p004a	swap	d6
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	nop
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	move.w	(a6)+,d7
	move.l	4(a4,d7.w),(a5)
	move.l	0(a4,d7.w),d7
	movep.l	d7,0(a5)
	swap	d6
	dbf	d6,p004a
	move.b	0(a0,d0.w),d1
	move.w	0(a2,d1.w),d6
	move.b	0(a1,d3.w),d4
	add.w	0(a2,d4.w),d6
	add.w	d6,(a3)+
	clr.w	d6
	add.l	d2,d0
	addx.w	d6,d0
	add.l	d5,d3
	addx.w	d6,d3
	lea	p003c(pc),a4
	move.w	d0,4(a4)
	lea	14(a4),a4
	move.w	d3,4(a4)
	move.w	-2(a3),d0
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	move.w	d0,(a3)+
	movem.l	(a7)+,a0-a4/d0-d6
	rts

xmd_no_i	dc.b	$80,$80
xmd_note	dc.b	$b,$9c,$a,$dc,$a,'$',9,'|'
	dc.b	8,$d4,8,'<',7,$ac,7,'$'
	dc.b	6,$a4,6,',',5,$bc,5,'P'
	dc.b	4,$ec,4,$8c,4,'0',3,$dc
	dc.b	3,$88,3,'<',2,$f4,2,$b0
	dc.b	2,'p',2,'4',1,$fc,1,$c4
	dc.b	1,$94,1,'d',1,'4',1,$c
	dc.b	0,$e4,0,$bc,0,$98,0,'x'
	dc.b	0,'X',0,'8',0,$1c,0,0
p004d	dcb.w	16
xmd_vibs	dc.b	0,$18,'1Jax',$8d,$a1
	dc.b	$b4,$c5,$d4,$e0,$eb,$f4,$fa,$fd
	dc.b	$ff,$fd,$fa,$f4,$eb,$e0,$d4,$c5
	dc.b	$b4,$a1,$8d,'xaJ1',$18
p004f	dc.b	'C',$e0,'pnC9[',$a8
	dc.b	'B',$95,'ušA',$f4,$a7,'5'
	dc.b	'AV',$da,'H@',$bb,$f9,'r'
	dc.b	'@#',$f0,$1c,'?',$8e,$aa,'p'
	dc.b	'>',$fc,$15,'L>l',$1e,'@'

p0050	incbin	p0050

ym_68	move.w	(a6)+,d7
	move.l	ym_vol+4(pc,d7.w),(a5)
	move.l	ym_vol(pc,d7.w),d7
	movep.l	d7,(a5)
	rte

ym_vol	incbin	p0051

xmd_volu	incbin	xmd_volu

palette	dc.b	0,0,3,2,4,$13,5,'$'
	dc.b	6,'5',0,'f',0,'U',0,'D'
	dc.b	0,'3',0,'"',2,'4',3,'E'
	dc.b	4,'V',7,'F',5,'g',1,'#'
gfx1	incbin	gfx1
gfx2	incbin	gfx2
gfx3	incbin	gfx3
gfx4	incbin	gfx4

l0075	incbin	stel0075

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

colours	dc.b	7,'s',6,'t',5,'D',5,'T'
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

setup_tri	dc.b	'A',$fa,'(nC',$fa,$d,'V'
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
vsync	ds.w	1
scr_base	ds.l	1
screenme	ds.b	49280
my_stack	ds.b	57786
l0086	ds.b	260786
buffer	ds.b	238386
end_of_prog
