import os
import sys

CC = input("enter C compiler (default: tcc)? ")

if (CC == ""):
        CC = "tcc"
        

if (os.system("nasm --version") != 0):
    print("download nasm for compiling this OS")
    sys.exit(0)

if os.name == "nt":
	print("moja OS dla linuxa.")
    sys.exit(0)
else:
	print("ok")

version = input("what will you use version?\n1.32bit\n2.16bit\n(default = 2)? ")
if (version == '1'):
	print("making KANAWAOS 32BIT")
else:
	print("making KANAWAOS 16BIT")
