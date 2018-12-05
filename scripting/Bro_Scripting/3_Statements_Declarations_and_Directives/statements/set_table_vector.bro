# Set enumeration. Order of a set is not guaranteed.
function enum_set(s: set[string]) {
   for (elem in s) {
       print elem;
   }
}

# Vector enumeration. A vector is zero indexed, so you get back the positions. 
function enum_vector(v: vector of string) {
    for (idx in v) {
        print idx; # prints the position(index).
        print fmt("idx = %d, element = %s", idx, v[idx]); # prints the elements in the indicies.
    }
}

# Table enumeration.
function enum_table(t: table[string] of string) {
    for (key in t) {
        print t[key]; # Keyed not indexed. Hash table. 
    }
}

event bro_init()
{
    # Set definition.
    local s1 = set("a","b","c","d","e","f");

    # Vector definition.
    local v1 = vector("a","b","c","d","e","f","f"); # Vectors allow duplicate entries.

    # Table definition.
    local t1: table[string] of string = {["a"] = "Element A",
                                         ["b"] = "Element B",
                                         ["c"] = "Element C",
                                         ["d"] = "Element D",
                                         ["e"] = "Element E",
                                         ["f"] = "Element F"};
    # Uncomment one by one.
    #enum_set(s1);
    #enum_vector(v1);
    #enum_table(t1);
}

# Set output. Order not guaranteed.
# c
# f
# a
# e
# b
# d

# Vector output. Showing both position and element in position.
# 0
# idx = 0, element a
# 1
# idx = 1, element b
# 2
# idx = 2, element c
# 3
# idx = 3, element d
# 4
# idx = 4, element e
# 5
# idx = 5, element f
# 6
# idx = 6, element f


# Table output
# Element D
# Element A
# Element B
# Element F
# Element C
# Element E
