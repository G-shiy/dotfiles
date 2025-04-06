if status is-interactive
  # Commands to run in interactive sessions can go here
end
set -gx PATH $HOME/.cargo/bin $PATH
set SPACEFISH_PROMPT_ADD_NEWLINE false
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH

starship init fish | source


alias lsf="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# Created by `pipx` on 2025-04-05 17:28:17
set PATH $PATH /home/shiy/.local/bin
