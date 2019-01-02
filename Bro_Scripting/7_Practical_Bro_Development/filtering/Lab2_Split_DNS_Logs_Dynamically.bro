#Write a script using the following criteria:

#1. Run against exercise_traffic.pcap
#2. Filter the dns.log
#3. Remove the default log filter
#4. Add a new filter
#5. Only include the timestamp, query and origination host IP
#6. Add a path_func that does the following
#	Writes NetBIOS requests to “dns-netbios”
#	Writes everything else to “dns-minimal"

#Reference

#Bro represents a NetBIOS query with the qtype_name of “NB” in the DNS.log.

function my_pathfunc(id: Log::ID, path: string, rec: DNS::Info) : string  # Add a path_func that does the following
{
	if ( rec?$qtype_name && rec$qtype_name == "NB" ) {
		return "dns-netbios";  # Writes NetBIOS requests to “dns-netbios”
	}

	return "dns-minimal";  # Writes everything else to “dns-minimal"
}


event bro_init()
{
	Log::remove_default_filter(DNS::LOG); # Remove the default log filter
	Log::add_filter(DNS::LOG, [$name="new-default",  # Add a new filter
                                   $include=set("ts", "id.orig_h", "query"), # Only include the timestamp, query and orig host IP
                                   $path_func=my_pathfunc]);
}
