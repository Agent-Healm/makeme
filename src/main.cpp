#include <iostream>
#include "func.hpp"
#include "addint.cpp"

int main(){

        std::cout<<"Hello world" << std::endl;
        std::cout<<"Func Hpp : " << add(2, 5) <<"\n";
        std::cout<<"Add Int : "<< addint(3, 4) <<"\n";
        return 0;

}