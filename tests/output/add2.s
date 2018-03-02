section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 0
  push DWORD 14
  push DWORD 24
  call label_def_add2_start
  add esp, 8
  mov esp, ebp
  pop  ebp
  ret
label_def_add2_start: 
  push ebp
  mov ebp, esp
  sub esp, 0
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  add eax, [ebp + 12]
  jo  near internal_error_overflow
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

