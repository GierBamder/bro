# b.bro
# 
module B;

global my_global = "I am b's global variable";

event bro_init()
{
    print my_global;
}
