postinstall scriptlet (using /bin/sh):
#!/bin/bash
# HHVM after install script.

# Create hhvm logs folder
if [ ! -d "/var/log/hhvm" ]; then
  mkdir /var/log/hhvm
fi
chown nginx:nginx /var/log/hhvm/

# Create hhvm run folder
if [ ! -d "/var/run/hhvm" ]; then
  mkdir /var/run/hhvm
fi
chown nginx:nginx /var/run/hhvm

# Add HHVM to service
chkconfig --add hhvm
chkconfig hhvm on

# Start HHVM
systemctl start hhvm
