#    Add a switch case in my_switch() for “b” with a unique message.
#    Add a fallthrough case to my_switch() for “last” to use the same logic as “default”
#    Call my_switch() in bro_init() with the option “b” and observe the results
#    Call my_switch() in bro_init() with the option “last” and observe the results
#    Add a switch case in my_switch() for “early” that causes an immediate return
#    Add a switch case in my_switch() for “d” with an appropriate message
#    Call my_switch( )in bro_init() with the argument “early”
#    Call my_switch( )in bro_init() with the argument “d”

function my_switch(a: string)
{
    switch(a) {
        case "early":
            print "Early got called";
            return;
        case "a":
            print "A got called";
            break;
        case "b":
            print "B got called";
            break;
        case "d":
            print "D got called";
            break;
        case "last":
            fallthrough;
        default:
            print "Falling to the bottom";
            return;
    }
}

event bro_init()
{
    my_switch("b");
    my_switch("last");
    my_switch("early");
    my_switch("d");
}
