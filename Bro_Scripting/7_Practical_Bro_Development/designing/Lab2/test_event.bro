module TEST_EVENT;

export {
	global my_test_event: event(c: connection);
}

event my_test_event(c: connection) &priority=30
{
	print fmt("TEST_EVENT::my_test_event (p30) - c$id = %s", c$id);
}

 event my_test_event(c: connection) &priority=5
 {
         print fmt("TEST_EVENT::my_test_event (p5) - c$id = %s", c$id);
 }

 event my_test_event(c: connection) &priority=-5
 {
         print fmt("TEST_EVENT::my_test_event (p-5) - c$id = %s", c$id);
 }

 event my_test_event(c: connection) &priority=-30
 {
         print fmt("TEST_EVENT::my_test_event (p-30) - c$id = %s", c$id);
 }
