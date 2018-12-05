
event bro_init()
{
    local x = 0x12345678;

    if ( x == 0xDEADBEEF ) {
        print "Here's the beef!";

    } else if ( x != 0x11111111 ) {
        print "All ones..";
    } else if ( x == 0x12345678 ) {
        print "This should match";
    } else {
        print "Hitting the else at the bottom";
    }
}
