#Write a script using the following criteria:

#    Run against exercise_traffic.pcap
#    Create two Bro files
#        main.bro
#        test_event.bro
#    main.bro:
#        Add an event new_connection handler that calls the new event handler 
#    test_event.bro
#        Add an export section that includes a global event named my_test_event that has a connection argument
#        Add a module name
#    In test_event.bro, create an event my_test_event handler that prints out the connection ID as well as identifies itself as the “my_test_event handler”
#    In main.bro, from the new_connection event handler call the event handler created in test_event.bro

@load test_event

event new_connection(c: connection) &priority=-3
{
	event TEST_EVENT::my_test_event(c);
}
