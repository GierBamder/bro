# const var is one that you cannot change
# create consts in the global namespace area

export {
    const option = 1234;

    const testing = "testing" &redef;
}

# with redef you can change it. but it's a constant and can only be changed at load time with 
# the redef operater and in the global namespace
redef testing = "Let's try this again.";


event bro_init()
{
    # option = 5678; #can't change it.
    print "bro_init: option - ", option;

    print "bro_init: testing - ", testing;
}

event bro_done()
{
    print "bro_done: option - ", option;

    # declared in main, not global
    # print "bro_done: testing - ", testing;
}
