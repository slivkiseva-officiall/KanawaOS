import os

if os.name == "nt":
	print("przepraszam, ale moja OS triebujet kurwa linux!!!!!!!!!!!")
else:
	print("ok")

version = input("what will you use version?\n1.32bit\n2.16bit\n(default = 2)? ")
if (version == '1'):
	print("making KANAWAOS 32BIT")
else:
	print("making KANAWAOS 16BIT")