roundcube-docker
================

Installs roundcube 1.0 inside a docker container.

Steps:

  1. Customize `roundcube/config.inc.php`.
  2. Launch `sudo ./start.sh` to create roundcube-1.0 image and start
it with port forwarding at 127.0.0.1:8081. You may use PORT env.
variable to change the default port.
  3. Update your web server to proxy connections.

The SQLite database for contacts, settings, etc. is kept
in `/rc` inside roundcube-data container. Even if you delete
roundcube container, the database will persist in it.
