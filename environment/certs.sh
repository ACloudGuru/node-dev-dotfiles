# Define location of Zscaler cert bundle
export CERTIFICATE_BUNDLE=$HOME/.ssl/zscaler-bundle.pem

# Use Zscaler cert bundle with all language environments
export REQUESTS_CA_BUNDLE=$CERTIFICATE_BUNDLE
export CURL_CA_BUNDLE=$CERTIFICATE_BUNDLE
export NODE_EXTRA_CA_CERTS=$CERTIFICATE_BUNDLE
export NODE_CA_CERTS_ENV_VAR=$CERTIFICATE_BUNDLE
export AWS_CA_BUNDLE=$CERTIFICATE_BUNDLE
export SSL_CERT_FILE=$CERTIFICATE_BUNDLE
