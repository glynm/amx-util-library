PROGRAM_NAME='convert'

#IF_NOT_DEFINED __CONVERT__
#DEFINE __CONVERT__


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
// Function: ltoa
//
// Parameters:
//    long val   -   A long value
//
// Returns:
//    char[10]   -   A character array (string) containing the value in numeric ASCII form ('0' - '4294967295')
//
// Description:
//    Returns a ASCII numeric string representing the long value parameter. Written as a necessity as the in-built
//    itoa function in NetLinx has a bug whereby large long values are returned as negative ASCII numeric strings.
// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
define_function char[10] ltoa(long val) {
	if(val <= 100000) {
		return itoa(val);
	} else {
		return "itoa(val/100000),itoa(val%100000)";
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
// Function: ltba
//
// Parameters:
//    long val   -   A long value
//
// Returns:
//    char[4]   -   A 4-byte character array
//
// Description:
//    Returns a the 4-byte long value as a 4-byte char array.
// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
define_function CHAR[4] ltba(long val) {
	char result[4];

	result[1] = type_cast((val & $FF000000) >> 24);
	result[2] = type_cast((val & $00FF0000) >> 16);
	result[3] = type_cast((val & $0000FF00) >> 8);
	result[4] = type_cast((val & $000000FF));
	set_length_array(result,4);

	return result;
}


#END_IF
