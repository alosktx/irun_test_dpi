#include <stdint.h>

#include <fstream>
#include <iostream>
int main(int argc, char const *argv[]) {
    std::ifstream ifs;
    ifs.open("dpi.dat", std::ios::binary);
    if (!ifs) {
        std::cout << "open error!" << std::endl;
    }
    uint64_t time;
    uint8_t type;
    uint32_t *data;

    ifs.read((char*)&time, sizeof(uint64_t));
    ifs.read((char*)&type, sizeof(uint32_t));

    if (type == 0 || type == 3) {
        ifs.read((char*)data, 17 * sizeof(uint32_t));
    } else {
        ifs.read((char*)data, sizeof(uint32_t));
    }
    std::cout << "time:\t" << time << "\ttype:\t" << (uint16_t)type << "\tdata:\t" << data[0] << "\n";
    // std::cout << "time:\t" << time << "\ttype:\t" << (uint16_t)type << "\n";

    return 0;
}
