# This function prints "a"
function prints_a()
{
    print "a";
}

# This function prints a count and a string
function prints_stuff(n: count, s: string)
{
    print n, s;
}

# This function returns 2 strings
function return_stuff(s1: string, s2: string): string
{
    return s1 + " kicks " + s2;
}

# This runction prints one argument
function one_arg(s1: string)
{
    print "one_arg: ", s1;
}


event bro_init()
{
    prints_a();
    prints_stuff(1234, "testing");

    print "bro_init:", return_stuff("Bro", "Ass");

    one_arg("pimpness");
}
