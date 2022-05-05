# CLI provides simple operation of the AWS SSO crentials tools
# Usage:
# awssso install - install all requiremnets
# awssso login - login to all profiles
# awssso <profile> - switch to given profile
awssso () {
  SSO_TOOL_REPO="https://github.com/ACloudGuru/aws-sso-credentials.git"
  SSO_TOOL_PATH="$HOME/lib/aws-sso-credentials"
  ZSCALER_CERT_PATH="$HOME/.ssl/zscaler.crt"
  MODE_OR_PROFILE="$1"

  # Install the AWS SSO tool, it's prerequisites and the Zscaler certificate
  if [ $MODE_OR_PROFILE = "install" ]; then

    # Clone the repo, if it doesn't exist already
    if [ -d "$SSO_TOOL_PATH" ]; then
      echo -e "✅ Repository exits at $SSO_TOOL_PATH\n"
    else
      command git clone https://github.com/ACloudGuru/aws-sso-credentials.git $SSO_TOOL_PATH
    fi

    # Install requirements, quiet mode so it doesn't shout if they exist
    command pip3 install --quiet --requirement $SSO_TOOL_PATH/requirements.txt

  # Use AWS SSO to create daily credentials for shell sessions
  elif [ $MODE_OR_PROFILE = "login" ]; then
    command $SSO_TOOL_PATH/awssso --all --login

  # Use AWS SSO to a given profile and add it to env defaults
  else
    command $SSO_TOOL_PATH/awssso --profile $MODE_OR_PROFILE
    export AWS_PROFILE=$MODE_OR_PROFILE
    export AWS_DEFAULT_PROFILE=$MODE_OR_PROFILE
  fi
}
