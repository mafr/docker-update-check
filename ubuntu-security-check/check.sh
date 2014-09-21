#! /bin/sh

# Overwrite our own dpkg status file. This doesn't matter because our
# container gets destroyed right afterwards anyway.
docker cp "$CONTAINER_TO_CHECK:/var/lib/dpkg/status" /var/lib/dpkg/

/usr/lib/update-notifier/apt-check --human-readable
