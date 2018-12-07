event bro_init()
{

}

event http_message_done(c: connection, is_orig: bool, stat: http_message_stat)
{
	Analyzer::disable_analyzer(Analyzer::ANALYZER_HTTP);
}

