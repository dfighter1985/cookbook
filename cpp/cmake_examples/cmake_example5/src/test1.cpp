#include "lib.h"
#include <iostream>

int main( int argc, char *argv[] )
{
    std::cout << "Running test1 main.." << std::endl;

    std::string expected = "hello";
    std::string string = CMakeLibExample::getString();

    std::cout << "Library gave us the string: " << string << std::endl;

    if( expected.compare( string ) == 0 )
	return 0;
    else
	return 1;
}
