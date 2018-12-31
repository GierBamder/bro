#LAB - Use the Input Framework to Disable Analyzers
#
#Template
#
#const config_tag_map: table[string] of Analyzer::Tag = {    
#["AYIYA"]       = Analyzer::ANALYZER_AYIYA,    
#["BITTORRENT"]  = Analyzer::ANALYZER_BITTORRENT,    
#["DHCP"]         = Analyzer::ANALYZER_DHCP,    
#["DNP3_TCP"]    = Analyzer::ANALYZER_DNP3_TCP,    
#["DNS"]         = Analyzer::ANALYZER_DNS,    
#["DTLS"]        = Analyzer::ANALYZER_DTLS,    
#["FTP"]         = Analyzer::ANALYZER_FTP,    
#["FTP_DATA"]    = Analyzer::ANALYZER_FTP,    
#["GTPV1"]       = Analyzer::ANALYZER_GTPV1,    
#["HTTP"]        = Analyzer::ANALYZER_HTTP,    
#["IRC"]         = Analyzer::ANALYZER_IRC,    
#["IRC_DATA"]    = Analyzer::ANALYZER_IRC_DATA,    
#["KRB"]         = Analyzer::ANALYZER_KRB,    
#["KRB_TCP"]     = Analyzer::ANALYZER_KRB_TCP,    
#["MODBUS"]      = Analyzer::ANALYZER_MODBUS,    
#["MYSQL"]       = Analyzer::ANALYZER_MYSQL,    
#["NTP"]         = Analyzer::ANALYZER_NTP,    
#["POP3"]        = Analyzer::ANALYZER_POP3,    
#["RADIUS"]      = Analyzer::ANALYZER_RADIUS,    
#["RDP"]         = Analyzer::ANALYZER_RDP,    
#["SIP"]         = Analyzer::ANALYZER_SIP,    
#["SMB"]         = Analyzer::ANALYZER_SMB,    
#["SMTP"]        = Analyzer::ANALYZER_SMTP,    
#["SNMP"]        = Analyzer::ANALYZER_SNMP,    
#["SOCKS"]       = Analyzer::ANALYZER_SOCKS,    
#["SSH"]         = Analyzer::ANALYZER_SSH,    
#["SSL"]         = Analyzer::ANALYZER_SSL,    
#["SYSLOG"]      = Analyzer::ANALYZER_SYSLOG,    
#["TEREDO"]      = Analyzer::ANALYZER_TEREDO,  
#};
#
#Exercise
#
#Write a script using the following criteria:
#
#    Leverage the solution from the Analyzers lab as the basis for disabling analyzers
#    Add the config_tag_map to the script from #1
#    Define a new input file with the requisite Input Framework #fields, etc.
#    Map the results of #3 with #2 and use Input::add_event instead of maintain a table, as a means of disabling the analyzers when the input changes

module DISABLE_ANALYZERS_LAB;

export {
	global disable_analyzers: set[Analyzer::Tag] = { Analyzer::ANALYZER_HTTP } &redef;

	const config_tag_map: table[string] of Analyzer::Tag = {    
		["AYIYA"]       = Analyzer::ANALYZER_AYIYA,    
		["BITTORRENT"]  = Analyzer::ANALYZER_BITTORRENT,    
		["DHCP"]         = Analyzer::ANALYZER_DHCP,    
		["DNP3_TCP"]    = Analyzer::ANALYZER_DNP3_TCP,    
		["DNS"]         = Analyzer::ANALYZER_DNS,    
		["DTLS"]        = Analyzer::ANALYZER_DTLS,    
		["FTP"]         = Analyzer::ANALYZER_FTP,    
		["FTP_DATA"]    = Analyzer::ANALYZER_FTP,    
		["GTPV1"]       = Analyzer::ANALYZER_GTPV1,    
		["HTTP"]        = Analyzer::ANALYZER_HTTP,    
		["IRC"]         = Analyzer::ANALYZER_IRC,    
		["IRC_DATA"]    = Analyzer::ANALYZER_IRC_DATA,    
		["KRB"]         = Analyzer::ANALYZER_KRB,    
		["KRB_TCP"]     = Analyzer::ANALYZER_KRB_TCP,    
		["MODBUS"]      = Analyzer::ANALYZER_MODBUS,    
		["MYSQL"]       = Analyzer::ANALYZER_MYSQL,    
		["NTP"]         = Analyzer::ANALYZER_NTP,    
		["POP3"]        = Analyzer::ANALYZER_POP3,    
		["RADIUS"]      = Analyzer::ANALYZER_RADIUS,    
		["RDP"]         = Analyzer::ANALYZER_RDP,    
		["SIP"]         = Analyzer::ANALYZER_SIP,    
		["SMB"]         = Analyzer::ANALYZER_SMB,    
		["SMTP"]        = Analyzer::ANALYZER_SMTP,    
		["SNMP"]        = Analyzer::ANALYZER_SNMP,    
		["SOCKS"]       = Analyzer::ANALYZER_SOCKS,    
		["SSH"]         = Analyzer::ANALYZER_SSH,    
		["SSL"]         = Analyzer::ANALYZER_SSL,    
		["SYSLOG"]      = Analyzer::ANALYZER_SYSLOG,    
		["TEREDO"]      = Analyzer::ANALYZER_TEREDO,  
	};
}

event bro_init() {
	for ( a in disable_analyzers ) {
		Analyzer::disable_analyzer(a);
	}
}

