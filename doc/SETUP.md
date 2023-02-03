## TL;DR
To get started you need to install a LaTeX interpreter for you OS, set up an IDE and optionally install LaTeX extension(s).
The suggested IDE is VSCode, either local or in GitHub Codespaces.
NOTE: As of today, Github removes your codespace if you don't use it for a month. You knew it.

Obviously, you can do as you want, if you know how to. Otherwise stick with these instructions. :)

# IDE
## GH Codespaces
In the [template repository page](https://github.com/consba/tesi-latex-template) click on "Use this template" button, then "Open in a codespace".

## VSCode
Follow VSCode [install guide](https://code.visualstudio.com/docs/setup/setup-overview).

# LaTeX
## Linux
### Ubuntu and GH Codespace
In terminal (`Ctrl+J` to open it in VSCode or Codespace) write:
```
sudo apt update
sudo apt install texlive-full
```

# LaTeX extensions for VSCode/Codespace
Launch VS Code Quick Open (`Ctrl+P`), paste the following command, and press enter.
```
ext install James-Yu.latex-workshop
```
