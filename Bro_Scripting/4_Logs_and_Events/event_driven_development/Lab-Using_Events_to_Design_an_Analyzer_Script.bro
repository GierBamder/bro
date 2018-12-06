# For this lab, you will use your accumulated knowledge of logs, records and fundamental types to write a new protocol analyzer script for ARP.
#
# The following events should be used:
#
# event arp_request(mac_src: string, mac_dst: string, SPA: addr, SHA: string, TPA: addr, THA: string)
#
# event arp_reply(mac_src: string, mac_dst: string, SPA: addr, SHA: string, TPA: addr, THA: string)
#
# event bad_arp(SPA: addr, SHA: string, TPA: addr, THA: string, explanation: string)
#
# Example template:
#
#module NEW_ARP;
#export {
#        redef enum Log::ID += { LOG };
#        type Info: record {
#            …
#             arp_msg:   string &log &optional;
#             …
#        };
#        global log_new_arp: event(rec: Info);
#}
#
#event bro_init() &priority=5
#{
#        Log::create_stream(NEW_ARP::LOG, [$columns=Info, $ev=log_new_arp]);
#}
#
# Remember for the required record should use &optional attributes where appropriate for fields.
#
# Exercise
#    Implement all the event handlers
#    Make sure to assign the message “type” to arp_msg – e.g. “reply”, “request”, etc.
#    Verify implementation via trybro.eppert.co and exercise_traffic.pcap


module NEW_ARP;

export {
        redef enum Log::ID += { LOG };
        type Info: record {
		ts:	     time &log;
		## Message Type
		arp_msg:     string &log &optional;
		## The requestor's MAC address
		src_mac:     string &log &optional;
		## The responder's MAC address
		dst_mac:     string &log &optional;
		## Source Protocol Address
		SPA:         addr &log &optional;
		## Source Hardware Address
		SHA:         string &log &optional;
		## Target Protocol Address
		TPA:         addr &log &optional;
		## Target Hardware Address
		THA:         string &log &optional;
		## Bad ARP explanation
		bad_explain: string &log &optional;
        };

        global log_new_arp: event(rec: Info);
}

event bro_init() &priority=5
{
        Log::create_stream(NEW_ARP::LOG, [$columns=Info, $ev=log_new_arp, $path="arp"]);
}

event arp_request(mac_src: string, mac_dst: string, SPA: addr, SHA: string, TPA: addr, THA: string)
{
	local info: NEW_ARP::Info;

	info$ts = network_time();
	info$arp_msg = "request";
	info$src_mac = mac_src;
	info$dst_mac = mac_dst;
	info$SPA = SPA;
	info$SHA = SHA;
	info$TPA = TPA;
	info$THA = THA;

	Log::write(NEW_ARP::LOG, info);
}

event arp_reply(mac_src: string, mac_dst: string, SPA: addr, SHA: string, TPA: addr, THA: string)
{
        local info: NEW_ARP::Info;

        info$ts = network_time();
        info$arp_msg = "reply";
        info$src_mac = mac_src;
        info$dst_mac = mac_dst;
        info$SPA = SPA;
        info$SHA = SHA;
        info$TPA = TPA;
        info$THA = THA;

        Log::write(NEW_ARP::LOG, info);
}

event bad_arp(SPA: addr, SHA: string, TPA: addr, THA: string, explanation: string)
{
	local info: NEW_ARP::Info;

	info$ts = network_time();
	info$arp_msg = "bad";
	info$SPA = SPA;
	info$SHA = SHA;
	info$TPA = TPA;
	info$THA = THA;
	info$bad_explain = explanation;

	Log::write(NEW_ARP::LOG, info);
}
