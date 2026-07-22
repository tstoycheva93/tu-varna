.486
.model flat, stdcall
includelib \masm32\lib\kernel32.lib
ExitProcess proto:DWORD

.data
NameSurname db 'teodora stoycheva', 0 
countA dd 0 

.code
start:
    cld 
    lea esi, NameSurname 
    mov ecx, 0 
    mov eax, 0 

count_loop:
    lodsb 
    cmp al, 0 
    je end_count_loop
    cmp al, 'a' 
    jne not_a
    inc ecx 
not_a:
    jmp count_loop

end_count_loop:
    mov [countA], ecx
    Invoke ExitProcess, 0
end start

