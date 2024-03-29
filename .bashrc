export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=nvim
alias vim=nvim

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gl="git log --oneline"
alias glmaster="git log master..HEAD"
alias gdmaster="git diff master...HEAD"
alias gsearch="git log -S" # <term> Will search for something in the diff of commits
# This is zsh function. Should really just make this file .zshrc at this point
#function gdbranchtemp() {
	if [ "$1" != ""]
	then
		git log --no-merges origin/"$1" --not $(git for-each-ref --format="%(refname)" refs/remotes/origin | grep -Fv refs/remotes/origin/"$1")
	else
		echo "Provide a branch name as an argument"
	fi
}
# No idea why, but this command just doesn't work when done from the zshrc file. Way more output that in you just run it yourself in the shell
alias gdbranch="git log --no-merges origin/<YOUR-BRANCH>  --not $(git for-each-ref --format='%(refname)' refs/remotes/origin | grep -Fv refs/remotes/origin/<YOUR-BRANCH>)"
alias linediff="git diff --stat"

export HOMEBREW_NO_GOOGLE_ANALYTICS=true # Disable brew.sh tracking
