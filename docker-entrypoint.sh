#!/bin/sh

set -e

if [ "$(id -u)" = "0" ]; then
  if [ -n "$UID" ] && [ ! "$UID" = "$(id krusty -u)" ]; then
    usermod -u "$UID" krusty
  fi

  if [ -n "$GID" ] && [ ! "$GID" = "$(id krusty -g)" ]; then
    groupmod -g "$GID" krusty
  fi

  chown krusty:krusty /home/krusty

  exec gosu krusty "$@"
else
  exec "$@"
fi

