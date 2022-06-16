----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/19 17:05:39
-- Design Name: 
-- Module Name: Full_Adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  --bit type�� �ƴ� std_logic type�� ����ϱ� ����

entity Full_Adder is
port (x, y, cin: in std_logic;
      sum : out std_logic;
      cout: out std_logic);
end Full_Adder;                          -- x,y,cin�� �Է�, sum, cout�� ���

architecture Behavioral of Full_Adder is
begin
    sum <= cin xor x xor y;                                 
    cout <= (x and y) or (x and cin) or (y and cin);     --truth table�� �ۼ��Ͽ� sSum�� cout�� ���� ���� ����
end Behavioral;

