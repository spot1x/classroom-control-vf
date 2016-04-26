1 class skeleton { 
2   file { '/etc/skel': 
3     ensure => directory,
      owner => 'root'
      group => 'root'
      mode =>'0755',
4     } 
5   file {/etc/skel/.bashrc':
    ensure =>  file,
    owner => 'root',
    group => 'root',
    mode =>'0644',
    source => 'puppet://modules/skeleton/bashrc',
    }
} 

