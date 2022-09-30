#!/usr/bin/env bash
set -e

plugin_base_path='./.vim/pack/bundle/start'

check_submodules() {
  installed=false
  git_submdules=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')
  for submodule in $git_submdules; do
    if [[ "./$submodule" == "$1" ]]; then
      installed=true
    fi
  done
  echo $installed
}

case $1 in
i | install)
  url="$2"
  if [[ -z "$url" ]]; then
    echo "provide an url as second parameter"
    exit 1
  fi

  name=$(echo "$url" | awk -F/ '{print $NF}' | sed 's/.git//')
  plugin_path="./.vim/pack/bundle/start/$name"

  if [[ $(check_submodules "$plugin_path") == "true" ]]; then
    echo "git submodule '$plugin_path' already added"
    exit 1
  fi

  git submodule add "$url" "$plugin_path"
  # git commit --message "[vim] added '$name' plugin"
  ;;
u | uninstall)
  name="$2"
  plugin_path="$plugin_base_path/$name"

  if [[ ! -d "$plugin_path" ]]; then
    echo "directory '$plugin_path' does not exsits"
    exit 127
  fi

  if [[ $(check_submodules "$plugin_path") == "false" ]]; then
    echo "no git submodule '$plugin_path' found"
    exit 127
  fi

  git submodule deinit -f -- "$plugin_path"
  rm -rf "./.git/modules/.vim/pack/bundle/start/$name"
  git rm -f "$plugin_path"
  # git commit --message "[vim] removed '$name' plugin"
  ;;
l | list)
  printf 'Installed plugins:\n\n'
  for plugin in "$plugin_base_path"/*; do
    plugin_name=$(echo "$plugin" | awk -F/ '{print $NF}')
    printf '  * %s\n' "${plugin_name}"
  done
  ;;
esac
