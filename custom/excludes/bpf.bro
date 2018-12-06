redef restrict_filters += { 
    ["not-these-hosts"] = 
        "not host 10.1.1.23 and not host 10.1.1.17 and not host 172.16.88.88"
};


redef PacketFilter::all_packets=F;
redef capture_filters += { ["all-packets"] = "ip or not ip" };
redef restrict_filters = { ["BPF-1"] = "not host ( 192.168.13.70 or 192.168.13.95 or 192.168.13.96 ) and not ( tcp portrange 8400-8500 or tcp portrange 8600-8620 )" }; 

