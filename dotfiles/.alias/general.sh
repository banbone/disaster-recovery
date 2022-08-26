# General aliases
function code() {
  open "$@" -a "Visual Studio Code"
}
alias btpair='blueutil --pair 20-18-05-08-16-18 0000'
alias new-pswd='openssl rand -base64 16'alias date='gdate'
alias date='gdate'
alias drone-queue='drone queue ls --format "item:{{ .ID }} // Status:{{ .Status }} // Machine:{{ .Machine }} // PipelineName:{{ .Name }}"'
