# 1. Create a new record r429 with the following fields and attributes:
# 2. Create a local variable r of type r429 and set the fields to be the following:
#   * item = 1234
#   * name = “Section 4.2.9”
#   * ready = T
# 3. Print the results of 2
# 4. Change name in r to be “This is a Lab”
# 5. Print the results of 3



# Create the record in global namespace

type r429: record { item: count;
                    name: string;
                    options: string &optional;
                    ready: bool &default=F ; };


event bro_init()
{
    # Initialize the record with count of 1234, string of "Section 4.2.9" and a bool of T
    local r: r429;
    r$item = 1234;
    r$name = "Section 4.2.9";
    r$ready = T;

    print r$item;

    # Change 'name' and print
    r$name = "This is a lab";
    print "Updated name: ", r$name;


    # Print everything
    print "Entire record: ", r;

 
}

event bro_done()
{
    print "Bye!";
}
