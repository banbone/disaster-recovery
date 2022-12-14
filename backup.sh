#! /bin/zsh
HOME="/Users/danieljones"
PATH=$(/usr/local/bin/aws secretsmanager get-secret-value --secret-id mac-term-path | /usr/local/bin/jq -r '.SecretString')
source /Users/danieljones/.zshrc

cd ~/disaster-recovery || exit 1

DATE=$(date "+%Y-%m-%d")

git checkout -b "backup/$DATE"

cp -r ~/.alias/* ./dotfiles/.alias/
cp ~/.docker/config.json ./dotfiles/.docker-config.json
cp ~/.docker/daemon.json ./dotfiles/.docker-daemon.json
cp ~/.vimrc ./dotfiles/.vimrc
grep -v 'DRONE' ~/.zshrc > ./dotfiles/.zshrc
printf "\n# drone credential exports omitted for security - please re-add" >> ./dotfiles/.zshrc
brew list > ./brew-list.txt

touch /tmp/pip-list.txt
for i in $(pip list --format json | jq -c '.[]') ;
do
  package=$(echo "$i" | jq -r '.name') ;
  version=$(echo "$i" | jq -r '.version') ;
  echo "$package@$version" >> /tmp/pip-list.txt ;
done
cp /tmp/pip-list.txt ./pip-list.txt
rm /tmp/pip-list.txt

cp ~/customClusterColumns.txt ./customClusterColumns.txt
cp ~/fixVirtualBox.sh ./fixVirtualBox.sh

touch /tmp/npm-list.txt
npmlist=$(npm ls -g --json | jq -r '.dependencies')
for i in $(echo $npmlist | jq 'keys' | jq -r '.[]') ;
do
  package="$i" ;
  version=$(echo "$npmlist" | jq -r --arg a "$package" '.[$a].version') ;
  echo "$package@$version" >> /tmp/npm-list.txt ;
done
cp /tmp/npm-list.txt ./npm-list.txt
rm /tmp/npm-list.txt

ls ~/.vscode/extensions > ./vscode-extensions-list.txt

base64 "$HOME"/Library/'Application Support'/Google/Chrome/Default/Bookmarks > chrome-bookmarks.encr

echo "# CHANGES UPDATED ON $DATE" >> ./CHANGELOG.md

git add .
changes=$(git status -s)
echo "$changes" >> ./CHANGELOG.md
git add ./CHANGELOG.md
git commit -m "auto-commit - dotfiles backup for $DATE"
git push --set-upstream origin "backup/$DATE"
git checkout master
git merge "backup/$DATE"
git branch --delete "backup/$DATE"
git push

