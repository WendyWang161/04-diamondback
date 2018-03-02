section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 0
  push DWORD 2900000
  push DWORD 0
  call label_def_sumTR_start
  add esp, 8
  mov esp, ebp
  pop  ebp
  ret
label_def_sumTR_start: 
  push ebp
  mov ebp, esp
  sub esp, 12
  mov eax, [ebp + 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 12]
  sub eax, 2
  and eax, 0x80000000
  or  eax, 0x7FFFFFFF
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 4]
  cmp eax, 0xFFFFFFFF
  je  near label_19_true
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  add eax, 2
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  mov eax, [ebp + 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 2
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 12]
  sub eax, 2
  jo  near internal_error_overflow
  mov [ebp - 12], eax
  mov eax, DWORD [ebp - 8]
  mov [ebp + 8], eax
  mov eax, DWORD [ebp - 12]
  mov [ebp + 12], eax
  mov esp, ebp
  pop  ebp
  jmp near label_def_sumTR_start
  jmp near label_19_done
label_19_true: 
  mov eax, [ebp + 8]
label_19_done: 
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

