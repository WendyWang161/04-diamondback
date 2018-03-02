section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 12
  mov eax, 20
  mov [ebp - 4], eax
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
  je  near label_7_true
  mov eax, 0x7FFFFFFF
  jmp near label_7_done
label_7_true: 
  mov eax, 0xFFFFFFFF
label_7_done: 
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 12]
  cmp eax, 0xFFFFFFFF
  je  near label_11_true
  mov eax, 88
  jmp near label_11_done
label_11_true: 
  mov eax, 200
label_11_done: 
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

