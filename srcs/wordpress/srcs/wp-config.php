<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'admin42' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin42' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'K#zQT?*BCalgh~JdCpo-Ag>QcqS^M/v71<!<3q%im_kW1q-iU}NfHA1nO:y^2Fnt' );
define( 'SECURE_AUTH_KEY',  'nt^^[ADNJ*efw`k9w0&>>Uy<+C`*6`MG=R&?nOTOjH6!W+T&b<e$Up-RB:JUW**!' );
define( 'LOGGED_IN_KEY',    '@>QC)oUxVeV<{ubi,iSTrG]v`OO5D?b-m}62IWfj4adszH#W?&8a7A$bRUzKKyXy' );
define( 'NONCE_KEY',        'hqN8[#AKXZ0mX)g/#?B&CC:9&%Bq/7D+l.!b0JrJ&$IBO:ev6?IcmfSB/s,5AANh' );
define( 'AUTH_SALT',        'brz=noC(.MN2p/R=?36`P|J7XR]TSxYegz>WW{lgF/b}ikMp.)Y5FF* Zttd/mL`' );
define( 'SECURE_AUTH_SALT', 'a@|]&QqhWL!!d5#5D7N9{vP!hD;5ku?wJ]bu{=m;)za%H<U/[WT]@yOa5ATRR3CM' );
define( 'LOGGED_IN_SALT',   '2v!xns&TBXjR_weN?NQcbC]O^pCfV][*pcC K5d+Ab6U.{5XP&)gT fH>HAAm9<{' );
define( 'NONCE_SALT',       '*+kZ>lQ*mr@z]uf!ol=)2DVsEM+GiRM#HRtL3srO-=N&-TFYvJht@,Da$_nFS`O+' );
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';