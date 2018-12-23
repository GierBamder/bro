#Template

#hook Notice::policy(n: Notice::Info) &priority=10   
#{      
#…  
#}

#Exercise

#Write a script using the following criteria:
#
#    Use the template above with the results of the previous lab.
#    Change the Notice message to have a pre-amble of “Section 15.1.8”

@load base/frameworks/notice

module HTTP;

export {
        redef enum Notice::Type += {
                Large_HTTP_Flow,
        };

        const bad_len = 250000 &redef;
}

event connection_state_remove(c: connection) {
        if ( ! c?$http ) {
                return;
        }

        for ( host in set(c$id$orig_h, c$id$resp_h) ) {
                if ( c$http?$request_body_len && c$http$request_body_len >= bad_len ) {
                        NOTICE([$note=Large_HTTP_Flow,
                                $msg=fmt("%s (%s) to %s had request_body_len of %d",
                                host,
                                Site::is_local_addr(host) ? "local" : "remote",
                                host == c$id$orig_h ? "client" : "server",
                                c$http$request_body_len),
                                $conn = c]);
                }

                if ( c$http?$response_body_len && c$http$response_body_len >= bad_len ) {
                        NOTICE([$note=Large_HTTP_Flow,
                                $msg=fmt("%s (%s) to %s had response_body_len of %d",
                                host,
                                Site::is_local_addr(host) ? "local" : "remote",
                                host == c$id$orig_h ? "client" : "server",
                                c$http$response_body_len),
                                $conn = c]);
                }
        }

}

#hook Notice::policy(n: Notice::Info) &priority=10
#{
#	if ( n$note != HTTP::Large_HTTP_Flow ) {
#		return;
#	}
#	n$msg = "Section 15.1.8: " + n$msg;
#}

hook Notice::policy(n: Notice::Info) &priority=10
{
        if ( n$note == HTTP::Large_HTTP_Flow ) {
                n$msg = "Section 15.1.8: " + n$msg;
        }
}

