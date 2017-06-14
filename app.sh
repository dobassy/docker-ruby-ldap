#!/bin/bash

echo '[INFO] Exec bundle install ------------->'
bundle install --path vendor/bundle

echo '[INFO] Exec rails s with port 3000 ----->'
bundle exec rails s -b 0.0.0.0 -p 3000
