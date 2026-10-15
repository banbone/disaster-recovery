# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"
# print time statement
ll=$(last -2 -t console | tail -1 | cut -b 40- | cut -b -16)
hr=$(last -2 -t console | tail -1 | cut -b 40- | cut -b 28-29)
min=$(last -2 -t console | tail -1 | cut -b 40- | cut -b 31-32)
echo "Your last session - $ll for $((hr?hr:0)) hours and $min minutes. Welcome back!"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# load aliases and functions
. ~/.alias/aws.sh
. ~/.alias/docker.sh
. ~/.alias/general.sh
. ~/.alias/git.sh
. ~/.alias/k8s.sh
. ~/.alias/spin.sh

PATH=/opt/homebrew/opt/python@3.11/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
export JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION=1
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export APPLE_SSH_ADD_BEHAVIOR=macos
export NODE_OPTIONS="$NODE_OPTIONS --experimental-vm-modules"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
