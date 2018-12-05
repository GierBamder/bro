# Declaring a variable
# Form:
# {class} {identifier} [':' {type}] ['=' {init}]
#
# {type} may be omitted, privided {init} is specified.
#    * The {type} will be inferred from the {init}
#
#

module KNOWN_HOSTS_EXAMPLE;

export {
    global known_hosts: set[addr];
}

event bro_init()
{
    add known_hosts[127.0.0.1];
    print "bro_init: ", KNOWN_HOSTS_EXAMPLE::known_hosts;
}

event bro_done()
{
    print "Goodbye";
} 
