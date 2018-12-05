# Regex in bro
# A type representing regular-expression patterns which can be used for fast text-searching operations. Pattern constants are created by enclosing text within forward
# slashes "/pattern/" and is the same syntax as the patterns supported by the flex lexical analyzer (http://flex.sourceforge.net/manual/Patterns.html)
# The speed of regular expression matching does not depend on the complexity or size of the patterns. Patterns support two types of matching, exact and embedded.
# 
# In exact matching the == equality relational operator is used with one "pattern" operand and one "string" operand (order of operands does not matter) to check
# whether the full string exactly matches the pattern. In exact matching, the ^ beginning-of-line and $ end-of-line anchors are redundant since the pattern is implicitly 
# anchored to the beginning and end of the line to facilitate an exact match.
#
  
