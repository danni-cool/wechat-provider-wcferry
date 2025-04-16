#!/bin/sh

if [ -f /var/run/xrdp.pid ]; then
  rm /var/run/xrdp.pid
fi

/usr/sbin/xrdp

if [ -f /var/run/xrdp-sesman.pid ]; then
  rm /var/run/xrdp-sesman.pid
fi

/usr/sbin/xrdp-sesman

# 启动VNC服务器
vncserver :1 -geometry 1024x768 -depth 24 -localhost no -SecurityTypes None &

# 启动noVNC
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080 &

# Necesssary for docker
exec "$@"
