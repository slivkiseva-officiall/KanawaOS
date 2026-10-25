import os
import sys

CC = input("enter C compiler (default: tcc)? ")

if (CC == ""):
        CC = "tcc"
        

if (os.system("nasm --version") != 0):
    print("download nasm for compiling this OS")
    sys.exit(0)

version = input("what will you use version?\n1.32bit\n2.16bit\n(default = 2)? ")
if (version == '1'):
	print("making KANAWAOS 32BIT")
else:
	print("making KANAWAOS 16BIT")
	print("making int 0x42")
	if os.name == "nt":
		os.system("md build/")
		os.system("md build/int")
		os.system("md build/int/16bit")
		os.system("mkdir build/boot")
		os.system("mkdir build/kernel")
	else:
		os.system("mkdir -p build/int/16bit/")
		os.system("mkdir -p build/boot/")
		os.system("mkdir -p build/kernel/")
	os.system("nasm -f bin src/int/16bit/system_int.asm -o build/int/16bit/0x42int.bin")
	os.system("nasm -f bin src/boot/bootsect.asm -o build/boot/bootsect.bin")
	os.system("nasm -f bin src/boot/ldr16/main.asm -o build/boot/main.bin")
