# General aliases
function code() {
  open "$@" -a "Visual Studio Code"
}
function yq() {
  docker run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
}
alias btpair='blueutil --pair 20-18-05-08-16-18 0000'
alias new-pswd='openssl rand -base64 16'