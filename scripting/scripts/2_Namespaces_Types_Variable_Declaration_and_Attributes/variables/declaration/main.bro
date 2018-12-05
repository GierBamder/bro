# main.bro
#
@load ./a
@load ./b

global my_global = "I am main's global variable";

event bro_init()
{
    local my_local = "I am a local variable to bro_init in main.bro";
    print my_global;
    print my_local;

    print fmt("main.bro: $s", A::my_global);
}

event bro_done()
{
    print "Done";
}
