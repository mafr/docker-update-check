Docker Security Check
=====================

There are two images with different tasks. The ubuntu-security-repo is
instantiated once and is responsible for keeping itself updated with
the latest package indices from Ubuntu  by running "apt-get update"
regularly. The container makes the indices in its /var/lib/apt/ directory
available as a volume.

The ubuntu-security-check image mounts the /var/lib/apt/ volume and the
Docker host's unix domain socket in /var/run/docker.sock. This means
the security check has access to both the current apt indices and all
running containers, including files from their filesystems. It downloads
the list of installed packages from /var/lib/dpkg/status and checks
whether any of them needs updating.
