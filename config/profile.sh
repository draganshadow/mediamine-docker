#!/bin/sh
curl -s https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | sudo tee /etc/apt/sources.list.d/blackfire.list
apt-get update
apt-get install blackfire-agent

sed -i 's/server-id=/server-id=7eee88e3-8a41-47c9-b98f-8eaf0c4d1bed/g' /etc/blackfire/agent
sed -i 's/server-token=/server-token=a02bf8f29a02dd358f48128d62b2390e7c3a3ceda56461a589c0cb0b2765b748/g' /etc/blackfire/agent
/etc/init.d/blackfire-agent start

echo "[blackfire]
;
; This is a configuration file for Blackfire.
;
;
; setting: agent-socket
; desc   : Sets the agent socket (unix:///path/to/blackfire/agent.sock or tcp://127.0.0.1:8307)
; default: unix:///var/run/blackfire/agent.sock
agent-socket=unix:///var/run/blackfire/agent.sock
;
; setting: ca-cert
; desc   : Sets the PEM encoded certificates to use
; default:
ca-cert=
;
; setting: client-id
; desc   : Sets the Client ID used for API authentication
; default:
client-id=4f8dd7b0-928a-4cca-93bd-937fcd1653e5
;
; setting: client-token
; desc   : Sets the Client Token used for API authentication
; default:
client-token=fbc7286f8f45f86789c0edb455d438f150dae2b348ac0e0530aac721c7f13d7b
;
; setting: endpoint
; desc   : Sets the API endpoint
; default: https://blackfire.io
endpoint=https://blackfire.io
;
; setting: timeout
; desc   : Sets the Blackfire API connection timeout
; default: 15s
timeout=15s
"  | sudo tee /root/.blackfire.ini

apt-get install blackfire-php

sv restart fpm
sv restart nginx