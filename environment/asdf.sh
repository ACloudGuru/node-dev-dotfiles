# ASDF
# http://asdf-vm.com/
# Add ASDF environment setup.
#
## source $(brew --prefix asdf)/libexec/asdf.sh
# ☝️ not required since 0.16.1
# Leaving this here for reference and in case of future changes.
export ASDF_DIR="$HOME/.asdf"
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export ASDF_CONCURRENCY=auto
