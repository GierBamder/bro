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

redef DISABLE_ANALYZER_LAB::analyzers += { Analyzer::ANALYZER_FTP };
