#!/usr/bin/env python
#-*- coding: utf-8 -*-
'''
    python ==> printf() 함수를 사용해본 예제 코드 (not working 180423)
'''
from ctypes import *
import time

msvcrt = cdll.msvcrt
counter = 0

while True:
    msvcrt.printf("Loop iteration %d! \n" %counter)
    time.sleep(.5)
    counter += 1
    
