#define a local var 's' that is a set of ports
#and initialize it with 4 ports
event bro_init()
{
    local s: set[port] = { 21/tcp,
                           23/tcp,
                           80/tcp,
                           443/tcp };


    #c++ constructor like version
    local s1 = set(21/tcp, 23/tcp, 80/tcp, 443/tcp);

    #take off 'tcp' to make it a set of counts
    local s2: set[count] = { 21,
                             23,
                             80,
                             443 };


    #c++ like. take off 'tcp' for a set of counts
    local s3 = set(21, 23, 80, 443);

    
    #uninitialized count set.
    #use this method if collecting things up as you're executing.
    local s4: set[count];

    #use add commands. Like an array in cpp.
    add s4[21];
    add s4[23];
    add s4[80];
    add s4[443];

    #to delete something from a set, use delete operator.
    delete s4[443];
    delete s4[23];


}
