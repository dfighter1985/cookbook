#include "lib.h"
#include <iostream>

int main( int argc, char *argv[] )
{
    std::cout << "Running test2 main.." << std::endl;

    int expected = 3;
    int value = CMakeLibExample::getInt();

    std::cout << "Library gave us this int: " << value << std::endl;

    if( expected == value )
	return 0;
    else
	return 1;
}
