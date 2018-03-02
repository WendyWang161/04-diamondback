section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 32
  mov eax, 4
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  imul eax, [ebp - 4]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  imul eax, [ebp - 8]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 12]
  imul eax, [ebp - 12]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 16], eax
  mov eax, [ebp - 16]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 16]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 16]
  imul eax, [ebp - 16]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 20], eax
  mov eax, [ebp - 20]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 20]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 20]
  imul eax, [ebp - 20]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 24], eax
  mov eax, [ebp - 24]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 24]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 24]
  imul eax, [ebp - 24]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 28], eax
  mov eax, [ebp - 28]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 28]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 28]
  imul eax, [ebp - 28]
  jo  near internal_error_overflow
  sar eax, 1
  mov [ebp - 32], eax
  mov eax, [ebp - 32]
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

