@load base/frameworks/notice

module SSH;

export {
	redef enum Notice::Type += {
		Interesting_IP,
	};

	const interesting_ips = set (172.16.238.129);
}

event ssh_auth_successful(c: connection, auth_method_none: bool) {
	for ( host in set (c$id$orig_h, c$id$resp_h) ) {
		if (host in interesting_ips ) {
			NOTICE([$note=Interesting_IP,
				$msg=fmt("Interesting IP via SSH login involving a %s host connecting to a %s.",
				Site::is_local_addr(host) ? "local" : "remote", host == c$id$orig_h ? "client" : "server" ),
				$conn = c]);
		}
	}
}

