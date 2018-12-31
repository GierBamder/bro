#Template
#
#event bro_init()   
#    {      
#        local r1 = SumStats::Reducer($stream="...", ...);        
#
#        SumStats::create([$name="http_method",                        
#            $epoch=12hrs,                        
#            $reducers=set(r1),                        
#            $epoch_result(ts: time, key: SumStats::Key, result: SumStats::Result) =                          
#        {                          
#        local r = result["..."];                          
#        ...                          
#        }]);   
#}    
#
#event http_request(c: connection, method: string, original_URI: string, unescaped_URI: string, version: string)  
#{      
#    …  
#}
#
#Write a script using the following criteria:
#
#1. Use the template above as the basis for your script
#2. Pick the appropriate calculation to use with the SumStats::Reducer
#3. Observe the HTTP method being used
#4. Print the results using exercise_traffic.pcap
#
#https://www.bro.org/sphinx/scripts/base/frameworks/sumstats/main.bro.html#type-SumStats::Calculation

event bro_init()   
	{      
		local r1 = SumStats::Reducer($stream="http.method", $apply=set(SumStats::TOPK), $topk_size=50);        

		SumStats::create([$name="http_method",                        
			$epoch=12hrs,                        
			$reducers=set(r1),                        
			$epoch_result(ts: time, key: SumStats::Key, result: SumStats::Result) = {                          
				local r = result["http.method"];                          
				local s: vector of SumStats::Observation;
				s = topk_get_top(r$topk, 10);
				for ( i in s ) {
					print fmt("Method = %s, %d", s[i]$str, topk_count(r$topk, s[i]));
					print ""; 
				}
        	}]);   
}    

event http_request(c: connection, method: string, original_URI: string, unescaped_URI: string, version: string)  
{      
	SumStats::observe("http.method", [], [$str=method]);
}

#Results
#Method = GET, 252
#
#Method = POST, 97
#
#Method = HEAD, 10
