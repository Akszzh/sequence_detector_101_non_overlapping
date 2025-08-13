`timescale 1ns/1ps

module sequence_detector_tb;
    reg clk;
    reg reset;
    reg x;
    wire z;

    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        x = 0;
        #10 reset = 0;

        #10 x = 1; // Apply 1
        #10 x = 0; // Apply 0
        #10 x = 1; // Should detect 101 here

        #10 x = 0;
        #10 x = 1; // Another 101 sequence

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #10 x = 0;
        #20 $finish;
    end

    initial begin
        $display("Time\tclk\treset\tx\tz");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, reset, x, z);
    end
endmodule
