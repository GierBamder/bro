#Exercise
#
#Write a script using the following criteria:
#
#    The script should implement an export block and appropriate module name
#    It should disable Protocol Analyzers – Recall Analyzer::Tag – on startup
#    The set of Analyzers should be &redef’able
#    Write a secondary script that takes advantage of the &redef’ed set to add additional Analyzer entries
#
#https://www.bro.org/sphinx/script-reference/proto-analyzers.html#type-Analyzer::Tag

module DISABLE_ANALYZERS;

export
{
	global analyzers: set[Analyzer::Tag] = { Analyzer::ANALYZER_HTTP,
                                                 Analyzer::ANALYZER_DNS,
                                                 Analyzer::ANALYZER_DHCP,
                                                 Analyzer::ANALYZER_SMTP } &redef;
}

event bro_init()
{
	for ( a in analyzers ) {
		Analyzer::disable_analyzer(a);
	}
}
