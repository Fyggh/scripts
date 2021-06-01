# .zshrc 
#
# This is your personal .zshrc file. It is executed during zsh startup for
# interactive shells.

# Default user prompt
# PS1="%T [%n@%m:%~]
# %! %# "

# Here are some other good prompts to choose from. You can also 
# create your own.
# mpierce uses a colorified, somewhat rearranged version:
fg_red="$(print '%{\e[1;31m%}')"
fg_green="$(print '%{\e[0;32m%}')"
fg_normal="$(print '%{\e[0m%}')"
PS1="%(!.${fg_red}.${fg_green})%n${fg_normal}@%B%m%b [%6c]
(%!) %# "
# It looks best with white text on a black background.
# It has a green user, unless you're root, in which case the user is red.

# Remember the last 50 commands
HISTSIZE=50

# Have zsh tell you when background jobs finish
setopt notify

# Turn off the infuriating beeping noises
# If you want the shell to beep when you make a mistake,
# comment this line out and run source .zshrc on it.
setopt nobeep

# Protect files from being overwritten
setopt noclobber

# Add a spell checking option for commands
setopt correct

# SETTING ALIASES
# 
# You can set aliases quite easily just by following the same format
# as the other commands use below. In case you need to know the format is
# alias new_command='old commands'

# If you do a lot of C compiling, this saves finger wear
# (Note that only one filename may be specified.)
# alias     C='gcc -o \!* \!*.c '
# alias     C++='g++ -o \!* \!*.[Cc]*[^~] '

# This is a _really_ handy alias.
# show / after directories, * after executables, etc.
# alias     ls='ls -F'
# To see color-coded ls output, uncomment this alias:
alias  ls='ls -lAF --color=auto'
#alias lsp='ls -lAF --color=always | less -R'   
lsp() {
    if [ $# -eq 0 ]
        then ls -lAF --color=always | less -R
        else ls -lAF --color=always "$1" | less -R
    fi
}

LS_COLORS='rs=0:di=00;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.html=00;38;5;48'
export LS_COLORS

# Useful commands made better (according to some) through alias:
# alias     mv='nocorrect mv -i'
# alias     cp='nocorrect cp -i'
# alias     rm='nocorrect rm -i'        # The nocorrect option keeps the zsh spell checker from 
# alias     mkdir='nocorrect mkdir'     # running on any of the arguments passed to the command.
# alias     man='nocorrect man'
alias     ll='ls -l'
# alias     l.='ls -A'
# alias     sizeof='du -sh'     # Useful for checking the size of directories and regular files
alias     pow='htop -u tfleming'
alias     rgrep='grep -rnI . -e'
alias     rgrepc='grep -rnI . --include="*.[chS]" -e'

# Java Shortcuts
# alias     je=java
# alias     jx='javac \!$.java ; java \!$'
# alias     jc=~/bin/jc

# Load the zsh completion system
# Keeping separate .zcompdump files is necessary for working around some issues
# with zsh.
autoload -U compinit
compinit -d ~/.zcompdump_`uname -s`

# zsh history settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zsh_history"

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/tfleming/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /cs/cs134/bin/setup.bash
