event bro_init() &priority=5
{
	local r1 = SumStats::Reducer($stream="excess.queries", $apply=set(SumStats::SUM));

	SumStats::create([$name = "excess.queries.http",
		$epoch = 5min,
		$reducers = set(r1),
		$threshold = 5.0,
		$threshold_val(key: SumStats::Key, result: SumStats::Result): double = {
			return result["excess.queries"]$sum;
		},
		$threshold_crossed(key: SumStats::Key, result: SumStats::Result) = {
			print fmt("%s had too many queries!", key$host);
		}
	]);
}

event http_message_done(c: connection, is_orig: bool, stat: http_message_stat) &priority=-10
{
	if (! is_orig) {
		if ( c$http?$uri ) {
			SumStats::observe("excess.queries", SumStats::Key($host=c$id$orig_h),
                                                             SumStats::Observation($str=c$http$uri));
		}
	}
}
