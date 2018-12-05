#an associate array that maps from one set of values to another. The values being mapped are termed the 
#index or indices and the result of the mapping is called the yield. Indexing into tables is very efficient, 
#and internally it is just a single hash table lookup.
#
#the table declaration syntax is:
#   table [type^+ ] of type
#
#where type^+ is one or more types separated by commas. For example:
#   global a: table[count] of string;
#
#Essentially, it's a hash table with key value pairs.
#
#A table constructor can also be used to create a table:
#
#   global t2 = table(
#        [192.168.0.2, 22/tcp] = "ssh",
#        [192.168.0.3, 80/tcp] = "http",
         [192.168.0.4, 53/udp] = "dns");  #always remember to put port/protocol
#And membership can be tested with in or !in:
#   if (13 in t)
#       ...
#   if ( [192.168.0.2, 22/tcp] in t2 ) { ... }
#
#Remove individual table elements with delete:
#   delete t[13];
#
#The absolute operator (|x|) can be used to determine the size of a table.
#
#
event bro_init()
{
    #explicit declaration
    local t: table[count] of string = { [1] = "one",
                                        [2] = "two",
                                        [3] = "three" }; 

    #constructor
    local t1 = table([1] = "one",
                     [2] = "two",
                     [3] = "three");

    print t[1];

    if ( 1 in t ) {
        print "One is there";
    }

    if ( 5 !in t ) {
        t[5] = "five";
    }

    print t[5];

    #print t[6];  #not there, will error.

    t[5] = "six"; #change 5 to "six"
    print t[5];

    delete t[5];

    if ( 5 !in t ) {
        print "We deleted 5 I guess?";
    }

    #complex table
    local t2: table[count,string] of count = { [1,"one"] = 1,
                                               [2,"two"] = 2 };

    print t2[2,"two"];
}

