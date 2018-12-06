# Intel Framework for MISP
@load frameworks/intel/seen
@load frameworks/intel/do_notice
redef Intel::read_files += {
 "/data/bro/feeds/domain.intel",
 "/data/bro/feeds/email.intel",
 "/data/bro/feeds/filehash.intel",
 "/data/bro/feeds/filename.intel",
 "/data/bro/feeds/ip.intel",
 "/data/bro/feeds/url.intel",
 };
 
 # Disable certain logs
 event bro_init() {
  Log::disable_stream(Syslog::LOG);
  Log::disable_stream(Weird::LOG);
}

# Add worker source to conn.log
redef record Conn::Info += {
        peer_descr: string &default="unknown" &log;
};
event connection_state_remove(c: connection){
        c$conn$peer_descr = peer_description;
}
