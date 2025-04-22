
#!/bin/python3

import os


def clean(og_names):
    # os.chdir('/home/mahalo/Downloads/VideoDownloader')
    # og_names =(os.listdir())

    for n in og_names:
        file_name, extension = os.path.splitext(n)
        final_format=''
        
        if "(" in  str(file_name):
            start_of_segment=(file_name.index('('))
            
            formatted= file_name[0:start_of_segment]
            final_format=(formatted + extension) 
            os.rename(n, final_format)     

        elif "[" in  str(file_name): 
            start_of_segment=(file_name.index('['))

            formatted= file_name[0:start_of_segment]
            final_format=(formatted + extension) 
            os.rename(n, final_format)     


        elif "{" in  str(file_name): 
            start_of_segment=(file_name.index('{'))

            formatted= file_name[0:start_of_segment]
            final_format=(formatted + extension) 
            os.rename(n, final_format)     

    print("Working on" , os.getcwd())
    print("All Done")
    return

for dirpath,subdirs,files in os.walk('/home/mahalo/Downloads/Sabaton - 2022 - The War to End All Wars (24bit-48kHz)/'):
    os.chdir(dirpath)
    clean(files)
