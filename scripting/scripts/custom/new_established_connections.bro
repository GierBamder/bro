# Displays newly established connections and the time since the last one.
# 
# 2018/04/10 06:59:15: New connection established from 192.168.1.104 to 65.55.184.16
#    Time since last connection: 1258535653.085939
    
    
# Store the time the previous connection was established.
global last_connection_time: time;

# boolean value to indicate whether we have seen a previous connection.
global connection_seen: bool = F;

event connection_established(c: connection)
{
    local net_time: time = network_time();

    print fmt("%s: New connection established from %s to %s", strftime("%Y/%M/%d %H:%m:%S", net_time), c$id$orig_h, c$id$resp_h);

    if ( connection_seen ) {
        print fmt("    Time since last connection: %s", net_time = last_connection_time);
    }

    last_connection_time = net_time;
    connection_seen = T;
}
