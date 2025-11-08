if status is-interactive
  # Commands to run in interactive sessions can go here
end
set -gx PATH $HOME/.cargo/bin $PATH
set SPACEFISH_PROMPT_ADD_NEWLINE false
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
set -U fish_user_paths /home/gustavo/go/bin $fish_user_paths
set -Ua PATH ~/.local/bin

set -Ux WAYFER_DATABASE_USER "shiy"
set -Ux WAYFER_DATABASE_NAME "localdb"
set -Ux WAYFER_DATABASE_HOST "localhost"
set -Ux WAYFER_DATABASE_PORT "5432"
set -Ux WAYFER_DATABASE_PASSWORD "neverforget3oct"

function fish_greeting
    pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

    set phrases \
        " Zero overhead, maximum control  " \
        " The closer to metal, the sharper the code  " \
        " Optimize. Compile. Dominate  " \
        " Binary dreams in a silicon city  "

    set random_index (math (random) % (count $phrases) + 1)
    echo (set_color cyan)$phrases[$random_index]
end

# echo (set_color cyan)" Simplicity fuels productivity  "
# 


starship init fish | source



alias lsf="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cat="bat --paging=never"
#alias catc="bat --color=always"
