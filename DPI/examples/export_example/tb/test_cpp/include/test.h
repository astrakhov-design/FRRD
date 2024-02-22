
#include "stdio.h"

extern "C" void get_timemark(unsigned long long * timemark);
extern "C" void wait_clk(unsigned int n_clk);

int sample_test(void);

extern "C" void run_cpp_task() {
    sample_test();
}