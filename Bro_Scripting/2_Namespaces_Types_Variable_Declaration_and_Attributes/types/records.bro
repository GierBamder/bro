#"record" in bro is like "struct" in c.
#
#A "record" is a collection of values. Each value has a field name and a type. 
#Values do not need to have the same type and the types have no restrictions. 
#Field names must allow the same syntax as regular variable names (except that field names are allowed 
#to be the same as local or global variables). 
#An example record type definition:
#   type MyRecordType: record { c: count;
                                s: string &optional; };
#
#Records can be initialized or assigned as a whole in three different ways.
#When assigning a whole record value, all fields that are not &optional or have a &default attribute must be specified.
#   local r = MyRecordType($c = 42);
#
#Alternative constructor method:
#   local r = MyRecordType = [$c = 13, $s = "thirteen"];
#
#Access to a record field uses the dollar sign "$" operator, and record fields can be assigned with this:
#   local r: MyRecordType;
#   r$c = 13;
#
#To test if a field that is &optional has been assigned a value, use the "?$" operator (it returns a bool value of T
#if the filed has been assigned a value, or F if not):
#   if (r ?$s )
#      ...
#NOTE: Records are fundamental for Log Writing. Anything that uses the logging framework is a record.
#They have to be added in the global namespace.


#create the record
type MyRecord: record { c: count;                 #explicit
                        s: string;                #explicit
                        c1: count &optional;      #optional
                        s1: string &optional; };  #optional

event bro_init()
{
    
    #ways to initialize records
    #least explicit
    local r = MyRecord($c = 1234, $s = "testing");      #Implicit define. create the record. c1 and s1 are optional

    #more explicit
    local r1: MyRecord =  [$c = 1234,        
                           $s = "testing"];

    #most explicit. do it this way
    local r2: MyRecord;
    r2$c = 1234;
    r2$s = "testing";

    print r2$s;

    r2$c1 = 12345678;

    if ( r2?$c1 ) {
       print "r2$c1 is there!";
    }
     

}
event bro_done()
{
    print "Bye";
}
