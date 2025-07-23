#!/bin/python3

import re
import subprocess
import os

dir = os.getcwd()
# gets list of installed programs from dnf
subprocess.run('dnf repoquery --userinstalled > manully_dnf.txt', shell=True)
#from flatpak
flat =subprocess.run('flatpak list --app | cut -f 2', shell=True, capture_output=True,text=True)


# (.*?)-\d+
pattern = re.compile(r'([a-z]+)+[-\D]+')

list_f =[]
formated_list= []

with open('manully_dnf.txt','r', encoding='UTF-8') as f:

    # It gives an error with f36-background expression
    for line in f:
        match= pattern.match(line)
        try:
            if match.group(0) not in list_f:
                list_f.append(match.group(0))
        except Exception:
            pass
# removing the - at the end of match from fail regex
for programs in list_f:
    if programs.endswith('-'):
        formated_list.append(programs[:-1])
    else:
        formated_list.append(programs)

with open('data.conf','w+') as output:
    output.write('[Programs] \n')
    for i in formated_list:
        output.write(i + '\n')

#appending flatpak
with open('data.conf','a') as output:
    output.write('[Flatpak] \n')
    output.write(flat.stdout)
    output.write('\n')


# Repolist


path =os.listdir('/etc/yum.repos.d/')
repos =[]
repolist = set()
for file in path:
    if 'fedora' not in file.lower() and 'copr' not in file.lower() and 'rpmfusion' not in file.lower():
        repos.append(file)

for f in repos:
    with open('/etc/yum.repos.d/'+f, 'r') as file:
        for line in file:
            line.strip()
            if line.startswith('baseurl='):
                cut =line.find('=') +1
                end = line.find('$')
                line = (line[cut:end])
                if not line.endswith('/'):
                    line = line +'/'
                if line not in repolist:
                 repolist.add(line + f)


#appending extra repos
with open('data.conf','a') as output:
    output.write('[Repolist]\n')
    for x in repolist:
        output.write(x + '\n')
    output.write('\n')

coprlist = subprocess.run(['dnf','copr','list'], capture_output=True,text=True).stdout.splitlines()
copr = [c.removeprefix('copr.fedorainfracloud.org/') for c in coprlist]

# append copr
with open('data.conf','a') as output:
    output.write('[Copr]\n')
    for x in copr:
        output.write(x+ '\n')

#opens the final file
with open('data.conf','r') as o:
    print(o.read())

# data.conf file will remain in directory

#removes output of dnf check
if os.path.exists('manully_dnf.txt'):
    os.remove(dir + '/manully_dnf.txt')
