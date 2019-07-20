#!/usr/bin/env python
# coding=utf-8
import sys
index = sys.argv[1].find('/',1)
print(sys.argv[1][index+1:])
