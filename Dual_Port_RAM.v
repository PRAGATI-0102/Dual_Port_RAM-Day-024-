`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 10:39:42 PM
// Design Name: 
// Module Name: Dual_Port_RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define WIDTH 8
`define DEPTH 16 
`define ADDR $clog2(`DEPTH)

module Dual_Port_RAM(
    input clk,
    input en1, 
    input en2,
    input rd_en1,
    input rd_en2,
    input [(`ADDR-1):0]addr1,
    input [(`ADDR-1):0]addr2,
    input [(`WIDTH-1):0]data_in1,
    input [(`WIDTH-1):0]data_in2,
    output reg [(`WIDTH-1):0]data_out1,
    output reg [(`WIDTH-1):0]data_out2
    );
    
    reg [(`WIDTH-1):0] Memory_RAM [(`DEPTH-1):0]; 

    always@(posedge clk) begin
        if(rd_en1 && en1)
            data_out1<=Memory_RAM[addr1];
        else;
    end

    always@(posedge clk) begin
        if(!rd_en1 && en1)
            Memory_RAM[addr1]<=data_in1;
        else; 
    end

    always@(posedge clk) begin
        if(rd_en2 && en2)
            data_out2<=Memory_RAM[addr2];
        else;
    end

    always@(posedge clk) begin
        if(!rd_en2 && en2)
            Memory_RAM[addr2]<=data_in2;
        else; 
    end
endmodule
