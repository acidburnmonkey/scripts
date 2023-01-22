#!/bin/python3

import os
import sys
import re
import subprocess

arguments =sys.argv[1:]
test='gimp'


for iteration in arguments:
    iteration = iteration.upper() 
    find_configs=subprocess.run('find ~/ -name ' + iteration, shell=True, capture_output=True, text=True)
    print(find_configs.stdout)

