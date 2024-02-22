#include "test.hpp"

int sample_test(void) 
{ 

  unsigned long long timemark;
  int unsigned n_clk = 32;

  get_timemark(&timemark);
  printf("Start Test! with time %ll", timemark);
  
  wait_clk(n_clk);

  get_timemark(&timemark);
  printf("Finish test with time %ll", timemark);

  return 0;
}