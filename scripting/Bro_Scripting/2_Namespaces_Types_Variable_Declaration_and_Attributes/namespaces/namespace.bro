@load ./other

redef Other::z = 3000;

event bro_init()
{
    local a = 1;

     print fmt("main a = %d", a);
     print fmt("main Other::a = %d", Other::a);
     print fmt("main Other::b = %d", Other::b);
    #print fmt("main Other::c = %d", Other::c);
     print fmt("main Other::x = %d", Other::x);
     print fmt("main Other::y = %d", Other::y);
     print fmt("main Other::z = %d", Other::z);

}
