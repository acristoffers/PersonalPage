#!/bin/bash

certbot --nginx --email acristoffers@gmail.com --agree-tos -d acristoffers.me --non-interactive
/usr/bin/python3 -u /sbin/my_init
