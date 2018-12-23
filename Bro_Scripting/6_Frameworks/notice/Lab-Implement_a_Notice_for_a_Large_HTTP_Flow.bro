#Recall, that each protocol tracks the metadata for that protocol only. The conn.log maintains the statistic information and state of each flow in Bro – e.g. byte counts, etc.
#
#Exercise
#
#Write a script using the following criteria:
#
#    Use the event: event connection_state_remove (c: connection)
#    Define a module and export block
#    Define a &redef’able value to use as the trigger for a “large” HTTP flow – c$http${response_body_len, request_body_len}
#    Define all the required values for a NOTICE in the export block
#    Use the &redef’able value plus the NOTICE within the connection_state_remove event to generate NOTICEs when required – check that c$http exists 


@load base/frameworks/notice

module HTTP;

export {
        redef enum Notice::Type += {
                Large_HTTP_Flow,
        };

        const bad_len = 10000 &redef;
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


