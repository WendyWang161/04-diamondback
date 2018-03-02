section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 20
  mov eax, 0xFFFFFFFF
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, 0xFFFFFFFF
  cmp eax, 0xFFFFFFFF
  je  near label_49_true
  mov eax, 4
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, 2
  jo  near internal_error_overflow
  mov [ebp - 4], eax
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  sub eax, [ebp - 4]
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  mov eax, 6
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, -2
  jo  near internal_error_overflow
  mov [ebp - 12], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  imul eax, [ebp - 12]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 16], eax
  mov eax, [ebp - 16]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 4
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 16]
  imul eax, 4
  jo  near internal_error_overflow
  sar eax, 1
  jmp near label_49_done
label_49_true: 
  mov eax, 4
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, 2
  jo  near internal_error_overflow
  mov [ebp - 4], eax
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  add eax, [ebp - 4]
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  mov eax, 6
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 8
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 6
  add eax, 8
  jo  near internal_error_overflow
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, -2
  jo  near internal_error_overflow
  mov [ebp - 16], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 16]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  add eax, [ebp - 16]
  jo  near internal_error_overflow
  mov [ebp - 20], eax
  mov eax, [ebp - 20]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 20
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 20]
  add eax, 20
  jo  near internal_error_overflow
label_49_done: 
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

