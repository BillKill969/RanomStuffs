#!/bin/bash
doas mkdir -p /etc/xbps.d
printf "repository=https://github.com/xlibre-void/xlibre/releases/latest/download" | doas tee /etc/xbps.d/99-repository-xlibre.conf
doas xbps-install -S
