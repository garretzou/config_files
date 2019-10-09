#!/bin/sh

repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u 'garretzou' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
