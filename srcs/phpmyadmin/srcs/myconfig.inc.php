<?php

/**
* This is needed for cookie based authentication to encrypt password in
* cookie. Needs to be 32 chars long.
*/
$cfg['blowfish_secret'] = 'A69LP5aQpeNNESfUZnm6a8DH9nAHt5V5'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/**
* Servers configuration
*/
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql'; # 名前解決。mysql.yamlのserviceのname。podのIP(192.168.10.10)が入る。
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

/**
* phpMyAdmin configuration storage settings.
*/
$cfg['PmaAbsoluteUri'] = 'http://pma-service:5000';

/* User used to manipulate with storage */
// $cfg['Servers'][$i]['controlhost'] = '';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['controluser'] = 'user42'; #mysql start.shに依存
$cfg['Servers'][$i]['controlpass'] = 'user42';

/**
* Directories for saving/loading files from server
*/
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
