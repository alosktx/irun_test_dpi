#include <stdint.h>

#include <fstream>
#include <iostream>
extern "C" void Write(const unsigned int *time, const uint32_t type, const uint32_t *data);
bool flag;
std::ofstream ofs;
void Write(const uint32_t *time, const uint32_t type, const uint32_t *data) {
    if (!flag) {
        ofs.open("dpi.dat", std::ios::binary);
        flag = true;
    }

    uint64_t time_n = (uint64_t)time[0] + ((uint64_t)time[1]) << 32;

    ofs.write((char*)&time_n, sizeof(uint64_t));
    ofs.write((char*)&type, sizeof(uint32_t));

    if (type == 0 || type == 3){
        ofs.write((char*)data, 17 * sizeof(uint32_t));
    }else{
        ofs.write((char*)data, sizeof(uint32_t));
    }
}