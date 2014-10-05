#! /bin/bash

# Exit the script in case anything goes wrong.
set -o errexit -o pipefail -o nounset

# Make sure all required variables are set.
: ${BASEDIR=$(dirname $0)}
: ${CONTAINER_TO_CHECK:?}
: ${APT_CONFIG=$BASEDIR/apt.conf}

# Extract list of installed packages from another container.
docker cp "$CONTAINER_TO_CHECK:/var/lib/dpkg/status" /tmp/

export APT_CONFIG
/usr/lib/update-notifier/apt-check --human-readable
