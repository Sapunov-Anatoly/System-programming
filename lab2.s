.data

print_format:
	.string "Колличество чисел, меньших 128, равно: %d\n"

array:
	.long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array_end:

.text
.global main
.type main, @function

main:
	movl $0, %ecx
   	movl $array,%ebx 
    	movl (%ebx), %eax
	
jmp ch_bound
	
less:
	addl $4, %ebx                               /* переходим на следующий элемент массива*/
	movl (%ebx), %eax

ch_bound:
    	cmpl $array_end, %ebx /*сравнить адрес текущего элемента и адрес конца массива*/
    	jne concatinathion /*если не равны, то повторить цикл снова*/
	jmp end
    

concatinathion:
    	xor $107, %eax
    	cmpl $128, %eax
	addl $1, %ecx
    	JNA ch_bound

end:
		

pushl %ecx
pushl $print_format
call printf
addl $8, %esp
movl $0, %ecx
movl $0, %ebx
movl $0, %eax
ret

