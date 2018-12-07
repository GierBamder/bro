
function a_func(n: count)
{
	print fmt("n = %d", n);
}

function this_is_my_function(n: count): count
{
	local c = n * 3;

	print fmt("c = %d", c);

	a_func(c);

	return c;
}

event bro_init()
{
	print "Testing 1 2 3";

	this_is_my_function(1234);
}

event bro_done()
{
	print "bro_done()";
}
