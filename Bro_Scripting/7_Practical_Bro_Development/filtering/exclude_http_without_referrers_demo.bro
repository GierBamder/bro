function filter_pred(rec: HTTP::Info): bool
{
	if ( rec?$referrer )
		return T;
	return F;
}

event bro_init() &priority=-10
{
	local filt = Log::get_filter(HTTP::LOG, "default");
	#filt$pred=filter_pred;
	#filt$exclude = set("request_body_len", "info_code", "info_msg");
	filt$include = set("ts", "uid", "uri");
	Log::add_filter(HTTP::LOG, filt);
}
