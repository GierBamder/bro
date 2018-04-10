# a.bro
# 
module A;

export {
    global my_global = "I am a's global variable";
}

event bro_init()
{
    print my_global;
}
