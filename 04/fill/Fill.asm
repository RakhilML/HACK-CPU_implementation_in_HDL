// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(RESTART)
@SCREEN
D=A
@0
M=D	//Screen goes to R0


(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	//if any key is pressed - jump
@WHITE
D;JEQ	//else jump to white

@KBDCHECK
0;JMP

(BLACK)
@1
M=-1	//filling screen with -1
@CHANGE
0;JMP

(WHITE)
@1
M=0	//filling screen with 0
@CHANGE
0;JMP

(CHANGE)
@1	//checks the screen filling
D=M	//contains black or white

@0
A=M	
M=D	//fills pixels

@0
D=M+1	//increment to next pixel
@KBD
D=A-D	

@0
M=M+1	//increment to next pixel
A=M

@CHANGE
D;JGT

@RESTART
0;JMP