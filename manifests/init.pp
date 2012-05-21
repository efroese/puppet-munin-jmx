#
#
#
class munin-jmx { 

    file { '/usr/share/munin/plugins/jmx_':
        owner => root,
        group => root,
        mode  => 0755,
        source => 'puppet:///modules/munin-jmx/jmx_',
    }

    file { '/usr/share/munin/plugins/jmxquery.jar':
        owner => root,
        group => root,
        mode  => 0755,
        source => 'puppet:///modules/munin-jmx/jmxquery.jar',
    }

}