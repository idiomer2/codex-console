#!/bin/bash
set -ex

if [ "$1" = "-d" ]; then
    docker run -d --name="codex-reg-webui" -p 8316:8316 -v ./data:/app/data -e WEBUI_ACCESS_PASSWORD="your_password_when_web_login" codex-reg-webui:latest
else
    docker run --rm --name="codex-reg-webui" -p 8316:8316 -v ./data:/app/data -e WEBUI_ACCESS_PASSWORD="your_password_when_web_login" codex-reg-webui:latest
fi
