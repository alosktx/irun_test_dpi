CXX ?= g++
CXX_FLAGS := -MMD -MP -fPIC
LD_FLAGS := -shared
CXX_SRCS := dpi.cc 
CXX_OBJS := $(CXX_SRCS:%.cc=%.o)
OBJS := $(CXX_OBJS)

.PHONY : all dpi.so run clean main
all: dpi.so run

%.o : %.cc
	$(CXX) $(CXX_FLAGS) -c -o $@ $<

dpi.so : $(OBJS)
	$(CXX) $(LD_FLAGS) -o $@ $(OBJS)

main:
	g++ -o main main.cc

run:
	irun -SV_LIB dpi.so -64bit top.sv 

clean:
	rm -f *.o
	rm -f *.d
	rm -f *.so
	rm -f irun.*
	rm -f *.log
	rm -f main
