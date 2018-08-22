roundcube-docker
================

Installs roundcube 1.3.7 inside a docker container.

The installation may be used on your server, but also as a standalone
IMAP client (if you skip the step 1. below).

Steps:

  1. Customize `roundcube/config.inc.php`. If the file is unmodified,
Roundcube will show a generic login page where the user can
specify IMAP server.
  2. Launch `sudo ./start.sh` to create roundcube image and start
it with port forwarding at 127.0.0.1:8081. You may use LISTEN and PORT env.
variables to change the default listening address and port.
  3. Update your web server to proxy connections.

The SQLite database for contacts, settings, etc. is kept
in `/rc` inside roundcube-data container. Even if you delete
roundcube container, the database will persist in it.
