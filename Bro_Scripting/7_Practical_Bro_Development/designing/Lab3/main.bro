#Write a script using the following criteria:

#    Run against exercise_traffic.pcap
#    Create an event that takes no arguments and prints a message
#        Note: Scheduled events must reschedule themselves from within the event handler
#    Schedule the new event to run every 3 secs

global cnt = 0;

event schedule_me()
{
	print "event schedule_me() is running";
	++cnt;

	schedule 3sec { schedule_me() };	
}
	
event bro_init()
{
	schedule 3sec { schedule_me() };
}

event bro_done()
{
	print fmt("event schedule_me() ran %d times", cnt);
}
