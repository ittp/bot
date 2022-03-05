#!/bin/env bash

run() {
    local RUN_CMD="${1}"
    case "${RUN_CMD}" in
        (message|file) bot_"${@}" ;;
        (*) command bot "${@}" ;;
    esac
}

bot() {
  local action=$1
  echo "bot.action.$1"
  #cat ./action.$1.yaml
}
