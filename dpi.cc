#include <stdint.h>

#include <fstream>
#include <iostream>

extern "C" void Write(const uint32_t* time, const uint32_t type, const uint32_t* data);

bool flag;
std::ofstream ofs;

void Write(const uint32_t* time, const uint32_t type, const uint32_t* data) {
    if (!flag) {
        ofs.open("dpi.dat", std::ios::binary);
        flag = true;
    }
    std::cout << "time:\t" << time[0] << "\ttype:\t" << type << "\t";

    ofs.write((char*)&time[0], sizeof(uint64_t));

    ofs.write((char*)&type, sizeof(uint32_t));

    if (type == 0 || type == 3) {
        ofs.write((char*)data, sizeof(uint32_t) * 4);
        std::cout << "data:\t" << data[3] << data[2] << data[1] << data[0] << "\n";
    } else {
        ofs.write((char*)data, sizeof(uint32_t));
        std::cout << "data:\t" << data[0] << "\n";
    }
}