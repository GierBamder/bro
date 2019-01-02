module TEST_EVENT;

export {
	global my_test_event: event(c: connection);
}

event my_test_event(c: connection)
{
	print fmt("TEST_EVENT::my_test_event - c$id = %s", c$id);
}
