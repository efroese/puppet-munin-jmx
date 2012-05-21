## Introduction
A puppet module to configure Munin graphing JMX applications

## Requirements 
https://github.com/efroese/puppet-icinga
https://github.com/efroese/puppet-munin

Based on the nagios/munin plugins for JMX applications from
https://github.com/tcurdt/nagios-check-jmx

## Example:

    node 'somejavanode' {
    
        class { 'tomcat6': }
    
        class { munin::client: }
    
        munin-jmx { 'catalina_requests':
            $conf_source => 'puppet:///modules/munin-jmx/tomcat/catalina_requests.conf.erb'
        }
    }