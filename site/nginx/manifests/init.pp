#
class nginx {

  # PACKAGE
  package { 'nginx':
    ensure => present,
  }

  # DOCROOT
  file { '/var/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # WEB PAGE
  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nginx/index.html',
  }

  # CONFIG FILES
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
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
