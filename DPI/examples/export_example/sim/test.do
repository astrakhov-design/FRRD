set TESTBENCH_PATH +incdir+../tb/tb_top
set UVM_TB_PATH +incdir+../tb/tb_uvm_env
set CPP_PATH +incdir+../tb/test_cpp
set HPP_PATH +incdir+../tb/test_cpp/include

transcript on

vlog -64 -sv -dpiheader $TESTBENCH_PATH $UVM_TB_PATH $CPP_PATH $HPP_PATH \
    ../tb/tb_uvm_env/tb_pkg.sv \
    ../tb/tb_top/context_interface.sv \
    ../tb/tb_top/tb_top.sv \
    ../tb/test_cpp/test.c

vsim +UVM_TEST_NAME=tb_test +UVM_VERBOSITY=UVM_HIGH -vopt work.tb_top