FROM octoprint/octoprint:latest

# allow octoprint to start, even whithout printer connected
RUN echo "#!/usr/bin/execlineb -P\nmknod /dev/ttyAMA0 c 188 0" >> /etc/cont-init.d/init-usb-device
