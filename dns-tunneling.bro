#   - Attempts to detect DNS tunneling 
#
# Author: Brian Kellogg
#
# Modified by: Matt Clemons
 
module DNS;
 
export {
        redef enum Notice::Type += {
                DNS::Tunneling,
        };
 
event bro_init()
    {
    local r1 = SumStats::Reducer($stream="Detect.dnsTunneling", $apply=set(SumStats::SUM));
    SumStats::create([$name="Detect.dnsTunneling",
			$epoch=5min,
			$reducers=set(r1),
			$threshold = 5.0,
			$threshold_val(key: SumStats::Key, result: SumStats::Result) =
				{
				return result["Detect.dnsTunneling"]$sum;
				},
			$threshold_crossed(key: SumStats::Key, result: SumStats::Result) =
				{
				local parts = split_string(key$str, /,/);
				NOTICE([$note=DNS::Tunneling,
					$id=[$orig_h=key$host,$orig_p=to_port(parts[0]),
						$resp_h=to_addr(parts[1]),$resp_p=to_port(parts[2])],
					$uid=parts[5],
					$msg=fmt("%s", parts[3]),
					$sub=fmt("%s", parts[4]),
					$identifier=cat(key$host,parts[2]),
					$suppress_for=5min
					]);
					}]);
    }
 
 


			SumStats::observe("Detect.dnsTunneling",
						[$host=c$id$orig_h, 
						$str=cat(c$id$orig_p,",",
							c$id$resp_h,",",
							c$id$resp_p,",",
							cat("Query: ",query),",",
							cat("Query type: ",qtype),",",
							c$uid)],
						[$num=1]);
			}
		}
	}
 
 
event dns_message(c: connection, is_orig: bool, msg: dns_msg, len: count)
	{
	if (len > dns_plsize_alert && c$id$orig_p !in dns_ports_ignore && c$id$resp_p !in dns_ports_ignore)
		{
		NOTICE([$note=DNS::Oversized_Answer,
			$conn=c,
			$msg=fmt("Payload length: %sB", len),
			$identifier=cat(c$id$orig_h,c$id$resp_h),
			$suppress_for=20min
			]);

		SumStats::observe("Detect.dnsTunneling",
				[$host=c$id$orig_h, 
				$str=cat(c$id$orig_p,",",
					c$id$resp_h,",",
					c$id$resp_p,",",
					cat("Payload length: ",len),",",
					" ",",",
					c$uid)],
				[$num=1]);
			}
	}
