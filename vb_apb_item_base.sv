///////////////////////////////////////////////////////////////////////////////
// File:        vb_apb_item_base.sv
// Author:      Vishwath Bhandary
// Description: APB item base class.
///////////////////////////////////////////////////////////////////////////////
`ifndef VB_APB_ITEM_BASE_SV
  `define VB_APB_ITEM_BASE_SV

  class vb_apb_item_base extends uvm_sequence_item;

    //Direction
    rand vb_apb_dir dir;
    
    //Address
    rand vb_apb_addr addr;
    
    //Data
    rand vb_apb_data data;
    
    `uvm_object_utils(vb_apb_item_base)
    
    function new(string name = "");
      super.new(name);
    endfunction
    
    virtual function string convert2string();
      string result = $sformatf("dir: %0s, addr: %0x", dir.name(), addr);
      
      return result;
    endfunction
    
  endclass

`endif
