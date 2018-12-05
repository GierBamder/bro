#Matrix operations
#A vector is like a table, except it's always indexed by a count (and vector indexing is always zero-based).
#A vector is declared like:
#   global v: vector of string;   #global vector of type string
#
#A vector can be initilaized with the vector constructor:
#   local v = vector("one", "two", "three");
#
#Accessing vector elements is provided by enclising index values within square brackets ([]), for example:
#   print v[2];
#
#An element can be added to a vector by assigning the value (a value that already exists at that index will be overwritten):
#   v[3] = "four";
#
#The number of elements in a vector can be obtained by placing the vector identifier between verticle pipe characters:
#   |v|
#
#Vectors of integral types (int or count) support the pre-increment (++) and pre-decrement operators (--), which will increment or decrement each element in the vector.
#
#Vectors of arithmetic types (int, count, or double) can be operands of the arithmetic operators (+, -, *, /, %), but bother operands must have the same number of elements (and the modulus operator % cannot be used if either operand is a vector of a double). The resulting vector contains the result of the operation applied to each of the elements in the operand vectors.
#
#vectors allow duplicate entries. Like how many times a bad ip address did something against a port.

event bro_init() 
{
    local v: vector of count = { 1, 2, 3, 4 };  # vector constructor
    
    v[|v|] = 5;   # Add into a vector. |var| is the length operator. Like len(v)
                  # I want to put in v[|len|] put the number 5 at the end.
    print v;

    print v[1];   # print a position. like an array.

    locat v1 = vector(1, 2, 3, 4);  # implicit declaration of a vector.

    print v1[0];  # prints 1.

}
