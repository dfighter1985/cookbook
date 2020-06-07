#include "lib.h"
#include "main.h"
#include <iostream>

int main( int argc, char *argv[] )
{
    std::cout << "Calling library function: printString..." << std::endl;
    CMakeLibExample::printString();

    std::cout << "..and this is just some string from the header: " << SOMESTRING << std::endl;
    return 0;
}
