#!/bin/bash

if [ "$AUTOINDEX" = "off" ] ; then
	sed -i -e "s/autoindex on;/autoindex off;/g" /etc/nginx/sites-available/wordpress.conf
fi
