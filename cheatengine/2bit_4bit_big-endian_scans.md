# Add 2bit and 4bit Big Endian scan to Cheat Engine


1. Start a new scan and rightclick the variable type
2. Choose new custom type (auto assembler)

To give CE support for 2 Byte Big Endian put this in:
Code:	
```
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(ConvertRoutine,1024)
alloc(ConvertBackRoutine,1024)

TypeName:
db '2 Byte Big Endian',0

ByteSize:
dd 2

//The convert routine should hold a routine that converts the data to an integer (in eax)
//function declared as: stdcall int ConvertRoutine(unsigned char *input);
//Note: Keep in mind that this routine can be called by multiple threads at the same time.
ConvertRoutine:
//jmp dllname.functionname
[64-bit]
//or manual:
//parameters: (64-bit)
//rcx=address of input
xor eax,eax
mov ax,[rcx] //eax now contains the bytes 'input' pointed to
xchg ah,al //convert to big endian

ret
[/64-bit]

[32-bit]
//jmp dllname.functionname
//or manual:
//parameters: (32-bit)
push ebp
mov ebp,esp
//[ebp+8]=input
//example:
mov eax,[ebp+8] //place the address that contains the bytes into eax
mov ax,[eax] //place the bytes into eax so it's handled as a normal 4 byte value
and eax,ffff //cleanup
xchg ah,al //convert to big endian

pop ebp
ret 4
[/32-bit]

//The convert back routine should hold a routine that converts the given integer back to a row of bytes (e.g when the user wats to write a new value)
//function declared as: stdcall void ConvertBackRoutine(int i, unsigned char *output);
ConvertBackRoutine:
//jmp dllname.functionname
//or manual:
[64-bit]
//parameters: (64-bit)
//ecx=input
//rdx=address of output
//example:
xchg ch,cl //convert the little endian input into a big endian input
mov [rdx],cx //place the integer the 4 bytes pointed to by rdx

ret
[/64-bit]

[32-bit]
//parameters: (32-bit)
push ebp
mov ebp,esp
//[ebp+8]=input
//[ebp+c]=address of output
//example:
push eax
push ebx
mov eax,[ebp+8] //load the value into eax
mov ebx,[ebp+c] //load the address into ebx

//convert the value to big endian
xchg ah,al

mov [ebx],ax //write the value into the address
pop ebx
pop eax

pop ebp
ret 8
[/32-bit]
```

To give CE support for 4 Byte big endian put this in:
Code:	
```
alloc(TypeName,256)
alloc(ByteSize,4)
alloc(ConvertRoutine,1024)
alloc(ConvertBackRoutine,1024)

TypeName:
db '4 Byte Big Endian',0

ByteSize:
dd 4

//The convert routine should hold a routine that converts the data to an integer (in eax)
//function declared as: stdcall int ConvertRoutine(unsigned char *input);
//Note: Keep in mind that this routine can be called by multiple threads at the same time.
ConvertRoutine:
//jmp dllname.functionname
[64-bit]
//or manual:
//parameters: (64-bit)
//rcx=address of input
xor eax,eax
mov eax,[rcx] //eax now contains the bytes 'input' pointed to
bswap eax //convert to big endian

ret
[/64-bit]

[32-bit]
//jmp dllname.functionname
//or manual:
//parameters: (32-bit)
push ebp
mov ebp,esp
//[ebp+8]=input
//example:
mov eax,[ebp+8] //place the address that contains the bytes into eax
mov eax,[eax] //place the bytes into eax so it's handled as a normal 4 byte value

bswap eax

pop ebp
ret 4
[/32-bit]

//The convert back routine should hold a routine that converts the given integer back to a row of bytes (e.g when the user wats to write a new value)
//function declared as: stdcall void ConvertBackRoutine(int i, unsigned char *output);
ConvertBackRoutine:
//jmp dllname.functionname
//or manual:
[64-bit]
//parameters: (64-bit)
//ecx=input
//rdx=address of output
//example:
bswap ecx //convert the little endian input into a big endian input
mov [rdx],ecx //place the integer the 4 bytes pointed to by rdx

ret
[/64-bit]

[32-bit]
//parameters: (32-bit)
push ebp
mov ebp,esp
//[ebp+8]=input
//[ebp+c]=address of output
//example:
push eax
push ebx
mov eax,[ebp+8] //load the value into eax
mov ebx,[ebp+c] //load the address into ebx

//convert the value to big endian
bswap eax

mov [ebx],eax //write the value into the address
pop ebx
pop eax

pop ebp
ret 8
[/32-bit]
```


Once these are in CE will be able to scan for those and you can add them to your cheat table and edit the values.

[Source](https://forum.cheatengine.org/viewtopic.php?p=5305367)
