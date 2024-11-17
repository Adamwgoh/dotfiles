autoload -U colors && colors
setopt promptsubst


local parse_special='%{$fg[yellow]%}$(date)%{$reset_color%}'“

source $(brew --prefix nvm)/nvm.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias minikubestart="minikube start --driver qemu --network socket_vmnet"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/adamgoh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/adamgoh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adamgoh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adamgoh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

parse_git_branch() 
  {    
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'     
  }
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias python='python3'
alias pip='pip3'
alias mlops='conda activate mlops'
alias gradio='conda activate gradio'
alias delete-endpoint='aws sagemaker delete-endpoint --endpoint-name $1'
alias get-modelpackagegroups='aws sagemaker get-model-package-groups'
alias get-model-packages='aws sagemaker get-model-packages'
alias start-postgresql='brew services start postgresql@14'

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export privatedlc="534138779879.dkr.ecr.us-west-2.amazonaws.com/deep-learning-containers"
export PYENV_ROOT=~/.pyenv

eval "$(pyenv init -)"




[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
