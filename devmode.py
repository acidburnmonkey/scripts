#!/bin/python3

from pyfzf import FzfPrompt
import pathlib
import subprocess
import os


home = pathlib.Path.home()

# Python projects
python_projects = {
    "mySite": f'{home}/repos/mysite/',
    "Dashboard": f'{home}/python/Dashboard',
}

# other projects
other = {"gobook": f'{home}/golang/book/ch1/'}

# React projects
react_projects = {}


def main():
    fzf = FzfPrompt()
    choices = {}

    for key in python_projects.keys():
        if "python" not in choices:
            choices["python"] = []

        choices["python"].append(key)

    for key in other.keys():
        if "go" not in choices:
            choices["go"] = []

        choices["go"].append(key)

    for key in react_projects.keys():
        if "web" not in choices:
            choices["web"] = []

        choices["web"].append(key)

    # Flatten all values into one list or is [[]]
    all_choices = [item for sublist in choices.values() for item in sublist]

    selected = fzf.prompt(all_choices, '--prompt="Launch:"')

    if not selected:
        print('Nothing selected')
        exit(0)

    selected = selected[0]
    print("selected:", selected)

    # Handle selection

    # UV
    if selected in python_projects.keys():
        print("python")
        project_path = python_projects[selected]
        print("project_path:", project_path)

        os.chdir(project_path)

        call_esac = esac()
        inner_cmd = "tmux new-window && exec zsh"

        tmux_cmd = ["tmux", "new", '-d', "-s", selected, "zsh", "-c", inner_cmd]

        subprocess.run(tmux_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        if call_esac:
            other_commands = f"tmux send-keys -t {selected} 'sh ./esac.sh' C-m"
            subprocess.run(
                other_commands,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                shell=True,
            )

        subprocess.run(
            ['tmux', 'attach', '-t', selected],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

    # react
    elif selected in react_projects.keys():
        print("react")

        project_path = react_projects[selected]

        subprocess.Popen(
            [
                "chromium-browser",
                "--profile-directory='Default'",
                "http://localhost:5173/",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            stdin=subprocess.DEVNULL,
            start_new_session=True,
        )

        subprocess.Popen(
            ["firefox", "-p", "devfox"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            stdin=subprocess.DEVNULL,
            start_new_session=True,
        )

        os.chdir(project_path)
        subprocess.run(["tmux", "new", "-s", selected])

    elif selected in other.keys():
        print("react")

        project_path = other[selected]

        os.chdir(project_path)
        subprocess.run(["tmux", "new", "-s", selected])


def esac():
    if 'esac.sh' in os.listdir():
        return True
    else:
        return False

if __name__ == "__main__":
    main()
