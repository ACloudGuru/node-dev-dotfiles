# Git Configs
# Stop git scanning up the directory tree into home path
# https://git-scm.com/docs/git#Documentation/git.txt-codeGITCEILINGDIRECTORIEScode
export GIT_CEILING_DIRECTORIES=$HOME

alias ghtoken="export GITHUB_TOKEN=\"$(gh auth token)\""

alias gt="gittower ."

# Utility to clone all repositories from a GitHub organization
# Requires a GITHUB_TOKEN env var with repo access
# Dependencies: gh, jq, parallel
# Usage: CloneAll <organization>
CloneAll() {
  ORG=$1
  page=1
  while links=($(curl -H "Authorization: token ${GITHUB_TOKEN}" -s "https://api.github.com/orgs/${ORG}/repos?per_page=100&page=${page}" | jq -rc '.[] | {ssh_url} | .ssh_url'));  [[ "$links" ]]
  do
      GIT_TERMINAL_PROMPT=0 parallel git clone --depth=1 {} ::: "${links[@]}"
      ((++page))
  done
}
