#! /bin/sh
working_dir=$(pwd)
cd ~ || exit 1
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm "AWSCLIV2.pkg"
cd "$working_dir" || exit 1