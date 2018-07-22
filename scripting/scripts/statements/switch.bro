
function test_even_or_odd(c: count){
	switch ( c % 2){
		case 0:
			print fmt("c = %d is Even", c);
			break;
		default:
			print fmt("c = %d is Odd", c);
			break;
	}
}

function test_divisibility(c: count){
    switch ( c % 4 ) {
        case 0:
            print fmt("c = %d is divisible by 4 evenly", c);
            fallthrough;
        case 2:
            print fmt("c = %d is divisible by 2 evenly", c);
            break;
        default:
            print fmt("c = %d is Odd", c);
            break;
    }

    print "Outside switch statement";
}

event bro_init()
{
	test_even_or_odd(2);
    test_even_or_odd(3);

    test_divisibility(2);
    test_divisibility(16);
    test_divisibility(13);
    test_divisibility(3);
}
