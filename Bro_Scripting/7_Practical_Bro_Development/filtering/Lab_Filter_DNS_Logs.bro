#Write a script using the following criteria:
#
#1. Run against exercise_traffic.pcap
#2. Filter the dns.log
#3. Remove the default log filter
#4. Add a new filter
#5. Only include the timestamp, query and origination host IP

event bro_init()
{
	Log::remove_default_filter(DNS::LOG); # Remove the default log filter
	Log::add_filter(DNS::LOG, [$name="new-default",  # Add a new filter
                                   $include=set("ts", "id.orig_h", "query")]); # Only include the timestamp, query and orig host IP
}
