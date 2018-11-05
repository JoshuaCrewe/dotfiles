#! /usr/bin/env python2
import os, re, subprocess
from os.path import expanduser
def get_pass(acct):
    home = expanduser("~")
    acct = os.path.basename(acct)
    params = {
            'home': home,
            'path': '/dotfiles/offlineimap/',
            'acct': acct
            }
    command = "%(home)s%(path)s%(acct)s.gpg" % params
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", command]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""

# #! /usr/bin/env python2
# from subprocess import check_output
#
# def get_pass(account):
#     return check_output("pass mail/" + account, shell=True).splitlines()[0]
