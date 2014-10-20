Docker Update Check
===================

Running a server means you have to keep up with bug fixes and security
updates. Using tools like `apt`, Linux distributions offer more or less
convenient mechanisms to apply those updates - as long as your services
aren't running in containers. Containerized services make it harder to
check what needs updating and require a different workflow for updating
software packages.

This package provides a proof-of-concept implementation for Ubuntu that
helps you to figure out which of your running containers need updating.
You can then rebuild the affected Docker images and redeploy your
containers.


How Does It Work?
-----------------

The idea is pretty simple. In Ubuntu, you can run the
`/usr/lib/update-notifier/apt-check` tool from the `update-notifier-common`
package to see if there are security updates or other updates that need
to be installed. To achieve this, `apt-check` compares the list of
installed packages found in the `/var/lib/dpkg/status` file with package
lists from `/var/lib/apt/lists/`. Package management tools keep the status
file up to date automatically, but you have to run `apt-get update`
regularly to keep the package lists current.

Checking whether a given container X has all the latest and greatest
packages installed, we can do the following:

  * Run a temporary container Y with current package lists.
  * Extract the status file from X and copy it to Y.
  * Run the `apt-check` tool on Y using X's status file.
  * Destroy Y and repeat for each container we want to check.

Since Y is a temporary container, we don't want to run `apt-get update`
each time we create it so we keep its `/var/lib/apt/` directory inside
a data-only container Z and mount it as a volume. Y gets the host's Docker
socket in `/var/run/docker.sock` mounted as a volume to give it access to
any container X's filesystem.


How Do I Use It?
----------------

First of all, build the Docker images by running `make`.

Next, create the data-only security repo container that will hold the
package lists:

    update-check run

Run a cron job regularly that updates those apt package lists:

    update-check update

To get an update report from a given list of containers, run the `check`
command:

    update-check check CONTAINER-ID...

Note that only Ubuntu-based containers are supported at this point.
