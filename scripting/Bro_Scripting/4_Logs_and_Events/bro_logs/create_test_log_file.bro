# Paste this into try.bro.org and select http PCAP, or run 'bro -r basics.bro http.pcap'

module TEST;

export {
    redef enum Log::ID += { LOG }; # TEST::LOG
    
    type Info: record {
        ## Timestamp
        ts:            time        &log;
        
        ## Unique ID for the connection
        uid:           string      &log;

        ## The connection's 4-tuple of endpoing addresses/ports
        id:            conn_id     &log;

        ## Elapsed time of the connection
        elapsed:       interval    &log &optional;

        ## Connection started
        conn_start:    time;
    };
        global log_test: event(rec: Info);
}

redef record connection += {
        test:    TEST::Info &optional;
};

event bro_init()
{
        Log::create_stream(TEST::LOG, [$columns=Info, $ev=log_test, $path="test"]);
}

# Fires when a new connection is added to the internal tracking of bro
event new_connection(c: connection)
{
	if ( ! c?$test ) {
		local info: TEST::Info;
		info$ts = network_time();
		info$uid = c$uid;
		info$id = c$id;
		info$conn_start = network_time();

		c$test = info;
	}    
}

# Fires when the connection is removed from the internal tracking of bro
event connection_state_remove(c: connection) &priority=-5
{
	if ( ! c?$test ) {
		return;
	}

	c$test$elapsed = network_time() - c$test$conn_start;
	Log::write(TEST::LOG, c$test);
}

