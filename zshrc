# New zsh config from scratch written by github.com/simvux
PROMPT="%F{6} []%F{7} : %F{6}%20d%u%F{7} -> %F{7}"
PROMPT_EOL_MARK=''

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec dbus-run-session sway
fi

# Alacritty why the fuck are you breaching standards
export TERM=xterm-256color

# -> Path
export GOPATH="$HOME/C/go"
export LUMINA_PATH="$HOME/C/rust/lumina/luminastd/"
export PATH="$PATH:/usr/local/go/bin:$HOME/C/go/bin"
export PATH="$PATH:/$HOME/.cargo/bin"
export PATH="$PATH:/home/simon/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/"
export PATH="$PATH:/$HOME/.bin"
export PATH="$PATH:/$HOME/.cabal/bin"
export PATH="$PATH:/$HOME/.npm-global/bin"
export PATH="$PATH:/home/simon/.local/bin"

export lumina="/home/simon/C/rust/lumina/"
export loggboken="/home/simon/C/go/src/github.com/simvux/loggboken"
# <- Path

# -> Native
function chpwd() {
    emulate -L zsh
    ls --color=auto
}
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
zstyle ':completion:*' insert-tab false
setopt complete_in_word
setopt always_to_end

bindkey -v
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# <- Native

# -> Bindings
# <- Bindings

# -> Quirks
# Less command colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# <- Quirks

# -> Plugins
source /home/simon/.antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting
#antigen bundle urbainvaes/fzf-marks
antigen bundle hlissner/zsh-autopair
antigen apply
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# <- Plugins

source /home/simon/.alias
#export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=10;42:ow=01;6:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.svg=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"
