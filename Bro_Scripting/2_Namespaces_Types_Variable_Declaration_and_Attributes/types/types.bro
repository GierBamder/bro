#vars have to be initialized


#enum is like a typedef
type color: enum {
    Red,
    White,
    Blue,
    Pink,
    Purple,
    Black,
    Orange,  #you can keep or remote the trailing comma. best to leave in case you have to add something.
};


event bro_init()
{
    #bool
    local this_is_my_bool = T;
    local this_is_my_bool2: bool = T;

    #count
    local this_is_my_count = 1234;
    local this_is_my_count2: count = 1234;

    #string
    local this_is_a_string = "testing";
    local this_is_a_string2: string = "testing2"; #without quotes it's a count

    #enum. like a typedef
    local favorite_color = Blue;

}
