#Spinnaker aliases
function spinid() { 
  aws secretsmanager get-secret-value \
    --secret-id "Spinnaker-API-key-spinnaker-${1}-tooling.dvla.gov.uk" \
    --region eu-west-2 \
    | grep SecretBinary \
    | sed 's/.*:."//' \
    | sed 's/"\,//' \
    | base64 -D \
    > /tmp/spinconfig 
}
alias spinapps='spin --insecure --config /tmp/spinconfig app list | jq -r ".[].name"'