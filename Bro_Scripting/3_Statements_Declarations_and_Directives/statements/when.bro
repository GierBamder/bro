global X: table[string] of count;

function a(): count
{
    return when ( "a" in X ){
        return X["a"];

    } timeout 30 sec {
        return 0;
    }
}

event bro_init()
{
    when ( a() == 42 ){
        print "expected result";
    }

    print "Waiting for a() to return...";

    X["a"] = 42;
}
