# Starting template:
#global my_count = 0;
#global local_subnets: set[subnet] = { };
#global inside_networks: set[addr];
#global outside_networks: set[addr];
#
#event new_connection(c: connection)
#{
#    # Increment counter…
#    if ( my_count <= 10 ) {
#        print fmt("The connection %s from %s on port %s to %s on port %s started at %s.", c$uid, c$id$orig_h, c$id$orig_p, c$id$resp_h, c$id$resp_p, strftime("%D %H:%M", c$start_time));
#    }
#    # check orig_h versus local_subnets
#    # add accordingly to inside or outside
#    # check resp_h versus local_subnets
#    # add accordingly to inside or outside
#}
#
#event connection_state_remove(c: connection)
#{
#
#}
#
#event bro_done()
#{
#    print "These IPs are considered local";
#    # print ips here
#    print "These IPs are considered external";
#    # print ips here
#}

# Exercise:
# To solve this Test use exercise_traffic.pcap and consider the following subnets as local:
#192.168.1.0/24
#192.68.2.0/24
#172.16.0.0/20
#172.16.16.0/20
#172.16.32.0/20                
#172.16.48.0/20

# Write a script based on the above template that does the following:
#    Finds the first 10 new connections source IP and port, destinations IP and port, connection ID, time when the connection started.
#    Counts all connections seen and prints the total in the end.
#    Prints out (for) each unique IP address if it is local or external

global my_count = 0;
global local_subnets: set[subnet] = { 	192.168.1.0/24,
					                    192.68.2.0/24,
					                    172.16.0.0/20,
					                    172.16.16.0/20,
					                    172.16.32.0/20,
					                    172.16.48.0/20 };
global inside_networks: set[addr];
global outside_networks: set[addr];

event new_connection(c: connection)
{
    # Increment counter…
    ++my_count;
    if ( my_count <= 10 ) {
        print fmt("The connection %s from %s on port %s to %s on port %s started at %s.", c$uid, c$id$orig_h, c$id$orig_p, c$id$resp_h, c$id$resp_p, strftime("%D %H:%M", c$start_time));
    }
    # check orig_h versus local_subnets
    # add accordingly to inside or outside
    if ( c$id$orig_h in local_subnets ) {
        add inside_networks[c$id$orig_h];
    }

    # check resp_h versus local_subnets
    # add accordingly to inside or outside
    if ( c$id$resp_h !in local_subnets ) {
        add outside_networks[c$id$resp_h];
    }
}

event connection_state_remove(c: connection)
{

}

event bro_done()
{
    print "These IPs are considered local";
    for ( ip in inside_networks ) {
        print ip;
    }
    print "These IPs are considered external";
    for ( ip in outside_networks ) {
        print ip;
    }
}

