#!/bin/python3

from pyfzf import FzfPrompt
import pathlib
import subprocess
import os


home = pathlib.Path.home()

# Python projects
python_projects = {
    "AlgoVictory": f'{home}/repos/divinatio',
    "mySite": f'{home}/repos/mysite/',
}

# other projects
other = {"gobook": f'{home}/golang/book/ch1/'}


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

        choices["web"].append(key)

    # Flatten all values into one list or is [[]]
    all_choices = [item for sublist in choices.values() for item in sublist]

    selection: list = fzf.prompt(all_choices, '--prompt="Launch:"')

    if not selection:
        print('Nothing selected')
        exit(0)

    selected: str = selection[0]
    print("selected:", selected)

    # Handle selection

    # UV
    if selected in python_projects.keys():
        project_path = python_projects[selected]
        print("project_path:", project_path)

        os.chdir(project_path)

        inner_cmd = "tmux new-window && exec zsh"

        tmux_cmd = ["tmux", "new", '-d', "-s", selected, "zsh", "-c", inner_cmd]

        subprocess.run(tmux_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        esac(selected)

    elif selected in other.keys():
        project_path = other[selected]

        os.chdir(project_path)
        subprocess.run(["tmux", "new", "-s", selected])


def esac(selected: str):
    if 'esac.sh' in os.listdir():
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


if __name__ == "__main__":
    main()
