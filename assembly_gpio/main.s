RCC_APB2ENR EQU 0x40021018

GPIOA_CLR EQU 0x40010800
GPIOA_CRH EQU 0x40010808
GPIOA_ODR EQU 0x4001080C


	export __main
		
			


	
	AREA MAIN, CODE, READONLY
__main PROC
	LDR R1, = RCC_APB2ENR
	LDR R0, [R1]
	ORR R0, R0, #0xFC
	STR R0, [R1]
	
	LDR R1, =GPIOA_CLR
	LDR R0, =0x33333333
	STR R0, [R1]
	
	
	
LOOP
	
repeat MOV r3, #10
	ADR R4, digits
	
	
	
	LDR R5, =GPIOA_ODR
	LDR R6, =~(0x00)
	STR R6, [R5]	
	BL delay
	
	
	
inside LDR R7, [R4], #4    
	MOV R6, R7
	STR R6, [R5]
	BL delay
	
	SUBS r3, r3, #1
	BNE inside   
	B repeat
	
	B LOOP




delay
	LDR R9, =300
d_L1 LDR R10, =25000
d_L2 SUBS R10, R10, #1
	BNE d_L2
	SUBS R9, R9, #1
	BNE d_L1
	BX LR
	



ENDP
digits DCD ~0x3F, ~0x06, ~0x5b, ~0x4f, ~0x66, ~0x6d, ~0x7d, ~0x07, ~0x7f, ~0x6f	

	END

	
