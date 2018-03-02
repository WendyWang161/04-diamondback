section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 16
  push DWORD 0
  call label_def_even_start
  add esp, 4
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 4], eax
  push DWORD 2
  call label_def_even_start
  add esp, 4
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 8], eax
  push DWORD 4
  call label_def_even_start
  add esp, 4
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 12], eax
  push DWORD 6
  call label_def_even_start
  add esp, 4
  mov [ebp - 16], eax
  mov eax, [ebp - 16]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 16], eax
  mov eax, 0
  mov esp, ebp
  pop  ebp
  ret
label_def_even_start: 
  push ebp
  mov ebp, esp
  sub esp, 8
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 0
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  cmp eax, 0
  je  near label_3_true
  mov eax, 0x7FFFFFFF
  jmp near label_3_done
label_3_true: 
  mov eax, 0xFFFFFFFF
label_3_done: 
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 4]
  cmp eax, 0xFFFFFFFF
  je  near label_13_true
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
  sub eax, 2
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  push DWORD [ebp - 8]
  call label_def_odd_start
  add esp, 4
  jmp near label_13_done
label_13_true: 
  mov eax, 0xFFFFFFFF
label_13_done: 
  mov esp, ebp
  pop  ebp
  ret
label_def_odd_start: 
  push ebp
  mov ebp, esp
  sub esp, 8
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 0
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  cmp eax, 0
  je  near label_21_true
  mov eax, 0x7FFFFFFF
  jmp near label_21_done
label_21_true: 
  mov eax, 0xFFFFFFFF
label_21_done: 
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  and ebx, 0x7FFFFFFF
  cmp ebx, 0x7FFFFFFF
  jne near internal_error_non_boolean
  mov eax, [ebp - 4]
  cmp eax, 0xFFFFFFFF
  je  near label_31_true
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
  sub eax, 2
  jo  near internal_error_overflow
  mov [ebp - 8], eax
  push DWORD [ebp - 8]
  call label_def_even_start
  add esp, 4
  jmp near label_31_done
label_31_true: 
  mov eax, 0x7FFFFFFF
label_31_done: 
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

