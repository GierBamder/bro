#Write a script using the following criteria:
#
#1. Use @load base/protocols/conn/thresholds
#2. Use event connection_established(c: connection) as the basis for setting the byte threshold
#3. The byte threshold of interest should be &redef’able
#4. Use the NOTICE Framework to log an entry when the threshold has been crossed
#
#Reference
#
#event ConnThreshold::bytes_threshold_crossed(c: connection, threshold: count, is_orig: bool)

module LARGE_TRANSFER_DETECTOR;

@load base/protocols/conn/thresholds

export {
	const large_transfer = 100000 &redef;

	redef enum Notice::Type += {
		Large_Transfer,
	};
}

event ConnThreshold::bytes_threshold_crossed(c: connection, threshold: count, is_orig: bool) {
	NOTICE([$note=Large_Transfer,
		$msg=fmt("Large transfer from %s:%d to %s:%d of threshold %d",
                          c$id$orig_h, c$id$orig_p,
                          c$id$resp_h, c$id$resp_p,
                          threshold),
		$conn=c]);
}

event connection_established(c: connection) {
	ConnThreshold::set_bytes_threshold(c, large_transfer, T);
	ConnThreshold::set_bytes_threshold(c, large_transfer, F);
}
