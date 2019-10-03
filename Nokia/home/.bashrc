###########################################################################
#
#   Filename:           .bashrc
#
#   Author:             smorton based on .bashrc for cygwin 1.3 by mbs
#
#   Created:            2010/06/03 17:45:10
#
#   Description:        Default .bashrc for new developers on PANOS using DESKTOP_2: Win7 + Cygwin 1.5
#
# Note - you must not to modify this file. You can
# put your personal settings in .bashrc.local which this file will 'source'
# automatically.
#
#
###########################################################################
#
#                 Source Control System Information
#
#   $Id$
#
###########################################################################
#
#                  Copyright (c) 2010-2010 Alcatel-Lucent
#
###########################################################################

case "$(uname -o)" in
  Cygwin*)
    [ -f ~/.bashrc_cygwin ] && source ~/.bashrc_cygwin
    # Must be before we overwrite the Windows path
    [ -n "$java" ] || java=$(which java 2> /dev/null)
    export OSTYPE=cygwin
    cygwin=1
    export WIND_HOST_TYPE=x86-win32
    export DESKTOP_2=1
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin
    ;;
  Msys*)
    export "PATH=${PATH}:/usr/local/timostools"
    return
    ;;
  *Linux*)
    java=$(which java 2> /dev/null)
    export OSTYPE=linux
    cygwin=0
    export WIND_HOST_TYPE=x86-linux
    export PATH=/usr/local/bin:/bin:/usr/bin
    export GTK_THEME=Default
    ;;
esac

: "${USER:=$USERNAME}"
: "${USERNAME:=$USER}"
export USER USERNAME

# This is not needed to build TiMOS. The build environment figures it out
# automatically. But, it is here just to catch incorrecty installed software
# installations to make it easier for me to debug an installation somebody
# has screwed up.
export WIND_BASE=/usr/local/tornado-2.0
export EMACS_BASE=/usr/local/emacs-20.6

export TMP=/tmp
export TEMP=/tmp

#
# CVS things
#
export CVSROOT=":pserver:$USER@cvspc.mv.usa.alcatel.com:/swdev/cvsrep"
export GASHROOT=":pserver:$USER@gashpc.mv.usa.alcatel.com:/swdev/cvsrep"
export ADMINROOT=":pserver:$USER@cvspc.mv.usa.alcatel.com:/swdev/adminrep"
export CVSREAD=TRUE

#
# Things for building PANOS
#
export MAKE_MODE=UNIX
# The default TiMOS build targets.
export TGT_HW=x86_64
export TGT_SYS=both

#
# Set up the path. It's done in stages...
#

if [ $cygwin -eq 1 -a -d /etc/alternatives ]
then
    export PATH=${PATH}:/etc/alternatives
fi

#
# Wind River Tornado
# 
if [ -d ${WIND_BASE}/host/${WIND_HOST_TYPE}/bin ]
then
    export PATH=${PATH}:${WIND_BASE}/host/${WIND_HOST_TYPE}/bin
fi

#
# Various tools that may or may not exist
#

# Emacs
if [ -d ${EMACS_BASE}/bin ]
then
    export PATH=${PATH}:${EMACS_BASE}/bin
fi

# VI-clone
if [ -d /usr/local/vim56 ]
then
    export PATH=${PATH}:/usr/local/vim56
fi

# TCL
if [ -d /usr/local/tcl/bin ]
then
    export PATH=${PATH}:/usr/local/tcl/bin
fi

# WinCVS, use its version of cvs over what is in /bin
# 4/14/05 mbs: Not any more. With newer wincvs versions, they
# have severely screwed things up. You can't script a login (which might
# be intentional). And, often 'cvs edit' leaves a file still read-only.
# Plus, it seems to have totally messed up execute permissions. It seems
# make all .c and .h files executable.
#if [ -d /usr/local/wincvs/CVSNT ]
#then
#    export PATH=/usr/local/wincvs/CVSNT:${PATH}
#fi


#
# Sun's java compiler. The thing gets installed in different
# places depending upon the particular versions. Something that revs
# once per month is sort of a problem... Try and "guess" at the most recent
# one. Surely the most recent is the "best", right?
#

if [ -z "$java" -a $cygwin -eq 1 ]; then
    jdk='/ProgramData/Oracle/Java/javapath'
    if [ ! -d "$jdk" ]; then
        jdk="$(/bin/ls -d -t /j2sdk* 2>/dev/null | head -1)"
        if [ ! -d "$jdk" ]; then
            jdk=$(/bin/ls -d -t /jdk* 2>/dev/null | head -1)
        fi
        if [ -d "$jdk" ]; then
            java="$jdk/bin"
        fi
    fi
fi

if [ -n "$java" ]; then
    PATH=${PATH}:"${java%/java}"
fi

#
# If you have timostools, then use it
#
if [ -d /usr/local/timostools ]
then
    export PATH="/usr/local/timostools:${PATH}"

    # Enable git tab-complete and fancy git prompting for linux users
    if [ $cygwin -eq 0 ]; then
        source /usr/local/timostools/git.d/git-completion.bash
        source /usr/local/timostools/git.d/git-prompt.sh

        # git prompt configuration
        GIT_PS1_SHOWUPSTREAM=auto
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_STATESEPARATOR=' '
        export PROMPT_COMMAND='__git_ps1 "\w" " > "'
    fi
    # If you want to disable these, do not modify this file, put this in your ~/.bashrc.local
    # unset PROMPT_COMMAND    # To disable the prompt that tells you about your branch and what files you have modified.
    # complete -r git gitk    # To disable the tab-completion of git commands

    if [ -d /usr/local/timostools/git.d/man ]; then
       export MANPATH=":/usr/local/timostools/git.d/man"
    fi
else
    echo "You do not appear to have the SW development tools."
fi

if [ $cygwin -eq 1 ]
then
    #
    # Put standard Windows system path next
    #
    [ -n "$CYGPATH_SYSROOT" ] || CYGPATH_SYSROOT="$(cygpath -a -u "$SYSTEMROOT")"
    export PATH="${PATH}:$CYGPATH_SYSROOT/system32"
    export PATH="${PATH}:$CYGPATH_SYSROOT"
    export PATH="${PATH}:$CYGPATH_SYSROOT/system32/Wbem"
    export PATH="${PATH}:$CYGPATH_SYSROOT/system32/WindowsPowerShell/v1.0"

    if [ -d /cygdrive/c -a ! -d /cygdrive/c/tmp ]
    then
        mkdir -p /cygdrive/c/tmp
    fi
    if [ -d /cygdrive/d -a ! -d /cygdrive/d/tmp -a -w /cygdrive/d ]
    then
        mkdir -p /cygdrive/d/tmp
    fi

    cat > ~/.bashrc_cygwin <<eof
export java="$java"
export CYGPATH_SYSROOT="$CYGPATH_SYSROOT"
eof

fi

#
# If you have a bin in your home directory, we'll use it
#
if [ -d "$HOME"/bin ]
then
    export PATH="${PATH}:${HOME}/bin"
fi

#
# Finally, use current directory
#
export PATH="${PATH}:."

#
# Make sure the temp directories exist
#
if [ -n "$TMP" -a ! -d "$TMP" ]
then
    mkdir -p "$TMP"
fi

#
# Set prompt to <working directory>, space, ">", space
#
export PS1="\w > "

# Set size of history
export HISTSIZE=500
export HISTFILESIZE=500

# Ignore duplicate cmds in history log; ignore cmds beginning with whitespace
export HISTCONTROL=ignoreboth

# When doing file completion, ignore files ending in these
export FIGNORE=".o:~"

# Ignore EOF character
export IGNOREEOF

# Executed just before printing every prompt. You probably don't
# want to do anything with this.
#export PROMPT_COMMAND="printf '\e]0;$HOSTNAME\7'"

# Don't allow redirection to overwrite existing file
export noclobber

# If you do 'cd <val>' and val isn't a directory, then assume
# it's a variable and cd to the contents of the variable.
export cdable_vars

#
# Generic aliases.
# You may want to add more or override (unalias) these in your .bashrc.local
# These aliases put training wheels on commands like rm and mv to prevent
# overwriting existing files
#
alias copy='cp -i'
alias del='rm -i'
alias dir='ls -lF'
alias h=history
alias la='ls -a'
alias ll='ls -l'
alias ls='ls -F'
alias more=less
alias mv='mv -i'
alias ren='mv -i'
alias rm='rm -i'

#
# Some aliases specific to our development
#
alias panos='cd $HOME/ws/panos'

#
# Do a 'cvs -n up' which shows all files in the currrent directory
# and below which need to be updated or are modified. But, filter out
# all of the noise lines that cvs generates as it traverses a file tree
#
alias cvsnup='cvs -n -q up -P -d 2>/dev/null | grep -v "^\?"'
alias cvsup='cvs -z9 -q up -P -d 2>/dev/null | grep -v "^\?"'
alias cvsedit='cvs edit'
alias cvschanged="cvs -n -f -q up -dPR 2>/dev/null | grep '^[MARC?] '"
alias cvschanged2='cvs -z9 -q status 2>&1 | grep Status | egrep -v "(Up-to|Needs Patch)"'
alias cvsstatus='cvs status | grep Status'


# Turn on vi-style command line editing.
# If you prefer EMACS-style editing, use -o emacs
# If you prefer windows-style editing (using arrow keys), don't use anything.
#set -o vi

unset JAVA_HOME java

#
# Finally, if a ~/.bashrc.local exists, source it
#
if [ -e ~/.bashrc.local ]
then
    source ~/.bashrc.local
fi

if [ -e ~/.myalias ]
then
    source ~/.myalias
fi

if [ -e ~/.mynokalias ]
then
    source ~/.mynokalias
fi
