#Write a script using the following criteria:

#    Run against exercise_traffic.pcap
#    Use the results of the previous lab.
#    test_event.bro
#        Create three additional event my_test_event handlers
#        Make sure each of the four total handlers have a unique output
#        Add &priority attributes to all the handlers

@load test_event

event new_connection(c: connection) &priority=-3
{
	event TEST_EVENT::my_test_event(c);
}
