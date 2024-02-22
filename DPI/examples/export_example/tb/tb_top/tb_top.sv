`timescale 1ps/1ps

import tb_pkg::tb_test;

module tb_top;

    import uvm_pkg::*;

    logic src_clk = 0;

    always #10ns src_clk = ~src_clk;

    context_interface context_if();

    assign context_if.source_clock = src_clk;

    initial begin
        $timeformat(-12, 0, " ps", 0);
        uvm_config_db #(virtual context_interface)::set(null, "*", "context_vif", context_if);
        run_test();
    end

endmodule