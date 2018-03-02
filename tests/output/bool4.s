section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 16
  mov eax, 200
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, 2
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  add eax, -2
  jo  near internal_error_overflow
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 8], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 4]
  cmp eax, [ebp - 8]
  je  near label_14_true
  mov eax, 0x7FFFFFFF
  jmp near label_14_done
label_14_true: 
  mov eax, 0xFFFFFFFF
label_14_done: 
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 12]
  cmp eax, 0xFFFFFFFF
  je  near label_30_true
  mov eax, 0x7FFFFFFF
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 16], eax
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
  sub eax, [ebp - 4]
  jo  near internal_error_overflow
  jmp near label_30_done
label_30_true: 
  mov eax, 0xFFFFFFFF
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 16], eax
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
  add eax, [ebp - 4]
  jo  near internal_error_overflow
label_30_done: 
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
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

