///////////////////////////////////////////////////////////////////////////////
// File:        vb_apb_item_drv.sv
// Author:      Vishwath Bhandary
// Description: APB driver item class.
///////////////////////////////////////////////////////////////////////////////
`ifndef VB_APB_ITEM_DRV_SV
  `define VB_APB_ITEM_DRV_SV

  class vb_apb_item_drv extends vb_apb_item_base;
    
    //Pre drive delay
    rand int unsigned pre_drive_delay;
    
    //Post drive delay
    rand int unsigned post_drive_delay;
    
    constraint pre_drive_delay_default {
      soft pre_drive_delay <= 5;
    }

    constraint post_drive_delay_default {
      soft post_drive_delay <= 5;
    }

    `uvm_object_utils(vb_apb_item_drv)
    
    function new(string name = "");
      super.new(name);
    endfunction
    
    virtual function string convert2string();
      string result = super.convert2string();
      
      if(dir == vb_apb_WRITE) begin
        result = $sformatf("%s, data: %0x", result, data);
      end
      
      result = $sformatf("%s, pre_drive_delay: %0d, post_drive_delay: %0d", 
                         result, pre_drive_delay, post_drive_delay);
      
      return result;
    endfunction
    
  endclass

`endif
