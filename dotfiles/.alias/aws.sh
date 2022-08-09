#AWS aliases and functions
function getRegistryId() { 
  echo "$(aws ecr describe-registry | jq -r '.registryId').dkr.ecr.eu-west-2.amazonaws.com" 
}
alias ssodvla='aws-azure-login --profile azure'
alias ssokill='unset AWS_PROFILE && unset AWS_ACCESS_KEY_ID && unset AWS_SECRET_ACCESS_KEY && unset AWS_SESSION_TOKEN'
alias ecrlog='aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin "$(getRegistryId)"'
alias awsid='aws sts get-caller-identity'
alias cancel-image='aws imagebuilder cancel-image-creation --image-build-version-arn'
function sp() { 
  export AWS_PROFILE=${1} 
}
function awsWp() {
echo 'wot profiles u got m8?'
python3 <<HEARDOC
import configparser
import os
from rich.console import Console
from rich.table import Column, Table
# parse the config file
path = os.path.join(os.path.expanduser('~'), '.aws/config')
config = configparser.ConfigParser()
config.read(path)
# define the output format
console = Console()
table = Table(show_header=True, header_style="bold magenta")
table.add_column("Profile", width=20)
table.add_column("Role ARN")
# only output roles which can be assumed
for section in sorted(config.sections()):
    if 'role_arn' in config[section]:
        table.add_row(section.replace('profile ',''), config[section]["role_arn"])
# show results
console.print(table)
HEARDOC
}
function bitbucketRefresh() {
REF_ID=$(aws autoscaling start-instance-refresh --auto-scaling-group-name bitbucket-asg | jq -r '.InstanceRefreshId')
watch aws autoscaling describe-instance-refreshes --auto-scaling-group-name bitbucket-asg --instance-refresh-ids "$REF_ID"
}
