alias vim=nvim
alias v=nvim
alias ls=exa
alias cat=bat

export EDITOR=vim

eval "$(rbenv init - zsh)"

eval "$(/opt/homebrew/bin/brew shellenv)"


# Assumes brew install
export NVM_DIR="$HOME/.nvm" 
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export GOPATH=$(go env GOPATH)
export PATH="$HOME/.rbenv/shims/:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/scripts/:$PATH"
export PATH="$HOME/bin/:$PATH"
# Add brew's path for installing libs
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --oneline"
alias gp="git pull"
alias gccc="git checkout"
# Credit https://jordanelver.co.uk/blog/2020/06/04/fixing-commits-with-git-commit-fixup-and-git-rebase-autosquash/
alias gfixup="git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -d ' ' -f1 | xargs -o git commit --fixup"
alias grb="git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -d ' ' -f1 | xargs -o -I % git rebase -i"
alias gfixrebase="git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -d ' ' -f1 | xargs -o -I % git rebase -i --autosquash %~1"
alias glcopy="git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -d ' ' -f1 | pbcopy" # TODO: pbcopy is mac, xclip is unix. Find what's installed then use that automatically
alias gshow="git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -d ' ' -f1 | xargs -o git show"
alias glmaster="git log master..HEAD"
alias gdmaster="git diff master...HEAD"
alias gsearch="git log -S" # <term> Will search for something in the diff of commits
# This is zsh function. Should really just make this file .zshrc at this point
#function gdbranchtemp() {
# 	if [ "$1" != ""]
# 	then
# 		git log --no-merges origin/"$1" --not $(git for-each-ref --format="%(refname)" refs/remotes/origin | grep -Fv refs/remotes/origin/"$1")
# 	else
# 		echo "Provide a branch name as an argument"
# 	fi
# }
# No idea why, but this command just doesn't work when done from the zshrc file. Way more output that in you just run it yourself in the shell
# alias gdbranch="git log --no-merges origin/<YOUR-BRANCH>  --not $(git for-each-ref --format='%(refname)' refs/remotes/origin | grep -Fv refs/remotes/origin/<YOUR-BRANCH>)"
alias linediff="git diff --stat"

export HOMEBREW_NO_GOOGLE_ANALYTICS=true # Disable brew.sh tracking
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
