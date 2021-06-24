.section .text
.global load
.type load, @function

load:
	add	a4, a0, zero //initialize the sum register with 0
	add	a2, a0, a1 //store count 10 in register a2. Register a1 is loaded with 0xa (decimal 10) from  main program
	add	a3,a0,zero //initialize intermediate sum register with 0
	
loop:
	add	a4, a4, a3 //incremenral addition	
	addi  	a3, a3, 1 //increment intermediate register with 1
	blt	a3, a2, loop //if a3 is less than to a2 branch back to label name <loop>
	add	a0, a4, zero //store the final result in register a0 so that the final result can be use by the main program
	ret
