#!/bin/python3

from pyfzf import FzfPrompt
import pathlib
import subprocess
import os
import shlex


def main():
    fzf = FzfPrompt()
    home = pathlib.Path.home()
    choices = {}

    # Python projects
    python_projects = {"django": f"{home}/python/djangoTutorial/"}

    for key in python_projects.keys():
        if "python" not in choices:
            choices["python"] = []

        choices["python"].append(key)

    # React projects
    react_projects = {"pajeet todo": f"{home}/java_sc/todoApp/"}

    for key in react_projects.keys():
        if "web" not in choices:
            choices["web"] = []

        choices["web"].append(key)


    # Flatten all values into one list or is [[]]
    all_choices = [item for sublist in choices.values() for item in sublist]

    selected = fzf.prompt(all_choices,'--prompt="Launch:"')
    selected = selected[0]
    print("selected:", selected)


    if not selected:
        print('Nothing selected')
        exit(0)

    # Handle selection

    # UV
    if selected in python_projects.keys():
        print("python")
        project_path = python_projects[selected]
        print("project_path:", project_path)

        os.chdir(project_path)

        inner_cmd = " tmux new-window && echo test&& exec zsh"

        # subprocess.run(["tmux", "new", "-s", selected])

        tmux_cmd = [
            "tmux", "new", "-s", selected,
            "zsh", "-c", inner_cmd
        ]

        # Launch interactively to see errors (for now)
        subprocess.run(tmux_cmd)


    # react
    elif selected in react_projects.keys():
        print("react")

        project_path = react_projects[selected]


        subprocess.Popen(["chromium-browser", "http://localhost:5173/"],
                         stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                         stdin=subprocess.DEVNULL, start_new_session=True)

        subprocess.Popen(["firefox", "-p", "devfox"],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                     stdin=subprocess.DEVNULL, start_new_session=True)

        os.chdir(project_path)
        subprocess.run(["tmux", "new", "-s", selected])



if __name__ == "__main__":
    main()
