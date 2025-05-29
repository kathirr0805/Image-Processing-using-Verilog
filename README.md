# Image Processing System in Verilog

This project implements a basic image processing pipeline using Verilog HDL, designed for simulation purposes. The system reads 24-bit RGB image data from a hex file, converts it to grayscale, inverts the grayscale image, and saves the processed data to text files. It consists of two main modules: a memory reader to display sample memory contents and an image processor to perform the core image transformations.

## 📁 Project Structure

```bash
## 📁 Project Structure
├── main.v              # Module to read and display memory contents from a hex file
├── image_processor.v   # Core image processing module for grayscale conversion and inversion
├── memory.hex          # Sample hex file for memory_reader (not provided)
├── image_data.hex      # Input hex file containing 24-bit RGB image data (not provided)
├── grayscale_image.txt # Output file for grayscale image data
├── inverted_image.txt  # Output file for inverted image data
```


## 🔧 Features

- **Memory Reading**: Reads and displays contents of a sample 16-bit memory array from a hex file (`memory.hex`).
- **Image Processing**:
  - Converts 24-bit RGB image data to 8-bit grayscale using a simplified averaging formula.
  - Inverts the grayscale image by subtracting each pixel value from 255.
- **File Output**: Saves processed grayscale and inverted image data to text files (`grayscale_image.txt`, `inverted_image.txt`).
- **Simulation Focused**: Designed for simulation in Verilog environments like Vivado or ModelSim.
- **Modular Design**: Separate modules for memory reading and image processing, making it easy to extend or modify.

## 🧠 How It Works

1. **main.v**:
   - Defines a 16-bit memory array with 5 locations (`mem[0:4]`).
   - Reads memory contents from `memory.hex` using `$readmemh`.
   - Displays the memory contents using `$display` for verification.

2. **image_processor.v**:
   - Processes a 256x256 image (configurable via parameters `ROWS` and `COLS`).
   - Reads 24-bit RGB pixel data from `image_data.hex` into a 2D array (`image_data`).
   - Converts each pixel to grayscale using the formula: `gray = (r >> 2) + (r >> 4) + (g >> 1) + (g >> 4) + (b >> 3)`.
   - Inverts the grayscale image: `inverted = 255 - gray`.
   - Stores processed data in `grayscale_data` and `inverted_data` arrays.
   - Writes the grayscale and inverted pixel values to `grayscale_image.txt` and `inverted_image.txt` using `$fwrite`.

## 📥 Inputs

- **memory.hex**: Hex file containing sample memory data for `main.v` (path: `C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/memory.hex`).
- **image_data.hex**: Hex file containing 24-bit RGB image data for `image_processor.v` (path: `C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/image_data.hex`).

## 📤 Outputs

- **Console Output**: Displays the contents of the memory array from `main.v`.
- **grayscale_image.txt**: Contains the grayscale pixel values (8-bit) in hex format.
- **inverted_image.txt**: Contains the inverted grayscale pixel values (8-bit) in hex format.

## 🚀 Simulation and Testing

You can simulate the project using tools like Xilinx Vivado, ModelSim, or Icarus Verilog.

### Steps to Simulate

1. **Prepare Input Files**:
   - Create `memory.hex` with 5 lines of 16-bit hex values (e.g., `1A2B`, `3C4D`, etc.).
   - Create `image_data.hex` with 256x256 lines of 24-bit RGB hex values (e.g., `FF0000` for red).
   - Place both files in the directory: `C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/`.

2. **Set Up the Simulation**:
   - Open your Verilog simulator (e.g., Vivado or ModelSim).
   - Create a new project and add `main.v` and `image_processor.v` as source files.
   - Compile the modules.

3. **Run the Simulation**:
   - Simulate the design. The `main.v` module will display the memory contents, and `image_processor.v` will generate the output files.
   - Check the console for memory contents and verify that `grayscale_image.txt` and `inverted_image.txt` are created with the processed data.

### Example Testbench

Since the modules use `initial` blocks, you can directly simulate them without a separate testbench. However, for more control, you can create a simple testbench to instantiate both modules:

```verilog
module tb_image_processor;
    initial begin
        #100; // Wait for the initial blocks to complete
        $finish; // End the simulation
    end

    // Instantiate the modules
    memory_reader mem_reader();
    image_processor img_proc();
endmodule
```

## 🔍 Applications

- **Educational Demo**: Ideal for learning Verilog, digital design, and basic image processing concepts.
- **Image Preprocessing**: Can be used as a starting point for grayscale conversion and inversion in larger image processing pipelines.
- **Simulation Testing**: Useful for testing Verilog file I/O operations and array manipulations.

## 📌 Future Enhancements

- **Support for Color Image Processing**: Extend the processor to handle RGB outputs or additional color spaces (e.g., HSV).
- **Implement Additional Filters**: Add modules for blur, edge detection, or sharpening.
- **FPGA Implementation**: Adapt the design for FPGA deployment with AXI interface for SoC integration.
- **Dynamic Input Handling**: Add support for reading image data in real-time (e.g., via a UART interface).
- **Enhanced Grayscale Formula**: Use a more accurate grayscale conversion (e.g., weighted formula: `0.299R + 0.587G + 0.114B`).

## 📝 Author

**Kathir S**  
B.E. Electronics and Communication Engineering  
Anna University, Coimbatore

## 📜 License

This project is for educational purposes. You may use or modify it freely with attribution.


**Instructions to Access**:
1. Click the link above to open the Google Drive folder.
2. Ensure you are logged into a Google account with access (contact the owner if access is restricted).
3. Download or view files directly in the browser.
4. To contribute, request edit access from the folder owner or drag and drop files into the shared folder if permissions allow.

**Note**: The Google Drive folder is set to "Anyone with the link" for view access. For sensitive projects, adjust permissions to "Restricted" or specific email access for security.

## Troubleshooting

- **File Not Found Errors**: Ensure `memory.hex` and `image_data.hex` are in the correct directory (`C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/`). Update the file paths in the Verilog code if your directory differs.
- **Empty Output Files**: Verify that the simulation runs long enough for the `initial` block in `image_processor.v` to complete. Check for file write permissions in the output directory.
- **Simulation Issues**: Ensure your simulator supports Verilog file I/O operations (`$readmemh`, `$fwrite`). Check for syntax errors in the Verilog code.

## Acknowledgments

- Xilinx Vivado for providing a platform for Verilog simulation.
- Anna University, Coimbatore, for supporting this educational project.
