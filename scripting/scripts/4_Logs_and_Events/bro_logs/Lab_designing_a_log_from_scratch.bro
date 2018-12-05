# LAB - Designing a Log from Scratch
# For this lab, you will use your accumulated knowledge of logs and records to write a log file from scratch.
# Use the following event in your script:

#event http_message_done(c: connection, is_orig: bool, stat: http_message_stat)
#
#{
#
#    if ( c?$http && c$http?$uri ) {
#
#        // do something with c$http$uri
#
#    }
#
#}

# Exercise:
#    Name the module S951.
#    Declare the event bro_init() event handler.
#    Declare a new exported record type Info containing the fundamental record entries: timestamp, id and uid. Add to it another record entry that is a string called “uri”.
#    Declare the Log::ID in the export block for this module.
#    Declare the logging event handler for this module in the export block as a global.
#    Create the log file stream in bro_init() and make sure the path is “S951”
#    Use the event handler show above as the basis for populating your newly defined record and log the resulting Info record after it has been populated. Note: you should populate the id and uid from the connection record in http_message_done (i.e. c$id and c$uid)
#    Use exercise_traffic.pcap and trybro.eppert.co to verify your work. The originating HTTP log available within trybro should demonstrate the possible URI entries you should see.

module S951;

export {
	redef enum Log::ID += { LOG };

	type Info: record {
		ts:	time	&log;
		uid:	string	&log;
		id:	conn_id	&log;
		uri:	string	&log &optional;
	};
	global S951: event(rec: Info);
}

event bro_init()
{
	Log::create_stream(S951::LOG, [$columns=Info, $path="S951"]);	
}

event http_message_done(c: connection, is_orig: bool, stat: http_message_stat)
{
    if ( c?$http && c$http?$uri ) {
	local info: Info;

	info$ts = network_time();
	info$uid = c$uid;
	info$id = c$id;
	info$uri = c$http$uri;

	Log::write(S951::LOG, info);
    }
}
