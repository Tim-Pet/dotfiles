# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color" # This sets up colors properly

export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OSX antigen file
arch_name="$(uname -m)";
if [ "${arch_name}" = "arm64" ]; then
  source /opt/homebrew/share/antigen/antigen.zsh;
else
  source /usr/local/share/antigen/antigen.zsh;
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme romkatv/powerlevel10k

# Bundles
antigen bundle git
antigen bundle common-aliases
antigen bundle fasd
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# NVM bundle
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# Turn on extended globbing
setopt extendedglob

# Load custom aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable fuzzy backwards search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup fnm (fast node manager)
eval "$(fnm env --use-on-cd)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tp/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tp/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tp/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tp/Library/google-cloud-sdk/completion.zsh.inc'; fi

[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable fuzzy backwards search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup fnm (fast node manager)
eval "$(fnm env --use-on-cd)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tp/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tp/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tp/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tp/Library/google-cloud-sdk/completion.zsh.inc'; fi

export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_HOME=/Users/tp/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
