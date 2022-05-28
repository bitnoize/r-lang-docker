#!/bin/sh

set -e

if [ "$(id -u)" = "0" ]; then
  if [ -n "$UID" ] && [ ! "$UID" = "$(id dummy -u)" ]; then
    usermod -u "$UID" dummy
  fi

  if [ -n "$GID" ] && [ ! "$GID" = "$(id dummy -g)" ]; then
    groupmod -g "$GID" dummy
  fi

  chown dummy:dummy /home/dummy

  exec gosu dummy "$@"
else
  exec "$@"
fi

