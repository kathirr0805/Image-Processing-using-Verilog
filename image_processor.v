module image_processor;
    // Define the image size
    parameter ROWS = 256;  // Number of rows in the image
    parameter COLS = 256;  // Number of columns in the image

    // Declare 2D arrays for grayscale and inverted data
    reg [7:0] grayscale_data [0:ROWS-1][0:COLS-1];
    reg [7:0] inverted_data [0:ROWS-1][0:COLS-1];
    reg [23:0] image_data [0:ROWS-1][0:COLS-1];  // 24-bit RGB data
    integer i, j;
    reg [7:0] r, g, b, gray, inverted;
    reg [23:0] pixel;
    
    // Declare file handles for writing grayscale and inverted image data
    integer grayscale_file, inverted_file;

    initial begin
        // Initialize grayscale_data and inverted_data arrays to 0
        for (i = 0; i < ROWS; i = i + 1) begin
            for (j = 0; j < COLS; j = j + 1) begin
                grayscale_data[i][j] = 8'b0;  // Initialize grayscale data
                inverted_data[i][j] = 8'b0;   // Initialize inverted data
            end
        end
        
        // Open the files for writing grayscale and inverted images
        grayscale_file = $fopen("grayscale_image.txt", "w");
        inverted_file = $fopen("inverted_image.txt", "w");

        // Read the hex data into image_data array from the specified location
        $display("Reading hex file...");
        $readmemh("C:/Users/itzka/OneDrive/Documents/Vivado/file image processing/image_data.hex", image_data); // Read the hex file from the specified path
        $display("Hex file read successfully.");
        
        // Process each pixel
        for (i = 0; i < ROWS; i = i + 1) begin
            for (j = 0; j < COLS; j = j + 1) begin
                pixel = image_data[i][j];
                
                // Extract RGB values
                r = pixel[23:16];
                g = pixel[15:8];
                b = pixel[7:0];

                // Convert to grayscale (using simple averaging formula)
                gray = (r >> 2) + (r >> 4) + (g >> 1) + (g >> 4) + (b >> 3);
                
                // Invert the grayscale image
                inverted = 8'hFF - gray;
                
                // Store the processed data in arrays
                grayscale_data[i][j] = gray;
                inverted_data[i][j] = inverted;

                // Write the grayscale and inverted values to files
                $fwrite(grayscale_file, "%h\n", gray);     // Write grayscale data to the file
                $fwrite(inverted_file, "%h\n", inverted);   // Write inverted data to the file
            end
        end
        
        // Close the files after writing
        $fclose(grayscale_file);
        $fclose(inverted_file);

        // Display completion message
        $display("Grayscale and Inverted image data saved.");
    end
endmodule
