global myhook: hook(s: string);

hook myhook(s: string) &priority = 10
{
	print "priority 10 myhook handler", s;
	s = "no";
}

hook myhook(s: string)
{
	print "break out of myhook handling", s;
	#break;
	s = "final statement";
}

hook myhook(s: string) &priority = -5
{
	print "definitely going to happen", s;
}

event bro_init()
{
	local ret: bool = hook myhook("hi");
	if ( ret ) {
		print "all handlers ran";
	}
}
