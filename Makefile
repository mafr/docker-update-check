#
# Build Docker images and tag them.
#

build:
	$(MAKE) -C ubuntu-security-repo 
	$(MAKE) -C ubuntu-security-check
