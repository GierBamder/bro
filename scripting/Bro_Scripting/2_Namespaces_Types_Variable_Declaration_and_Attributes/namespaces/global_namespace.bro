module KNOWN_HOSTS_TEST_A;

export {
    global known_hosts: set[addr];
}


function test_global() 
{
    print "test_global - known_hosts: ", KNOWN_HOSTS_TEST_A::known_hosts;
}


event bro_init()
{
    add known_hosts[127.0.0.1];
    test_global();
    print "bro_init known_hosts: ", known_hosts;
}

