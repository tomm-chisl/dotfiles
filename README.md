My config file for WSL using Wezterm and Neovim. Unless otherwise stated, the files/folders in this repo should live in the home folder of WSL.

# Setup
Below is a non-exhaustive (I will add to this list as I remember) list of tools that need to be installed in addition to the config files:
- `Wezterm` which needs to be installed on *Windows*
- `nvim`
- `zoxide`
- `eza`
- `rust_analyzer`
- `uv`
- `ruff`
- `ty`

# Notes
## wezterm
The `wezterm` config file is configured in windows, hence 
- when cloning this repo: move the `wezterm` folder into a `.config` folder in the home directory of your windows machine
- when pushing changes to this repo: copy the `wezterm` folder from the home directory of your windows machine into the home directory of the WSL so that it can be pushed to the remote repo.
