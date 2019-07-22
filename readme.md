# ts react generator

Generate typscript react files from command line.

Assumptions:

* duh:
  * using typescript
  * using react
* file names are title-case
* react components are paired with a sass (scss) file
* uses modularized css
* scss file names are in {Name}.module.scss format

Using Windows & using git bash as terminal are not required but readme examples gear these assumptions.

## Execute script

Execute powershell scripts from the directory you want to generate files in.

To install project proceed to [Install](#install) otherwise jump to [Scripts](#scripts)

# Install

Note: If using command shortcuts you'll want to create aliases to the files in this project. Choose installation directory accordingly.

1. Clone this repo
2. (Optional) [Create command aliases](#create-command-aliases)

### Scripts

Run scripts by [refering directly](#execute-powershell-on-windows) to project powershell files on disk or [utilize aliases](#create-command-aliases).

#### create function component (alias: cfc)- `functionComponent.ps1`

creates files by specified name:
* {Name}.tsx
* {Name}.module.scss

* $Name (first param, also ComponentName)
* $Path (second param, also DestinationPath)
  * if left blank files are created in current directory

.examples

* create files in current directory
`cfc "DateRefinerPanel

### Create Command Aliases

You can use bash aliases to create shortcuts to execute of the powershell script in your installation directory (where you cloned the repo).

Command aliases can be added to `.bash_profile` (from your user directory).

See examples below (replace `path/to/ts-react-generator` with the actual path to this project)

```sh
alias cfc="PowerShell $HOME/path/to/ts-react-generator/functionalComponent.ps1"
```

Be sure to `source ~/.bash_profile` after making the change

### Execute PowerShell on Windows

To execute PowerShell files on Windows: from terminal of choice use `PowerShell`, i.e. '$> PowerShell myFile.ps1`