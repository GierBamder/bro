function my_func(): string
{
    return "Returning now";
}

event my_event(n: count)
{
    if ( n == 0 ){
        return;
    }

    if ( n != 1 || n > 5 && n == 10 ){
        return;
    }

    print n;
}

event bro_init()
{
    local t_ret = my_func();

    print "t_ret", t_ret, |t_ret|;

    event my_event(1);

    print "Processing continues here";
}
