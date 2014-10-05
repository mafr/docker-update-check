Docker Security Check
=====================

The idea is pretty simple. In Ubuntu, you can run the
/usr/lib/update-notifier/apt-check tool from the update-notifier-common
package to see if there are security updates or other updates that need
to be installed. To achieve this, the apt-check tool compares the list of
installed packages found in the /var/lib/dpkg/status file with package
lists from /var/lib/apt/lists/. Package management tools keep the status
file up to date automatically, but you have to run "apt-get update"
regularly to keep the package lists current.

Checking whether a given container X has all the latest and greatest
packages installed, you can do the following:

  * Run a temporary Ubuntu container Y with current package lists.
  * Extract the status file from X and copy it to Y
  * Run the apt-check tool on Y using X's status file.
  * Destroy Y and repeat.

Since Y is a temporary container, we don't want to run "apt-get update"
each time we create it so we keep its /var/lib/apt/ directory inside
a data-only container Z and mount it as a volume. Y runs "apt-get update"
only if the package lists are too old. Y gets the host's Docker socket in
/var/run/docker.sock mounted as a volume to give it access to any
container X's filesystem.


How Do I Set It Up?
-------------------

Run a cron job regularly that updates the apt package lists inside the
security repo container.
