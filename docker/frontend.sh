#!/bin/bash
export NG_CLI_ANALYTICS="false"
npm install -g npm
npm install -g @angular/cli
npm install
cd /app && npm install && ng build
chown -R node:node /app
