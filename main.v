module memory_reader;
  
  // Define the memory array
  reg [15:0] mem [0:4];  // 5 locations of 16-bit memory

  // Initialize the memory from the file
  initial begin
    // Load the contents of the memory.hex file into the mem array
    $readmemh("C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/memory.hex", mem);
    
    // Display the contents of the memory array
    $display("Memory contents:");
    $display("mem[0] = %h", mem[0]);
    $display("mem[1] = %h", mem[1]);
    $display("mem[2] = %h", mem[2]);
    $display("mem[3] = %h", mem[3]);
    $display("mem[4] = %h", mem[4]);
  end
  
endmodule
