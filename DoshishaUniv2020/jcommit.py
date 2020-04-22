#-*- coding: utf-8 -*-
import re
import sys
import os

#  自動で commit, pu   sh を行う
# 実装方法 : run  「python jccommit.py」



# os.system("ls")

input_message=input("コミット内容入力")

os.system("git add . ")
os.system("git commit -m"+input_message)
os.system("git push")

#
# git push
