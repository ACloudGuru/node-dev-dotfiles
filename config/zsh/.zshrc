export DOTFILES=$HOME/.dotfiles
alias dotfiles='cd $DOTFILES'
alias dotfiles-install='. $DOTFILES/install.sh'
alias dotfiles-config='. $DOTFILES/config.sh'
alias dev='cd ~/Code'

# Extend path with Homebrew and user binary paths
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/private/tmp:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# Source secrets lib first
source $DOTFILES/environment/secret.sh

# Export dotfiles secrets
secret export NPM_TOKEN --silent
secret export ARTIFACTORY_NPM_TOKEN --silent
secret export HOME_TOWN --silent
secret export GIT_NAME --silent
secret export GIT_EMAIL --silent
secret export GIT_USERNAME --silent

# Source environment extensions
source $DOTFILES/environment/npm.sh
source $DOTFILES/environment/awssdk.sh
source $DOTFILES/environment/certs.sh
source $DOTFILES/environment/git.sh
source $DOTFILES/environment/granted.sh
source $DOTFILES/environment/killport.sh
source $DOTFILES/environment/pnpm.sh
source $DOTFILES/environment/search.sh
source $DOTFILES/environment/starship.sh
source $DOTFILES/environment/upbrew.sh
source $DOTFILES/environment/utils.sh
source $DOTFILES/environment/weather.sh
source $DOTFILES/environment/yarn.sh
source $DOTFILES/environment/zsh.sh
source $DOTFILES/environment/mise.sh

# Source ZimFW last to reference all other environment extensions
source $DOTFILES/environment/zim.sh
