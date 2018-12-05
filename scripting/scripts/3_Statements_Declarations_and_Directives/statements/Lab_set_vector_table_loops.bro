# For this lab, you will use your accumulated knowledge loops to enumerate various container types.
#
#    Declare a set s with six string entries of your choosing and print s
#    Enumerate s using a for loop and print each entry. Note the order of the elements.
#    Declare a vector v of six unique string entries of your choosing and print v
#    Enumerate v and print the index and corresponding entry at the index
#    Declare a table t with six entries containing a simple string key and value of your choosing and print t
#    Enumerate t and print the key/value pairs

#Set enum. Enumerate s using a for loop and print each entry. Sets do not maintain order.
function enum_set(s: set[string]) {
    for (entry in s) {
        print entry;
    }
}

#Vector enum. Enumerate v and print the index and corresponding entry at the index
function enum_vector(v: vector of string) {  #vectors are different format in functions
    for (index in v) {
        print index; #prints elements out of order
        print fmt("index = %d", index); #prints indicies in order
        print fmt("index = %d, element = %s", index, v[index]); #print the index and corresponding entry at the index
    }
}

#Table enum. Enumerate t and print the key/value pairs
function enum_table(t: table[string] of string) {  #tables have two strings,(key/value)
    for (key in t) {
        print fmt("t[%s] = %s", key, t[key]);
        #print "t_key = ", key, "t_key_value = ", t[key];
    }
}

event bro_init()
{

#Declare a set s with six string entries
local s = set("I","love","to","code","in","bro");
    #and print 's'
    #print "s = ", s";

#Declare a vector of v with 6 unique strings
local v: vector of string = {"I","love","to","code","in","bro"};
    #and print v
    #print "v = ", v";

#Declare a table t with six entries containing a simple string key and value
local t: table[string] of string = { ["one"]   = "I",
                                     ["two"]   = "love",
                                     ["three"] = "to",
                                     ["four"]  = "code",
                                     ["five"]  = "in",
                                     ["six"]   = "bro"};
#and print t
#print "t = ", t";

#enum_set(s);
#enum_vector(v);
enum_table(t);
}
