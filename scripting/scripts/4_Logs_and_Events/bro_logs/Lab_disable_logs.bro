# Syntax for disabling logs
#event bro_init() { Log::disable_stream(Log::ID) }

# Log::ID is generally the first entry in an export block in an analyzer script
# -SSH::LOG
# -HTTP::LOG
# -Syslog::LOG
# -etc.


# For this lab, you will use your accumulated knowledge of disabling logs, attributes and sets to put together a script declaring logs that should not be written by Bro.
#
# Exercise
#
#    Declare the event bro_init() event handler.
#    Declare an export {} block with a constant set ignore_logs, consisting of Log::IDs consisting of DHCP::LOG and HTTP::LOG initially. Ignore_logs should use the redefinable attribute.
#    From bro_init() enumerate ignore_logs and disable the streams accordingly.
#    Verify the results at trybro or local using PCAP. 

export {
	const ignore_logs: set[Log::ID] = { DHCP::LOG, HTTP::LOG } &redef;
}

event bro_init()
{
	for ( il in ignore_logs ) {
		Log::disable_stream(il);
	}
}
