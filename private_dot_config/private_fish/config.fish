if status is-interactive
  # Commands to run in interactive sessions can go here
  source (jump shell fish | psub)
end

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

set -gx GPG_TTY (tty)

# pnpm
set -gx PNPM_HOME "/home/rasmus/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path /opt/nvim-linux64/bin
fish_add_path $HOME/.npm-global/bin
fish_add_path $HOME/.cargo/bin

# Created by `pipx` on 2024-03-09 20:11:01
set PATH $PATH /home/rasmus/.local/bin

set VIRTUAL_ENV /home/rasmus/.venvs/lvim

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/rasmus/.micromamba/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/rasmus/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/rasmus/micromamba/bin/conda
    eval /home/rasmus/micromamba/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/rasmus/micromamba/etc/fish/conf.d/conda.fish"
        . "/home/rasmus/micromamba/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/rasmus/micromamba/bin" $PATH
    end
end
# <<< conda initialize <<<
