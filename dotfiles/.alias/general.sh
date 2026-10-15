# General aliases
function code() {
  open "$@" -a "Visual Studio Code"
}
function kiro() {
  open "$@" -a "Kiro"
}
alias btpair='blueutil --pair 20-18-05-08-16-18 0000'
alias new-pswd='openssl rand -base64 16'
alias date='gdate'
#alias date='gdate'
alias drone-queue='drone queue ls --format "item:{{ .ID }} // Status:{{ .Status }} // Machine:{{ .Machine }} // PipelineName:{{ .Name }}"'
function c-test() {
    gcc "${1}" -o /tmp/testbuild ;
    /tmp/testbuild ;
    rm /tmp/testbuild ;
}
alias meal='node ~/git/personal/meal-planner'
alias names="node ~/random-name-picker"
function unquarantine() {
  xattr -d com.apple.quarantine "${1}"
}
function pangps() {
  launchctl "${1}" /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
}
alias quentin=kiro-cli
alias hometime='node ~/timeCalc $(date | cut -d " " -f 5 | cut -d ":" -f 1,2)'