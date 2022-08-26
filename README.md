# 项目目的
使用irun和c++测试systemverilog dpi

# debug log
1. ifs.read() 参数1要使用数组来承接
2. 使用 !ifs.eof() 判断会多读一行，改用 ifs.peek() != EOF
3. irun dump 波形操作（不如xrun智能）
