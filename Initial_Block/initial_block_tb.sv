`timescale 1ns / 1ps

module tb();

// Global signals clk , rst

reg clk;
reg rst;

reg [3:0] temp;


// 1. Initialize global variables
initial begin
    clk = 1'b0;
    rst = 1'b0;
end


// 2. Random signal for data/control
initial begin
    rst = 1'b1;
    #30;
    rst = 1'b0;
end


initial begin
    temp = 4'b0100;
    #10;

    temp = 4'b1100;
    #10;

    temp = 4'b0011;
    #10;
end


// 3. System task at the start of simulation
initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end


// 4. Analyzing values of variables on console
initial begin
    $monitor("Temp : %0d at time : %0t", temp, $time);
end


// 5. Stop simulation by forcefully calling $finish
initial begin
    #200;
    $finish();
end

endmodule