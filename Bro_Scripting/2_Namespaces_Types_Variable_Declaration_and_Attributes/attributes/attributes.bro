module TESTING_ATTRIBS;

export {
    const config_on = T &redef;
}

type attribRecord: record { c: count  &log;
                            s: string &log;
                            o: string &log &optional;
                            d: bool   &log &default=F;
                            };

redef config_on = F;

function test_function(s: string &default="I am filled in!")
{
    print "test_function: s =", s;
}

event bro_init() &priority=20
{
    print "bro_init with priority 20";
    
    test_function();
}

event bro_init() &priority=-5
{
    print "bro_init with priority -5";
    
    test_function("I have overridden the default from bro_init with priority = -5");
}
