
.text
.align 2
.global miMain
.type miMain, %function
.extern printf
.extern nave




miMain: // X0 pixels
		mov		x10, X0			//  BackUp pixels address
		mov		x15, X1			//  BackUp config

		adrp	X7, contador	// Variable contador
		add		X7, X7, :lo12:contador
		
		ldr		X11, [X7, #0]

		// mov		x11,	#0			//	Start counter in 0
		movz	w2, 0x0aa0
		movk	w2, 0xffff, lsl 16	// X2 = color
		// w2 = 0xffff0aa0

loop2:
		add		w2, w2, #1

		lsl		X1, X11, #2		// *4 pixels

		mov		X0, X10			// X0 = pixels
		add		X0, X0, X1
		str		W2, [x0, #0]

		add		X11, X11, #1
		movz	X3,	0x2C00
		movk	X3, 0x1, lsl 16
		cmp		X11, X3
		b.lt	loop2
		mov		x11,	#0

wait: 	//wait for frame

        ldrb	w7, [x15, #8]
		subs	wzr, w7, #1
        b.ne	wait
		mov		w7, #0
		strb	w7,[x15, #8]
		b		loop2



// int contador = 0//

contador:
	.xword	0  // 64 bits
/*
 struct{
		uint64_t pp//
		uint32_t juan//
		uint16_t pedro//
		uint8_t  byte//
		uint8_t  byte2//
 } estructura//
*/

estructura:
	.xword	0  // 64 bits
	.word	0  // 32 bits
	.hword	0  // 16 bits
	.byte	0  // 8 bits


