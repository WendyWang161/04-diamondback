section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 8
  mov eax, 0xFFFFFFFF
  mov [ebp - 4], eax
  mov eax, 0x7FFFFFFF
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 8], eax
  mov eax, [ebp - 4]
  mov esp, ebp
  pop  ebp
  ret
internal_error_non_number: 
  push 0
  jmp near label_0_done
internal_error_non_boolean: 
  push 2
  jmp near label_0_done
internal_error_overflow: 
  push 1
  jmp near label_0_done
label_0_done: 
  call error
