event print_testing(s: string)
{
	print fmt("Testing - %DT - Extra: %s", network_time(), s);

	schedule 5 sec { print_testing("Self") };
}

event print_testing(s:string) &priority=10
{
        print fmt("(p1) Testing - %DT - Extra: %s", network_time(), s);

        schedule 5 sec { print_testing("(p1) Self") };
}

event bro_init()
{
	schedule 5 sec { print_testing("bro_init") };
}

