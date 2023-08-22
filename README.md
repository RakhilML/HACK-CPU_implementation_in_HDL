# HACK-CPU_implementation_in_HDL
The Hack CPU (Central Processing unit), consisting of an ALU, two registers named A and D, and a program counter named PC.

# WORKING OF CPU
The Hack CPU (Central Processing unit), consisting of an ALU, two registers
named A and D, and a program counter named PC.
The CPU is designed to fetch and execute instructions written in the Hack
machine language. In particular, it functions as follows: Executes the inputted
instruction according to the Hack machine language specification.
The D and A in the language specification refer to CPU-resident registers,
while M refers to the external memory location addressed by A, i.e. to
Memory[A]. 

The inM input holds the value of this location.
If the current instruction needs to write a value to M, the value is placed in
outM, the address of the target location is placed in the addressM output, and
the writeM control bit is asserted. (When writeM==0, any value may appear
in outM). The outM and writeM outputs are combinational: they are affected
instantaneously by the execution of the current instruction.
The addressM and pc outputs are clocked: although they are affected by the
execution of the current instruction, they commit to their new values only in
the next time step. If reset==1 then the CPU jumps to address 0 (i.e. pc is set
to 0 in next time step) rather than to the address resulting from executing the
current instruction.

# ALU

• zr and ng are our Output Control Bits.
• The Hack ALU produces two kinds of outputs: a "main" 16-bit output resulting from
operating on the two 16-bit inputs, and two 1-bit "status outputs" named 'zr' and 'ng'.
• After we input x and y, presetting of inputs is done by the chips zx, nx, zy, and ny
depending upon the values that we provide for these input bits. Since it basically performs
a IF condition we use a MUX gate.
• Then we select between + or &. This depends on our value of f input bit. So, to make this
we use MUX gate.
• Then post setting of output is done.
• We need to now find the values of zr and ng.
• We can find the value of ng by finding out the value of our MSB. If it is 1, it means our
value is negative. If it is 0, then our output is positive.

# PROGRAM COUNTER

A program counter is a register in the CPU containing the address of the next instruction
to be executed from memory.

For example, when the computer is turned on, a signal places the decimal number F000
into the CPU. This action tells the computer to look at the first instruction on the
motherboard's flash memory chip.
This control mechanism can be realized by a register called Program Counter (PC).

# RAM16K

RAM is a form of computer memory that can be read and changed in any order, typically used to
store working data and machine code.
A sequence of n addressable 16-bit registers, with addresses 0 to n-1

# MEMORY

The complete address space of the Hack computer's memory, including RAM and memory-mapped I/O.
The chip facilitates read and write operations, as follows:
Read: out(t) = Memory[address(t)](t)
Write: if load(t-1) then Memory[address(t-1)](t) = in(t-1)
In words: the chip always outputs the value stored at the memory location specified by address. If load==1, the
in value is loaded into the memory location specified by address.
This value becomes available through the out output from the next time step onward.
Address space rules: Only the upper 16K+8K+1 words of the Memory chip are used.
Access to address>0x6000 is invalid. Access to any address in the range 0x4000-0x5FFF results in accessing
the screen memory map. Access to address 0x6000 results in accessing the keyboard memory map.
The behavior in these addresses is described in the Screen and Keyboard chip specifications given in the book.

# COMPUTER 

The HACK computer, including CPU, ROM and RAM. When reset is 0, the program stored in the
computer's ROM executes.
When reset is 1, the execution of the program restarts. Thus, to start a program's execution, reset must
be pushed "up" (1) and "down" (0). From this point onward the user is at the mercy of the software.
Depending on the program's code, the screen may show some output and the user may be able to
interact with the computer via the keyboard.

Refer (https://www.nand2tetris.org/) for more content and explanation.
