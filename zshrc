# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 0
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/aki/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000000
SAVEHIST=10000000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install
#
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# aliases

alias cls="clear"
alias ls="ls --color=auto"
alias servo="~/Programs/servo/servo"

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
zmodload zsh/complist
# bindkey -M menuselect '^xi' vi-insert
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# use <S-Tab> to traverse menus backwards
bindkey -v '^[[Z' reverse-menu-complete
bindkey -s '^_' 'clear\n'

bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line


autoload -U compinit; compinit
# _comp_options+=(glob)

setopt GLOB_COMPLETE        # Show autocompletion menu with globs
# setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_MENU
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt EXTENDEDGLOB

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.

preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^a' 'bc -lq\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source /home/aki/.config/zsh/plugins/zsh-autosuggestions.zsh 2>/dev/null
source  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

function cd {
	builtin cd $@
	pwd > "/home/aki/.config/.last-dir"
}

function pd {
	cd "$(cat "/home/aki/.config/.last-dir")"
}

function copy {
	cat $@ | xclip -selection clipboard
}
