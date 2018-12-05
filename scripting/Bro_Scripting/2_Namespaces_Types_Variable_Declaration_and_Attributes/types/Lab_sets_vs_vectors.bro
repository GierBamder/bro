event bro_init()
{
    #create a vector of type string, and print
    local v: vector of string = { "a", "b", "c", "d" };
    print "v: ", v;

    #create a set of type string, and print
    local s: set[string] = { "a",
                             "b",
                             "c",
                             "d" };
    print "s: ", s;

    #change the first index of vector v to "z"
    v[0] = "z";
    print "v (change 0): ", v;

    #change "a" in set s: to "z"
    #have to delete it first and then add
    delete s["a"];
    add s["z"];
    print "s (change a): ", s;

    #add another "c" to the end of the vector "v"
    v[|v|] = "c";
    print "v with another c: ", v;

    #try to add another "c" to the set "s" and print
    add s["c"];
    print "s with an extra c ", s;
}
event bro_done()
{

}

