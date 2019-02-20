#!/bin/bash

service nginx start
certbot --nginx --email acristoffers@gmail.com --agree-tos -d acristoffers.me --non-interactive
service nginx reload
tail -f /dev/null
