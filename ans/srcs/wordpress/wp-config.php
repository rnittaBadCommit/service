<?php
define( 'DB_NAME', 'services' );
define( 'DB_USER', 'user42' );
define( 'DB_PASSWORD', 'user42' );
/** MySQL hostname */  # 名前解決。mysql.yamlのserviceのname。CLSUTER-IPだと思う。EXTERNAL-IPじゃないよね
define( 'DB_HOST', 'mysql' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/** Authentication Unique Keys and Salts. */
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

// WordPress Database Table prefix.
$table_prefix = 'wp_';

// For developers: WordPress debugging mode.
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';