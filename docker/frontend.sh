#!/bin/bash
export NG_CLI_ANALYTICS="false"
if [ -f "/app/angular.json" ]; then
  npm install -g npm
  npm install -g @angular/cli
    cd /app \
      && ng new frontend-app --skip-git --style=scss --ssr=false --directory ./ \
      && ng g environments
fi

cd /app && ng build
rm -rf /app/dist/html/*
cp -R /app/dist/frontend-app/browser/* /app/dist/html
chown -R node:node /app
