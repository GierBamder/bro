#Write a script using the following criteria:

#1. Run against ssh.pcap
#2. Find the successful SSH Session and print the UID
#3. Count the number of failed SSH Sessions and print the result
#4. Print the client and server version strings
#5. Print the number of failed SSH sessions

#Reference

#event ssh_auth_failed(c: connection)    
#event ssh_auth_successful(c: connection, auth_method_none: bool)


module SSH_SESSION_TRACKER;

global auth_failures = 0;

event ssh_auth_successful(c: connection, auth_method_none: bool)
{
	print fmt("successful SSH session - %s", c$uid);
}

event ssh_auth_failed(c: connection)
{
	++auth_failures;
}

event connection_state_remove(c: connection) &priority=-5
{
	if ( ! c?$ssh ) {
		return;
	}

	if ( !c$ssh$logged && c$ssh?$client && c$ssh?$server ) {
		print fmt("SSH: client = %s, server = %s", c$ssh$client, c$ssh$server);

	}
}

event bro_done()
{
	print fmt("SSH auth failures = %d", auth_failures);
}
