
.486
.model flat, stdcall
includelib \masm32\lib\kernel32.lib
ExitProcess proto:DWORD
.data
A               dd      23,34,37,38,41,44,57,61,64,72   
BR              dd      0   
N               dd      10
.code
start:  
    lea esi, A 
    mov ecx, N
    mov ebx,0
    call counting
    mov BR, ebx
    Invoke ExitProcess, 0
 
counting proc
    ProcessArray:
        mov eax, [esi]
        cmp eax, 30
        jl notInRange
        cmp eax, 55
        jg notInRange
        inc ebx
    notInRange:
    add esi, 4
    loop ProcessArray
    ret
counting endp
 
end start
