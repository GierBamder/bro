##main.bro
#
#create a global var named my_counter. The term "counter" is reserved.
#
global my_counter: count = 0;

event bro_init()
{
    #increment my_counter by one
    ++my_counter;

}


event bro_done()
{
    #increment my_counter by 2
    my_counter += 2;

    #print the result
    print my_counter;
}
