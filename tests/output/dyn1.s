section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 12
  mov eax, 24
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  and eax, 0x1
  shl eax, 31
  or  eax, 0x7FFFFFFF
  xor eax, 0x80000000
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 8]
  cmp eax, 0xFFFFFFFF
  je  near label_13_true
  mov eax, 24
  jmp near label_13_done
label_13_true: 
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  add eax, 2
  jo  near internal_error_overflow
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  push ebx
  call print
label_13_done: 
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 20
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  imul eax, 20
  jo  near internal_error_overflow
  sar eax, 1
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

