#understanding bro tables lab
#
event bro_init()
{
    # Create a table containg the compound key of a string and a count with the value being a descriptive string.
    local t: table[string,count] of string = { ["www", 80] = "Internal Web Server",
                                               ["dns1", 53] = "Internal DNS 1",
                                               ["dns2", 53] = "Internal DNS 2",
                                               ["dhcp-for-wifi", 443] = "DHCP Management Interface for Wifi" };

    print t;

    # update dhcp-for-wifi's value
    t["dhcp-for-wifi", 443] = "DHCP for Internal VMware cluster";
    print "Updated table: ", t;

    # remove a row    
    print "The 'Internal Web Server' has been decommissioned";
    delete t["www", 80];
    print "Removed internal web server: ", t;
    
    # add a row
    print "A new webserver, 'www-shiny' that uses HTTPS has been added";
    t["www-shiny", 443] = "Shiny HTTPS server";
    print "Added HTTPS server: ", t;
}

event bro_done()
{
    print "Adios";
}
