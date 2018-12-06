
event bro_init()
{
    local a = "Testing 1 2 3";
    local rx = /Testing/;
    const rx2 = /[[:alnum:]]{0,12}/ &redef;
    
    print rx in a;
    print rx2 in a;
}
