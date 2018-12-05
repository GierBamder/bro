# Declaring a variable
# Form:
# {class} {identifier} [':' {type}] ['=' {init}]
#
# {type} may be omitted, privided {init} is specified.
#    * The {type} will be inferred from the {init}
#
#
# create a function called add_two that adds 2 to the argument provided to it
# return the value

#"Class"   "id"    "type"
function add_two(i: count): count
{
    local added_two = i+2;
    print fmt("i + 2 = %d", added_two);
    return added_two;
}

event bro_init()
{
    local test = add_two(10);
}

event bro_done()
{
    print "Goodbye";
} 
