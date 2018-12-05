event bro_init()
{
    local a: interval = 15min;
    print a;
    
    a = a + 30sec;
    print a;
    
    local p: port = 53/udp; #don't have to specify port. bro knows.
    print p;
    
    local ip: addr = 10.0.0.1; #don't have to specify addr. bro knows.
    print ip;
    
    local sn: subnet = 192.168.0.1/24;
    print sn;
    
    print "Is 192.168.1.1 in sn?", 192.168.1.1 in sn;
    print "Is 192.168.0.200 in sn?", 192.168.0.200 in sn;
    
    local rx = /__[[:alnum:]]{4}__/; #Two underscores followed by 4 alphanumerics followed by two underscores
    print rx;
    
    print "Is __ASDF__ in rx", rx in "__ASDF__";
    print "Is __1234__ in rx", rx in "__1234__";
    print "Is __A__ in rx", rx in "__A__";
}

