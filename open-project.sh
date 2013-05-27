#!/usr/bin/env bash

SOURCE=static/index.html

k ${SOURCE}
chromium-browser ${SOURCE}
