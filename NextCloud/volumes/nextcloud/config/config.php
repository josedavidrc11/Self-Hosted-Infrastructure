<?php

/*
 * WARNING
 *
 * This file gets modified by automatic processes and all lines that are not
 * active code (ie. comments) are lost during that process.
 *
 * If you want to document things with comments or use constants add your settings
 * in a '<NAME>.config.php' file which will be included and rendered into this file.
 *
 * Example:
 *   <?php
 *   $CONFIG = [];
 *
 * See also: https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/config_sample_php_parameters.html#multiple-merged-configuration-files
 */
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => 
  array (
    'host' => 'Redis',
    'password' => '',
    'port' => 6379,
  ),
  'upgrade.disable-web' => true,
  'passwordsalt' => '',
  'secret' => '',
  'trusted_domains' => 
  array (
    0 => 'localhost',
    1 => 'drive.example.com',
  ),
  'trusted_proxies' => 
  array (
    0 => '172.18.0.0/16',
  ),
  'overwrite.cli.url' => 'https://drive.example.com',
  'overwriteprotocol' => 'https',
  'forwarded_for_headers' => 
  array (
    0 => 'HTTP_X_FORWARDED_FOR',
  ),
  'maintenance_window_start' => 1,
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '35.0.2.2',
  'dbname' => 'DB',
  'dbhost' => 'MySQL',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'clubor',
  'dbpassword' => '',
  'installed' => true,
  'instanceid' => 'ocmaz3613gtl',
  'defaultapp' => '',
  'mail_smtpmode' => 'smtp',
  'mail_sendmailmode' => 'smtp',
  'mail_smtphost' => 'mailserver.example.com',
  'default_phone_region' => 'ES',
  'twofactor_enforced' => 'false',
  'twofactor_enforced_groups' => 
  array (
  ),
  'twofactor_enforced_excluded_groups' => 
  array (
  ),
  'maintenance' => false,
  'loglevel' => 3,
  'mail_smtpauth' => true,
  'mail_smtpname' => 'noreply@example.com',
  'mail_smtppassword' => '',
  'config_preset' => 1,
  'mail_smtpsecure' => 'ssl',
  'mail_smtpport' => '465',
  'mail_from_address' => 'noreply',
  'mail_domain' => 'example.com',
  'app_install_overwrite' => 
  array (
  ),
);
