#
class nginx {

$docroot = '/var/www'


File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    }

  # PACKAGE
  package { 'nginx':
    ensure => present,
  }

  # DOCROOT
  file { $docroot:
    ensure => directory,
  }

  # WEB PAGE
  file { '/var/www/index.html':
    source => 'puppet:///modules/nginx/index.html',
  }

  # CONFIG FILES
  file { '/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/etc/nginx/conf.d/default.conf':
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # SERVICE
  service { 'nginx':
    ensure => running,
    enable => true,
  }

}
