#Enter file class memcached {

class memcached {

#package
package {'memcached':
ensure => present,
  }

#file
file {'/etc/sysconfig/memcached':
ensure => file,
owner => 'root',
group => 'root',
mode => '0644',
source => 'puppet:///modules/memcached/memcached',
require => Package['memcached'],
notify => Service['memcached'],
  }

#Service
service {'memcached':
ensure => running,
enable => true,

  }
}
