# Expertly curated bash profile by J. Macoskey

# Prep for adding git branch to prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Change Prompt
export PS1="\e[0;36m\w\e[m \e[1;34m@\e[m\e[0;32m\$(parse_git_branch) \e[m  \n >$ "

# Set Path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


#### ALIASES ####
# Make Some Commands Better
alias ll='ls -FGlAhp'
alias path='echo -e ${PATH//:/\\n}'
# alias python='python3.6'
alias tensor='source ~/tensorflow/bin/activate'
alias tensor_off='deactivate'
alias bosch='ssh -p 65022 jonmac@96.83.172.33'
alias caen='ssh macoskey@oncampus-course.engin.umich.edu'
alias serial='ls -lrt /dev/tty.*'
alias gitmap='git log --all --graph --decorate --oneline --simplify-by-decoration'

# Sox noises
alias brownnoise='play -c 2 -n synth brownnoise'
alias whitenoise='play -c 2 -n synth whitenoise'
alias pinknoise='play -c 2 -n synth pinknoise'
alias treknoise='play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20'

# Show/hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Notes (should be functional - do this l8r)
# alias uztargz='gunzip -c foo.tar.gz | tar xopf -'
# alias uztar='tar xopf foo.tar'
# alias uzip='unzip -a foo.zip'
# alias tar czf archive_folder_name.tar.gz folder_to_copy

# Enable some colors
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
