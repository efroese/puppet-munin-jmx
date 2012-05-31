#
# = Define munin-jmx::plugin
# Configure munin to monitor some JMX information
#
# == Parameters
#
# $conf_template:: A template to render the munin config file for the plugin
#
# $conf_source:: The source for the munin config file for the plugin
#
define munin-jmx::plugin (
    $conf_template = '',
    $conf_source = ''){

    if $conf_source == '' and $conf_template == '' {
        fail("Please pass either the conf_template or conf_source parameter.")
    }

    if $conf_source != '' and $conf_template != '' {
        fail("Please pass either the conf_template or conf_source parameter. NOT BOTH!")
    }

    file { "/etc/munin/plugins/jmx_${name}":
        ensure => "/usr/share/munin/plugins/jmx_",
    }

    if $conf_template != '' {
        file { "/usr/share/munin/plugins/jmx_${name}":
            owner => root,
            group => root,
            mode => 0755,
            content => template($conf_template),
        }
    }

    if $conf_source != '' {
        file { "/usr/share/munin/plugins/jmx_${name}":
            owner => root,
            group => root,
            mode => 0755,
            source => $conf_source,
        }
    }

    file { "/etc/munin/plugins/jmx_${name}":
        ensure => link,
        target => '/usr/share/munin/plugins/jmx_',
    }
}
