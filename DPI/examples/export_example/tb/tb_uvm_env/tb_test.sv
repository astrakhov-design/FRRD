class tb_test extends uvm_test;

  `uvm_component_utils(tb_test)

  virtual context_interface context_vif;

  function new(string name = "tb_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual context_interface)::get(this, "*", "context_vif", context_vif))
      `uvm_fatal("NO_VIF", "Virtual interface was not found")

  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);

    context_vif.run_cpp_test();

    #2000;

    phase.drop_objection(this);

  endtask


endclass