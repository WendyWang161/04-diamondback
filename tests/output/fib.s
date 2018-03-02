section .text
extern error
extern print
global our_code_starts_here
our_code_starts_here:
  push ebp
  mov ebp, esp
  sub esp, 24
  push DWORD 0
  call label_def_fib_start
  add esp, 4
  mov [ebp - 4], eax
  mov eax, [ebp - 4]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 4], eax
  push DWORD 2
  call label_def_fib_start
  add esp, 4
  mov [ebp - 8], eax
  mov eax, [ebp - 8]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 8], eax
  push DWORD 4
  call label_def_fib_start
  add esp, 4
  mov [ebp - 12], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 12], eax
  push DWORD 6
  call label_def_fib_start
  add esp, 4
  mov [ebp - 16], eax
  mov eax, [ebp - 16]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 16], eax
  push DWORD 8
  call label_def_fib_start
  add esp, 4
  mov [ebp - 20], eax
  mov eax, [ebp - 20]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 20], eax
  push DWORD 10
  call label_def_fib_start
  add esp, 4
  mov [ebp - 24], eax
  mov eax, [ebp - 24]
  mov ebx, eax
  push ebx
  call print
  mov [ebp - 24], eax
  mov eax, 0
  mov esp, ebp
  pop  ebp
  ret
label_def_fib_start: 
  push ebp
  mov ebp, esp
  sub esp, 20
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 4
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  sub eax, 4
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
  je  near label_27_true
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
  call label_def_fib_start
  add esp, 4
  mov [ebp - 12], eax
  mov eax, [ebp + 8]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, 4
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp + 8]
  sub eax, 4
  jo  near internal_error_overflow
  mov [ebp - 16], eax
  push DWORD [ebp - 16]
  call label_def_fib_start
  add esp, 4
  mov [ebp - 20], eax
  mov eax, [ebp - 12]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 20]
  mov ebx, eax
  and ebx, 0x1
  cmp ebx, 0x0
  jne near internal_error_non_number
  mov eax, [ebp - 12]
  add eax, [ebp - 20]
  jo  near internal_error_overflow
  jmp near label_27_done
label_27_true: 
  mov eax, 2
label_27_done: 
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

