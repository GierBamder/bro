#
module Other;

export {
    global a = 1;
    global b = 2;
    global x = 10;
    global y = 20;
    const z = 30 &redef;
}


global c = 3;

event bro_init() {
    print fmt("Other - a = %d", a);
    print fmt("Other - b = %d", b);
    print fmt("Other - c = %d", c);

    print fmt("Other - x = %d", x);
    print fmt("Other - y = %d", y);
    print fmt("Other - z = %d", z);
}
