# Original: https://raw.githubusercontent.com/JustinAzoff/bro-react/master/conn-bulk.bro

@load base/protocols/conn
@load base/protocols/conn/thresholds

module Bulk;

export {
    ## Number of bytes transferred before marking a connection as bulk
    const size_threshold = 102400 &redef;

    ## Raised when a Bulk data channel is detected.
    ##
    ## c: The connection pertaining to the Bulk data channel.
    global connection_detected: event(c: connection);

    ## The initial criteria used to determine whether to start polling
    ## the connection for the :bro:see:`Bulk::size_threshold` to have
    ## been exceeded.
    ## c: The connection which may possibly be a Bulk data channel.
    ##
    ## Returns: true if the connection should be further polled for an
    ##          exceeded :bro:see:`Bulk::size_threshold`, else false.
    const bulk_initial_criteria: function(c: connection): bool &redef;

    type PortRange: record {
        ports:    set[port] &optional;
        port_min: port &default=1/tcp;
        port_max: port &default=65535/tcp;
    };
    const hosts: table[subnet] of PortRange = {[0.0.0.0/0] = PortRange()} &redef;
}

redef record Conn::Info += {
    bulk: bool &optional &default=F;
};

event Bulk::connection_detected(c: connection)
{
	print fmt("connection_detected: %s", c);
}

event ConnThreshold::bytes_threshold_crossed(c: connection, threshold: count, is_orig: bool)
{
	if ( threshold < size_threshold ) {
		return;
	}

	event Bulk::connection_detected(c);
}

function bulk_initial_criteria(c: connection): bool
    {
    local pr: PortRange;

    if(c$id$orig_h in hosts)
        pr = hosts[c$id$orig_h];
    else if(c$id$resp_h in hosts)
        pr = hosts[c$id$resp_h];
    else
        return F;

    if(pr?$ports) {
        return (c$id$resp_p in pr$ports);
    }

    return (pr$port_min <= c$id$resp_p && c$id$resp_p <= pr$port_max);
    }

event new_connection(c: connection) &priority=-3
    {
    if ( bulk_initial_criteria(c) ) {
	ConnThreshold::set_bytes_threshold(c, size_threshold, T);
	ConnThreshold::set_bytes_threshold(c, size_threshold, F);
    }
}

event connection_state_remove(c: connection)
    {
    if(c$conn$bulk)
        return;
    if ( bulk_initial_criteria(c) && (c$orig$size > size_threshold || c$resp$size > size_threshold ))
        c$conn$bulk = T;
    }

event bro_init()
{
    Log::add_filter(Conn::LOG, [
        $name = "conn-bulk",
        $path = "conn_bulk",
        $pred(rec: Conn::Info) = {
            return rec$bulk;
        }
    ]);
}
