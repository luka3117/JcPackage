#-*- coding: utf-8 -*-
import re
import sys
import os

# os.system("ls")
os.system("git remote -v| grep 'http'> ttt.txt")

for i in open("ttt.txt"):
    i=i.split()
    print(i[1])

# import subprocess

import webbrowser

# webbrowser.open('https://tonari-it.com/')
webbrowser.open(i[1])

os.system("rm ttt.txt")
