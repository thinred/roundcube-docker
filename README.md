roundcube-docker
================

Installs roundcube 1.0 inside a docker container.

Steps:

  1. Please run `gen-key.sh` to generate a random key
for your roundcube installation. 
  2. Customize `roundcube/config.inc.php`.
  3. Launch `./start.sh` to create roundcube-1.0 image and start
it with port forwarding at 127.0.0.1:8081. You may use PORT env.
variable to change the default port.
  4. Update your web server to proxy connections.

TODO
-------

Probably the SQLite database should be stored in a data-only
container to ease transitions to newer versions.
