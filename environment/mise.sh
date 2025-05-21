local __mise=mise
if (( ! $+commands[mise] )); then
  if (( $+commands[rtx] )); then
    __mise=rtx
  else
    return
  fi
fi

# Load mise hooks
eval "$($__mise activate zsh)"

# Hook mise into current environment
eval "$($__mise hook-env -s zsh)"

COMPLETIONS_PATH="$HOMEBREW_PREFIX/share/zsh/site-functions/_mise"

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `mise`. Otherwise, compinit will have already done that.
if [[ ! -f "$COMPLETIONS_PATH" ]]; then
  typeset -g -A _comps
  autoload -Uz _$__mise
  _comps[$__mise]=_$__mise
fi

# Generate and load mise completion
$__mise completion zsh >| "$COMPLETIONS_PATH" &|

export NODE_PATH="$(mise which node)"
export NPM_PATH="$(mise which npm)"
