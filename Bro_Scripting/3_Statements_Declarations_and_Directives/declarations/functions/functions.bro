#For this lab, you will use your accumulated knowledge of function declarations and basic Bro types to create a simple two argument string concatenation function.
#
#Exercise
#1.Declare the event bro_init() event handler that will call your string concatenation function.
#2.Declare a function mycat that takes two string arguments of your own naming and returns a string.
#3.Verify the length (|string|) of the strings passed are greater than zero and if not return a zero length string immediately. Check each individual string to verify it is greater than zero. Any string that is less than zero, but the other is greater than zero, immediately return the non-zero string.
#4.Once all strings have been verified to be greater than zero, add the two strings together and return the result.
#5.Call the newly created mycat function from bro_init() and verify the results are as expected. Attempt different combinations of empty strings and non-empty strings.

function mycat(a: string, b: string): string
{
	if ( |a| == 0 && |b| == 0 ) {
		return "";
	}
	if ( |a| > 0 && |b| == 0 ) {
		return a;
	}
	if ( |b| > 0 && |a| == 0 ) {
		return b;
	}
	return a + b;
}

event bro_init()
{
	print "mycat(a, b)", mycat("a", "b");
	print "mycat(just a, ) = ", mycat("just a", "");
	print "mycat(, just b) = ", mycat("", "just b");
	print "mycat(,) = ", mycat("", "");
}

