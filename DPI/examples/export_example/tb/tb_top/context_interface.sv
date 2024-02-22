interface context_interface;

    logic source_clock;

    export "DPI-C" task get_timemark;

    task get_timemark(output longint unsigned timemark);
        automatic realtime rt = $realtime;
        timemark  = longint'(rt);
    endtask

    export "DPI-C" task wait_clk;

    task wait_clk(input int unsigned n_clk);
        repeat(n_clk) @(posedge source_clock);
    endtask

    import "DPI-C" context task run_cpp_test();

endinterface